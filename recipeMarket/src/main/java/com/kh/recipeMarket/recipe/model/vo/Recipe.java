package com.kh.recipeMarket.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.vo.Author;


public class Recipe {
	private int postNo;
	private int memberNo;
	private String title;
	
	private Author author;
	
	private Date createDate;
	private Date modifyDate;
	
	private String category;
	private int serving;
	private int reqTime;
	private int difficulty;
	
	private ArrayList<Ingredient> ingredientList;
	private ArrayList<RecipeStep> stepList;
	private ArrayList<Tag> tagList;
	private ArrayList<Photo> imgList;
	
	private double rating;
	private int hit;
	
	private char deleted;
	
	public Recipe() {
		super();
	}
	
	public Recipe(int postNo, int memberNo, String title, Author author, Date createDate, Date modifyDate,
			String category, int serving, int reqTime, int difficulty, ArrayList<Ingredient> ingredientList,
			ArrayList<RecipeStep> stepList, ArrayList<Tag> tagList, ArrayList<Photo> imgList, double rating, int hit,
			char deleted) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.title = title;
		this.author = author;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.serving = serving;
		this.reqTime = reqTime;
		this.difficulty = difficulty;
		this.ingredientList = ingredientList;
		this.stepList = stepList;
		this.tagList = tagList;
		this.imgList = imgList;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
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

	public ArrayList<Ingredient> getIngredientList() {
		return ingredientList;
	}

	public void setIngredientList(ArrayList<Ingredient> ingredientList) {
		this.ingredientList = ingredientList;
	}

	public ArrayList<RecipeStep> getStepList() {
		return stepList;
	}

	public void setStepList(ArrayList<RecipeStep> stepList) {
		this.stepList = stepList;
	}

	public ArrayList<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(ArrayList<Tag> tagList) {
		this.tagList = tagList;
	}

	public ArrayList<Photo> getImgList() {
		return imgList;
	}

	public void setImgList(ArrayList<Photo> imgList) {
		this.imgList = imgList;
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
		return "Recipe [postNo=" + postNo + ", memberNo=" + memberNo + ", title=" + title + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", category=" + category + ", serving=" + serving + ", reqTime="
				+ reqTime + ", difficulty=" + difficulty + ", ingredientList=" + ingredientList + ", stepList="
				+ stepList + ", tagList=" + tagList + ", rating=" + rating + ", hit=" + hit + ", deleted=" + deleted
				+ "]";
	}


	
}
