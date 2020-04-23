package com.kh.recipeMarket.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class RecipeBox extends Recipe{

	private Date createDate;
	private Date modifyDate;
	
	private ArrayList<String> ingredientList;
	private ArrayList<String> amountList;
	private ArrayList<String> tagList;
	private ArrayList<String> stepList;
	
	private double rating;
	private int hit;
	
	public RecipeBox() {
		super();
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

	@Override
	public String toString() {
		return "RecipeBox [ingredientList=" + ingredientList + ", amountList=" + amountList + ", tagList=" + tagList
				+ ", stepList=" + stepList + ", rating=" + rating + ", hit=" + hit + "]";
	}
	

	
}
