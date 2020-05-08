package com.kh.recipeMarket.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Follow;
import com.kh.recipeMarket.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int joinMember(Member m);

	int uploadImage(Photo p);

	int checkIdDup(String id);

	int checkNickDup(String nickName);

	String getPhoto(int memberNo);

	String findId(Member m);

	int updatePwd(Member m);

	Member CheckPwd(Member m);

	int mDeleteUp(int no);

	int mDelete(Member loginUser);

	Member checkKaKao(HashMap<String, Object> userInfo);

	int kJoinMember(Member m);

	int insertFollow(Follow follow);

	//int findMno(Follow follow);

	Follow findMno(Follow follow);

	ArrayList<Follow> selectFollowing(Follow follow);

	ArrayList<Follow> selectFollower(Follow follow);

	int deleteFollow(Follow follow);

	int deleteFollower(Follow follow);

}
