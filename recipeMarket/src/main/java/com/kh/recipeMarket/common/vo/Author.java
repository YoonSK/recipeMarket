package com.kh.recipeMarket.common.vo;

public class Author {

	private int memberNo;
	private String nickName;
	private String pName;
	
	private int posts;
	private double rating;
	private int follows;
	private int hits;
	
	public Author() {
		super();
	}
	

	public Author(int memberNo, String nickName, String pName, int posts, double rating, int follows, int hits) {
		super();
		this.memberNo = memberNo;
		this.nickName = nickName;
		this.pName = pName;
		this.posts = posts;
		this.rating = rating;
		this.follows = follows;
		this.hits = hits;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPosts() {
		return posts;
	}

	public void setPosts(int posts) {
		this.posts = posts;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getFollows() {
		return follows;
	}

	public void setFollows(int follows) {
		this.follows = follows;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "Author [memberNo=" + memberNo + ", nickName=" + nickName + ", pName=" + pName + ", posts=" + posts
				+ ", rating=" + rating + ", follows=" + follows + ", hits=" + hits + "]";
	}

	
	

}
