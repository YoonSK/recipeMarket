package com.kh.recipeMarket.common.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.common.Like;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.vo.Reply;
import com.kh.recipeMarket.common.vo.Targetter;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.recipe.model.vo.Ingredient;
import com.kh.recipeMarket.recipe.model.vo.SearchCon;
import com.kh.recipeMarket.recipe.model.vo.Tag;

@Repository("cDAO")
public class CommonDAO {
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply rp) {
		return (int)sqlSession.insert("commonMapper.insertReply", rp);
	}
	
	public ArrayList<Reply> selectReplies(SqlSessionTemplate sqlSession, int boardNo, int targetNo) {
		Targetter target = new Targetter(boardNo, targetNo);
		return (ArrayList)sqlSession.selectList("commonMapper.selectReplies", target);
	}
	
	public int insertPhotos(SqlSessionTemplate sqlSession, ArrayList<Photo> photos) {
		for (Photo photo : photos) {
		sqlSession.insert("commonMapper.insertPhotos", photo);
		}
		return 1;
	}
	
	public ArrayList<Photo> selectPhotos(SqlSessionTemplate sqlSession, int boardNo, int targetNo){
		Targetter target = new Targetter(boardNo, targetNo);
		return (ArrayList)sqlSession.selectList("commonMapper.selectPhotos", target);
	}
	
	public int insertLike(SqlSessionTemplate sqlSession, Like lk) {
		return sqlSession.insert("commonMapper.insertLike", lk);
	}

	public Integer checkLike(SqlSessionTemplate sqlSession, Like lk) {
		return sqlSession.selectOne("commonMapper.checkLike", lk);
	}

	public ArrayList<Product> searchProductList(SqlSessionTemplate sqlSession, SearchCon sc) {
		return (ArrayList)sqlSession.selectList("commonMapper.searchProductList", sc);
	}
}
