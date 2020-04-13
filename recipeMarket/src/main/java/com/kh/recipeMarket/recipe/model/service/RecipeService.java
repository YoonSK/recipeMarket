package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.recipe.model.vo.*;

public interface RecipeService {

	int insertRecipe(Recipe r);
	
	Recipe selectRecipe(int postNo);
	
	ArrayList<Ingredient> selectIngredients(int postNo);
	
	ArrayList<String> selectTags(int postNo);
	
	ArrayList<RecipeStep> selectRecipeSteps(int postNo);
	
	ArrayList<Reply> selectReplies(int postNo);
	
}
