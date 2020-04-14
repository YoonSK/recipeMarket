package com.kh.recipeMarket.recipe.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.recipe.model.vo.*;

@Repository("rDAO")
public class RecipeDAO {

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		return sqlSession.insert("recipeMapper.insertRecipe",r);
	}
	
	public Recipe selectRecipe(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("recipeMapper.selectRecipe", postNo);
	}
	
	public ArrayList<Ingredient> selectIngredients(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectIngredientList", postNo);
	}
	
	public ArrayList<String> selectTags(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectIngredientList", postNo);
	}
	
	public ArrayList<RecipeStep> selectRecipeSteps(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeStepList", postNo);
	}
	
	
}
