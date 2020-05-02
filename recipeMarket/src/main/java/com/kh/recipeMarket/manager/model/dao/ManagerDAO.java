package com.kh.recipeMarket.manager.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

@Repository("maDAO")
public class ManagerDAO {

	public int orderCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.orderCount");
	}

	public ArrayList<mOrderInfo> orderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
		return (ArrayList)sqlSession.selectList("managerMapper.orderList", pi, rowBounds);
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

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("managerMapper.updateProduct", p);
	}

	public int oSortCount(SqlSessionTemplate sqlSession, int status) {
		return sqlSession.selectOne("managerMapper.oSortCount", status);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.selectOne("managerMapper.getSearchListCount",p);
	}

	public ArrayList<Product> searchList(SqlSessionTemplate sqlSession, Product p,PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.searchList",p, rowBounds);
	}

	public ArrayList<Product> productSortList(SqlSessionTemplate sqlSession, Product p,PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.productSortList",p,rowBounds);
	}

	public int productSortCount(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.selectOne("managerMapper.productSortCount",p);
	}

	public List<Product> selectExcelList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("managerMapper.selectExcelList");
	}

	public ArrayList<Product> selectsList(SqlSessionTemplate sqlSession,Product p, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.searchsList",p, rowBounds);
	}

	public int productStatusCount(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.selectOne("managerMapper.productStatusCount",p);
	}
	
	public List<Product> selectRow(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("managerMapper.selectExcelList");
	}

}
