package com.kh.recipeMarket.mypage.model.vo;

import java.sql.Date;

public class mOrderInfo {
	private int orderNo;
	private Date date;
	private int total;
	private String oList;
	private int status;
	
	public mOrderInfo() {}

	public mOrderInfo(int orderNo, Date date, int total, String oList, int status) {
		super();
		this.orderNo = orderNo;
		this.date = date;
		this.total = total;
		this.oList = oList;
		this.status = status;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getoList() {
		return oList;
	}

	public void setoList(String oList) {
		this.oList = oList;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "mOrderInfo [orderNo=" + orderNo + ", date=" + date + ", total=" + total + ", oList=" + oList
				+ ", status=" + status + "]";
	}


}
