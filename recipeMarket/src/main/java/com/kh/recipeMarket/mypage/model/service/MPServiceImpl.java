package com.kh.recipeMarket.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.vo.Follow;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.dao.MyPageDAO;
import com.kh.recipeMarket.mypage.model.vo.ReplyPr;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;
import com.kh.recipeMarket.recipe.model.vo.RecipePreview;


@Service("mps")
public class MPServiceImpl implements MyPageService{

	 @Autowired
	private SqlSessionTemplate sqlSession;
	 
	 @Autowired
	private MyPageDAO mpDAO;
		   
	@Override
	public int mUpdate(Member m) {
		return mpDAO.mUpdate(sqlSession, m);
	}


	@Override
	public int updateImage(Photo p) {
		return mpDAO.updateImage(sqlSession, p);
	}	
	
	@Override
	public int uploadImage(Photo p) {
		return mpDAO.uploadImage(sqlSession, p);
	}

	@Override
	public int pwdUpdate(Member loginUser) {
		return mpDAO.pwdUpdate(sqlSession, loginUser);
	}

	@Override
	public int mOrderCount(int memberNo) {
		return mpDAO.mOrderCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<mOrderInfo> orderList(PageInfo pi, int memberNo) {
		return mpDAO.orderList(sqlSession, pi, memberNo);
	}

	@Override
	public ArrayList<mOrderDetail> orderDetail(int no) {
		return mpDAO.orderDetail(sqlSession, no);
	}

	@Override
	public int orderStatus(Order o) {
		return mpDAO.orderStatus(sqlSession, o);
	}

	@Override
	public ArrayList<mOrderInfo> orderSortList(PageInfo pi, Member loginUser) {
		return mpDAO.orderSortList(sqlSession, pi, loginUser);
	}


	@Override
	public int oderSortCount(Member loginUser) {
		return mpDAO.orderSortCount(sqlSession, loginUser);
	}


	@Override
	public ArrayList<mOrderDetail> goWriteRv(int orderNo) {
		return mpDAO.goWriteRv(sqlSession, orderNo);
	}


	@Override
	public int rvCount(int targetNo) {
		return mpDAO.rvCount(sqlSession, targetNo);
	}


	@Override
	public int insertRv(ReplyPr r) {
		return mpDAO.insertRv(sqlSession, r);
	}


	@Override
	public int rvResult(int targetNo) {
		return mpDAO.rvResult(sqlSession, targetNo);
	}


	@Override
	public int orderCount(int orderNo) {
		return mpDAO.orderCount(sqlSession, orderNo);
	}


	@Override
	public int updateOrderStatus(int orderNo) {
		return mpDAO.updateOrderStatus(sqlSession, orderNo);
	}


	@Override
	public int searchOrderCount(Member loginUser) {
		return mpDAO.searchOrderCount(sqlSession, loginUser);
	}


	@Override
	public ArrayList<mOrderInfo> searchOrderList(PageInfo pi, Member loginUser) {
		return mpDAO.searchOrderList(sqlSession, pi, loginUser);
	}


	@Override
	public ArrayList<Follow> selectChefNews(int memberNo) {
		return mpDAO.selectChefNews(sqlSession, memberNo);
	}


	@Override
	public ArrayList<RecipePreview> selectChefUpdate(Follow follow) {
		return mpDAO.selectChefUpdate(sqlSession, follow);
	}


	@Override
	public ArrayList<Follow> selectChefUpdateNews(int memberNo) {
		return mpDAO.selectChefUpdateNews(sqlSession, memberNo);
	}


}
