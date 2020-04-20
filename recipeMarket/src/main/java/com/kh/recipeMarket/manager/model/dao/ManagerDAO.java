package com.kh.recipeMarket.manager.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
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

	public ArrayList<mOrderInfo> orderSortList(SqlSessionTemplate sqlSession, PageInfo pi, int status) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.orderSortList", status, rowBounds);
	}

	public int orderStatus(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("managerMapper.orderStatus", o);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.insert("managerMapper.insertProduct",product);
	}

	public int uploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.insert("managerMapper.uploadImage",p);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.getListCount");
	}

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.selectList", null, rowBounds);
	}

	public ArrayList<Product> productList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.productList", null, rowBounds);
	
	}

}
