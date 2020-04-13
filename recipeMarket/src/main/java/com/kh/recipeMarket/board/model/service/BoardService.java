package com.kh.recipeMarket.board.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b);

//	int insertBoard(String nickName);


}
