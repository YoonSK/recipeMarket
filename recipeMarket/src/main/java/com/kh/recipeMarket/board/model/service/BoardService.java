package com.kh.recipeMarket.board.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.board.model.vo.Qna;
import com.kh.recipeMarket.common.Like;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.Reply;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);
	
	
	ArrayList<Board> rCount(PageInfo pi);

	int insertBoard(Board b);

	Board selectBoard(int postNo);

	int uploadImage(Photo p);

	ArrayList<Board> profileList(PageInfo pi);

	Board selectProfile(int postNo);

	int addReply(Reply r);

	ArrayList<Reply> selectReplyList(int postNo);

	int bUpdate(Board b);

	int updateImage(Photo p);

	int deleteBoard(int postNo);

	int newUploadImage(Photo p);

	//Like like(int targetNo, int memberNo);

	int insertLike(Like like);

	int deleteLike(Like like);

	Like selectLikeCheck(Like like);

	ArrayList<Board> gCount(PageInfo pi);

	Board selectrCount(int postNo);

	int rDelete(int replyNo);

	int insertQna(Qna q);

	ArrayList<Qna> qList(PageInfo pi);

	int qListCount();

	ArrayList<Qna> selectQnaList(int memberNo);

	

//	int insertBoard(String nickName);


}
