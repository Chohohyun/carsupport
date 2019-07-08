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

}
