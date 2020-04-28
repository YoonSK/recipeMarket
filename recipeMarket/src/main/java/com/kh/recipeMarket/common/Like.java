package com.kh.recipeMarket.common;

public class Like {
	private int boardNo; // 게시판 종류
	private int targetNo; // 해당 번호
	private int memberNo; // 회원 번호
	
	public Like() {}

	public Like(int boardNo, int targetNo, int memberNo) {
		super();
		this.boardNo = boardNo;
		this.targetNo = targetNo;
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	@Override
	public String toString() {
		return "Like [boardNo=" + boardNo + ", targetNo=" + targetNo + ", memberNo=" + memberNo + "]";
	}
	
	
}
