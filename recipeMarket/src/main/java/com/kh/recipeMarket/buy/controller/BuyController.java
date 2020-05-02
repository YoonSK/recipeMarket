package com.kh.recipeMarket.buy.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.buy.model.exception.BuyException;
import com.kh.recipeMarket.buy.model.service.BuyService;
import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class BuyController {
	
	@Autowired
	private BuyService bs;

	@RequestMapping("goCart.by")
	public ModelAndView goCart(ModelAndView mv, Model model) {
		Member loginUser = (Member)model.getAttribute("loginUser");		
		int memberNo = loginUser.getMemberNo();
		ArrayList<Cart> list = bs.cartList(memberNo);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("mCart");
		}else {
			throw new BuyException("장바구니 조회에 실패하였습니다.");
		}
		return mv;
	}

	
}
