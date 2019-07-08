package com.support.movement;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	int getAcceptPermit(String id);

	int getAcceptListAllCnt();

	List<Map<String, String>> getAcceptList();

	int getAcceptDriverCnt(int driver_no);

	int getDriverRegCnt(DriverDTO driverDTO);

	int getUpDelListAllCnt();

	List<Map<String, String>> getUpDelList();

	DriverDTO getDriverDTO(int driver_no);

	int getDriverUpCnt(DriverDTO driverDTO);

	int getDriverDelCnt(DriverDTO driverDTO);

	int getCarDriverDelCnt(DriverDTO driverDTO);

}
