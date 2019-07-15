package com.support.movement;

public class CarSearchDTO {
	private String car_number;
	private String keyword;
	private String car_code;
	private int selectPageNo;
	private String maintance_year;
	private String maintance_month;
	private String maintance_code;
	
	public String getMaintance_year() {
		return maintance_year;
	}

	public void setMaintance_year(String maintance_year) {
		this.maintance_year = maintance_year;
	}

	public String getMaintance_month() {
		return maintance_month;
	}

	public void setMaintance_month(String maintance_month) {
		this.maintance_month = maintance_month;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCar_code() {
		return car_code;
	}

	public void setCar_code(String car_code) {
		this.car_code = car_code;
	}

	public String getCar_number() {
		return car_number;
	}

	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}

	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}

	public String getMaintance_code() {
		return maintance_code;
	}

	public void setMaintance_code(String maintance_code) {
		this.maintance_code = maintance_code;
	}
	
}
