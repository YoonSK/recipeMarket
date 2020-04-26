package com.kh.recipeMarket.common.service;

import java.util.ArrayList;

import com.kh.recipeMarket.common.vo.Reply;

public interface CommonService {
	
	int insertReply(Reply rp);
	
	ArrayList<Reply> selectReplies(int boardNo, int targetNo);
	

}
