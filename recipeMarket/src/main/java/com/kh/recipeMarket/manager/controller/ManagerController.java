package com.kh.recipeMarket.manager.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.manager.model.exception.ManagerException;
import com.kh.recipeMarket.manager.model.service.ManagerService;
import com.kh.recipeMarket.manager.model.vo.Pagination;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.member.model.exception.MemberException;
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
		default : status = 9; break;
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
//	@RequestMapping("pManage.ma")
//	public String goProduct() {
//		return "productManager";
//	}
	@RequestMapping("pManage.ma")
	public ModelAndView listProduct(@RequestParam(value = "page", required=false) Integer page,ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mas.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Product> list = mas.selectList(pi);
		ArrayList<Product> plist = mas.productList(pi);
		
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("plist", plist);
			mv.addObject("pi",pi);
			mv.setViewName("productManager");
			System.out.println(list);
			System.out.println(plist);
		} else {
			throw new ManagerException("게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	
	// 상품 등록
	@RequestMapping("insertProduct.ma")
	public String insertProduct(@ModelAttribute Product product,@ModelAttribute Photo p,
										@RequestParam("pImage") MultipartFile pImage,HttpServletRequest request) {
		
	
		
		int result = mas.insertProduct(product);
		System.out.println("controller : " + product);
		if(result > 0) {
			// 사진 첨부
			if(pImage != null && !pImage.isEmpty()) {
				String pName = saveImage(pImage, request);
			
				if(pName != null) {
						p.setOriginName(pImage.getOriginalFilename());
						p.setChangeName(pName);
					}
					int result2 = mas.uploadImage(p);
					if(result2 > 0) {
						return "redirect:/pManage.ma";							
					} else {
						throw new MemberException("게시글 등록에 실패하였습니다.");					
					}
					
				} else {
					return "redirect:/pManage.ma";		
			}
		} else {
			throw new ManagerException("상품 등록에 실패하였습니다.");
		}
	}
//이미지 업로드
	public String saveImage(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\upload";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName
		= sdf.format(new Date(System.currentTimeMillis())) + "." 
		+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
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
