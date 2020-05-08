package com.kh.recipeMarket.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.product.model.service.ProductService;
import com.kh.recipeMarket.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;

	@RequestMapping("/list.bu")
	public ModelAndView getProductList(Model model, ModelAndView mv) {
		
		ArrayList<Product> pList = pService.getProductList();
		
		ArrayList<Product> grain = new ArrayList<Product>();
		ArrayList<Product> fruit = new ArrayList<Product>();
		ArrayList<Product> vegitable = new ArrayList<Product>();
		ArrayList<Product> fish = new ArrayList<Product>();
		ArrayList<Product> meat = new ArrayList<Product>();
		ArrayList<Product> beverage = new ArrayList<Product>();
		ArrayList<Product> ect = new ArrayList<Product>();
		
		for(Product p : pList) {
			String category = p.getCategory();
			if(category.equals("곡류")) {
				grain.add(p);
			} else if(category.equals("과일류")) {
				fruit.add(p);
			} else if(category.equals("채소류")) {
				vegitable.add(p);
			} else if(category.equals("어류")) {
				fish.add(p);
			} else if(category.equals("육류")) {
				meat.add(p);
			} else if(category.equals("음료")) {
				beverage.add(p);
			} else if(category.equals("기타")) {
				ect.add(p);
			} 
		}
		
//		HashMap<String, ArrayList<Product>> productMap = new HashMap<String, ArrayList<Product>>();
//		productMap.put("곡류", grain);
//		productMap.put("과일류", fruit);
//		productMap.put("채소류", vegitable);
//		productMap.put("어류", fish);
//		productMap.put("육류", meat);
//		productMap.put("음료", beverage);
//		productMap.put("기타", ect);
//		
//		System.out.println(productMap);
//		
//		model.addAttribute("productMap", productMap);
		
		mv.addObject("grain", grain);
		mv.addObject("fruit", fruit);
		mv.addObject("vegitable", vegitable);
		mv.addObject("fish", fish);
		mv.addObject("meat", meat);
		mv.addObject("beverage", beverage);
		mv.addObject("ect", ect);
		mv.setViewName("productmain");
		
		return mv;
	}
	
	@RequestMapping("/detail.bu")
	public ModelAndView getProductDetail(Model model, ModelAndView mv) {
		
		ArrayList<Product> pList = pService.getProductList();
		
		ArrayList<Product> grain = new ArrayList<Product>();
		ArrayList<Product> fruit = new ArrayList<Product>();
		ArrayList<Product> vegitable = new ArrayList<Product>();
		ArrayList<Product> fish = new ArrayList<Product>();
		ArrayList<Product> meat = new ArrayList<Product>();
		ArrayList<Product> beverage = new ArrayList<Product>();
		ArrayList<Product> ect = new ArrayList<Product>();
		
		for(Product p : pList) {
			String category = p.getCategory();
			if(category.equals("곡류")) {
				grain.add(p);
			} else if(category.equals("과일류")) {
				fruit.add(p);
			} else if(category.equals("채소류")) {
				vegitable.add(p);
			} else if(category.equals("어류")) {
				fish.add(p);
			} else if(category.equals("육류")) {
				meat.add(p);
			} else if(category.equals("음료")) {
				beverage.add(p);
			} else if(category.equals("기타")) {
				ect.add(p);
			} 
		}
		
		mv.addObject("grain", grain);
		mv.addObject("fruit", fruit);
		mv.addObject("vegitable", vegitable);
		mv.addObject("fish", fish);
		mv.addObject("meat", meat);
		mv.addObject("beverage", beverage);
		mv.addObject("ect", ect);
		mv.setViewName("productdetail");
		
		return mv;
	}
	
	@RequestMapping("/cart.bu")
	public ModelAndView getProductCart(Model model, ModelAndView mv) {
		
		mv.setViewName("cart");
		
		return mv;
	}
}
