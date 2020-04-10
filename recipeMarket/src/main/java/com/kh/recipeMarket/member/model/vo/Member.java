package com.kh.recipeMarket.member.model.vo;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;

public class Member {

	private int memberNo;
	private String id;
	private String pwd;
	private String name;
	private String nickName;
	private String email;
	private String phone;
	private Date birth;
	private int zip;
	private String address;
	private String address2;
	private int grade;
	private String deleted;
	private String pName;

	public Member() {}
	
	public Member(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public Member(int memberNo, String id, String pwd, String name, String nickName, String email, String phone,
			Date bitrh, int zip, String address, String address2, int grade, String deleted) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.birth = bitrh;
		this.zip = zip;
		this.address = address;
		this.address2 = address2;
		this.grade = grade;
		this.deleted = deleted;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickName="
				+ nickName + ", email=" + email + ", phone=" + phone + ", birth=" + birth + ", zip=" + zip
				+ ", address=" + address + ", address2=" + address2 + ", grade=" + grade + ", deleted=" + deleted
				+ ", pName=" + pName + "]";
	}

}
