package com.support.movement;

import java.util.List;
import java.util.Map;

public interface AdminService {

	int getAcceptListAllCnt(String id);

	List<Map<String, String>> getAcceptList(String id);

	int getAcceptDriverCnt(int driver_no);

	int getDriverRegCnt(DriverDTO driverDTO);

	int getUpDelListAllCnt(String id);

	List<Map<String, String>> getUpDelList(String id);

	DriverDTO getDriverDTO(int driver_no);

	int getDriverUpCnt(DriverDTO driverDTO);

	int getDriverDelCnt(DriverDTO driverDTO);

}
