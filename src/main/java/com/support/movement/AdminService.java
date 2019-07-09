package com.support.movement;

import java.util.List;
import java.util.Map;

public interface AdminService {

	int getAcceptListAllCnt(String id);

	List<Map<String, String>> getAcceptList(String id);

	int getAcceptDriverCnt(int driver_no);

	int getDriverRegCnt(DriverDTO driverDTO);

	int getDriverUpDelListAllCnt(String id);

	List<Map<String, String>> getDriverUpDelList(String id);

	DriverDTO getDriverDTO(int driver_no);

	int getDriverUpCnt(DriverDTO driverDTO);

	int getDriverDelCnt(DriverDTO driverDTO);

	int getUserRegCnt(UserDTO userDTO);

	int getUserUpDelListAllCnt(String id);

	List<Map<String, String>> getUserUpDelList(String id);

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

	List<Map<String, String>> getQnaList(int question_group_no);

	int insertQna(QnaDTO qnaDTO);

}
