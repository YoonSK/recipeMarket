package com.kh.recipeMarket.buy.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.buy.model.vo.OrderDetail;
import com.kh.recipeMarket.member.model.vo.Member;

public interface BuyService {

	ArrayList<Cart> cartList(int memberNo);

	int cartDelete(Cart cart);

	ArrayList<Cart> goBuy(List<Integer> prnArray);

	int insertOrder(Order o);

	int insertOrderD(ArrayList<OrderDetail> list);

	int getOrderNo(int memberNo);

	ArrayList<Cart> selectOrderDetail(int orderNo);

	int cartDeleteAfter(ArrayList<Cart> delList);

}
