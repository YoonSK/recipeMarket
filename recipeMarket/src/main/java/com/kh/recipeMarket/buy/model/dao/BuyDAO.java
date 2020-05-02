package com.kh.recipeMarket.buy.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.buy.model.vo.Cart;

@Repository("buyDAO")
public class BuyDAO {

	public ArrayList<Cart> cartList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("buyMapper.cartList", memberNo);
	}

}
