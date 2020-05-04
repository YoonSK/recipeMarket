package com.kh.recipeMarket.buy.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.buy.model.vo.Cart;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.buy.model.vo.OrderDetail;

@Repository("buyDAO")
public class BuyDAO {

	public ArrayList<Cart> cartList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("buyMapper.cartList", memberNo);
	}

	public int cartDelete(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.delete("buyMapper.cartDelete", cart);
	}

	public ArrayList<Cart> goBuy(SqlSessionTemplate sqlSession, List<Integer> prnArray) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", prnArray);
		return (ArrayList)sqlSession.selectList("buyMapper.goBuy", map);
	}

	public int insertOrder(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.insert("buyMapper.insertOrder", o);
	}

	public int insertOrderD(SqlSessionTemplate sqlSession, ArrayList<OrderDetail> list) {
		return sqlSession.insert("buyMapper.insertOrderD", list);
	}

	public int getOrderNo(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("buyMapper.getOrderNo", memberNo);
	}

	public ArrayList<Cart> selectOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("buyMapper.selectOrderDetail", orderNo);
	}

	public int cartDeleteAfter(SqlSessionTemplate sqlSession, ArrayList<Cart> delList) {
		return sqlSession.delete("buyMapper.cartDeleteAfter", delList);
	}

}
