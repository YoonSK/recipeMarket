package com.kh.recipeMarket.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class SearchCon {
	
	private String keyword;
	private String sorter; //POST_NO, RATE, HIT
	
	private String category;
	private int serving;
	private int difficulty;
	private int reqTime;
	
	private ArrayList<String> ingredientList;
	private ArrayList<String> tagList;
	
	private double rating;
	private int hit;
	
	public SearchCon() {
		super();
	}
	public SearchCon(String keyword, String sorter, String category, int serving, int difficulty, int reqTime,
			ArrayList<String> ingredientList, ArrayList<String> tagList, double rating, int hit) {
		super();
		this.keyword = keyword;
		this.sorter = sorter;
		this.category = category;
		this.serving = serving;
		this.difficulty = difficulty;
		this.reqTime = reqTime;
		this.ingredientList = ingredientList;
		this.tagList = tagList;
		this.rating = rating;
		this.hit = hit;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSorter() {
		return sorter;
	}
	public void setSorter(String sorter) {
		this.sorter = sorter;
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
	public int getReqTime() {
		return reqTime;
	}
	public void setReqTime(int reqTime) {
		this.reqTime = reqTime;
	}
	public ArrayList<String> getIngredientList() {
		return ingredientList;
	}
	public void setIngredientList(ArrayList<String> ingredientList) {
		this.ingredientList = ingredientList;
	}
	public ArrayList<String> getTagList() {
		return tagList;
	}
	public void setTagList(ArrayList<String> tagList) {
		this.tagList = tagList;
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
	@Override
	public String toString() {
		return "SearchCon [keyword=" + keyword + ", sorter=" + sorter + ", category=" + category + ", serving="
				+ serving + ", difficulty=" + difficulty + ", reqTime=" + reqTime + ", ingredientList=" + ingredientList
				+ ", tagList=" + tagList + ", rating=" + rating + ", hit=" + hit + "]";
	}
	
	
	
}
