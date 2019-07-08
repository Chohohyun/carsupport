package com.support.movement;

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
	public int getPossibleCarCnt(UserReservationDTO userReservationDTO) {
		int possibleCarCnt = this.sqlSession.selectOne("com.support.movement.UserDAO.getPossibleCarCnt",userReservationDTO);
		return possibleCarCnt;
	}
	



}
