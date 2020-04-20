package com.kh.recipeMarket.manager.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.manager.model.dao.ManagerDAO;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

@Service("mas")
public class MaServiceImpl implements ManagerService {

	 @Autowired
	private SqlSessionTemplate sqlSession;
	 
	 @Autowired
	 private ManagerDAO maDAO;
	 
	@Override
	public int orderCount() {
		return maDAO.orderCount(sqlSession);
	}

	@Override
	public ArrayList<mOrderInfo> orderList(PageInfo pi) {
		return maDAO.orderList(sqlSession, pi);
	}

	@Override
	public ArrayList<mOrderInfo> orderSortList(PageInfo pi, int status) {
		return maDAO.orderSortList(sqlSession, pi, status);
	}

	@Override
	public int orderStatus(Order o) {
		return maDAO.orderStatus(sqlSession, o);
	}

	@Override
	public int insertProduct(Product product) {
		return maDAO.insertProduct(sqlSession, product);
	}

	@Override
	public int uploadImage(Photo p) {
		return maDAO.uploadImage(sqlSession,p);
	}

	@Override
	public int getListCount() {
		return maDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		return maDAO.selectList(sqlSession,pi);
	}

	@Override
	public ArrayList<Product> productList(PageInfo pi) {
		return maDAO.productList(sqlSession, pi);
	}

}
