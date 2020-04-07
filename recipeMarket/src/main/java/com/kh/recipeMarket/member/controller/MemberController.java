package com.kh.recipeMarket.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
@RequestMapping("*.me")
public class MemberController {

	@RequestMapping("goLogin.me")
	public String goLogin() {
		System.out.println("여기");
		return "memberLogin";
	}
	
	@RequestMapping("goJoin.me")
	public String goJoin() {
		System.out.println("여기");
		return "memberJoin";
	}	
}
