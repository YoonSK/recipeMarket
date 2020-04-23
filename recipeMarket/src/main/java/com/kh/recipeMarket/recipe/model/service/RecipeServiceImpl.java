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
	public int insertRecipe(Recipe r, ArrayList<String> steps, ArrayList<String> ings, ArrayList<String> amts, ArrayList<String> tags) {
		int postNo = rDAO.insertRecipe(sqlSession, r);
		
		ArrayList<Ingredient> IngList = new ArrayList<Ingredient>();
		for(int i=0; i < ings.size(); i++) {
			Ingredient ing = new Ingredient();
			ing.setPostNo(postNo);
			ing.setName(ings.get(i));
			ing.setAmount(amts.get(i));
			IngList.add(ing);
		}
		rDAO.insertIngredients(sqlSession, IngList);
		
		ArrayList<RecipeStep> StepList = new ArrayList<RecipeStep>();
		for(int i=0; i < steps.size(); i++) {
			RecipeStep stp = new RecipeStep();
			stp.setStep(i);
			stp.setPostNo(postNo);
			stp.setContent(steps.get(i));
			StepList.add(stp);
		}
		rDAO.insertSteps(sqlSession, StepList);
		
		ArrayList<Tag> TagList = new ArrayList<Tag>();
		for(int i=0; i < tags.size(); i++) {
			Tag tg = new Tag();
			tg.setTag(tags.get(i));
			tg.setPostNo(postNo);
			TagList.add(tg);
		}
		rDAO.insertTags(sqlSession, TagList);
		
		return postNo;
	}
	

	@Override
	public Recipe selectRecipe(int postNo) {
		
		Recipe rb = rDAO.selectRecipe(sqlSession, postNo);
		rb.setIngredientList(rDAO.selectIngredients(sqlSession, postNo));
		rb.setStepList(rDAO.selectRecipeSteps(sqlSession, postNo));
		rb.setTagList(rDAO.selectTags(sqlSession, postNo));

		return rb;
	}

	
	


	
}
