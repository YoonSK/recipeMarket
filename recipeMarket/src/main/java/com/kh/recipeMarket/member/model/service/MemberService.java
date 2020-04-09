package com.kh.recipeMarket.member.model.service;

import com.kh.recipeMarket.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int joinMember(Member m);

}
