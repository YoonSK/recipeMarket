package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.recipe.model.vo.*;

public interface RecipeService {

	int insertRecipe(Recipe r);
	
	int insertIngredients(ArrayList<Ingredient> ingredients);
	
	int insertTags(ArrayList<Tag> tags);

	int insertSteps(ArrayList<RecipeStep> steps);

	Recipe selectRecipe(int postNo);

	ArrayList<Recipe> searchRecipeList(SearchCon sc);
	
	ArrayList<Recipe> selectRecipeList(int memberNo);
	
	ArrayList<Ingredient> selectIngredients(int postNo);
	
	ArrayList<Tag> selectTags(int postNo);
	
	ArrayList<RecipeStep> selectRecipeSteps(int postNo);
	
	ArrayList<Reply> selectReplies(int postNo);
	
	
}
