package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.vo.Author;
import com.kh.recipeMarket.recipe.model.vo.*;

public interface RecipeService {

	int insertRecipe(Recipe r, ArrayList<String> steps, ArrayList<String> ings, ArrayList<String> amts, ArrayList<String> tags, ArrayList<Photo> images);

	Recipe selectRecipe(int postNo);
	
	ArrayList<RecipePreview> selectRecipeList(int memberNo);

	ArrayList<RecipePreview> searchRecipeList(SearchCon sc);
	
	int updateRecipe(Recipe r, ArrayList<String> steps, ArrayList<String> ings, ArrayList<String> amts, ArrayList<String> tags, ArrayList<Photo> images);

	int deleteRecipe(int postNo);
	
	ArrayList<Author> selectChefList(String sorter);

	ArrayList<Author> selectChefLikeList(int memberNo);

	ArrayList<Photo> selectPhotos(int postNo);
}
