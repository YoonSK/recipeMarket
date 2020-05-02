package com.kh.recipeMarket.buy.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.buy.model.dao.BuyDAO;
import com.kh.recipeMarket.buy.model.vo.Cart;

@Service("bs")
public class BuyServiceImpl implements BuyService{
	 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BuyDAO buyDAO;

	@Override
	public ArrayList<Cart> cartList(int memberNo) {
		return buyDAO.cartList(sqlSession, memberNo);
	}

	@Override
	public int cartDelete(Cart cart) {
		return buyDAO.cartDelete(sqlSession, cart);
	}
}
