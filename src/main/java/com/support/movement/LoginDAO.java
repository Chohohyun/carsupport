package com.support.movement;

import java.util.Map;

public interface LoginDAO {

	int getAdminCnt(Map<String, String> admin_id_pwd);

	int getAdminIdCnt(Map<String, String> admin_id_pwd);

	int getUserIdCnt(Map<String, String> admin_id_pwd);

	int getUserCnt(Map<String, String> admin_id_pwd);

	int getDriverIdCnt(Map<String, String> admin_id_pwd);

	int getDriverCnt(Map<String, String> admin_id_pwd);

	int getUesrRegCnt(UserDTO userDTO);

	int getDriverRegCnt(DriverDTO driverDTO);

}
