package com.kh.recipeMarket.common.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.common.dao.CommonDAO;
import com.kh.recipeMarket.common.vo.Reply;
import com.kh.recipeMarket.recipe.model.dao.RecipeDAO;

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

}
