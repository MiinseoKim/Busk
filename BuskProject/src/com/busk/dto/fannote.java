package com.busk.dto;

import java.sql.Date;

public class fannote {
	private int fannote_no;
	private String fannote_b_email;
	private String fannote_email;
	private String fannote_content;
	private Date fannote_regdate;
	
	private String fannote_name;
	
	public int getFannote_no() {
		return fannote_no;
	}
	public void setFannote_no(int fannote_no) {
		this.fannote_no = fannote_no;
	}
	public String getFannote_b_email() {
		return fannote_b_email;
	}
	public void setFannote_b_email(String fannote_b_email) {
		this.fannote_b_email = fannote_b_email;
	}
	public String getFannote_email() {
		return fannote_email;
	}
	public void setFannote_email(String fannote_email) {
		this.fannote_email = fannote_email;
	}
	public String getFannote_content() {
		return fannote_content;
	}
	public void setFannote_content(String fannote_content) {
		this.fannote_content = fannote_content;
	}
	public Date getFannote_regdate() {
		return fannote_regdate;
	}
	public void setFannote_regdate(Date fannote_regdate) {
		this.fannote_regdate = fannote_regdate;
	}
	public String getFannote_name() {
		return fannote_name;
	}
	public void setFannote_name(String fannote_name) {
		this.fannote_name = fannote_name;
	}
}
