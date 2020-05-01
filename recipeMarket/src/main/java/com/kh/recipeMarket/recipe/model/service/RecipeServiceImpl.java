package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.common.dao.CommonDAO;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.recipe.model.dao.RecipeDAO;
import com.kh.recipeMarket.recipe.model.vo.*;

@Service
public class RecipeServiceImpl implements RecipeService {

	
	@Autowired
	private RecipeDAO rDAO;

	@Autowired
	private CommonDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	   
	@Override
	public int insertRecipe(Recipe r, ArrayList<String> steps, ArrayList<String> ings, ArrayList<String> amts, ArrayList<String> tags, ArrayList<Photo> images) {
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
			stp.setStep(i + 1);
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
		
		for(int i=0; i < images.size(); i++) {
			images.get(i).setTargetNo(postNo);
			System.out.println(images.get(i));
		}
		cDAO.insertPhotos(sqlSession, images);
		
		return postNo;
	}

	@Override
	public Recipe selectRecipe(int postNo) {
		Recipe rb = rDAO.selectRecipe(sqlSession, postNo);
		rb.setIngredientList(rDAO.selectIngredients(sqlSession, postNo));
		rb.setStepList(rDAO.selectRecipeSteps(sqlSession, postNo));
		rb.setTagList(rDAO.selectTags(sqlSession, postNo));
		rb.setImgList(cDAO.selectPhotos(sqlSession, 1, postNo));

		return rb;
	}

	@Override
	public ArrayList<RecipePreview> selectRecipeList(int memberNo) {
		return rDAO.selectRecipeList(sqlSession, memberNo);
	}

	@Override
	public ArrayList<RecipePreview> searchRecipeList(SearchCon sc) {
		return rDAO.searchRecipeList(sqlSession, sc);
	}

	@Override
	public int updateRecipe(Recipe r, ArrayList<String> steps, ArrayList<String> ings, ArrayList<String> amts,
			ArrayList<String> tags, ArrayList<Photo> images) {
		int postNo = r.getPostNo();
		
		rDAO.clearRecipe(sqlSession, postNo);
		
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
			stp.setStep(i + 1);
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
		
		for(int i=0; i < images.size(); i++) {
			images.get(i).setTargetNo(postNo);
			System.out.println(images.get(i));
		}
		cDAO.insertPhotos(sqlSession, images);
		
		return postNo;
	}

	@Override
	public int deleteRecipe(int postNo) {
		rDAO.clearRecipe(sqlSession, postNo);
		rDAO.deleteRecipe(sqlSession, postNo);
		return 0;
	}

	
	


	
}
