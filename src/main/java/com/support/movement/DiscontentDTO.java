package com.support.movement;

public class DiscontentDTO {
	private String discontent_subject;
	private String discontent_content;
	private String discontent_no;
	private String user_id;
	private String user_name;
	private String readcount;
	private String reg_date;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getDiscontent_subject() {
		return discontent_subject;
	}
	public void setDiscontent_subject(String discontent_subject) {
		this.discontent_subject = discontent_subject;
	}
	public String getDiscontent_content() {
		return discontent_content;
	}
	public void setDiscontent_content(String discontent_content) {
		this.discontent_content = discontent_content;
	}
	public String getDiscontent_no() {
		return discontent_no;
	}
	public void setDiscontent_no(String discontent_no) {
		this.discontent_no = discontent_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
