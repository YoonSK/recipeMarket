package com.kh.recipeMarket.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.service.MemberService;
import com.kh.recipeMarket.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping("goLogin.me")
	public String goLogin(){
	
		return "/memberLogin";
		
	}

	@RequestMapping(value="login.me", method= {RequestMethod.POST,  RequestMethod.GET})
	public String memberLogin(Member m, Model model) {			
		System.out.println(m);	
		System.out.println(m.getId());
		Member loginUser = ms.memberLogin(m);
		System.out.println("여기");
		System.out.println(loginUser);

		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "../home";		
		} else {
			model.addAttribute("message", "로그인에 실패하였습니다.");
			return "../common/errorPage";
		}		
	}	
	
	
	
	
	@RequestMapping("goJoin.me")
	public String goJoin() {
		return "memberJoin";
	}	
}
