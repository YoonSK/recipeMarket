package com.kh.recipeMarket.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.recipeMarket.recipe.model.service.RecipeService;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rs;
	
	@RequestMapping("insert.rc")
	public String recipeInsert() {
		return "recipeInsert";
	}
	
	@RequestMapping("detail.rc")
	public String recipeDetail() {
		return "recipeDetail";
	}
	
	@RequestMapping("list.rc")
	public String recipeList() {
		return "recipeDetail";
	}
	
}
