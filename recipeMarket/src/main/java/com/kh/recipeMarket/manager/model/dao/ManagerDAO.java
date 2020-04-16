package com.kh.recipeMarket.manager.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

@Repository("maDAO")
public class ManagerDAO {

	public int orderCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.orderCount");
	}

	public ArrayList<mOrderInfo> orderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("managerMapper.orderList", rowBounds);
	}

}
