package com.support.movement;

public class UserReservationDTO {
	private String endLatitude;
	private String startLatitude;
	private String endLongitude;
	private String startLongitude;
	private String car_code;
	private String car_reservation_date;
	private String car_reservation_hour;
	private String user_no;
	private String possibleCarCnt;
	public String getEndLatitude() {
		return endLatitude;
	}
	public void setEndLatitude(String endLatitude) {
		this.endLatitude = endLatitude;
	}
	public String getStartLatitude() {
		return startLatitude;
	}
	public void setStartLatitude(String startLatitude) {
		this.startLatitude = startLatitude;
	}
	public String getEndLongitude() {
		return endLongitude;
	}
	public void setEndLongitude(String endLongitude) {
		this.endLongitude = endLongitude;
	}
	public String getStartLongitude() {
		return startLongitude;
	}
	public void setStartLongitude(String startLongitude) {
		this.startLongitude = startLongitude;
	}
	public String getCar_code() {
		return car_code;
	}
	public void setCar_code(String car_code) {
		this.car_code = car_code;
	}
	public String getCar_reservation_date() {
		return car_reservation_date;
	}
	public void setCar_reservation_date(String car_reservation_date) {
		this.car_reservation_date = car_reservation_date;
	}
	public String getCar_reservation_hour() {
		return car_reservation_hour;
	}
	public void setCar_reservation_hour(String car_reservation_hour) {
		this.car_reservation_hour = car_reservation_hour;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no=user_no;
	}
	public String getPossibleCarCnt() {
		return possibleCarCnt;
	}
	public void setPossibleCarCnt(String possibleCarCnt) {
		this.possibleCarCnt = possibleCarCnt;
	}
	
}
