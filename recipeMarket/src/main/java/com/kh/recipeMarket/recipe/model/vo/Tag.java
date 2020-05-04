package com.kh.recipeMarket.recipe.model.vo;

public class Tag {
	private int postNo;
	private String tag;
	
	public Tag() {
		super();
	}

	public Tag(int postNo, String tag) {
		super();
		this.postNo = postNo;
		this.tag = tag;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	


}

