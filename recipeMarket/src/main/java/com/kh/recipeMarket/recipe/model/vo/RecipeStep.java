package com.kh.recipeMarket.recipe.model.vo;

public class RecipeStep {
	int Content;
	int timer;
	
	public RecipeStep() {
		super();
	}
	
	public RecipeStep(int content, int timer) {
		super();
		Content = content;
		this.timer = timer;
	}
	
	public int getContent() {
		return Content;
	}
	public void setContent(int content) {
		Content = content;
	}
	public int getTimer() {
		return timer;
	}
	public void setTimer(int timer) {
		this.timer = timer;
	}

}
