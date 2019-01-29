package com.busk.dto;

public class fan {
	private int fan_no;
	private String fan_email;
	private String fan_b_email;
	private String bname;
	private String fname;
	
	private String picture;
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFan_b_email() {
		return fan_b_email;
	}
	public void setFan_b_email(String fan_b_email) {
		this.fan_b_email = fan_b_email;
	}
	public int getFan_no() {
		return fan_no;
	}
	public void setFan_no(int fan_no) {
		this.fan_no = fan_no;
	}
	public String getFan_email() {
		return fan_email;
	}
	public void setFan_email(String fan_email) {
		this.fan_email = fan_email;
	}

	
}
