package com.kh.recipeMarket.buy.model.vo;

public class OrderDetail {
	private int detailNo;
	private int orderNo;
	private int productNo;
	private int prCount;
	private int price;
	
	public OrderDetail() {}

	public OrderDetail(int detailNo, int orderNo, int productNo, int prCount, int price) {
		super();
		this.detailNo = detailNo;
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.prCount = prCount;
		this.price = price;
	}

	public int getDetailNo() {
		return detailNo;
	}

	public void setDetailNo(int detailNo) {
		this.detailNo = detailNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderDetail [detailNo=" + detailNo + ", orderNo=" + orderNo + ", productNo=" + productNo + ", prCount="
				+ prCount + ", price=" + price + "]";
	}
	
}
