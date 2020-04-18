package com.kh.recipeMarket.manager.model.vo;

import com.kh.recipeMarket.board.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int currentPage, int listCount) {

		PageInfo pi = null;
		
		int pageLimit = 10;
		int maxPage ;
		int startPage;
		int endPage;
		int boardLimit = 20;
		
		maxPage= (int)((double)listCount / boardLimit + 0.95);
		
		startPage=(((int)((double)currentPage / pageLimit + 0.95)) - 1) * pageLimit +1;
		
		endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}

}
