package com.kh.recipeMarket.recipe.model.vo;

public class RecipeStep {
	private int postNo;
	private int content;
	private int timer;
	
	public RecipeStep() {
		super();
	}
	
	public RecipeStep(int postNo, int content, int timer) {
		super();
		this.postNo = postNo;
		this.content = content;
		this.timer = timer;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getContent() {
		return content;
	}

	public void setContent(int content) {
		this.content = content;
	}

	public int getTimer() {
		return timer;
	}

	public void setTimer(int timer) {
		this.timer = timer;
	}
	


}
