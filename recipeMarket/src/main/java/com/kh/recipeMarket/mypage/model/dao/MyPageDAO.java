package com.kh.recipeMarket.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

@Repository("mpDAO")
public class MyPageDAO {

	public int mUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.mUpdate", m);
	}

	public int updateImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.update("memberMapper.updateImage", p);
	}	
	
	public int uploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.update("memberMapper.mUploadImage", p);
	}

	public int pwdUpdate(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.pwdUpdate", loginUser);
	}

	public int mOrderCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.mOrderCount", memberNo);
	}

	public ArrayList<mOrderInfo> orderList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.orderList", memberNo, rowBounds);
	}

	public ArrayList<mOrderDetail> orderDetail(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("memberMapper.orderDetail", no);
	}

	public int orderStatus(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("memberMapper.orderStatus", o);
	}

}
