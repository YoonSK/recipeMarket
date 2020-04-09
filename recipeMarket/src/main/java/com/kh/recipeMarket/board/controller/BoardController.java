package com.kh.recipeMarket.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.board.model.exception.BoardException;
import com.kh.recipeMarket.board.model.service.BoardService;
import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.common.Pagination;
import com.kh.recipeMarket.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
//	@RequestMapping("insertView.bo")
//	public String boardInsertView() {
//		return "boardInsertForm";
//	}
	
	@RequestMapping("blist.bo")
	public ModelAndView boardList(@RequestParam(value = "page", required=false) Integer page, ModelAndView mv) {
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("boardListView");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
//		return "boardListView";
		return mv;
	}
	
	@RequestMapping("insertView.bo")
	public String boardInsertView() {
		return "boardInsertForm";
	}
	
	@RequestMapping("insert.bo")
	public String boardInsert(@ModelAttribute Board b, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		b.setMemberNo(memberNo);
		
		int result = bService.insertBoard(b);
		
		if( result > 0) {
			return "redirect:blist.bo";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}

}
