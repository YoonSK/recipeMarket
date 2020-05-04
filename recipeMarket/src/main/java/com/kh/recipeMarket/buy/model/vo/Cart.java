package com.kh.recipeMarket.buy.model.vo;

public class Cart {
	private int memberNo;
	private int productNo;
	private int prCount;
	private String pName;
	private String phName;
	private int price;
	
	public Cart() {}

	public Cart(int memberNo, int productNo, int prCount, String pName, String phName, int price) {
		super();
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.prCount = prCount;
		this.pName = pName;
		this.phName = phName;
		this.price = price;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getPrCount() {
		return prCount;
	}

	public void setPrCount(int prCount) {
		this.prCount = prCount;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getPhName() {
		return phName;
	}

	public void setPhName(String phName) {
		this.phName = phName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Cart [memberNo=" + memberNo + ", productNo=" + productNo + ", prCount=" + prCount + ", pName=" + pName
				+ ", phName=" + phName + ", price=" + price + "]";
	}
	
	
}
