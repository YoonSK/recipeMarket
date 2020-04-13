package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Recipe selectRecipe(int postNo) {
		return rDAO.selectRecipe(sqlSession, postNo);
	}
	
	@Override
	public ArrayList<Ingredient> selectIngredients(int postNo) {
		return rDAO.selectIngredients(sqlSession, postNo);
	}

	@Override
	public ArrayList<String> selectTags(int postNo) {
		return rDAO.selectTags(sqlSession, postNo);
	}

	@Override
	public ArrayList<RecipeStep> selectRecipeSteps(int postNo) {
		return null;
	}
	
}
