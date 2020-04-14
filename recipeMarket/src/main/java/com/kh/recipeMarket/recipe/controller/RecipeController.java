package com.kh.recipeMarket.recipe.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.recipe.model.service.RecipeService;
import com.kh.recipeMarket.recipe.model.vo.*;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rService;
	
	@RequestMapping("insert.rc")
	public String recipeInsert() {
		return "recipeInsert";
	}
	
	@RequestMapping("detail.rc")
	public ModelAndView recipeDetail(int postNo, ModelAndView mv){
	
		
		Recipe r = rService.selectRecipe(postNo);
		r.setIngredientList(rService.selectIngredients(postNo));
		r.setTagList(rService.selectTags(postNo));
		r.setStepList(rService.selectRecipeSteps(postNo));
		mv.addObject("r", r);
		
		ArrayList<Reply> replies = rService.selectReplies(postNo);
		mv.addObject("replies", replies);
		
		mv.setViewName("recipeDetailView");
		return mv;
	}
	
	@RequestMapping("list.rc")
	public String recipeList() {
		
		return "recipeDetail";
	}
	
	
	
	
}

