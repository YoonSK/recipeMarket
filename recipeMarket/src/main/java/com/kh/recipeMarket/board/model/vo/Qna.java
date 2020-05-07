package com.kh.recipeMarket.board.model.vo;

public class Qna {
	private int postNo;
	private int memberNo;
	private String content;
	
	private String nickName; // 닉네임을 불러오기 위해서 설정
	
	public Qna() {}

	public Qna(int postNo, int memberNo, String content) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.content = content;
	}
	
	

	public Qna(String nickName) {
		super();
		this.nickName = nickName;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Qna [postNo=" + postNo + ", memberNo=" + memberNo + ", content=" + content + ", nickName=" + nickName
				+ "]";
	}

	
	
	
}
