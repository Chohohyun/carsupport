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

	int getUserStatusCnt(Map<String, String> admin_id_pwd);

	int getDriverStatusCnt(Map<String, String> admin_id_pwd);

	int findUserCnt(Map<String, String> paramsMap);

	String findUserId(Map<String, String> paramsMap);

	int findDriverCnt(Map<String, String> paramsMap);

	String findDriverId(Map<String, String> paramsMap);

	int findUserPwdChk(Map<String, String> paramsMap);

	int findDriverPwdChk(Map<String, String> paramsMap);

	int insertRandomPwdUser(Map<String, String> paramsMap);

	int insertRandomPwdDriver(Map<String, String> paramsMap);

	int getCheckEmail(Map<String, String> paramsMap);

	int insertSendEmail(Map<String, String> paramsMap);

	int updateSendEmail(Map<String, String> paramsMap);

	int emailAuthCheck(Map<String, String> paramsMap);

	int checkAdminId(Map<String, String> paramsMap);

	int checkUserId(Map<String, String> paramsMap);

	int checkDriverId(Map<String, String> paramsMap);


}
