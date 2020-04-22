package com.kh.recipeMarket.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.board.model.dao.BoardDAO;
import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
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


	




	
	

	
	
}
