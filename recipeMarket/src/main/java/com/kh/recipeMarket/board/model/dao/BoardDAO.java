package com.kh.recipeMarket.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.board.model.vo.PageInfo;
import com.kh.recipeMarket.board.model.vo.Qna;
import com.kh.recipeMarket.common.Like;
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
	
	public ArrayList<Board> rCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectrCount", null ,rowBounds);
	}
	
	public ArrayList<Board> gCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectgCount", null ,rowBounds);
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
	
	public int updateImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.update("boardMapper.updateImage",p );
	}
	
	public int newUploadImage(SqlSessionTemplate sqlSession, Photo p) {
		return sqlSession.insert("boardMapper.newUploadImage", p);
	}

	public int addReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.addReply",r );
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int postNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", postNo);
	}

	public int bUpdate(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard",b );
	}

	

	public int deleteBoard(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.update("boardMapper.deleteBoard", postNo);
	}

	public int insertLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.update("boardMapper.insertLike", like);
	}

	public int deleteLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.update("boardMapper.deleteLike", like);
	}

	public Like selectLikeCheck(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.selectOne("boardMapper.selectLikeCheck", like);
	}

	public Board selectrCount(SqlSessionTemplate sqlSession,int postNo) {
		return sqlSession.selectOne("boardMapper.rCount", postNo);
	}

	public int rDelete(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.rDelete", replyNo);
	}


	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("boardMapper.insetQna", q);
	}




	public int qListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.qListCount");
	}


	public ArrayList<Qna> qList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.qList", null, rowBounds);
	}


	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectQnaList", memberNo);
	}



	
	
}
