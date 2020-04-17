package com.kh.recipeMarket.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class SearchCon {
	
	private int memberNo;
	private Date createDate;
	private Date modifyDate;
	private String category;
	private int serving;
	private int difficulty;
	private ArrayList<String> ingredientList;
	private ArrayList<String> tagList;
	private double rating;
	private int hit;
	private char deleted;
	
}
