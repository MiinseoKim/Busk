package com.busk.dto;

public class board {
private int board_no;
private String board_email;
private String board_title;
private String board_content;
private int board_pageview;
private String board_regdate;
private String board_file;

@Override
public String toString() {
	return "board [board_no=" + board_no + ", board_email=" + board_email + ", board_title=" + board_title
			+ ", board_content=" + board_content + ", board_pageview=" + board_pageview + ", board_regdate="
			+ board_regdate + ", board_file=" + board_file + "]";
}
public int getBoard_no() {
	return board_no;
}
public void setBoard_no(int board_no) {
	this.board_no = board_no;
}
public String getBoard_email() {
	return board_email;
}
public void setBoard_email(String board_email) {
	this.board_email = board_email;
}
public String getBoard_title() {
	return board_title;
}
public void setBoard_title(String board_title) {
	this.board_title = board_title;
}
public String getBoard_content() {
	return board_content;
}
public void setBoard_content(String board_content) {
	this.board_content = board_content;
}
public int getBoard_pageview() {
	return board_pageview;
}
public void setBoard_pageview(int board_pageview) {
	this.board_pageview = board_pageview;
}
public String getBoard_regdate() {
	return board_regdate;
}
public void setBoard_regdate(String board_regdate) {
	this.board_regdate = board_regdate;
}
public String getBoard_file() {
	return board_file;
}
public void setBoard_file(String board_file) {
	this.board_file = board_file;
}



}
