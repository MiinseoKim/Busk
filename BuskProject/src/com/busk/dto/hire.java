package com.busk.dto;

import java.sql.Date;

public class hire {
	private int hire_no;
	private String hire_email;
	private Date hire_regdate;
	private int hire_num;
	private String hire_type;
	private int hire_aud_num;
	private Date hire_date;
	private String hire_duration;
	private int hire_budget;
	private String hire_about;
	private String hire_loc;
	
	//hire 페이지용
	private String date;
	private String time;
	
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHire_loc() {
		return hire_loc;
	}
	public void setHire_loc(String hire_loc) {
		this.hire_loc = hire_loc;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getHire_no() {
		return hire_no;
	}
	public void setHire_no(int hire_no) {
		this.hire_no = hire_no;
	}
	public String getHire_email() {
		return hire_email;
	}
	public void setHire_email(String hire_email) {
		this.hire_email = hire_email;
	}
	public Date getHire_regdate() {
		return hire_regdate;
	}
	public void setHire_regdate(Date hire_regdate) {
		this.hire_regdate = hire_regdate;
	}
	public int getHire_num() {
		return hire_num;
	}
	public void setHire_num(int hire_num) {
		this.hire_num = hire_num;
	}
	public String getHire_type() {
		return hire_type;
	}
	public void setHire_type(String hire_type) {
		this.hire_type = hire_type;
	}
	public int getHire_aud_num() {
		return hire_aud_num;
	}
	public void setHire_aud_num(int hire_aud_num) {
		this.hire_aud_num = hire_aud_num;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public String getHire_duration() {
		return hire_duration;
	}
	public void setHire_duration(String hire_duration) {
		this.hire_duration = hire_duration;
	}
	public int getHire_budget() {
		return hire_budget;
	}
	public void setHire_budget(int hire_budget) {
		this.hire_budget = hire_budget;
	}
	public String getHire_about() {
		return hire_about;
	}
	public void setHire_about(String hire_about) {
		this.hire_about = hire_about;
	}
}
