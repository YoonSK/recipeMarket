package com.kh.recipeMarket.common.service;

import java.util.ArrayList;

import com.kh.recipeMarket.common.Like;
import com.kh.recipeMarket.common.vo.Reply;

public interface CommonService {
	
	int insertReply(Reply rp);
	
	ArrayList<Reply> selectReplies(int boardNo, int targetNo);
	
	int insertLike(Like lk);
	
	int checkLike(Like lk);
}
