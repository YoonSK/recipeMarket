package com.kh.recipeMarket.recipe.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.recipeMarket.recipe.model.vo.Recipe;

@Repository("rDAO")
public class RecipeDAO {

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		return sqlSession.insert("recipeMapper.insertRecipe",r);
	}
	
}
