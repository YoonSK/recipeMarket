package com.kh.recipeMarket.mypage.model.service;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;

public interface MyPageService {

	int mUpdate(Member m);

	int uploadImage(Photo p);


}
