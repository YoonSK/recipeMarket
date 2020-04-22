package com.kh.recipeMarket.manager.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

public interface ManagerService {

	int orderCount();

	ArrayList<mOrderInfo> orderList(PageInfo pi);

	ArrayList<mOrderInfo> orderSortList(PageInfo pi, int status);

	int orderStatus(Order o);

	int insertProduct(Product product);

	int uploadImage(Photo p);

	int getListCount();

	ArrayList<Product> selectList(PageInfo pi);

	ArrayList<Product> productList(PageInfo pi);

	int updateProduct(Product p);

	int oSortCount(int status);

}
