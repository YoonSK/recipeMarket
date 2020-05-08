package com.kh.recipeMarket.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.common.vo.Author;
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
	
	public Author selectAuthor(SqlSessionTemplate sqlSession, int postNo){
		return sqlSession.selectOne("recipeMapper.selectRecipeAuthor", postNo);
	}
	
	public ArrayList<RecipePreview> selectRecipeList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeList", memberNo);
	}
	
	public ArrayList<RecipePreview> searchRecipeList(SqlSessionTemplate sqlSession, SearchCon sc){
		return (ArrayList)sqlSession.selectList("recipeMapper.searchRecipeList", sc);
	}

	public int clearRecipe(SqlSessionTemplate sqlSession, int postNo) {
		sqlSession.delete("recipeMapper.clearRecipeStep", postNo);
		sqlSession.delete("recipeMapper.clearRecipeIngredient", postNo);
		sqlSession.delete("recipeMapper.clearRecipeTag", postNo);
		sqlSession.update("recipeMapper.deletePhoto", postNo);
		return 1;
	}
	
	public int deleteRecipe(SqlSessionTemplate sqlSession, int postNo) {
		sqlSession.delete("recipeMapper.clearRecipeStep", postNo);
		sqlSession.delete("recipeMapper.clearRecipeIngredient", postNo);
		sqlSession.delete("recipeMapper.clearRecipeTag", postNo);
		sqlSession.update("recipeMapper.deletePhoto", postNo);
		return sqlSession.update("recipeMapper.deleteRecipe", postNo);
	}
	
	public ArrayList<Author> selectChefRank(SqlSessionTemplate sqlSession, String sorter, int rowlim) {
		SearchCon sc = new SearchCon();
		sc.setSorter(sorter);
		sc.setRowlim(rowlim);
		return (ArrayList)sqlSession.selectList("recipeMapper.selectChefRank", sc);
	}

	public ArrayList<Author> selectChefLikeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectChefLikeList", memberNo);
	}

	public int updateRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		return sqlSession.update("recipeMapper.updateRecipe", r);
	}
	
	public ArrayList<Ingredient> selectFreqIngredients(SqlSessionTemplate sqlSession, int lim){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectFreqIngredients", lim);
	}
	
	public ArrayList<Tag> selectFreqTags(SqlSessionTemplate sqlSession, int lim){
		return (ArrayList)sqlSession.selectList("recipeMapper.selectFreqTags", lim);
	}

	public ArrayList<RecipePreview> selectSavedRecipeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectSavedRecipeList", memberNo);
	}

	public ArrayList<RecipePreview> selectFollowedRecipeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectFollowedRecipeList", memberNo);
	}

	public int addRecipeHit(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.update("recipeMapper.addRecipeHit", postNo);
	}
		
}
