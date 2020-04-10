package com.kh.recipeMarket.mypage.controller;

import java.io.File;
import java.text.SimpleDateFormat;

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

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.vo.Member;
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
				String pName = saveImage(mImage, request, m);		
				if(pName != null) {
					p.setOriginName(mImage.getOriginalFilename());
					p.setChangeName(pName);
					p.setTargetNo(m.getMemberNo());
				}
				int result2 = mps.uploadImage(p);
				if(result2 > 0) {
					model.addAttribute("loginUser", m);	
					return "redirect:/";						
				} else {
					throw new MemberException("정보 수정에 실패하였습니다.");					
				}
				
			} else {
				model.addAttribute("loginUser", m);				
				return "redirect:/";		
			}
		} else {
				throw new MemberException("정보 수정에 실패하였습니다.");
		}		
	}

	
	// 이미지 업로드
	public String saveImage(MultipartFile file, HttpServletRequest request, @ModelAttribute Member m) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\upload";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = m.getpName();

		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		} 
		
		return renameFileName;
	}	
	
}
