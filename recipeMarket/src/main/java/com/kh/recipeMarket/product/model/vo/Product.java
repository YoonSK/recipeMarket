package com.kh.recipeMarket.product.model.vo;

import java.sql.Date;

public class Product {
	
	private int productNo;
	private String name;
	private int price;
	private int stock;
	private String category;
	private Date createDate;
	private String deleted;
	private int income;
	private int export;
	private String phName;
	
	
	
	public Product(int productNo, String name, int price, int stock, String category, Date createDate, String deleted,
			int income, int export, String phName) {
		super();
		this.productNo = productNo;
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.category = category;
		this.createDate = createDate;
		this.deleted = deleted;
		this.income = income;
		this.export = export;
		this.phName = phName;
	}

	public Product() {}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getExport() {
		return export;
	}

	public void setExport(int export) {
		this.export = export;
	}

	
	public String getPhName() {
		return phName;
	}

	public void setPhname(String phName) {
		this.phName = phName;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", name=" + name + ", price=" + price + ", stock=" + stock
				+ ", category=" + category + ", createDate=" + createDate + ", deleted=" + deleted + ", income="
				+ income + ", export=" + export + ", phName=" + phName + "]";
	}


	
}
