package com.kh.recipeMarket.board.model.vo;

import java.sql.Date;

public class Board {
	private int postNo;
	private int memberNo;
	private String nickName;
	private String content;
	private Date createDate;
	private Date modifyDate;
	private int hit;
	private String deleted; 
	private String category;
	
	public Board() {}

	public Board(int postNo, int memberNo, String content, Date createDate, Date modifyDate, int hit, String deleted,
			String category) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.hit = hit;
		this.deleted = deleted;
		this.category = category;
	}
	
	

	public Board(int postNo, String nickName, String content, Date createDate, Date modifyDate, int hit, String deleted,
			String category) {
		super();
		this.postNo = postNo;
		this.nickName = nickName;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.hit = hit;
		this.deleted = deleted;
		this.category = category;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	

	public String getContent() {
		return content;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Board [postNo=" + postNo + ", nickName=" + nickName + ", content=" + content + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", hit=" + hit + ", deleted=" + deleted + ", category="
				+ category + "]";
	}

//	@Override
//	public String toString() {
//		return "Board [postNo=" + postNo + ", memberNo=" + memberNo + ", content=" + content + ", createDate="
//				+ createDate + ", modifyDate=" + modifyDate + ", hit=" + hit + ", deleted=" + deleted + ", category="
//				+ category + "]";
//	}
	
	

	
	
	
}
