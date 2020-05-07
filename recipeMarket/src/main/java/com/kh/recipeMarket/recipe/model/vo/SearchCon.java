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
	
	private int rowlim;
	
	public SearchCon() {
		super();
	}
	
	public SearchCon(String keyword, String sorter, String category, int serving, int difficulty, int reqTime,
			ArrayList<String> ingredientList, ArrayList<String> tagList, int rowlim) {
		super();
		this.keyword = keyword;
		this.sorter = sorter;
		this.category = category;
		this.serving = serving;
		this.difficulty = difficulty;
		this.reqTime = reqTime;
		this.ingredientList = ingredientList;
		this.tagList = tagList;
		this.rowlim = rowlim;
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
	public int getRowlim() {
		return rowlim;
	}
	public void setRowlim(int rowlim) {
		this.rowlim = rowlim;
	}

	@Override
	public String toString() {
		return "SearchCon [keyword=" + keyword + ", sorter=" + sorter + ", category=" + category + ", serving="
				+ serving + ", difficulty=" + difficulty + ", reqTime=" + reqTime + ", ingredientList=" + ingredientList
				+ ", tagList=" + tagList + ", rowlim=" + rowlim + "]";
	}
	
	
}
