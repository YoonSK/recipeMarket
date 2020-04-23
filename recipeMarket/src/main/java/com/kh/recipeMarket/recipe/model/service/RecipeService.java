package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.recipe.model.vo.*;

public interface RecipeService {

	int insertRecipe(Recipe r, ArrayList<String> steps, ArrayList<String> ings, ArrayList<String> amts, ArrayList<String> tags);

	Recipe selectRecipe(int postNo);
	
	
	
}
