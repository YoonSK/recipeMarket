package com.kh.recipeMarket.member.controller;

import java.sql.Date;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.service.MemberService;
import com.kh.recipeMarket.member.model.vo.Member;

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
	public String join(@ModelAttribute Member m, @RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day,
												@RequestParam("mImage") MultipartFile mImage, HttpServletRequest request) {
		// Date 화
		Date birth = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		m.setBirth(birth);		
		// 복호화
		String encPwd = bcrypt.encode(m.getPwd());	
		m.setPwd(encPwd);
		 
		// 사진 첨부
		
		int result = ms.joinMember(m);
		
		if(result > 0) {
			return "../home";
		}else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "../home";
	}		
	
}
