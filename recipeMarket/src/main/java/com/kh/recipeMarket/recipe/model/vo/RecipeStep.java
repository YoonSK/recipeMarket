package com.kh.recipeMarket.recipe.model.vo;

public class RecipeStep {
	private int step;
	private int postNo;
	private String content;
	private int timer;
	
	public RecipeStep() {
		super();
	}
	
	public RecipeStep(int step, int postNo, String content, int timer) {
		super();
		this.step = step;
		this.postNo = postNo;
		this.content = content;
		this.timer = timer;
	}

	
	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String string) {
		this.content = string;
	}

	public int getTimer() {
		return timer;
	}

	public void setTimer(int timer) {
		this.timer = timer;
	}
	


}
