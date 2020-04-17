package com.kh.recipeMarket.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;


public class Recipe {
	private int postNo;
	private int memberNo;
	private String nickName;
	private Date createDate;
	private Date modifyDate;
	private String category;
	private int serving;
	private int difficulty;
	private ArrayList<Ingredient> ingredientList;
	private ArrayList<Tag> tagList;
	private ArrayList<RecipeStep> stepList;
	private double rating;
	private int hit;
	private char deleted;
	
	public Recipe() {
		super();
	}

	public Recipe(int postNo, int memberNo, String nickName, Date createDate, Date modifyDate, String category, int serving, int difficulty,
				  ArrayList<Ingredient> ingredientList, ArrayList<Tag> tagList, ArrayList<RecipeStep> stepList,
				  double rating, int hit, char deleted) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.nickName = nickName;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.serving = serving;
		this.difficulty = difficulty;
		this.ingredientList = ingredientList;
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

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public ArrayList<Ingredient> getIngredientList() {
		return ingredientList;
	}

	public void setIngredientList(ArrayList<Ingredient> ingredientList) {
		this.ingredientList = ingredientList;
	}

	public ArrayList<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(ArrayList<Tag> tagList) {
		this.tagList = tagList;
	}

	public ArrayList<RecipeStep> getStepList() {
		return stepList;
	}

	public void setStepList(ArrayList<RecipeStep> stepList) {
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

	public String getNickname() {
		return nickName;
	}

	public void setNickname(String nickName) {
		this.nickName = nickName;
	}
	
	
	
}
