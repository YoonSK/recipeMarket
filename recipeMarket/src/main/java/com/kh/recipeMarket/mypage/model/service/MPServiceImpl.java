package com.kh.recipeMarket.mypage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.dao.MyPageDAO;


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
	public int uploadImage(Photo p) {
		return mpDAO.uploadImage(sqlSession, p);
	}


}
