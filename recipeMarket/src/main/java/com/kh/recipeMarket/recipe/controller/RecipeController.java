package com.kh.recipeMarket.recipe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.common.Reply;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.recipe.model.service.RecipeService;
import com.kh.recipeMarket.recipe.model.vo.*;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rService;
	
	
	
	@RequestMapping("insertForm.rc")
	public String recipeInsertForm( HttpSession session) {
		
		return "recipeInsert";
		
	}
	
	@RequestMapping("insert.rc")
	public String recipeInsert(
			@RequestParam("stepContent") ArrayList<String> steps,
			@RequestParam("ingredient") ArrayList<String> ingredients,
			@RequestParam("amount") ArrayList<String> amounts,
			@RequestParam("tag") ArrayList<String> tags,
			@ModelAttribute Recipe r,
			HttpSession session)
	{

		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		r.setMemberNo(memberNo);
		
		System.out.println(steps);
		System.out.println(ingredients);
		System.out.println(amounts);
		System.out.println(tags);
		System.out.println(r);
		
		rService.insertRecipe(r, steps, ingredients, amounts, tags);
		
		return "recipeView";
	}

	@RequestMapping("list.rc")
	public ModelAndView recipeList(Recipe r, ModelAndView mv){
		ArrayList<Recipe> rlist = new ArrayList<Recipe>();

		mv.addObject("rlist", rlist);
		
		mv.setViewName("recipeList");
		return mv;
	}
	
	@RequestMapping("search.rc")
	public ModelAndView recipeSearch(Recipe r, ModelAndView mv){
		ArrayList<Recipe> rlist = new ArrayList<Recipe>();
		
		mv.addObject(rlist);
		
		mv.setViewName("recipeSearch");
		return mv;
	}
	
	@RequestMapping("detail.rc")
	public ModelAndView recipeDetail(int postNo, ModelAndView mv){
	
		Recipe r = rService.selectRecipe(postNo);
		
		
		
		mv.addObject("r", r);
		
		mv.setViewName("recipeDetail");
		return mv;
	}
	
	
	
	
}

