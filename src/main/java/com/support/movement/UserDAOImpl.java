package com.support.movement;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


// Repository를 붙임으로써 DAO 클래스 임을 지정하게 되고, bean 태그로 자동 등록된다.
@Repository
public class UserDAOImpl implements UserDAO{

	// SqlSessionTemplate 객체를 생성해 속변 sqlSession 에 저장
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getReservationAlreadyCnt(UserReservationDTO userReservationDTO) {
		int reservationAlreadyCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getReservationAlreadyCnt",userReservationDTO);
		return reservationAlreadyCnt;
	}

	@Override
	public int getPossibleCarCnt(UserReservationDTO userReservationDTO) {
		int possibleCarCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getPossibleCarCnt",userReservationDTO);
		return possibleCarCnt;
	}

	@Override
	public int getReservationCheck(UserReservationDTO userReservationDTO) {
		int reservationCheck = this.sqlSession.insert("com.support.movement.UserDAO.getReservationCheck",userReservationDTO);
		return reservationCheck;
	}

	@Override
	public List<String> getDriverList(UserReservationDTO userReservationDTO) {
		List<String> driverList = this.sqlSession.selectList("com.support.movement.UserDAO.getDriverList",userReservationDTO);
		return driverList;
	}

	@Override
	public int getDriverAcceptList(List<String> driverList) {
		int driverAcceptList = this.sqlSession.insert("com.support.movement.UserDAO.getDriverAcceptList",driverList);
		return driverAcceptList;
	}


	@Override
	public String getUserNo(String userId) {
		String userNo = this.sqlSession.selectOne("com.support.movement.UserDAO.getUserNo",userId);
		return userNo;
	}

	@Override
	public int getUserRevListAllCnt(String id) {
		int userRevListAllCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getUserRevListAllCnt",id);
		return userRevListAllCnt;
	}
	
	@Override
	public List<Map<String, String>> getUserRevList(String id) {
		List<Map<String, String>> userRevList = this.sqlSession.selectList("com.support.movement.UserDAO.getUserRevList",id);
		System.out.println("여기까진 잘 실행했다는 뜻?");
		return userRevList;
	}

	@Override
	public int getUserUtilDetailListAllCnt(String id) {
		int userUtilDetailListAllCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getUserUtilDetailListAllCnt",id);
		return userUtilDetailListAllCnt;
	}

	@Override
	public List<Map<String, String>> getUserUtilDetailList(String id) {
		List<Map<String, String>> userUtilDetailList = this.sqlSession.selectList("com.support.movement.UserDAO.getUserUtilDetailList",id);
		System.out.println("여기까진 잘 실행했다는 뜻?");
		return userUtilDetailList;
	}

	@Override
	public UserDTO getUserDTO(String id) {
		UserDTO userDTO = this.sqlSession.selectOne("com.support.movement.UserDAO.getUserDTO",id);
		return userDTO;
	}

	//*********************************************************
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	//*********************************************************
	public List<Map<String,String>> getDiscontentList(){
		List<Map<String,String>> discontentList = this.sqlSession.selectList(
				"com.support.movement.UserDAO.getDiscontentList");
		return discontentList;
	}
	//*********************************************************
	// [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	//*********************************************************
	public int getDiscontentListAllCnt(){
		int discontentListAllCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getDiscontentListAllCnt");
		return discontentListAllCnt;
	}

	@Override
	public int insertDiscontent(DiscontentDTO discontentDTO) {
		System.out.println("여기까ㅣㄴ된다.");
		int insertDiscontentCnt = this.sqlSession.insert("com.support.movement.UserDAO.insertDiscontent",discontentDTO);
		System.out.println("여기까ㅣㄴ된다.");
		return insertDiscontentCnt;
	}

	@Override
	public DiscontentDTO getDiscontentDTO(int discontent_no) {
		DiscontentDTO discontentDTO = this.sqlSession.selectOne("com.support.movement.UserDAO.getDiscontentDTO",discontent_no);
		return discontentDTO;
	}
	// 상세보기 들어가면 조회수 증가해버리기
	@Override
	public int getReadcountUp(int discontent_no) {
		int readcountUpCnt = this.sqlSession.update("com.support.movement.UserDAO.getReadcountUp",discontent_no);
		return readcountUpCnt;
	}

	@Override
	public int getDiscontentCnt(DiscontentDTO discontentDTO) {
		int discontentCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getDiscontentCnt",discontentDTO);
		return discontentCnt;
	}

	@Override
	public int getDiscontentDelCnt(DiscontentDTO discontentDTO) {
		int discontentDelCnt = this.sqlSession.delete("com.support.movement.UserDAO.getDiscontentDelCnt",discontentDTO);
		return discontentDelCnt;
	}

	@Override
	public int getDiscontentUpCnt(DiscontentDTO discontentDTO) {
		int discontentUpCnt = this.sqlSession.update("com.support.movement.UserDAO.getDiscontentUpCnt",discontentDTO);
		return discontentUpCnt;
	}


	@Override
	public int getCancelReservation(Map<String, String> paramsMap) {
		int cancelRevCnt = this.sqlSession.update("com.support.movement.UserDAO.getCancelReservation",paramsMap);
		return cancelRevCnt;
	}

	@Override
	public int getCancelAcceptList(Map<String, String> paramsMap) {
		int cancelReservationCnt = this.sqlSession.update("com.support.movement.UserDAO.getCancelAcceptList",paramsMap);
		return cancelReservationCnt;
	}

	@Override
	public Map<String, String> getReserveInfo(int reserve_apply_car_number) {
		Map<String,String> map = this.sqlSession.selectOne("com.support.movement.UserDAO.getReserveInfo",reserve_apply_car_number);
		return map;
	}


}
