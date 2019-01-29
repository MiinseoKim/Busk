package com.busk.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class member {
	private String email;
	private String name;
	private String pwd;	
	private String location;
	private String descript;
	private String picture;
	private String member_type_code;
	private String facebook;
	private String instagram;
	private String youtube;
	
	/*buskers*/
	private String fan_count;
	private String gallery_count;

	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		   try 
	        {
	            this.picture = URLEncoder.encode(picture,"UTF-8");
	        } 
	        catch (UnsupportedEncodingException e) 
	        {
	            e.printStackTrace();
	        }
	        this.picture = picture;
	}
	public String getMember_type_code() {
		return member_type_code;
	}
	public void setMember_type_code(String member_type_code) {
		this.member_type_code = member_type_code;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getInstagram() {
		return instagram;
	}
	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}
	public String getYoutube() {
		return youtube;
	}
	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}
	
	
	public String getFan_count() {
		return fan_count;
	}
	public void setFan_count(String fan_count) {
		this.fan_count = fan_count;
	}
	public String getGallery_count() {
		return gallery_count;
	}
	public void setGallery_count(String gallery_count) {
		this.gallery_count = gallery_count;
	}
	
}
