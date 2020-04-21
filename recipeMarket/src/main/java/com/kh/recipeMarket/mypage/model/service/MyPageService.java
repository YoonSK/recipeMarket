package com.kh.recipeMarket.mypage.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

public interface MyPageService {

	int mUpdate(Member m);

	int updateImage(Photo p);	
	
	int uploadImage(Photo p);

	int pwdUpdate(Member loginUser);

	int mOrderCount(int memberNo);

	ArrayList<mOrderInfo> orderList(PageInfo pi, int memberNo);

	ArrayList<mOrderDetail> orderDetail(int no);

	int orderStatus(Order o);

	ArrayList<mOrderInfo> orderSortList(PageInfo pi, Member loginUser);

	int oderSortCount(Member loginUser);

}
