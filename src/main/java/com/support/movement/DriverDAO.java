package com.support.movement;

import java.util.List;
import java.util.Map;


public interface DriverDAO {

	DriverDTO getDriverDTO(String id);

	CarDTO getDriverCarInfo(String id);

	int getDriveListAllCnt(String id);

	List<Map<String, String>> getDriveList(String id);

}
