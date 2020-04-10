package com.kh.recipeMarket.recipe.model.vo;

import java.util.ArrayList;


public class Recipe {
	int postNo;
	int memberNo;
	int createDate;
	int modifyDate;
	int category;
	int serving;
	int diffyculty;
	ArrayList<Ingredient> ingredientList;
	ArrayList<String> tagList;
	ArrayList<RecipeStep> stepList;
	double rating;
	int hit;
	char deleted;
	
	public Recipe() {
		super();
	}

	public Recipe(int postNo, int memberNo, int createDate, int modifyDate, int category, int serving, int diffyculty,
			ArrayList<Ingredient> ingredientList, ArrayList<String> tagList, ArrayList<RecipeStep> stepList,
			double rating, int hit, char deleted) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.serving = serving;
		this.diffyculty = diffyculty;
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

	public int getCreateDate() {
		return createDate;
	}

	public void setCreateDate(int createDate) {
		this.createDate = createDate;
	}

	public int getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(int modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getServing() {
		return serving;
	}

	public void setServing(int serving) {
		this.serving = serving;
	}

	public int getDiffyculty() {
		return diffyculty;
	}

	public void setDiffyculty(int diffyculty) {
		this.diffyculty = diffyculty;
	}

	public ArrayList<Ingredient> getIngredientList() {
		return ingredientList;
	}

	public void setIngredientList(ArrayList<Ingredient> ingredientList) {
		this.ingredientList = ingredientList;
	}

	public ArrayList<String> getTagList() {
		return tagList;
	}

	public void setTagList(ArrayList<String> tagList) {
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
	
	
	
}
