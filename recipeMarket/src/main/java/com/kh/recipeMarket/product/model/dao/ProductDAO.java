package com.kh.recipeMarket.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public ArrayList<Product> getProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.productList");
	}

	
}
