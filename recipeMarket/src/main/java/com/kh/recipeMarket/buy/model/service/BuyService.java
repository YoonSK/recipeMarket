package com.kh.recipeMarket.buy.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.buy.model.vo.OrderDetail;
import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.product.model.vo.Product;

public interface BuyService {

	ArrayList<Cart> cartList(int memberNo);

	int cartDelete(Cart cart);

	ArrayList<Cart> goBuy(List<Integer> prnArray, int memberNo);

	int insertOrder(Order o);

	int insertOrderD(ArrayList<OrderDetail> list);

	int getOrderNo(int memberNo);

	ArrayList<Cart> selectOrderDetail(int orderNo);

	int cartDeleteAfter(ArrayList<Cart> delList);

	int insertCart(Cart c);

	Product getPrDetail(int productNo);

	ArrayList<Reply> getReview(int productNo);

}
