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

}
