package com.kh.recipeMarket.mypage.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Pagination;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.exception.MyPageException;
import com.kh.recipeMarket.mypage.model.service.MyPageService;

@SessionAttributes("loginUser")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mps;

	@Autowired
	private BCryptPasswordEncoder bcrypt;	
	
	@RequestMapping("mypage.mp")
	public String goMypage() {
		return "/mypage";
	}
	
	@RequestMapping("goInfo.mp")
	public String goInfo() {
		return "/memberInfo";
	}
	
	@RequestMapping("gomupdate.mp")
	public String gomUpdate(){
		return "/memberUpdate";
	}

	@RequestMapping("mUpdate.mp")
	public String mUpadate(@ModelAttribute Member m, @ModelAttribute Photo p, 
							@RequestParam("mImage") MultipartFile mImage, HttpServletRequest request, Model model) {
		int result = mps.mUpdate(m);
		if(result > 0) {
			// 사진 첨부
			if(mImage != null && !mImage.isEmpty()) {
				String pName = saveImage(mImage, request);		
				if(pName != null) {
					p.setOriginName(mImage.getOriginalFilename());
					p.setChangeName(pName);
					p.setTargetNo(m.getMemberNo());
				}
				int result2 = mps.uploadImage(p);
				if(result2 > 0) {
					m.setpName(pName);
					model.addAttribute("loginUser", m);	
					return "redirect:memberInfo";						
				} else {
					throw new MemberException("정보 수정에 실패하였습니다.");					
				}
				
			} else {
				model.addAttribute("loginUser", m);				
				return "redirect:memberInfo";		
			}
		} else {
				throw new MemberException("정보 수정에 실패하였습니다.");
		}		
	}

	
	// 이미지 업로드
	public String saveImage(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\upload";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName
		= sdf.format(new Date(System.currentTimeMillis())) + "." 
		+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
	
	// 비밀번호 변경
	@RequestMapping("pwdUpdate.mp")
	public String pwdUpdate(String pwd, String newPwd, Model model) {
		Member loginUser = (Member)model.getAttribute("loginUser");
		
	      String encNewPwd = bcrypt.encode(newPwd);
	      if(bcrypt.matches(pwd, loginUser.getPwd())) {
	    	  loginUser.setPwd(encNewPwd);
	    	  int result = mps.pwdUpdate(loginUser);
	    	  if(result > 0) {
	    		  return "memberInfo";
	    	  }else {
		            throw new MyPageException("비밀번호 변경 실패");	    		  
	    	  }
	      } else {
		    	  model.addAttribute("msg", "원래 비밀번호와 일치하지 않습니다.");
		    	  model.addAttribute("url", "memberUpdate.jsp");
		    	  return "../common/pwdError.jsp";
		      }
	} 
	
	// 주문 조회
	@RequestMapping("mOrder.mp")
	public ModelAndView mOrder(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, Model model){
		Member loginUser = (Member)model.getAttribute("loginUser");		
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }
		
		int listCount = mps.mOrderCount(loginUser.getMemberNo());
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Order> list = mps.orderList(pi);

		String listNames = mps.getListNames(loginUser.getMemberNo());
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("listNames", listNames);
			mv.setViewName("memberorder");
		}else {
			throw new MyPageException("주문 조회에 실패하였습니다.");
		}
	return mv;
	}	
		
	
}
