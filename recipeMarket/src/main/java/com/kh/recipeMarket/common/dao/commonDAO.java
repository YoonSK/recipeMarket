package com.kh.recipeMarket.common.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.common.Reply;

public class commonDAO {
	public ArrayList<Reply> selectList(SqlSessionTemplate sqlSession, int postNo) {
		return (ArrayList)sqlSession.selectList("commonMapper.selectReplies", postNo);
	}
	
	
}
