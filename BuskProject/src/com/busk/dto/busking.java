package com.busk.dto;

import java.sql.Date;

public class busking {
	private String name;
	private String date;
	private String time;
	
	
	private String hname;
	private String aname;
	
	
	
	private int busking_no;
	private String busking_h_email;
	private String busking_loc;
	private int busking_num;
	private int busking_aud_num;
	private Date busking_date;
	private int busking_duration;
	private int busking_budget;
	private String busking_about;
	private String busking_a_email;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getName() {
		return name;
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

	public void setName(String name) {
		this.name = name;
	}
	public int getBusking_no() {
		return busking_no;
	}
	public void setBusking_no(int busking_no) {
		this.busking_no = busking_no;
	}
	public String getBusking_h_email() {
		return busking_h_email;
	}
	public void setBusking_h_email(String busking_h_email) {
		this.busking_h_email = busking_h_email;
	}
	public String getBusking_loc() {
		return busking_loc;
	}
	public void setBusking_loc(String busking_loc) {
		this.busking_loc = busking_loc;
	}
	public int getBusking_num() {
		return busking_num;
	}
	public void setBusking_num(int busking_num) {
		this.busking_num = busking_num;
	}
	public int getBusking_aud_num() {
		return busking_aud_num;
	}
	public void setBusking_aud_num(int busking_aud_num) {
		this.busking_aud_num = busking_aud_num;
	}
	public Date getBusking_date() {
		return busking_date;
	}
	public void setBusking_date(Date busking_date) {
		this.busking_date = busking_date;
	}
	public int getBusking_duration() {
		return busking_duration;
	}
	public void setBusking_duration(int busking_duration) {
		this.busking_duration = busking_duration;
	}
	public int getBusking_budget() {
		return busking_budget;
	}
	public void setBusking_budget(int busking_budget) {
		this.busking_budget = busking_budget;
	}
	public String getBusking_about() {
		return busking_about;
	}
	public void setBusking_about(String busking_about) {
		this.busking_about = busking_about;
	}
	public String getBusking_a_email() {
		return busking_a_email;
	}
	public void setBusking_a_email(String busking_a_email) {
		this.busking_a_email = busking_a_email;
	}
	
}
