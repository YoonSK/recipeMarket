package com.kh.recipeMarket.mypage.model.vo;

import java.sql.Date;

public class ReplyPr {
	
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
	
	private int etcNo;
	
	public ReplyPr() {
		super();
	}

	public ReplyPr(int replyNo, int memberNo, int boardNo,  int targetNo,String content, Date createDate, Date modifyDate,
			int rating, char deleted, int etcNo) {
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
		this.etcNo = etcNo;
	}
	


	public int getEtcNo() {
		return etcNo;
	}

	public void setEtcNo(int etcNo) {
		this.etcNo = etcNo;
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
		return "ReplyPr [replyNo=" + replyNo + ", memberNo=" + memberNo + ", boardNo=" + boardNo + ", targetNo="
				+ targetNo + ", content=" + content + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", rating=" + rating + ", deleted=" + deleted + ", nickName=" + nickName + ", pName=" + pName
				+ ", etcNo=" + etcNo + "]";
	}


	
}
