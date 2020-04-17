package com.kh.recipeMarket.recipe.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.recipe.model.vo.*;

@Repository("rDAO")
public class RecipeDAO {

	private static final Object SearchCon = null;

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		return sqlSession.insert("recipeMapper.insertRecipe",r);
	}
	
	public int insertIngredients(SqlSessionTemplate sqlSession, ArrayList<Ingredient> ingredients) {

		return sqlSession.insert("recipeMapper.insertIngredients",ingredients);
	}
	
	public int insertTags(SqlSessionTemplate sqlSession, ArrayList<Tag> tags){
		return sqlSession.insert("recipeMapper.insertTags",tags);
	}

	public int insertSteps(SqlSessionTemplate sqlSession, ArrayList<RecipeStep> steps){
		return sqlSession.insert("recipeMapper.insertSteps",steps);
	}
	
	public Recipe selectRecipe(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("recipeMapper.selectRecipe", postNo);
	}
	
	public ArrayList<Recipe> searchRecipeList(SqlSessionTemplate sqlSession, SearchCon sc){
		return (ArrayList)sqlSession.selectList("recipeMapper.searchRecipeList", sc);
	}
	
	public ArrayList<Recipe> selectRecipeList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeList", memberNo);
	}
	
	public ArrayList<Ingredient> selectIngredients(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectIngredientList", postNo);
	}
	
	public ArrayList<Tag> selectTags(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectIngredientList", postNo);
	}
	
	public ArrayList<RecipeStep> selectRecipeSteps(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeStepList", postNo);
	}
	
}
