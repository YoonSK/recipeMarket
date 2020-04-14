package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.recipe.model.dao.RecipeDAO;
import com.kh.recipeMarket.recipe.model.vo.*;

@Service
public class RecipeServiceImpl implements RecipeService {

	
	@Autowired
	private RecipeDAO rDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;
	   
	@Override
	public int insertRecipe(Recipe r) {
		return rDAO.insertRecipe(sqlSession, r);
	}
	
	@Override
	public int insertTags(ArrayList<Tag> tags) {
		return rDAO.insertTags(sqlSession, tags);
	}

	@Override
	public int insertIngredients(ArrayList<Ingredient> ingredients) {
		return rDAO.insertIngredients(sqlSession, ingredients);
	}

	@Override
	public int insertSteps(ArrayList<RecipeStep> steps) {
		return rDAO.insertSteps(sqlSession, steps);
	}

	@Override
	public Recipe selectRecipe(int postNo) {
		return rDAO.selectRecipe(sqlSession, postNo);
	}
	
	@Override
	public ArrayList<Ingredient> selectIngredients(int postNo) {
		return rDAO.selectIngredients(sqlSession, postNo);
	}

	@Override
	public ArrayList<Tag> selectTags(int postNo) {
		return rDAO.selectTags(sqlSession, postNo);
	}

	@Override
	public ArrayList<RecipeStep> selectRecipeSteps(int postNo) {
		return null;
	}

	@Override
	public ArrayList<Reply> selectReplies(int postNo) {
		return null;
	}
	
}
