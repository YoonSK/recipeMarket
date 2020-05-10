package com.kh.recipeMarket.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.buy.model.vo.Order;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.vo.Follow;
import com.kh.recipeMarket.member.model.vo.Follow;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.mypage.model.vo.ReplyPr;
import com.kh.recipeMarket.mypage.model.vo.mOrderDetail;
import com.kh.recipeMarket.mypage.model.vo.mOrderInfo;
import com.kh.recipeMarket.recipe.model.vo.RecipePreview;

@Repository("mpDAO")
public class MyPageDAO {

	public int mUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.mUpdate", m);
	}

	public int updateImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.update("memberMapper.updateImage", p);
	}	
	
	public int uploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.update("memberMapper.mUploadImage", p);
	}

	public int pwdUpdate(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.pwdUpdate", loginUser);
	}

	public int mOrderCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.mOrderCount", memberNo);
	}

	public ArrayList<mOrderInfo> orderList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.orderList", memberNo, rowBounds);
	}

	public ArrayList<mOrderDetail> orderDetail(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("memberMapper.orderDetail", no);
	}

	public int orderStatus(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("memberMapper.orderStatus", o);
	}

	public ArrayList<mOrderInfo> orderSortList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.orderSortList", loginUser, rowBounds);
	}

	public int orderSortCount(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.selectOne("memberMapper.orderSortCount", loginUser);
	}

	public ArrayList<mOrderDetail> goWriteRv(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.goWriteRv", orderNo);
	}

	public int rvCount(SqlSessionTemplate sqlSession, int targetNo) {
		return sqlSession.selectOne("memberMapper.rvCount", targetNo);
	}

	public int insertRv(SqlSessionTemplate sqlSession, ReplyPr r) {
		return sqlSession.insert("memberMapper.insertRv", r);
	}

	public int rvResult(SqlSessionTemplate sqlSession, int targetNo) {
		return sqlSession.update("memberMapper.updateRv", targetNo);
	}

	public int orderCount(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("memberMapper.orderCount", orderNo);
	}

	public int updateOrderStatus(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("memberMapper.upOS", orderNo);
	}

	public int searchOrderCount(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.selectOne("memberMapper.searchOrderCount", loginUser);
	}

	public ArrayList<mOrderInfo> searchOrderList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.searchOrderList", loginUser, rowBounds);
	}

	public ArrayList<Follow> selectChefNews(SqlSessionTemplate sqlSession, int memberNo) {
		return  (ArrayList)sqlSession.selectList("memberMapper.selectChefNews",memberNo);
	}

	public ArrayList<RecipePreview> selectChefUpdate(SqlSessionTemplate sqlSession, Follow follow) {
		return  (ArrayList)sqlSession.selectList("memberMapper.selectChefUpdate",follow);
	}

	public ArrayList<Follow> selectChefUpdateNews(SqlSessionTemplate sqlSession, int memberNo) {
		return  (ArrayList)sqlSession.selectList("memberMapper.selectChefUpdateNews",memberNo);
	}
}
