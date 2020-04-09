package com.kh.recipeMarket.member.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.service.MemberService;
import com.kh.recipeMarket.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;

	@Autowired
	private BCryptPasswordEncoder bcrypt;	
	
	@RequestMapping("goLogin.me")
	public String goLogin(){
	
		return "/memberLogin";
		
	}

	@RequestMapping(value="login.me", method= {RequestMethod.POST,  RequestMethod.GET})
	public String memberLogin(Member m, Model model) {			
		Member loginUser = ms.memberLogin(m);
		if(bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			System.out.println(model.getAttribute("loginUser"));
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		return "../home";	
	}	
	
	@RequestMapping("goJoin.me")
	public String goJoin() {
		return "/memberJoin";
	}	
	
	@RequestMapping("join.me")
	public String join(@ModelAttribute Member m, @ModelAttribute Photo p, @RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day,
												@RequestParam("mImage") MultipartFile mImage, HttpServletRequest request) {
		// Date 화
		Date birth = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		m.setBirth(birth);		
		// 복호화
		String encPwd = bcrypt.encode(m.getPwd());	
		m.setPwd(encPwd);
		 
		// 사진 첨부
		if(mImage != null && !mImage.isEmpty()) {
			String renameImage = saveImage(mImage, request);
		
			if(renameImage != null) {
				p.setOriginName(mImage.getOriginalFilename());
				p.setChangeName(renameImage);
			}
			int result1 = ms.uploadImage(p);
			if(result1 > 0) {
				int result2 = ms.joinMember(m);
				if(result2 > 0) {
					return "../home";
				}else {
					throw new MemberException("회원가입에 실패하였습니다.");
				}				
			}
		}

		int result = ms.joinMember(m);
		
		if(result > 0) {
			return "../home";
		}else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	public String saveImage(MultipartFile mImage, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\images";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = mImage.getOriginalFilename();
		String renameFileName
		= sdf.format(new Date(System.currentTimeMillis())) + "." 
		+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			mImage.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
	
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "../home";
	}		
	
}
