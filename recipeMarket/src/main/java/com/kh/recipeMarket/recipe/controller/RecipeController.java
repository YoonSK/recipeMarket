package com.kh.recipeMarket.recipe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.common.Enum;
import com.kh.recipeMarket.common.service.CommonService;
import com.kh.recipeMarket.common.vo.*;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.recipe.model.service.RecipeService;
import com.kh.recipeMarket.recipe.model.vo.*;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rService;
	
	@Autowired
	CommonService cService;
	
	@RequestMapping("insertForm.rc")
	public String recipeInsertForm(HttpSession session) {
		
		return "recipeInsert";
		
	}
	
	@RequestMapping("insert.rc")
	public ModelAndView recipeInsert(
			@RequestParam("stepContent") ArrayList<String> steps,
			@RequestParam("ingredient") ArrayList<String> ingredients,
			@RequestParam("amount") ArrayList<String> amounts,
			@RequestParam("tag") ArrayList<String> tags,
			@ModelAttribute Recipe r,
			HttpSession session,
			ModelAndView mv)
	{
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		r.setMemberNo(memberNo);
		
		System.out.println(steps);
		System.out.println(ingredients);
		System.out.println(amounts);
		System.out.println(tags);
		System.out.println(r);
		
		int postNo = rService.insertRecipe(r, steps, ingredients, amounts, tags);
		session.setAttribute("postNo", postNo);
		
		Recipe rb = rService.selectRecipe(postNo);
		mv.addObject("recipe", rb);
		mv.addObject("ingredientList", rb.getIngredientList());
		mv.addObject("tagList", rb.getTagList());
		mv.addObject("stepList", rb.getStepList());
		mv.setViewName("recipeView");
		return mv;
	}
	
	@RequestMapping("detail.rc")
	public ModelAndView recipeDetail(HttpSession session, ModelAndView mv){
		int postNo = (int)session.getAttribute("postNo");
		
		Recipe rb = rService.selectRecipe(postNo);
		mv.addObject("recipe", rb);
		mv.addObject("ingredientList", rb.getIngredientList());
		mv.addObject("tagList", rb.getTagList());
		mv.addObject("stepList", rb.getStepList());
		
		ArrayList<Reply> rplist = cService.selectReplies(new Enum().boardNo("recipe"), postNo);
		mv.addObject("replyList", rplist);
		
		mv.setViewName("recipeView");
		return mv;
	}
	
	@RequestMapping("insertReply.rc")
	public String replyInsert(
			@ModelAttribute Reply rp,
			HttpSession session){
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		int postNo = (int)session.getAttribute("postNo");
		int boardNo = new Enum().boardNo("recipe");
		
		rp.setMemberNo(memberNo);
		rp.setBoardNo(boardNo);
		rp.setTargetNo(postNo);
		
		System.out.println(rp);
		
		int replyNo = cService.insertReply(rp);
		
		return "redirect:detail.rc";
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
	
	
	
}

