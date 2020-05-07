package com.kh.recipeMarket.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.board.model.dao.BoardDAO;
import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.board.model.vo.Qna;
import com.kh.recipeMarket.common.Like;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.Reply;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO bDAO;
	 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int getListCount() {
		
		return bDAO.getListCount(sqlSession);
	}


	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDAO.selectList(sqlSession,pi);
	}

	@Override
	public ArrayList<Board> profileList(PageInfo pi) {
		return bDAO.profileList(sqlSession,pi);
	}
	
	@Override
	public ArrayList<Board> rCount(PageInfo pi) {
		return bDAO.rCount(sqlSession,pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertList(sqlSession, b);
	}


	@Override
	public Board selectBoard(int postNo) {
		return bDAO.selectBoard(sqlSession, postNo);
	}

	@Override
	public Board selectProfile(int postNo) {
		return bDAO.selectProfile(sqlSession, postNo);
	}
	
	

	@Override
	public int uploadImage(Photo p) {
		return bDAO.uploadImage(sqlSession, p);
	}


	@Override
	public int addReply(Reply r) {
		return bDAO.addReply(sqlSession, r);
	}


	@Override
	public ArrayList<Reply> selectReplyList(int postNo) {
		return bDAO.selectReplyList(sqlSession, postNo);
	}


	@Override
	public int bUpdate(Board b) {
		return bDAO.bUpdate(sqlSession, b);
	}


	@Override
	public int updateImage(Photo p) {
		return bDAO.updateImage(sqlSession, p);
	}


	@Override
	public int deleteBoard(int postNo) {
		return bDAO.deleteBoard(sqlSession, postNo);
	}


	@Override
	public int newUploadImage(Photo p) {
		return bDAO.newUploadImage(sqlSession, p);
	}


	@Override
	public int insertLike(Like like) {
		return bDAO.insertLike(sqlSession, like);
	}


	@Override
	public int deleteLike(Like like) {
		return bDAO.deleteLike(sqlSession, like);
	}


	@Override
	public Like selectLikeCheck(Like like) {
		return bDAO.selectLikeCheck(sqlSession, like);
	}


	@Override
	public ArrayList<Board> gCount(PageInfo pi) {
		return bDAO.gCount(sqlSession,pi);
	}


	@Override
	public Board selectrCount(int postNo) {
		return bDAO.selectrCount(sqlSession,postNo);
	}


	@Override
	public int rDelete(int replyNo) {
		return bDAO.rDelete(sqlSession,replyNo);
	}


	@Override
	public int insertQna(Qna q) {
		return bDAO.insertQna(sqlSession, q);
	}





	@Override
	public int qListCount() {
		return bDAO.qListCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> qList(PageInfo pi) {
		return bDAO.qList(sqlSession,pi);
	}


	@Override
	public ArrayList<Qna> selectQnaList(int memberNo) {
		return bDAO.selectQnaList(sqlSession, memberNo);
	}


	
	
}
