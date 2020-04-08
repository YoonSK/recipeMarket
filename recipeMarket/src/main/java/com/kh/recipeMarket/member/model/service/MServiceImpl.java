package com.kh.recipeMarket.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.member.model.dao.MemberDAO;
import com.kh.recipeMarket.member.model.vo.Member;

@Service("ms")
public class MServiceImpl implements MemberService {
	   
   @Autowired
   private MemberDAO mDAO;

   @Autowired
   private SqlSessionTemplate sqlSession;
   
	@Override
	public Member memberLogin(Member m) {
		return mDAO.selectMember(sqlSession, m);
	}

	@Override
	public int joinMember(Member m) {
		return mDAO.memberJoin(sqlSession, m);
	}

}
