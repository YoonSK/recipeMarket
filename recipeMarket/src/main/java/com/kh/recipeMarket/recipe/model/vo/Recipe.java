package com.kh.recipeMarket.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;


public class Recipe {
	private int postNo;
	private int memberNo;
	private String title;
	
	private Date createDate;
	private Date modifyDate;
	
	private String category;
	private int serving;
	private int reqTime;
	private int difficulty;
	
	private char deleted;
	
	public Recipe() {
		super();
	}

	public Recipe(int postNo, int memberNo, String title, Date createDate, Date modifyDate, String category,
			int serving, int reqTime, int difficulty, char deleted) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.title = title;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.serving = serving;
		this.reqTime = reqTime;
		this.difficulty = difficulty;
		this.deleted = deleted;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getServing() {
		return serving;
	}

	public void setServing(int serving) {
		this.serving = serving;
	}

	public int getReqTime() {
		return reqTime;
	}

	public void setReqTime(int reqTime) {
		this.reqTime = reqTime;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}

	@Override
	public String toString() {
		return "Recipe [postNo=" + postNo + ", memberNo=" + memberNo + ", title=" + title + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", category=" + category + ", serving=" + serving + ", reqTime="
				+ reqTime + ", difficulty=" + difficulty + ", deleted=" + deleted + "]";
	}

}
