package com.kh.recipeMarket.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recipeMarket.common.dao.CommonDAO;
import com.kh.recipeMarket.common.vo.Author;
import com.kh.recipeMarket.manager.model.vo.Product;
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
		rb.setAuthor(rDAO.selectAuthor(sqlSession, postNo));

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
		rDAO.updateRecipe(sqlSession, r);
		
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

	@Override
	public ArrayList<Author> selectChefRank(String sorter, int rowlim) {
		return rDAO.selectChefRank(sqlSession, sorter, rowlim);
	}

	@Override
	public ArrayList<Author> selectChefLikeList(int memberNo) {
		return rDAO.selectChefLikeList(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Photo> selectPhotos(int postNo) {
		return cDAO.selectPhotos(sqlSession, 1, postNo);
	}

	@Override
	public ArrayList<Product> searchProcuctList(SearchCon sc) {
		return cDAO.searchProductList(sqlSession, sc);
	}

	@Override
	public ArrayList<Ingredient> selectFreqIngredients(int lim) {
		return rDAO.selectFreqIngredients(sqlSession, lim);
	}

	@Override
	public ArrayList<Tag> selectFreqTags(int lim) {
		return rDAO.selectFreqTags(sqlSession, lim);
	}

	@Override
	public ArrayList<RecipePreview> selectSavedRecipeList(int memberNo) {
		return rDAO.selectSavedRecipeList(sqlSession, memberNo);
	}

	@Override
	public ArrayList<RecipePreview> selectFollowedRecipeList(int memberNo) {
		return rDAO.selectFollowedRecipeList(sqlSession, memberNo);
	}

	@Override
	public int addRecipeHit(int postNo) {
		return rDAO.addRecipeHit(sqlSession, postNo);
	}
	
}
