package com.kh.recipeMarket.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping("mypage.mp")
	public String goMypage() {
		return "/mypage";
	}
	
	
	
}
