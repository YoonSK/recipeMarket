package com.kh.recipeMarket.buy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.recipeMarket.buy.model.exception.BuyException;
import com.kh.recipeMarket.buy.model.service.BuyService;
import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.buy.model.vo.OrderDetail;
import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.product.model.vo.Product;

@SessionAttributes("loginUser")
@Controller
public class BuyController {
	
	@Autowired
	private BuyService bs;
	
	
	@RequestMapping("detail.by")
	public ModelAndView prDetail(@RequestParam("productNo") int productNo, ModelAndView mv) {
		Product pr = new Product();
		pr = bs.getPrDetail(productNo);
		ArrayList<Reply> list = bs.getReview(productNo);
		
		if(pr != null) {
			mv.addObject("pr", pr);
			mv.addObject("list", list);
			mv.setViewName("prDetail");
		}else {
			throw new BuyException("상세 조회에 실패하였습니다.");
		}
		return mv;
	}

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
	
	// 카트 삭제
	@RequestMapping("cartDelete.by")
	public void cartDelete(@RequestParam("no") int no, Model model, HttpServletResponse response) throws JsonIOException, IOException {
		Member loginUser = (Member)model.getAttribute("loginUser");		
		int memberNo = loginUser.getMemberNo();
		Cart cart = new Cart();
		cart.setProductNo(no);
		cart.setMemberNo(memberNo);
		
		int result = bs.cartDelete(cart);
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());		
		
	}
	
	// 구매창
	@RequestMapping("goBuy.by")
	public ModelAndView goBuy(ModelAndView mv, Model model, @RequestParam("prArray") ArrayList<Integer> prArray) {
		Member loginUser = (Member)model.getAttribute("loginUser");		
		int memberNo = loginUser.getMemberNo();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Integer> prnArray = new ArrayList();
		for(int i = 0; i < prArray.size(); i++) {
			if(prArray.get(i) != 0) {
			prnArray.add(prArray.get(i));

			}
		}
		ArrayList<Cart> list = new ArrayList<Cart>();
		for(int i = 0; i < prnArray.size(); i++) {
			list = bs.goBuy(prnArray);
		}		

		if(list != null) {
			mv.addObject("list", list);			
			mv.setViewName("mBuy");			
		}else {
			throw new BuyException("구매 페이지 로딩에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 바로 구매
	@RequestMapping("goToBuy.by")
	public ModelAndView goToBuy(@ModelAttribute Cart c, Model model, ModelAndView mv) {
		ArrayList<Cart> list = new ArrayList<Cart>();
		Member loginUser = (Member)model.getAttribute("loginUser");		
		list.add(c);
		mv.addObject("list", list);			
		mv.setViewName("mBuy");			
		
		return mv;		
	}
	
	// 장바구니 담기
	@RequestMapping("insertCart.by")
	public void goToCart(HttpServletResponse response, @ModelAttribute Cart c, Model model) throws JsonIOException, IOException {
		Member loginUser = (Member)model.getAttribute("loginUser");		
		c.setMemberNo(loginUser.getMemberNo());
		int result = bs.insertCart(c);
		Gson gson = new Gson();

		if(result > 0) {
			gson.toJson(result, response.getWriter());
		}else {
			gson.toJson(result, response.getWriter());
		}
	}
	
	// 구매완료
	@RequestMapping("buyComple.by")
	public void buyComple(HttpServletResponse response, @RequestParam("amount") int amount, @RequestParam("email") String email, @RequestParam("name") String name, @RequestParam("phone") int phone, @RequestParam("addr") String addr, @RequestParam("addr2") String addr2,
							@RequestParam("zip") int zip, @RequestParam("memo") String memo, @RequestParam("prArray") ArrayList<Integer> prArray, @RequestParam("prCArray") ArrayList<Integer> prCArray, @RequestParam("pPrArray") ArrayList<Integer> pPrArray, Model model) throws JsonIOException, IOException{
		Member loginUser = (Member)model.getAttribute("loginUser");		
		int memberNo = loginUser.getMemberNo();
		// 1. 주문 결과 Order에 넣기
		Order o = new Order();
		o.setTotal(amount);
		o.setAddress(addr);
		o.setAddress2(addr2);
		o.setNote(memo);
		o.setZip(zip);
		o.setMemNo(memberNo);
		
		int result = bs.insertOrder(o);

		ArrayList<OrderDetail> list = new ArrayList();
		// 2. 주문 결과 OrderDetail에 넣기	
		if(result > 0) {
			for(int i = 0; i < prArray.size(); i++) {
				OrderDetail od = new OrderDetail();
				od.setProductNo(prArray.get(i));
				od.setPrCount(prCArray.get(i));
				od.setPrice(pPrArray.get(i));
				od.setOrderNo(o.getOrderNo());
				list.add(od);
			}
		
		int result2 = bs.insertOrderD(list);

		// 3. 주문한 product는 cart에서 삭제
			if(result2 > 0) {
				ArrayList<Cart> delList = bs.selectOrderDetail(o.getOrderNo());
				for(int i = 0; i < delList.size(); i++) {
					delList.get(i).setMemberNo(memberNo);
				}
				int result3 = bs.cartDeleteAfter(delList);
				
				if(result3 > 0) {
					int orderNo = o.getOrderNo();
					Gson gson = new Gson();
					gson.toJson(orderNo, response.getWriter());
				}
			}			
		}

	}
	
	@RequestMapping("goComple.by")
	public ModelAndView goComple(ModelAndView mv, @RequestParam("orderNo") int orderNo) {
		
		mv.addObject("orderNo", orderNo);			
		mv.setViewName("buyComple");				
		return mv;
	}
	
}
