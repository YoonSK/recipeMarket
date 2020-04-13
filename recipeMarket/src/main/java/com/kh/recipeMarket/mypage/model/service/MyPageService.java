package com.kh.recipeMarket.mypage.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;

public interface MyPageService {

	int mUpdate(Member m);

	int uploadImage(Photo p);

	int pwdUpdate(Member loginUser);

	int mOrderCount(int memberNo);

	ArrayList<Order> orderList(PageInfo pi);

	String getListNames(int memberNo);


}
