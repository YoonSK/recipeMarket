package com.kh.recipeMarket.board.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.common.Photo;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b);

	Board selectBoard(int postNo);

	int uploadImage(Photo p);

	ArrayList<Board> profileList(PageInfo pi);

	Board selectProfile(int postNo);

//	int insertBoard(String nickName);


}
