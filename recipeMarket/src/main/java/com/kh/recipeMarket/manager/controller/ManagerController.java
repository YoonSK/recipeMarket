package com.kh.recipeMarket.manager.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.manager.model.exception.ManagerException;
import com.kh.recipeMarket.manager.model.service.ManagerService;
import com.kh.recipeMarket.manager.model.vo.Pagination;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService mas;
	
	@RequestMapping("manager.ma")
	public String goManager() {
		return "/managerPage";
	}
	
	@RequestMapping("oManage.ma")
	public ModelAndView orderManage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }
		
		int listCount = mas.orderCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<mOrderInfo> list = mas.orderList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("orderManage");
		}else {
			throw new ManagerException("주문 조회에 실패하였습니다.");
		}		
		
		return mv;
	}	
	
	// 주문 카테고리
	@RequestMapping("orderSort.ma")
	public ModelAndView orderSort(@RequestParam(value="page", required=false) Integer page, String sortCate, ModelAndView mv) {
		String cate = sortCate;
		int status = 0;
		switch(cate) {
		case "결제완료": status = 0; break;
		case "배송중" : status = 1; break;
		case "배송완료": status = 2; break;
		case "주문취소" : status = 4; break;
		}
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }
				
		int listCount = mas.orderCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<mOrderInfo> list = mas.orderSortList(pi, status);				
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("orderManage");
		}else {
			throw new ManagerException("주문 조회에 실패하였습니다.");
		}		
		
		return mv;		
		
	}
	
	// 배송 처리
	@RequestMapping(value="oStatus.ma")
	public void orderStatus(HttpServletResponse response, @ModelAttribute Order o) throws JsonIOException, IOException {
		int result = mas.orderStatus(o);
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());		
	
	}	
	
	// 재고관리 페이지 이동
	@RequestMapping("pManage.ma")
	public String goProduct() {
		return "productManager";
	}
	
	// 상품 등록
	@RequestMapping("insertProduct.pa")
	public ModelAndView insertProduct(ModelAndView mv,@RequestParam("productName") String productName) {
		return mv;
	}
}
