package com.kh.recipeMarket.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.Reply;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Board> profileList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.profileList", null, rowBounds);
	}

	public int insertList(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.inserBoard",b);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("boardMapper.selectBoard",postNo);
	}
	
	public Board selectProfile(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("boardMapper.selectProfile",postNo);
	}

	public int uploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.insert("boardMapper.uploadImage", p);
	}

	public int addReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.addReply",r );
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int postNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", postNo);
	}

	
	
}
