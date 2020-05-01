package com.kh.recipeMarket.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.recipe.model.vo.*;

@Repository("rDAO")
public class RecipeDAO {

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		System.out.println(r);
		sqlSession.insert("recipeMapper.insertRecipe", r);
		return r.getPostNo();
	}
	
	public int insertIngredients(SqlSessionTemplate sqlSession, ArrayList<Ingredient> ingredients) {
		return sqlSession.insert("recipeMapper.insertIngredients", ingredients);
	}
	
	public int insertSteps(SqlSessionTemplate sqlSession, ArrayList<RecipeStep> steps){
		return sqlSession.insert("recipeMapper.insertSteps", steps);
	}
	
	public int insertTags(SqlSessionTemplate sqlSession, ArrayList<Tag> tags){
		return sqlSession.insert("recipeMapper.insertTags", tags);
	}
	
	
	public Recipe selectRecipe(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("recipeMapper.selectRecipe", postNo);
	}
	
	public ArrayList<RecipeStep> selectRecipeSteps(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeSteps", postNo);
	}
	
	public ArrayList<Ingredient> selectIngredients(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectIngredients", postNo);
	}
	
	public ArrayList<Tag> selectTags(SqlSessionTemplate sqlSession, int postNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectTags", postNo);
	}
	
	public ArrayList<RecipePreview> selectRecipeList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeList", memberNo);
	}
	
	public ArrayList<RecipePreview> searchRecipeList(SqlSessionTemplate sqlSession, SearchCon sc){
		return (ArrayList)sqlSession.selectList("recipeMapper.searchRecipeList", sc);
	}

	public int clearRecipe(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.delete("recipeMapper.clearRecipe", postNo);
	}
	
	public int deleteRecipe(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.delete("recipeMapper.deleteRecipe", postNo);
	}

}
