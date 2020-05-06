package com.kh.recipeMarket.common.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.common.Like;
import com.kh.recipeMarket.common.dao.CommonDAO;
import com.kh.recipeMarket.common.vo.Reply;

@Service
public class CommonServiceImpl implements CommonService {
	
	
	@Autowired
	private CommonDAO cDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReply(Reply rp) {
		return cDAO.insertReply(sqlSession, rp);
	}

	@Override
	public ArrayList<Reply> selectReplies(int boardNo, int targetNo) {
		return cDAO.selectReplies(sqlSession, boardNo, targetNo);
	}

	@Override
	public int insertLike(Like lk) {
		if(cDAO.checkLike(sqlSession, lk) == null) {
			return cDAO.insertLike(sqlSession, lk);
		}
		else return 0;
	}

	@Override
	public int checkLike(Like lk) {
		return cDAO.checkLike(sqlSession, lk);
	}

}
