package com.kh.recipeMarket.buy.model.vo;

import java.sql.Date;

public class Order {
	private int orderNo;
	private int memNo;
	private Date date;
	private int zip;
	private String address;
	private String address2;
	private String note;
	private int phone;
	private int status;
	private int total;
	
	public Order() {}

	public Order(int orderNo, int memNo, Date date, int zip, String address, String address2, String note, int phone, int status, int total) {
		super();
		this.orderNo = orderNo;
		this.memNo = memNo;
		this.date = date;
		this.zip = zip;
		this.address = address;
		this.address2 = address2;
		this.note = note;
		this.phone = phone;
		this.status = status;
		this.total = total;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", memNo=" + memNo + ", date=" + date + ", zip=" + zip + ", address="
				+ address + ", address2=" + address2 + ", note=" + note + ", phone=" + phone 
				+ ", status=" + status + ", total=" + total + "]";
	}
	
	
}
