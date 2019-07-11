package com.support.movement;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


// Repository를 붙임으로써 DAO 클래스 임을 지정하게 되고, bean 태그로 자동 등록된다.
@Repository
public class LoginDAOImpl implements LoginDAO{
	
	// SqlSessionTemplate 객체를 생성해 속변 sqlSession 에 저장
	@Autowired
	private SqlSessionTemplate sqlSession;
	



	// 로그인 아이디가 관리자 테이블에 존재하는지 확인하는 메소드
	@Override
	public int getAdminIdCnt(Map<String, String> admin_id_pwd) {
		int adminIdCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getAdminIdCnt",admin_id_pwd);
		return adminIdCnt;
	}

	// 로그인 아이디와 패스워드가 관리자 테이블에서 일치하는지 확인하는 메소드
	@Override
	public int getAdminCnt(Map<String,String> admin_id_pwd) {
		
		int adminCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getAdminCnt",
				admin_id_pwd);
		return adminCnt;
	}

	// 로그인 아이디가 유저 테이블에 존재하는지 확인하는 메소드
	@Override
	public int getUserIdCnt(Map<String, String> admin_id_pwd) {
		int userIdCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getUserIdCnt",admin_id_pwd);
		return userIdCnt;
	}


	// 로그인 아이디와 패스워드가 유저 테이블에서 일치하는지 확인하는 메소드
	@Override
	public int getUserCnt(Map<String, String> admin_id_pwd) {
		int userCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getUserCnt",admin_id_pwd);
		return userCnt;
	}


	// 로그인 아이디가 운전자 테이블에 존재하는지 확인하는 메소드
	@Override
	public int getDriverIdCnt(Map<String, String> admin_id_pwd) {
		int driverIdCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getDriverIdCnt",admin_id_pwd);
		return driverIdCnt;
	}


	// 로그인 아이디와 패스워드가 운전자 테이블에서 일치하는지 확인하는 메소드
	@Override
	public int getDriverCnt(Map<String, String> admin_id_pwd) {
		int driverCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getDriverCnt",admin_id_pwd);
		return driverCnt;
	}

	// 유저 가입 메소드
	@Override
	public int getUesrRegCnt(UserDTO userDTO) {
		int userRegCnt = this.sqlSession.insert(
				"com.support.movement.LoginDAO.getUserRegCnt",userDTO);
		return userRegCnt;
	}
	

	// 운전자 가입 메소드
	@Override
	public int getDriverRegCnt(DriverDTO driverDTO) {
		int driverRegCnt = this.sqlSession.insert(
				"com.support.movement.LoginDAO.getDriverRegCnt",driverDTO);
		return driverRegCnt;
	}

	@Override
	public int getUserStatusCnt(Map<String, String> admin_id_pwd) {
		int userStatusCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getUserStatusCnt",admin_id_pwd);
		return userStatusCnt;
	}

	@Override
	public int getDriverStatusCnt(Map<String, String> admin_id_pwd) {
		int driverStatusCnt = this.sqlSession.selectOne(
				"com.support.movement.LoginDAO.getDriverStatusCnt",admin_id_pwd);
		return driverStatusCnt;
	}

	@Override
	public int findUserCnt(Map<String, String> paramsMap) {
		int findUserCnt = this.sqlSession.selectOne("com.support.movement.LoginDAO.findUserCnt",paramsMap);
		return findUserCnt;
	}

	@Override
	public String findUserId(Map<String, String> paramsMap) {
		String findUserId = this.sqlSession.selectOne("com.support.movement.LoginDAO.findUserId",paramsMap);
		return findUserId;
	}

	@Override
	public int findDriverCnt(Map<String, String> paramsMap) {
		int findDriverCnt = this.sqlSession.selectOne("com.support.movement.LoginDAO.findDriverCnt",paramsMap);
		return findDriverCnt;
	}

	@Override
	public String findDriverId(Map<String, String> paramsMap) {
		String findDriverId = this.sqlSession.selectOne("com.support.movement.LoginDAO.findDriverId",paramsMap);
		return findDriverId;
	}

	@Override
	public int findUserPwdChk(Map<String, String> paramsMap) {
		int userPwdChk = this.sqlSession.selectOne("com.support.movement.LoginDAO.findUserPwdChk",paramsMap);
		return userPwdChk;
	}

	@Override
	public int findDriverPwdChk(Map<String, String> paramsMap) {
		int driverPwdChk = this.sqlSession.selectOne("com.support.movement.LoginDAO.findDriverPwdChk",paramsMap);
		return driverPwdChk;
	}

	@Override
	public int insertRandomPwdUser(Map<String, String> paramsMap) {
		int insertRandomPwdUser = this.sqlSession.update("com.support.movement.LoginDAO.insertRandomPwdUser",paramsMap);
		return insertRandomPwdUser;
	}

	@Override
	public int insertRandomPwdDriver(Map<String, String> paramsMap) {
		int insertRandomPwdDriver = this.sqlSession.update("com.support.movement.LoginDAO.insertRandomPwdDriver",paramsMap);
		return insertRandomPwdDriver;
	}

	
}
