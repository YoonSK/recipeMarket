package com.kh.recipeMarket.buy.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.buy.model.vo.Cart;

public interface BuyService {

	ArrayList<Cart> cartList(int memberNo);

}
