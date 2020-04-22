package com.kh.recipeMarket.board.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.recipeMarket.board.model.exception.BoardException;
import com.kh.recipeMarket.board.model.service.BoardService;
import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.common.Pagination;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.service.MemberService;
import com.kh.recipeMarket.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	private MemberService ms;
	
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
		ArrayList<Board> plist = bService.profileList(pi);
		ArrayList<Board> rlist = bService.rCount(pi);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("plist", plist);
			mv.addObject("rlist", rlist);
			mv.addObject("pi",pi);
			mv.setViewName("boardListView");
			System.out.println(rlist);
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
	public String boardInsert(@ModelAttribute Board b, @ModelAttribute Photo p, HttpSession session, @RequestParam("bImage") MultipartFile bImage,
								HttpServletRequest request) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		//String nickName = loginUser.getNickName();
		
		b.setMemberNo(memberNo);
		//b.setNickName(nickName);
		
		int result = bService.insertBoard(b);
		
		if( result > 0) {
			// 사진 첨부
			if(bImage != null && !bImage.isEmpty()) {
				String pName = saveImage(bImage, request);
			
				if(pName != null) {
						p.setOriginName(bImage.getOriginalFilename());
						p.setChangeName(pName);
					}
					int result2 = bService.uploadImage(p);
					if(result2 > 0) {
						return "boardListView";						
					} else {
						throw new MemberException("게시글 등록에 실패하였습니다.");					
					}
					
				} else {
					return "boardListView";		
			}
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
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
	
	@RequestMapping("bdetail.bo")
	public ModelAndView boardDetail(@RequestParam("postNo") int postNo, @RequestParam("page") int page, ModelAndView mv) {
		
		
		Board board = bService.selectBoard(postNo);
		Board profile = bService.selectProfile(postNo);
		
		if(board != null) {
			mv.addObject("board", board);
			mv.addObject("profile", profile);
			mv.addObject("page",page);
			mv.setViewName("boardDetailView");
			
			return mv;
		}else {
			throw new BoardException("게시글 상세 조회에 실패하였습니다.");
		}
	}
	
	
	@RequestMapping("rList.bo")
	public void getReplyList(HttpServletResponse reponse, @RequestParam("postNo") int postNo) throws JsonIOException, IOException {
		ArrayList<Reply> rList = bService.selectReplyList(postNo);
		
		System.out.println("controller 의 rList : " + rList);
		
		for(Reply r : rList) {
			r.setContent(URLEncoder.encode(r.getContent(),"UTF-8"));
			r.setNickName(URLEncoder.encode(r.getNickName(),"UTF-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		System.out.println(reponse.getWriter());
		gson.toJson(rList, reponse.getWriter());
		
	}
	
	
	@RequestMapping("addReply.bo")
	@ResponseBody
	public String getAddReply(Reply r, HttpSession session) {
		
		Member loginUser =(Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		r.setMemberNo(memberNo);
		
		int result = bService.addReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("댓글 등록 실패");
		}
	}
}
