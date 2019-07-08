package com.support.movement;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	int getAcceptPermit(String id);

	int getAcceptListAllCnt();

	List<Map<String, String>> getAcceptList();

	int getAcceptDriverCnt(int driver_no);

	int getDriverRegCnt(DriverDTO driverDTO);

	int getDriverUpDelListAllCnt();

	List<Map<String, String>> getDriverUpDelList();

	DriverDTO getDriverDTO(int driver_no);

	int getDriverUpCnt(DriverDTO driverDTO);

	int getDriverDelCnt(DriverDTO driverDTO);

	int getCarDriverDelCnt(DriverDTO driverDTO);

	int getUserRegCnt(UserDTO userDTO);

	int getUserUpDelListAllCnt();

	List<Map<String, String>> getUserUpDelList();

	UserDTO getUserDTO(int user_no);

	int getUserUpCnt(UserDTO userDTO);

	int getUserDelCnt(UserDTO userDTO);

	List<Map<String, String>> getDriverList();

	int getCarRegCnt(CarDTO carDTO);

	int getCarListAllCnt();

	List<Map<String, String>> getCarList();
	
	CarDTO getCarDTO(int car_info_no);

	int getCarUpdateCnt(CarDTO carDTO);

	int getCarDeleteCnt(int car_info_no);

	int getCarMaintanceRegCnt(CarMaintanceDTO carMaintanceDTO);

	int getCarMaintanceListAllCnt();

	List<Map<String, String>> getCarMaintanceList();

	CarMaintanceDTO getCarMaintanceDTO(int car_maintance_info_no);

	int getCarMaintanceUpdateCnt(CarMaintanceDTO carMaintanceDTO);

	int getCarMaintancDeleteCnt(int car_maintance_info_no);

}
