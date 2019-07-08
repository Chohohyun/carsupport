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
	public int getDriverUpDelListAllCnt() {
		int upDelListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getDriverUpDelListAllCnt");
		return upDelListAllCnt;
	}

	@Override
	public List<Map<String, String>> getDriverUpDelList() {
		List<Map<String, String>> upDelList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getDriverUpDelList");
		return upDelList;
	}

	@Override
	public DriverDTO getDriverDTO(int driver_no) {
		DriverDTO driverDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getDriverDTO",driver_no);
		return driverDTO;
	}

	@Override
	public int getDriverUpCnt(DriverDTO driverDTO) {
		int driverUpCnt = this.sqlSession.update("com.support.movement.AdminDAO.getDriverUpCnt",driverDTO);
		return driverUpCnt;
	}

	@Override
	public int getDriverDelCnt(DriverDTO driverDTO) {
		int driverDelCnt = this.sqlSession.update("com.support.movement.AdminDAO.getDriverDelCnt",driverDTO);
		return driverDelCnt;
	}

	@Override
	public int getCarDriverDelCnt(DriverDTO driverDTO) {
		int carDriverDelCnt = this.sqlSession.update("com.support.movement.AdminDAO.getCarDriverDelCnt",driverDTO);
		return carDriverDelCnt;
	}

	@Override
	public int getUserRegCnt(UserDTO userDTO) {
		int userRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getUserRegCnt",userDTO);
		return userRegCnt;
	}

	@Override
	public int getUserUpDelListAllCnt() {
		int upDelListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getUserUpDelListAllCnt");
		return upDelListAllCnt;
	}

	@Override
	public List<Map<String, String>> getUserUpDelList() {
		List<Map<String, String>> upDelList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getUserUpDelList");
		return upDelList;
	}

	@Override
	public UserDTO getUserDTO(int user_no) {
		UserDTO userDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getUserDTO",user_no);
		return userDTO;
	}

	@Override
	public int getUserUpCnt(UserDTO userDTO) {
		int userUpCnt = this.sqlSession.update("com.support.movement.AdminDAO.getUserUpCnt",userDTO);
		return userUpCnt;
	}

	@Override
	public int getUserDelCnt(UserDTO userDTO) {
		int userDelCnt = this.sqlSession.update("com.support.movement.AdminDAO.getUserDelCnt",userDTO);
		return userDelCnt;
	}

	@Override
	public List<Map<String, String>> getDriverList() {
		List<Map<String, String>> driverList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getDriverList");
		return driverList;
	}

	@Override
	public int getCarRegCnt(CarDTO carDTO) {
		int carRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getCarRegCnt",carDTO);
		return carRegCnt;
	}
	
	@Override
	public int getCarListAllCnt() {
		int carListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getCarListAllCnt");
		return carListAllCnt;
	}
	
	@Override
	public List<Map<String, String>> getCarList() {
		List<Map<String, String>> carList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getCarList");
		return carList;
	}
	
	@Override
	public CarDTO getCarDTO(int car_info_no) {
		CarDTO carDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getCarDTO", car_info_no);
		return carDTO;
	}
	
	@Override
	public int getCarUpdateCnt(CarDTO carDTO) {
		int carUpdateCnt = this.sqlSession.update(
				"com.support.movement.AdminDAO.getCarUpdateCnt", carDTO);
		return carUpdateCnt;
	}
	
	@Override
	public int getCarDeleteCnt(int car_info_no) {
		int carDeleteCnt = this.sqlSession.delete(
				"com.support.movement.AdminDAO.getCarDeleteCnt", car_info_no);
		return carDeleteCnt;
	}
	@Override
	public int getCarMaintanceRegCnt(CarMaintanceDTO carMaintanceDTO) {
		int carMaintanceRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getCarMaintanceRegCnt",carMaintanceDTO);
		return carMaintanceRegCnt;
	}
	
	@Override
	public int getCarMaintanceListAllCnt() {
		int carMaintanceListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getCarMaintanceListAllCnt");
		return carMaintanceListAllCnt;
	}
	
	@Override
	public List<Map<String, String>> getCarMaintanceList() {
		List<Map<String, String>> carMaintanceList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getCarMaintanceList");
		return carMaintanceList;
	}
	@Override
	public CarMaintanceDTO getCarMaintanceDTO(int car_maintance_info_no) {
		CarMaintanceDTO carMaintanceDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getCarMaintanceDTO", car_maintance_info_no);
		return carMaintanceDTO;
	}
	

	@Override
	public int getCarMaintanceUpdateCnt(CarMaintanceDTO carMaintanceDTO) {
		int carMaintanceUpdateCnt = this.sqlSession.update(
				"com.support.movement.AdminDAO.getCarMaintanceUpdateCnt", carMaintanceDTO);
		return carMaintanceUpdateCnt;
	}
	
	@Override
	public int getCarMaintancDeleteCnt(int car_maintance_info_no) {
		int carMaintanceDeleteCnt = this.sqlSession.delete(
				"com.support.movement.AdminDAO.getCarMaintancDeleteCnt", car_maintance_info_no);
		return carMaintanceDeleteCnt;
	}
	
	
}
