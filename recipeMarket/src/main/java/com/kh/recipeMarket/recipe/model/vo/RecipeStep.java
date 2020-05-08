package com.kh.recipeMarket.recipe.model.vo;

public class RecipeStep {
	private int step;
	private int postNo;
	private String content;
	
	public RecipeStep() {
		super();
	}
	
	public RecipeStep(int step, int postNo, String content) {
		super();
		this.step = step;
		this.postNo = postNo;
		this.content = content;
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

	@Override
	public String toString() {
		return "RecipeStep [step=" + step + ", postNo=" + postNo + ", content=" + content + "]";
	}

	
}
