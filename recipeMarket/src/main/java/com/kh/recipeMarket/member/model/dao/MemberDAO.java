package com.kh.recipeMarket.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	public int memberJoin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.memberJoin", m);
	}

	public int uploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.insert("memberMapper.uploadImage", p);
	}

}
