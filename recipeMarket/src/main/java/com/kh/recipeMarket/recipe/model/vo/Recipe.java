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
	
	ArrayList<String> stepList;
	
	double rating;
	int hit;
	
	int deleted;
}
