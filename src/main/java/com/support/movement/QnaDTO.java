package com.support.movement;

public class QnaDTO {
	private String question_no;
	private String subject;
	private String content;
	private int question_group_no;
	public int question_print_no;
	
	public String getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(String question_no) {
		this.question_no = question_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQuestion_group_no() {
		return question_group_no;
	}
	public void setQuestion_group_no(int question_group_no) {
		this.question_group_no = question_group_no;
	}
	public int getQuestion_print_no() {
		return question_print_no;
	}
	public void setQuestion_print_no(int question_print_no) {
		this.question_print_no = question_print_no;
	}
}
