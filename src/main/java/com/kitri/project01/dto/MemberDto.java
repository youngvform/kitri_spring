package com.kitri.project01.dto;

import java.util.Date;

public class MemberDto {
	private int no;
	private String email;
	private String name;
	private String password;
	private Date createdDate;
	private Date modifiedDate;
	
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberDto(int no, String email, String name, String password, Date createdDate, Date modifiedDate) {
	
		this.no = no;
		this.email = email;
		this.name = name;
		this.password = password;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	
}
