package com.kh.recipeMarket.member.model.service;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int joinMember(Member m);

	int uploadImage(Photo p);

}
