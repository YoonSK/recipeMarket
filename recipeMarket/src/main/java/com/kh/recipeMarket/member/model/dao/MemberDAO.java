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

	public String getPhoto(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.getPhoto", memberNo);
	}
	
	public int memberJoin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.memberJoin", m);
	}

	public int uploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.insert("memberMapper.uploadImage", p);
	}

	public int checkIdDup(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkIdDup", id);
	}

	public int checkNickDup(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickDup", nickName);
	}

	public int mDelete(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("memberMapper.mDelete", no);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

}
