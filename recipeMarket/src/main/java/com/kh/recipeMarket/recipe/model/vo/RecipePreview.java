package com.kh.recipeMarket.recipe.model.vo;

public class RecipePreview {

	private int postNo;
	private String title;
	private String thumb;
	private int rating;
	private int hit;
	
	public RecipePreview() {
		super();
	}
	
	public RecipePreview(int postNo, String title, String thumb, int rating, int hit) {
		super();
		this.postNo = postNo;
		this.title = title;
		this.thumb = thumb;
		this.rating = rating;
		this.hit = hit;
	}
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "RecipePreview [postNo=" + postNo + ", title=" + title + ", thumb=" + thumb
				+ ", rating=" + rating + ", hit=" + hit + "]";
	}
	
	
	
	
}
