package com.support.movement;

import java.util.Map;

public interface LoginService {
	// 로그인 아이디, 암호 존재 개수 검색 메소드 선언
	int getAdminCnt(Map<String,String> admin_id_pwd);

	int getUserRegCnt(UserDTO userDTO);

	int getDriverRegCnt(DriverDTO driverDTO);
}
