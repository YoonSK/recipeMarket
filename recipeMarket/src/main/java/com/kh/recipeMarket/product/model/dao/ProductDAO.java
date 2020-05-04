package com.kh.recipeMarket.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public ArrayList<Product> getProductList(SqlSessionTemplate sqlSession) {
//		ArrayList<Product> grainList = (ArrayList)sqlSession.selectList("productMapper.grainList"); // 곡류
//		ArrayList<Product> fruitList = (ArrayList)sqlSession.selectList("productMapper.fruitList"); // 과일류
//		ArrayList<Product> vegiList = (ArrayList)sqlSession.selectList("productMapper.vagiList"); // 채소류
//		ArrayList<Product> fishList = (ArrayList)sqlSession.selectList("productMapper.fishList"); // 어류
		
		return (ArrayList)sqlSession.selectList("productMapper.productList");
	}

	
}
