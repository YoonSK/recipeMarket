
package com.kh.recipeMarket.recipe.model.vo;


public class Ingredient {
	private int postNo;
	private String name;
	private String amount;
	
	public Ingredient() {
		super();
	}

	public Ingredient(int postNo, String name, String amount) {
		super();
		this.postNo = postNo;
		this.name = name;
		this.amount = amount;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}


	
	
	
	
	
}
