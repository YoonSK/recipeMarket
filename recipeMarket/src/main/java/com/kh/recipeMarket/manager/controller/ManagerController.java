package com.kh.recipeMarket.manager.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
import com.kh.recipeMarket.excel.MakeExcel;
import com.kh.recipeMarket.manager.model.exception.ManagerException;
import com.kh.recipeMarket.manager.model.service.ManagerService;
import com.kh.recipeMarket.manager.model.vo.Pagination;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.manager.model.vo.ProductPagination;
import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.mypage.model.exception.MyPageException;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

import net.sf.jxls.exception.ParsePropertyException;

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
		PageInfo pi = ProductPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<mOrderInfo> list = mas.orderList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("listCount", listCount);
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
		case "후기완료" : status = 3; break;		
		case "주문취소" : status = 4; break;
		default : status = 9; break;
		}
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }
				
		int listCount = mas.oSortCount(status);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<mOrderInfo> list = mas.orderSortList(pi, status);	
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("cate", cate);
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
		PageInfo pi = ProductPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Product> list = mas.selectList(pi);
		ArrayList<Product> plist = mas.productList(pi);
		
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("plist", plist);
			mv.addObject("listCount", listCount);
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
	
	// 상품 입고 수정
	@RequestMapping("updateProduct.ma")
	public String updateProduct(@ModelAttribute Product p,@RequestParam("productNo") int productNo,HttpServletRequest request) {
		
//		p.setProductNo(productNo);
		System.out.println("수정 : " + productNo);
		int result = mas.updateProduct(p);
		 String referer = request.getHeader("Referer");
		if(result > 0) {
			return "redirect:"+referer;
		} else {
			throw new ManagerException("입고 수량 수정에 실패하였습니다.");
		}
	}
	
	//검색
	@RequestMapping("searchProduct.ma")
	public ModelAndView searchListProduct(@RequestParam(value = "page", required=false) Integer page,ModelAndView mv, String keyword, String category,String searchCate,
											Product p) {
		System.out.println("keyword: "+keyword + "category : "+ category + "searchCate : "+ searchCate);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(category != null) {
			p.setCategory(category);
		}
		
		if(searchCate.equals("상품명")) {
			p.setName(keyword);
		} else if(searchCate.equals("상품코드")) {
			p.setProductNo(Integer.parseInt(keyword));
		} 
		
		System.out.println("p : "+ p);
		int listCount = mas.getListCount();
		int slistCount = mas.getSearchListCount(p);
		PageInfo pi = ProductPagination.getPageInfo(currentPage, slistCount);
		ArrayList<Product> list = mas.searchList(p,pi);
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("listCount", listCount);
			mv.addObject("slistCount", slistCount);
			mv.addObject("pi", pi);
			mv.addObject("keyword", keyword);
//			mv.addObject("category", category);
			mv.addObject("searchCate", searchCate);
			mv.setViewName("productManager");
			
			System.out.println("slistCount : "+ slistCount);
			System.out.println("seacrh : " + list);
		} else {
			throw new ManagerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	/* 날짜로 검색 */
	@RequestMapping("productSort.ma")
	public ModelAndView dateSort(@RequestParam(value="page", required=false) Integer page, String sortDate, ModelAndView mv, Model model,Product p) {
		String date = sortDate;
		int ds = 0;
		System.out.println(date);
		switch(date) {
		case "전체": ds = 0; break;
		case "1개월" : ds = 31; break;
		case "3개월": ds = 91; break;
		case "6개월" : ds = 181; break;
		case "1년" : ds = 366; break;
		}
		p.setEndDate(ds);
		System.out.println("p의 endDate확인" + p);
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }		
		int slistCount = mas.productSortCount(p);
		int listCount = mas.getListCount();
		System.out.println(listCount);
		PageInfo pi = ProductPagination.getPageInfo(currentPage, slistCount);
		ArrayList<Product> list = mas.productSortList(p,pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("listCount",listCount);
			mv.addObject("slistCount", slistCount);
			mv.addObject("pi", pi);
			mv.addObject("sortDate", date);
			mv.setViewName("productManager");
		}else {
			throw new MyPageException("주문 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	/* 재고 상태로 검색 */
	@RequestMapping("productStatus.ma")
	public ModelAndView productStatus(@RequestParam(value="page", required=false) Integer page, String pStatus, ModelAndView mv,Product p) {
		int ds = 0;
//		System.out.println(pStatus);
		switch(pStatus) {
		case "전체": ds = 0; break;
		case "품절" : ds = 1; break;
		case "부족": ds = 2; break;
		case "여유" : ds = 3; break;
		}
		p.setStock(ds);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }		
		
		
		
		int listCount = mas.getListCount();
//		System.out.println(listCount);
		int slistCount = mas.productStatusCount(p);
		PageInfo pi = ProductPagination.getPageInfo(currentPage, slistCount);
		ArrayList<Product> list = null;
		if(ds == 0) {
			list = mas.selectsList(p,pi);
		}else if(ds ==1) {
			list = mas.selectsList(p,pi);
		}else if(ds ==2) {
			list = mas.selectsList(p,pi);
		} else if(ds ==3) {
			list = mas.selectsList(p,pi);
		}
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("listCount",listCount);
			mv.addObject("slistCount", slistCount);
			mv.addObject("pi", pi);
			mv.addObject("pStatus", pStatus);
			mv.setViewName("productManager");
		}else {
			throw new MyPageException("주문 조회에 실패하였습니다.");
		}
		return mv;
	}	
	
	
	/* 엑셀 파일 다운 */
	
	@RequestMapping("downloadExcelFile.ma")
	 public void listExcel(HttpServletRequest request,
	            HttpServletResponse response,@ModelAttribute("product") Product product,
	            ModelMap modelMap) throws ParsePropertyException, InvalidFormatException {

	        // Service의 해당 메소드로 실현될 쿼리로는 list select문을 그대로 사용하면 된다. 
	        List<Product> pList = mas.selectExcelList();
	        Map<String, Object> beans = new HashMap<String, Object>();
	        
	        beans.put("pList", pList);
	        System.out.println("pList"+pList);
	        
	        // 엑셀 다운로드 메소드가 담겨 있는 객체
	        MakeExcel me = new MakeExcel();
	        
	        // 인자로 request, response, Map Collection 객체, 파일명, 폴더명, 견본파일을 받는다.
	        me.download(request, response, beans, "src/main/webapp/WEB-INF/excel/", "recipe_market_Product.xlsx", "recipe.xlsx");
	    }

}
