package com.kh.recipeMarket.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Pagination;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.vo.Follow;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.exception.MyPageException;
import com.kh.recipeMarket.mypage.model.service.MyPageService;
import com.kh.recipeMarket.mypage.model.vo.ReplyPr;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

@SessionAttributes("loginUser")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mps;

	@Autowired
	private BCryptPasswordEncoder bcrypt;	
	
	@RequestMapping("mypage.mp")
	public String goMypage() {
		return "/mypage";
	}
	
	@RequestMapping("goInfo.mp")
	public String goInfo() {
		return "/memberInfo";
	}
	
	@RequestMapping("gomupdate.mp")
	public String gomUpdate(){
		return "/memberUpdate";
	}

	@RequestMapping("mUpdate.mp")
	public String mUpadate(@ModelAttribute Member m, @ModelAttribute Photo p, 
							@RequestParam("mImage") MultipartFile mImage, HttpServletRequest request, Model model) {
		int result = mps.mUpdate(m);
		if(result > 0) {
			// 사진 첨부
			if(mImage != null && !mImage.isEmpty() && m.getpName() != null) {
				String pName = saveImage(mImage, request);		
				System.out.println(m.getpName());
				if(pName != null) {
					p.setOriginName(mImage.getOriginalFilename());
					p.setChangeName(pName);
					p.setTargetNo(m.getMemberNo());
				}
				int result2 = mps.updateImage(p);
				if(result2 > 0) {
					m.setpName(pName);
					model.addAttribute("loginUser", m);	
					return "/memberInfo";						
				} else {
					throw new MemberException("정보 수정에 실패하였습니다.");					
				}
				
			} else if(mImage != null && !mImage.isEmpty() && m.getpName() == null) {
				String pName = saveImage(mImage, request);				
				if(pName != null) {
					p.setOriginName(mImage.getOriginalFilename());
					p.setChangeName(pName);
					p.setTargetNo(m.getMemberNo());
				}
				int result3 = mps.uploadImage(p);	
				if(result3 > 0) {
					m.setpName(pName);
					model.addAttribute("loginUser", m);	
					return "/memberInfo";						
				} else {
					throw new MemberException("정보 수정에 실패하였습니다.");					
				}				
				
			} else {
				model.addAttribute("loginUser", m);				
				return "/memberInfo";	
			}
		} else {
				throw new MemberException("정보 수정에 실패하였습니다.");
		}		
	}

	
	// 이미지 업로드
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
	
	// 비밀번호 변경
	@RequestMapping("pwdUpdate.mp")
	public String pwdUpdate(String pwd, String newPwd, Model model) {
		Member loginUser = (Member)model.getAttribute("loginUser");
		
	      String encNewPwd = bcrypt.encode(newPwd);
	      if(bcrypt.matches(pwd, loginUser.getPwd())) {
	    	  loginUser.setPwd(encNewPwd);
	    	  int result = mps.pwdUpdate(loginUser);
	    	  if(result > 0) {
	    		  return "memberInfo";
	    	  }else {
		            throw new MyPageException("비밀번호 변경 실패");	    		  
	    	  }
	      } else {
		    	  model.addAttribute("msg", "원래 비밀번호와 일치하지 않습니다.");
		    	  model.addAttribute("url", "memberUpdate.jsp");
		    	  return "pwdError";
		      }
	} 
	
	// 주문 조회
	@RequestMapping("mOrder.mp")
	public ModelAndView mOrder(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, Model model){
		Member loginUser = (Member)model.getAttribute("loginUser");		
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }
		
		int listCount = mps.mOrderCount(loginUser.getMemberNo());
		int memberNo = loginUser.getMemberNo();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<mOrderInfo> list = mps.orderList(pi, memberNo);

		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("memberorder");
		}else {
			throw new MyPageException("주문 조회에 실패하였습니다.");
		}
		return mv;
	}	
	
	// 주문 기간 조회
	@RequestMapping("dateSort.mp")
	public ModelAndView dateSort(@RequestParam(value="page", required=false) Integer page, String sortDate, ModelAndView mv, Model model) {
		Member loginUser = (Member)model.getAttribute("loginUser");		
		String date = sortDate;
		int ds = 0;
		switch(date) {
		case "전체": ds = 0; break;
		case "1개월" : ds = 31; break;
		case "3개월": ds = 91; break;
		case "6개월" : ds = 181; break;
		case "1년" : ds = 366; break;
		}
		int oGrade = loginUser.getGrade();
		loginUser.setGrade(ds);
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }		
		int listCount = mps.oderSortCount(loginUser);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<mOrderInfo> list = mps.orderSortList(pi, loginUser);
		loginUser.setGrade(oGrade);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("sortDate", date);
			mv.setViewName("memberorder");
		}else {
			throw new MyPageException("주문 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 주문 상세 조회
	@RequestMapping(value="orderDetail.mp", produces="text/plain;charset=UTF-8")
	public void orderDetail(HttpServletResponse response, @RequestParam("no") int no) throws JsonIOException, IOException {
		
		ArrayList<mOrderDetail> od = mps.orderDetail(no);

		for(mOrderDetail mrd : od) {
			mrd.setpName(URLEncoder.encode(mrd.getpName(), "UTF-8"));
			mrd.setmName(URLEncoder.encode(mrd.getmName(), "UTF-8"));
			mrd.setAddress(URLEncoder.encode(mrd.getAddress(), "UTF-8"));
			mrd.setAddress2(URLEncoder.encode(mrd.getAddress2(), "UTF-8"));
			if(mrd.getNote() != null) {
				mrd.setNote(URLEncoder.encode(mrd.getNote(), "UTF-8"));
			}
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(od, response.getWriter());
	}
		
	// 주문 버튼 처리
	@RequestMapping(value="oStatus.mp")
	public void orderStatus(HttpServletResponse response, @ModelAttribute Order o) throws JsonIOException, IOException {
		int result = mps.orderStatus(o);
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
	}	
	
	// 후기 작성 페이지
	@RequestMapping(value="writeRv.mp")
	public ModelAndView goWriteRv(@RequestParam("orderNo") int orderNo, ModelAndView mv) {
		
		ArrayList<mOrderDetail> od = mps.goWriteRv(orderNo);
		if(od != null) {
			mv.addObject("list", od);
			mv.setViewName("memRV");
		}else {
			throw new MyPageException("페이지 불러오기에 실패하였습니다.");
		}
		return mv;		
		
	}
	
	// 후기 작성
	@RequestMapping(value="insertRv.mp")
	public void insertRv(HttpServletResponse response, @ModelAttribute ReplyPr r, Model model, @RequestParam("orderNo") int orderNo) throws JsonIOException, IOException {
		Member loginUser = (Member)model.getAttribute("loginUser");	
		r.setMemberNo(loginUser.getMemberNo());
		
		// 후기 썼는지 확인
		int rvcResult = mps.rvCount(r.getTargetNo());
	
		// 후기 안 썼으면 후기 입력	
		if(rvcResult < 1) {
			System.out.println(r);
			int insertResult = mps.insertRv(r);
	
			// 후기 작성 후 ORDER_DETAIL REVIEWED 항목 Y로 수정
			if(insertResult > 0) {
				int rvResult = mps.rvResult(r.getTargetNo());
			
				// 한 주문에 있는 모든 상품의 후기 작성 여부 확인
				if(rvResult > 0) {
					int odCount = mps.orderCount(orderNo);

					if(odCount == 0) {
						int odStatus = mps.updateOrderStatus(orderNo);
						if(odStatus >  0) {
							Gson gson = new Gson();
							String result = "후기 작성이 완료되었습니다.";
							gson.toJson(URLEncoder.encode(result, "UTF-8"), response.getWriter());	
						}else {
							Gson gson = new Gson();
							String result = "후기 작성이 완료되었습니다.";
							gson.toJson(URLEncoder.encode(result, "UTF-8"), response.getWriter());								
						}
					}else {
						Gson gson = new Gson();
						String result = "후기 작성이 완료되었습니다.";
						gson.toJson(URLEncoder.encode(result, "UTF-8"), response.getWriter());						
					}
				} else {
					Gson gson = new Gson();
					String result = "후기 업로드 중 오류가 발생했습니다.";
					gson.toJson(URLEncoder.encode(result, "UTF-8"), response.getWriter());						
				}
			}else {
				// 이미 해당 상품 후기 작성시
				Gson gson = new Gson();
				String result = "후기 업로드 중 오류가 발생했습니다.";
				gson.toJson(URLEncoder.encode(result, "UTF-8"), response.getWriter());					
			}
		} else {
			// 이미 해당 상품 후기 작성시
			Gson gson = new Gson();
			String result = "이미 후기를 작성하셨습니다.";
			gson.toJson(URLEncoder.encode(result, "UTF-8"), response.getWriter());			
		}	
	}
	// 주문 검색
	@RequestMapping("searchOrder.mp")
	public ModelAndView searchOrder(@RequestParam(value="page", required=false) Integer page, String oContent, ModelAndView mv, Model model){
		Member loginUser = (Member)model.getAttribute("loginUser");		
		String oEmail = loginUser.getEmail();
		loginUser.setEmail(oContent);
		int currentPage = 1;
		if(page != null) {
			currentPage = page; }		
		int listCount = mps.searchOrderCount(loginUser);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<mOrderInfo> list = mps.searchOrderList(pi, loginUser);
		loginUser.setEmail(oEmail);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("oContent", oContent);
			mv.setViewName("memberorder");
		}else {
			throw new MyPageException("주문 검색에 실패하였습니다.");
		}
		return mv;		
		
		
	}
	
//	
//	@RequestMapping("chefNews.mp")
//	public String goChefNews() {
//		return "chefNews";
//	}
//	
	

	@RequestMapping("chefNews.mp")
		public ModelAndView chefNews(HttpSession session, ModelAndView mv, Follow follow){
		
			Member loginUser = (Member)session.getAttribute("loginUser");
			int memberNo = loginUser.getMemberNo();
			
			ArrayList<Follow> clist = mps.selectChefNews(memberNo);
			ArrayList<Follow> rlist = mps.selectChefUpdateNews(memberNo);
			System.out.println("clist : " + clist);
//			ArrayList<RecipePreview> rlist = new ArrayList<RecipePreview>();
//			for(int i = 0; i< clist.size(); i++) {
//				
//				follow.setTargetNo(clist.get(i).getMemberNo());
//				System.out.println("follow : " + follow);
//				rlist = mps.selectChefUpdate(follow);
//			}
			System.out.println("rlist : "+rlist);
			mv.addObject("clist", clist);
			mv.addObject("rlist", rlist);
			mv.setViewName("chefNews");
			return mv;
		}
}
