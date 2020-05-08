package com.kh.recipeMarket.buy.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.buy.model.dao.BuyDAO;
import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.buy.model.vo.OrderDetail;
import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.product.model.vo.Product;

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

	@Override
	public ArrayList<Cart> goBuy(List<Integer> prnArray) {
		return buyDAO.goBuy(sqlSession, prnArray);
	}

	@Override
	public int insertOrder(Order o) {
		return buyDAO.insertOrder(sqlSession, o);
	}

	@Override
	public int insertOrderD(ArrayList<OrderDetail> list) {
		return buyDAO.insertOrderD(sqlSession, list);
	}

	@Override
	public int getOrderNo(int memberNo) {
		return buyDAO.getOrderNo(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Cart> selectOrderDetail(int orderNo) {
		return buyDAO.selectOrderDetail(sqlSession, orderNo);
	}

	@Override
	public int cartDeleteAfter(ArrayList<Cart> delList) {
		return buyDAO.cartDeleteAfter(sqlSession, delList);
	}

	@Override
	public int insertCart(Cart c) {
		return buyDAO.insertCart(sqlSession, c);
	}

	@Override
	public Product getPrDetail(int productNo) {
		return buyDAO.getPrDetail(sqlSession, productNo);
	}

	@Override
	public ArrayList<Reply> getReview(int productNo) {
		return buyDAO.getReview(sqlSession, productNo);
	}

}
