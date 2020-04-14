package com.kh.recipeMarket.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.dao.MyPageDAO;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;


@Service("mps")
public class MPServiceImpl implements MyPageService{

	 @Autowired
	private SqlSessionTemplate sqlSession;
	 
	 @Autowired
	private MyPageDAO mpDAO;
		   
	@Override
	public int mUpdate(Member m) {
		return mpDAO.mUpdate(sqlSession, m);
	}


	@Override
	public int updateImage(Photo p) {
		return mpDAO.updateImage(sqlSession, p);
	}	
	
	@Override
	public int uploadImage(Photo p) {
		return mpDAO.uploadImage(sqlSession, p);
	}

	@Override
	public int pwdUpdate(Member loginUser) {
		return mpDAO.pwdUpdate(sqlSession, loginUser);
	}

	@Override
	public int mOrderCount(int memberNo) {
		return mpDAO.mOrderCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<mOrderInfo> orderList(PageInfo pi, int memberNo) {
		return mpDAO.orderList(sqlSession, pi, memberNo);
	}

	@Override
	public ArrayList<mOrderDetail> orderDetail(int no) {
		return mpDAO.orderDetail(sqlSession, no);
	}



}
