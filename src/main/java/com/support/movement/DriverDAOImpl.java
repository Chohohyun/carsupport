package com.support.movement;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;




// Repository를 붙임으로써 DAO 클래스 임을 지정하게 되고, bean 태그로 자동 등록된다.
@Repository
public class DriverDAOImpl implements DriverDAO{
	
	// SqlSessionTemplate 객체를 생성해 속변 sqlSession 에 저장
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public DriverDTO getDriverDTO(String id) {
		DriverDTO driverDTO = this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriverDTO",id);
		return driverDTO;
	}
	@Override
	public CarDTO getDriverCarInfo(String id) {
		CarDTO carDTO =  this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriverCarInfo",id);
		return carDTO;
	}
	@Override
	public int getDriveListAllCnt(String id) {
		int driveListAllCnt = this.sqlSession.selectOne("com.support.movement.DriverDAO.getDriveListAllCnt",id);
		return driveListAllCnt;
	}
	@Override
	public List<Map<String, String>> getDriveList(String id) {
		 List<Map<String, String>> driveList =  this.sqlSession.selectList("com.support.movement.DriverDAO.getDriveList",id);
			return driveList;
	}
}
