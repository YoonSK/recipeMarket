package com.kh.recipeMarket.common.vo;

public class Profile {

	private int memberNo;
	private String nickName;
	private String pName;
	
	public Profile() {
		super();
	}
	

	public Profile(int memberNo, String nickName, String pName) {
		super();
		this.memberNo = memberNo;
		this.nickName = nickName;
		this.pName = pName;
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

	
}
