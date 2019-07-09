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
public class UserServiceImpl implements UserService{
	// 속성변수 loginDAO 선언하고, LoginDAO 라는 인터페이스를
	// 구현한 클래스를 객체화 하여 저장
	// **********************************************************
	// Autowired이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	// 이 인터페이를 구현한 클래스를 객체화하여 저장
	@Autowired
	private UserDAO userDAO;

	@Override
	public int getReservationCheck(UserReservationDTO userReservationDTO,String userId) {
		int reservationPossibleCnt = this.userDAO.getReservationPossibleCnt(userReservationDTO);
		String possibleCarCnt = this.userDAO.getPossibleCarCnt(userReservationDTO);
		if(Integer.parseInt(possibleCarCnt)>reservationPossibleCnt) {
			String user_no = this.userDAO.getUserNo(userId);
			userReservationDTO.setUser_no(user_no);
			userReservationDTO.setPossibleCarCnt(possibleCarCnt);
			int reservationCheckCnt = this.userDAO.getReservationCheck(userReservationDTO);
			return reservationCheckCnt;
		}
		else {
			return -2;
		}
	}

	@Override
	public int getUserRevListAllCnt(String id) {
		int userRevListAllCnt = this.userDAO.getUserRevListAllCnt(id);
		return userRevListAllCnt;
	}

	@Override
	public List<Map<String, String>> getUserRevList(String id) {
		List<Map<String, String>> userRevList = this.userDAO.getUserRevList(id);
		return userRevList;
	}

	@Override
	public int getUserUtilDetailListAllCnt(String id) {
		int userUtilDetailListAllCnt = this.userDAO.getUserUtilDetailListAllCnt(id);
		return userUtilDetailListAllCnt;
	}

	@Override
	public List<Map<String, String>> getUserUtilDetailList(String id) {
		List<Map<String, String>> userUtilDetailList = this.userDAO.getUserUtilDetailList(id);
		return userUtilDetailList;
	}

	@Override
	public UserDTO getUserDTO(String id) {
		UserDTO userDTO = this.userDAO.getUserDTO(id);
		return userDTO;
	}
	//*********************************************************
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	//*********************************************************
	public List<Map<String,String>> getDiscontentList(){
		List<Map<String,String>> discontentList = this.userDAO.getDiscontentList();
		return discontentList;
	}
	//*********************************************************
	// [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	//*********************************************************
	public int getDiscontentListAllCnt() {
		int discontentListAllCnt = this.userDAO.getDiscontentListAllCnt();
		return discontentListAllCnt;
	}

}
