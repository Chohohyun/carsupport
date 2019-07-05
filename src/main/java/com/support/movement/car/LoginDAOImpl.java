package com.support.movement.car;

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
				"com.support.movement.car.LoginDAO.getAdminIdCnt",admin_id_pwd);
		return adminIdCnt;
	}

	// 로그인 아이디와 패스워드가 관리자 테이블에서 일치하는지 확인하는 메소드
	@Override
	public int getAdminCnt(Map<String,String> admin_id_pwd) {
		
		int adminCnt = this.sqlSession.selectOne(
				"com.support.movement.car.LoginDAO.getAdminCnt",
				admin_id_pwd);
		return adminCnt;
	}

	// 로그인 아이디가 유저 테이블에 존재하는지 확인하는 메소드
	@Override
	public int getUserIdCnt(Map<String, String> admin_id_pwd) {
		int userIdCnt = this.sqlSession.selectOne(
				"com.support.movement.car.LoginDAO.getUserIdCnt",admin_id_pwd);
		return userIdCnt;
	}


	// 로그인 아이디와 패스워드가 유저 테이블에서 일치하는지 확인하는 메소드
	@Override
	public int getUserCnt(Map<String, String> admin_id_pwd) {
		int userCnt = this.sqlSession.selectOne(
				"com.support.movement.car.LoginDAO.getUserCnt",admin_id_pwd);
		return userCnt;
	}


	// 로그인 아이디가 운전자 테이블에 존재하는지 확인하는 메소드
	@Override
	public int getDriverIdCnt(Map<String, String> admin_id_pwd) {
		int driverIdCnt = this.sqlSession.selectOne(
				"com.support.movement.car.LoginDAO.getDriverIdCnt",admin_id_pwd);
		return driverIdCnt;
	}


	// 로그인 아이디와 패스워드가 운전자 테이블에서 일치하는지 확인하는 메소드
	@Override
	public int getDriverCnt(Map<String, String> admin_id_pwd) {
		int driverCnt = this.sqlSession.selectOne(
				"com.support.movement.car.LoginDAO.getDriverCnt",admin_id_pwd);
		return driverCnt;
	}
}