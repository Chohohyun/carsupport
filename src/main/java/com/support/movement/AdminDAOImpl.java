package com.support.movement;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


// Repository를 붙임으로써 DAO 클래스 임을 지정하게 되고, bean 태그로 자동 등록된다.
@Repository
public class AdminDAOImpl implements AdminDAO{
	
	// SqlSessionTemplate 객체를 생성해 속변 sqlSession 에 저장
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getAcceptPermit(String id) {
		int acceptPermit = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getAcceptPermit",id);
		return acceptPermit;
	}
	
	@Override
	public int getAcceptListAllCnt() {
		int acceptListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getAcceptListAllCnt");
		return acceptListAllCnt;
	}

	@Override
	public List<Map<String, String>> getAcceptList() {
		List<Map<String, String>> acceptList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getAcceptList");
		return acceptList;
	}

	@Override
	public int getAcceptDriverCnt(int driver_no) {
		System.out.println("dao층까지왔다"+driver_no);
		int acceptDriverCnt = this.sqlSession.update("com.support.movement.AdminDAO.getAcceptDriverCnt",driver_no);
		System.out.println("dao층 나갑니다.");
		return acceptDriverCnt;
	}

	@Override
	public int getDriverRegCnt(DriverDTO driverDTO) {
		int driverRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getDriverRegCnt",driverDTO);
		return driverRegCnt;
	}

	@Override
	public int getUpDelListAllCnt() {
		int upDelListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getUpDelListAllCnt");
		return upDelListAllCnt;
	}

	@Override
	public List<Map<String, String>> getUpDelList() {
		List<Map<String, String>> upDelList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getUpDelList");
		return upDelList;
	}

	@Override
	public DriverDTO getDriverDTO(int driver_no) {
		DriverDTO driverDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getDriverDTO",driver_no);
		return driverDTO;
	}
	


}
