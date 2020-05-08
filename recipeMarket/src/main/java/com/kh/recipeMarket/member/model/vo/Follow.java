package com.kh.recipeMarket.member.model.vo;

public class Follow {
	private int targetNo;
	private int memberNo;
	private String nickName;
	private String pName;
	private String title;
	
	public Follow() {}

	public Follow(int targetNo, int memberNo, String nickName, String pName, String title) {
		super();
		this.targetNo = targetNo;
		this.memberNo = memberNo;
		this.nickName = nickName;
		this.pName = pName;
		this.title = title;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
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

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Follow [targetNo=" + targetNo + ", memberNo=" + memberNo + ", nickName=" + nickName + ", pName=" + pName
				+ ", title=" + title + "]";
	}


	
	
	
}
