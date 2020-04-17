package com.kh.recipeMarket.manager.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.manager.model.dao.ManagerDAO;
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

}
