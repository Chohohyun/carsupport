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
	public int getReservationPossibleCnt(UserReservationDTO userReservationDTO) {
		int reservationPossibleCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getReservationPossibleCnt",userReservationDTO);
		return reservationPossibleCnt;
	}

	@Override
	public String getPossibleCarCnt(UserReservationDTO userReservationDTO) {
		String possibleCarCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getPossibleCarCnt",userReservationDTO);
		return possibleCarCnt;
	}

	@Override
	public int getReservationCheck(UserReservationDTO userReservationDTO) {
		int reservationCheck = this.sqlSession.insert("com.support.movement.UserDAO.getReservationCheck",userReservationDTO);
		return reservationCheck;
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
	
	
	



}
