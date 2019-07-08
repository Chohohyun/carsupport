package com.support.movement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


// 서비스 클래스인 LoginServiceImpl 클래스 선언
// 서브스 클래스에는 @Service 와 @Transcational를 붙인다.
// @Service => 서비스 클래스 임을 지정하고 bean 태그로 자동 등록된다.
// @Transactional => 서비스 클래스의 메소드 내부에서 일어나느 ㄴ모든 작업에는 트랜잭션이 걸린다.
@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	// 속성변수 loginDAO 선언하고, LoginDAO 라는 인터페이스를
	// 구현한 클래스를 객체화 하여 저장
	// **********************************************************
	// Autowired이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	// 이 인터페이를 구현한 클래스를 객체화하여 저장
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public int getAcceptListAllCnt(String id) {
		int acceptPermit = this.adminDAO.getAcceptPermit(id);
		if(acceptPermit==1) {
			int acceptListAllCnt = this.adminDAO.getAcceptListAllCnt();
			return acceptListAllCnt;
		}
		else {
			return 0;
		}
	}

	@Override
	public List<Map<String, String>> getAcceptList(String id) {
		
		List<Map<String, String>> acceptList = this.adminDAO.getAcceptList();
			return acceptList;
		
	}

	@Override
	public int getAcceptDriverCnt(int driver_no) {
		int acceptDriverCnt = this.adminDAO.getAcceptDriverCnt(driver_no);
		return acceptDriverCnt;
	}

	@Override
	public int getDriverRegCnt(DriverDTO driverDTO) {
		int driverRegCnt = this.adminDAO.getDriverRegCnt(driverDTO);
		return driverRegCnt;
	}

	@Override
	public int getUpDelListAllCnt(String id) {
		int acceptPermit = this.adminDAO.getAcceptPermit(id);
		if(acceptPermit==1) {
			int upDelListAllCnt = this.adminDAO.getUpDelListAllCnt();
			return upDelListAllCnt;
		}
		else {
			return 0;
		}
	}

	@Override
	public List<Map<String, String>> getUpDelList(String id) {
		List<Map<String, String>> upDelList = this.adminDAO.getUpDelList();
		return upDelList;
	
	}

	@Override
	public DriverDTO getDriverDTO(int driver_no) {
		DriverDTO driverDTO = this.adminDAO.getDriverDTO(driver_no);
		return driverDTO;
	}

	@Override
	public int getDriverUpCnt(DriverDTO driverDTO) {
		int driverUpCnt = this.adminDAO.getDriverUpCnt(driverDTO);
		return driverUpCnt;
	}

	@Override
	public int getDriverDelCnt(DriverDTO driverDTO) {
		int carDriverDelCnt = this.adminDAO.getCarDriverDelCnt(driverDTO);
		int driverDelCnt = this.adminDAO.getDriverDelCnt(driverDTO);
		return driverDelCnt;
	}
	
}
