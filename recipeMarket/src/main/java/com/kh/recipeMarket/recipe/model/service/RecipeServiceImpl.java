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
		int postNo = rDAO.insertRecipe(sqlSession, r);
		
		ArrayList<String> ings = r.getIngredientList();
		ArrayList<String> amts = r.getAmountList();
		
		ArrayList<Ingredient> IngList = new ArrayList<Ingredient>();
		for(int i=0; i < ings.size(); i++) {
			Ingredient ing = new Ingredient();
			ing.setName(ings.get(i));
			ing.setAmount(amts.get(i));
			IngList.add(ing);
		}

		rDAO.insertIngredients(sqlSession, postNo, IngList);
		rDAO.insertTags(sqlSession, postNo, r.getTagList());
		rDAO.insertSteps(sqlSession, postNo, r.getStepList());
		
		return 0;
	}
	
	
	@Override
	public ArrayList<Recipe> searchRecipeList(SearchCon sc) {
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		return list;
	}
	
	@Override
	public ArrayList<Recipe> selectRecipeList(int memberNo) {
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		
		return list;
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
