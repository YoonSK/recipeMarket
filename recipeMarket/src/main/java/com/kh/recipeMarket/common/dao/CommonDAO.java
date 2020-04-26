package com.kh.recipeMarket.common.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.common.vo.Reply;
import com.kh.recipeMarket.common.vo.Targetter;

@Repository("cDAO")
public class CommonDAO {
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply rp) {
		return (int)sqlSession.insert("commonMapper.insertReply", rp);
	}
	
	public ArrayList<Reply> selectReplies(SqlSessionTemplate sqlSession, int boardNo, int targetNo) {
		Targetter target = new Targetter(boardNo, targetNo);
		return (ArrayList)sqlSession.selectList("commonMapper.selectReplies", target);
	}
	
	
}
