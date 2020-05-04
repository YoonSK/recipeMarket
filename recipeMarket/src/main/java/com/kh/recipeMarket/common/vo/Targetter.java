package com.kh.recipeMarket.common.vo;

public class Targetter {

	private int boardNo;
	private int targetNo;
	
	public Targetter() {
		super();
	}
	

	public Targetter(int boardNo, int targetNo) {
		super();
		this.boardNo = boardNo;
		this.targetNo = targetNo;
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
	
	
}
