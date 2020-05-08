package com.kh.recipeMarket.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.dao.MemberDAO;
import com.kh.recipeMarket.member.model.vo.Follow;
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
	public String getPhoto(int memberNo) {
		return mDAO.getPhoto(sqlSession, memberNo);
	}	
	
	@Override
	public int joinMember(Member m) {
		return mDAO.memberJoin(sqlSession, m);
	}

	@Override
	public int uploadImage(Photo p) {
		return mDAO.uploadImage(sqlSession, p);
	}

	@Override
	public int checkIdDup(String id) {
		return mDAO.checkIdDup(sqlSession, id);
	}

	@Override
	public int checkNickDup(String nickName) {
		return mDAO.checkNickDup(sqlSession, nickName);
	}

	@Override
	public String findId(Member m) {
		return mDAO.findId(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return mDAO.updatePwd(sqlSession, m);
	}

	@Override
	public Member CheckPwd(Member m) {
		return mDAO.checkPwd(sqlSession, m);
	}

	@Override
	public int mDeleteUp(int no) {
		return mDAO.mDeleteUp(sqlSession, no);
	}

	@Override
	public int mDelete(Member loginUser) {
		return mDAO.mDelete(sqlSession, loginUser);
	}

	@Override
	public Member checkKaKao(HashMap<String, Object> userInfo) {
		return mDAO.checkKaKao(sqlSession, userInfo);
	}

	@Override
	public int kJoinMember(Member m) {
		return mDAO.kJoinMember(sqlSession, m);
	}

	@Override
	public int insertFollow(Follow follow) {
		return mDAO.insertFollow(sqlSession, follow);
	}

	@Override
	public Follow findMno(Follow follow) {
		return mDAO.findMno(sqlSession, follow);
	}

	@Override
	public ArrayList<Follow> selectFollowing(Follow follow) {
		return mDAO.selectFollowing(sqlSession, follow);
	}

	@Override
	public ArrayList<Follow> selectFollower(Follow follow) {
		return mDAO.selectFollower(sqlSession,follow);
	}

	@Override
	public int deleteFollow(Follow follow) {
		return mDAO.deleteFollow(sqlSession, follow);
	}

	@Override
	public int deleteFollower(Follow follow) {
		return mDAO.deleteFollwer(sqlSession,follow);
	}
}
