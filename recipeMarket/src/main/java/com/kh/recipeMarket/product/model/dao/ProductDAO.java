package com.kh.recipeMarket.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public ArrayList<Product> getProductList(SqlSessionTemplate sqlSession) {
		// 종류가 뭐 있었죠? 가공.. 신선 간편 세가지입니다 넵 DB켜주세요
		// 카테고리에는 뭐가 들어가는지는 안 정했나보죠? 위에 종류가 카테고리
		// 제 말은 1번이 들어가면 가공이고 그런게 아니고 그냥 아무거나 지금 제가 넣으면 그게 정해지는 거잖아요, 그쵸??네
		// 근데 상품 등록하는거 한 사람이 따로 있다고 하지 않았어요? 네
		// 그럼 그 사람이 카테고리 정했곘네요 누가 했어요?
		// 그 분하고 맞춰봐야할거 같은데 아니 근데 이거 최신거 받은거에요? 그래도 상품 등록 쪽은 있는걸로 알고있어요
		// 그 사람한테 물어보던가, 아니면 최신거 받던가 해야해요
//		ArrayList<Product> grainList = (ArrayList)sqlSession.selectList("productMapper.grainList"); // 곡류
//		ArrayList<Product> fruitList = (ArrayList)sqlSession.selectList("productMapper.fruitList"); // 과일류
//		ArrayList<Product> vegiList = (ArrayList)sqlSession.selectList("productMapper.vagiList"); // 채소류
//		ArrayList<Product> fishList = (ArrayList)sqlSession.selectList("productMapper.fishList"); // 어류
		
		return (ArrayList)sqlSession.selectList("productMapper.productList");
	}

	
}
