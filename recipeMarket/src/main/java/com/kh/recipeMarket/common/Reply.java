package com.kh.recipeMarket.common;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private int memberNo;
	private int boardNo;
	private int targetNo;
	
	private String content;
	private Date createDate;
	private Date modifyDate;
	private int rating;
	private char deleted;
	
	private String nickName; // 작성자 닉네임
	private String pName; // 작성자 프로필사진
	
	public Reply() {
		super();
	}

	public Reply(int replyNo, int memberNo, int boardNo,  int targetNo,String content, Date createDate, Date modifyDate,
			int rating, char deleted) {
		super();
		this.replyNo = replyNo;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.targetNo = targetNo;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.rating = rating;
		this.deleted = deleted;
	}
	
	
	// 자유게시판 댓글에서 닉네임, 작성자 프로필 사진을 위해 만든 생성자(회원번호대신 nickName사용 , 프로필 사진을 위해 pName사용)
	public Reply(int replyNo, int memberNo, int boardNo,int targetNo,  String content, Date createDate, Date modifyDate,
			int rating, char deleted, String nickName, String pName) {
		super();
		this.replyNo = replyNo;
		this.nickName = nickName;
		this.boardNo = boardNo;
		this.targetNo = targetNo;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.rating = rating;
		this.deleted = deleted;
		this.pName = pName;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}



	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", memberNo=" + memberNo + ", boardNo=" + boardNo + ", targetNo="
				+ targetNo + ", content=" + content + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", rating=" + rating + ", deleted=" + deleted + ", nickName=" + nickName + ", pName=" + pName + "]";
	}
	
	
	
	
	
	
}
