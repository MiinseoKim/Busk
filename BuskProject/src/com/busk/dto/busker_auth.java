package com.busk.dto;

public class busker_auth {
	private String auth_email;
	private String auth_pwd;
	private String auth_name;
	private String member_type_code;
	public String getAuth_email() {
		return auth_email;
	}
	public void setAuth_email(String auth_email) {
		this.auth_email = auth_email;
	}
	public String getAuth_pwd() {
		return auth_pwd;
	}
	public void setAuth_pwd(String auth_pwd) {
		this.auth_pwd = auth_pwd;
	}
	public String getAuth_name() {
		return auth_name;
	}
	public void setAuth_name(String auth_name) {
		this.auth_name = auth_name;
	}
	public String getMember_type_code() {
		return member_type_code;
	}
	public void setMember_type_code(String member_type_code) {
		this.member_type_code = member_type_code;
	}
}
