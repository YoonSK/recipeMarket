package com.kh.recipeMarket.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;


public class Recipe {
	private int postNo;
	private int memberNo;
	private String nickName;
	private String title;
	
	private Date createDate;
	private Date modifyDate;
	private String category;
	
	private int serving;
	private int reqTime;
	private int difficulty;
	
	private ArrayList<String> ingredientList;
	private ArrayList<String> amountList;
	private ArrayList<String> tagList;
	private ArrayList<String> stepList;
	
	private double rating;
	private int hit;
	
	private char deleted;
	
	public Recipe() {
		super();
	}

	public Recipe(int postNo, int memberNo, String nickName, String title, Date createDate, Date modifyDate,
			String category, int serving, int reqTime, int difficulty, ArrayList<String> ingredientList,
			ArrayList<String> amountList, ArrayList<String> tagList, ArrayList<String> stepList, double rating, int hit,
			char deleted) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.nickName = nickName;
		this.title = title;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.serving = serving;
		this.reqTime = reqTime;
		this.difficulty = difficulty;
		this.ingredientList = ingredientList;
		this.amountList = amountList;
		this.tagList = tagList;
		this.stepList = stepList;
		this.rating = rating;
		this.hit = hit;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public ArrayList<String> getIngredientList() {
		return ingredientList;
	}

	public void setIngredientList(ArrayList<String> ingredientList) {
		this.ingredientList = ingredientList;
	}

	public ArrayList<String> getAmountList() {
		return amountList;
	}

	public void setAmountList(ArrayList<String> amountList) {
		this.amountList = amountList;
	}

	public ArrayList<String> getTagList() {
		return tagList;
	}

	public void setTagList(ArrayList<String> tagList) {
		this.tagList = tagList;
	}

	public ArrayList<String> getStepList() {
		return stepList;
	}

	public void setStepList(ArrayList<String> stepList) {
		this.stepList = stepList;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}

	@Override
	public String toString() {
		return "Recipe [postNo=" + postNo + ", memberNo=" + memberNo + ", nickName=" + nickName + ", title=" + title
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", category=" + category + ", serving="
				+ serving + ", reqTime=" + reqTime + ", difficulty=" + difficulty + ", ingredientList=" + ingredientList
				+ ", amountList=" + amountList + ", tagList=" + tagList + ", stepList=" + stepList + ", rating="
				+ rating + ", hit=" + hit + ", deleted=" + deleted + "]";
	}
	
}
