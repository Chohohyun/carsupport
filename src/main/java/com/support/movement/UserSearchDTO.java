package com.support.movement;

public class UserSearchDTO {
	private int selectPageNo;
	private String keyword;
	private String[] gender;
	private String disability_type;
	private String disability_grade;
	
	public String getDisability_type() {
		return disability_type;
	}

	public void setDisability_type(String disability_type) {
		this.disability_type = disability_type;
	}

	public String getDisability_grade() {
		return disability_grade;
	}

	public void setDisability_grade(String disability_grade) {
		this.disability_grade = disability_grade;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String[] getGender() {
		return gender;
	}

	public void setGender(String[] gender) {
		this.gender = gender;
	}

	

	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	
}
