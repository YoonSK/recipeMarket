package com.kh.recipeMarket.manager.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;

public interface ManagerService {

	int orderCount();

	ArrayList<mOrderInfo> orderList(PageInfo pi);

	ArrayList<mOrderInfo> orderSortList(PageInfo pi, int status);

}
