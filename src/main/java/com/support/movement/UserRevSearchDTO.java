package com.support.movement;

public class UserRevSearchDTO {
	private String keyword;
	private int selectPageNo;
	private String id;
	private String reservation_year;
	private String reservation_month;
	
	public String getReservation_year() {
		return reservation_year;
	}
	public void setReservation_year(String reservation_year) {
		this.reservation_year = reservation_year;
	}
	public String getReservation_month() {
		return reservation_month;
	}
	public void setReservation_month(String reservation_month) {
		this.reservation_month = reservation_month;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
