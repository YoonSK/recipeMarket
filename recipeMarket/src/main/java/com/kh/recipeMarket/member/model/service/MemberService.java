package com.kh.recipeMarket.member.model.service;

import com.kh.recipeMarket.common.Photo;
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

}
