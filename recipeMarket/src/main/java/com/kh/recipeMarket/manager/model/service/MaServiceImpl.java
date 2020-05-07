package com.kh.recipeMarket.manager.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.manager.model.dao.ManagerDAO;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;
import com.kh.recipeMarket.recipe.model.vo.RecipePreview;

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

	@Override
	public int updateProduct(Product p) {
		return maDAO.updateProduct(sqlSession,p);
	}

	@Override
	public int oSortCount(int status) {
		return maDAO.oSortCount(sqlSession, status);
	}

	@Override
	public int getSearchListCount(Product p) {
		return maDAO.getSearchListCount(sqlSession,p);
	}

	@Override
	public ArrayList<Product> searchList(Product p,PageInfo pi) {
		return maDAO.searchList(sqlSession,p,pi);
	}

	@Override
	public ArrayList<Product> productSortList(Product p,PageInfo pi) {
		return maDAO.productSortList(sqlSession,p,pi);
	}

	@Override
	public int productSortCount(Product p) {
		return maDAO.productSortCount(sqlSession,p);
	}

	@Override
	public ArrayList<Product> selectsList(Product p, PageInfo pi) {
		return maDAO.selectsList(sqlSession,p, pi);
	}

	@Override
	public int productStatusCount(Product p) {
		return maDAO.productStatusCount(sqlSession,p);
	}
	
	@Override
	public List<Product> selectRow() {
		return maDAO.selectRow(sqlSession);
	}

	@Override
	public ArrayList<Cart> getProduct(Order o) {
		return maDAO.getProduct(sqlSession, o);
	}

	@Override
	public int productExport(Cart list) {
		return maDAO.productExport(sqlSession, list);
	}

	@Override
	public ArrayList<RecipePreview> topFoodList() {
		return maDAO.topFoodList(sqlSession);
	}

	@Override
	public ArrayList<RecipePreview> weatherFoodList() {
		return maDAO.weatherFoodList(sqlSession);
	}

	
}
