package com.kh.recipeMarket.recipe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.board.model.exception.BoardException;
import com.kh.recipeMarket.board.model.vo.Board;
import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.recipe.model.service.RecipeService;
import com.kh.recipeMarket.recipe.model.vo.*;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rService;
	
	@RequestMapping("insert.rc")
	public String recipeInsert(Recipe r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		r.setMemberNo(memberNo);
		int result = rService.insertRecipe(r);
		
		return "recipeDetailcj";
	}

	@RequestMapping("list.rc")
	public ModelAndView recipeList(Recipe r, ModelAndView mv){
		ArrayList<Recipe> rlist = new ArrayList<Recipe>();
		
		
		mv.setViewName("recipeList");
		return mv;
	}
	
	@RequestMapping("search.rc")
	public ModelAndView recipeSearch(Recipe r, ModelAndView mv){
		ArrayList<Recipe> rlist = new ArrayList<Recipe>();
		
		
		mv.setViewName("recipeList");
		return mv;
	}
	
	@RequestMapping("detail.rc")
	public ModelAndView recipeDetail(int postNo, ModelAndView mv){
	
		Recipe r = rService.selectRecipe(postNo);
		r.setIngredientList(rService.selectIngredients(postNo));
		r.setTagList(rService.selectTags(postNo));
		r.setStepList(rService.selectRecipeSteps(postNo));
		mv.addObject("r", r);
		
		ArrayList<Reply> replies = rService.selectReplies(postNo);
		mv.addObject("replies", replies);
		
		mv.setViewName("recipeDetail");
		return mv;
	}
	
	
	
	
}

