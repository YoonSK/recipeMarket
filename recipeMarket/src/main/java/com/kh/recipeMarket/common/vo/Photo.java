package com.kh.recipeMarket.common.vo;

public class Photo {
	private int photoNo;
	private int boardNo;
	private int targetNo;
	private int fileLevel;
	private String originName;
	private String changeName;
	private String deleted;
	 
	public Photo() {}

	
	public Photo(int photoNo, int boardNo, int targetNo, int fileLevel, String originName, String changeName,
			String deleted) {
		super();
		this.photoNo = photoNo;
		this.boardNo = boardNo;
		this.targetNo = targetNo;
		this.fileLevel = fileLevel;
		this.originName = originName;
		this.changeName = changeName;
		this.deleted = deleted;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
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

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	@Override
	public String toString() {
		return "Photo [photoNo=" + photoNo + ", boardNo=" + boardNo + ", targetNo=" + targetNo + ", fileLevel="
				+ fileLevel + ", originName=" + originName + ", changeName=" + changeName + ", deleted=" + deleted + "]";
	}
		
}
