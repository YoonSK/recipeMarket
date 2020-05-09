package com.kh.recipeMarket.manager.model.service;

import java.sql.Date;

import java.util.ArrayList;
import java.util.List;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.manager.model.vo.Product;

import com.kh.recipeMarket.member.model.vo.Follow;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;
import com.kh.recipeMarket.recipe.model.vo.RecipePreview;

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

	int getSearchListCount(Product p);

	ArrayList<Product> searchList(Product p,PageInfo pi);

	ArrayList<Product> productSortList(Product p,PageInfo pi);

	int productSortCount(Product p);

	ArrayList<Product> selectsList(Product p, PageInfo pi);

	int productStatusCount(Product p);

	List<Product> selectRow();

	ArrayList<Cart> getProduct(Order o);

	int productExport(Cart cart);

	ArrayList<RecipePreview> topFoodList();

	ArrayList<RecipePreview> weatherFoodList(int weather);

	ArrayList<Follow> topChefList();

}
