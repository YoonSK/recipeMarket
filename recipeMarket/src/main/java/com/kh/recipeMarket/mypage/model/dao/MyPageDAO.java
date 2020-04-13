package com.kh.recipeMarket.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;

@Repository("mpDAO")
public class MyPageDAO {

	public int mUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.mUpdate", m);
	}

	public int uploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.update("memberMapper.updateImage", p);
	}

	public int pwdUpdate(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.pwdUpdate", loginUser);
	}

}
