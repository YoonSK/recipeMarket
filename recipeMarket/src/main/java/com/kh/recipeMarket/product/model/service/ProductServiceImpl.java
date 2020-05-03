package com.kh.recipeMarket.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.product.model.dao.ProductDAO;
import com.kh.recipeMarket.product.model.vo.Product;

@Service("pService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO pDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Product> getProductList() {
		return pDAO.getProductList(sqlSession);
	}

}
