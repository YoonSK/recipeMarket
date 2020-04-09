package com.kh.recipeMarket.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int insertList(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.inserBoard",b);
	}
	
	
	
}
