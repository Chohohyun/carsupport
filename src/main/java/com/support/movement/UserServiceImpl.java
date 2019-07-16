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
		int reservationAlreadyCnt = this.userDAO.getReservationAlreadyCnt(userReservationDTO);
		int CarCnt = this.userDAO.getPossibleCarCnt(userReservationDTO);
		int possibleCarCnt = CarCnt - reservationAlreadyCnt;
		System.out.println("여기까진 되자");
		if(possibleCarCnt > 0) {
			String user_no = this.userDAO.getUserNo(userId);
			System.out.println("여기까진 되자");
			userReservationDTO.setUser_no(user_no);
			System.out.println("여기까진 되자3");
			userReservationDTO.setPossibleCarCnt(possibleCarCnt);
			System.out.println("여기까진 되자4");
			// 예약 넣기
			int reservationCheckCnt = this.userDAO.getReservationCheck(userReservationDTO);
			System.out.println("여기까진 되자5");
			// 운전 가능한 driver 뽑아오기
			List<String> driverList = this.userDAO.getDriverList(userReservationDTO);
			System.out.println(driverList);
			System.out.println("여기까진 되자6");
			int driverAcceptListCnt = this.userDAO.getDriverAcceptList(driverList);
			System.out.println("여기까진 되자7");
			return driverAcceptListCnt;
		}
		else {
			return -2;
		}
	}

	@Override
	public int getUserRevListAllCnt(UserRevSearchDTO userRevSearchDTO) {
		int userRevListAllCnt = this.userDAO.getUserRevListAllCnt(userRevSearchDTO);
		return userRevListAllCnt;
	}

	@Override
	public List<Map<String, String>> getUserRevList(UserRevSearchDTO userRevSearchDTO) {
		List<Map<String, String>> userRevList = this.userDAO.getUserRevList(userRevSearchDTO);
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

	@Override
	public int insertDiscontent(DiscontentDTO discontentDTO) {
		System.out.println("service층까ㅏ진옴ㄴ");
		int insertDiscontentCnt = this.userDAO.insertDiscontent(discontentDTO);
		return insertDiscontentCnt;
	}

	@Override
	public DiscontentDTO getDiscontentDTO(int discontent_no) {
		int readcountUpCnt = this.userDAO.getReadcountUp(discontent_no);
		DiscontentDTO discontentDTO = this.userDAO.getDiscontentDTO(discontent_no);
		return discontentDTO;
	}

	@Override
	public int getDiscontentUpCnt(DiscontentDTO discontentDTO) {
		int deleteCnt = this.userDAO.getDiscontentCnt(discontentDTO);
		
		if(deleteCnt ==0) {
			return -1;
		}
		else {
			int discontentUpCnt = this.userDAO.getDiscontentUpCnt(discontentDTO);
			return discontentUpCnt;
		}
		
	}

	@Override
	public int getDiscontentDelCnt(DiscontentDTO discontentDTO) {
		int deleteCnt = this.userDAO.getDiscontentCnt(discontentDTO);
		if(deleteCnt ==0) {
			return -1;
		}
		else {
			int discontentDelCnt = this.userDAO.getDiscontentDelCnt(discontentDTO);
			return discontentDelCnt;
		}
	}

	@Override
	public int getCancelReservation(Map<String, String> paramsMap) {
		int cancelReserveCnt = this.userDAO.getCancelAcceptList(paramsMap);
		System.out.println("여긴되고");
		int cancelRevCnt = this.userDAO.getCancelReservation(paramsMap);
		System.out.println("여긴되고");
		
		return cancelRevCnt;
	}

	@Override
	public Map<String, String> getReserveInfo(int reserve_apply_car_number) {
		Map<String,String> map = this.userDAO.getReserveInfo(reserve_apply_car_number);
		return map;
	}

	@Override
	public int insertReview(ReviewDTO reviewDTO) {
		int reviewRegCnt = this.userDAO.getReviewRegCnt(reviewDTO);
		return reviewRegCnt;
	}

	@Override
	public ReviewDTO getReviewInfo(int reserve_apply_car_number) {
		ReviewDTO reviewDTO = this.userDAO.getReviewInfo(reserve_apply_car_number);
		return reviewDTO;
	}

	@Override
	public int getReviewUpCnt(ReviewDTO reviewDTO) {
		int reviewCnt = this.userDAO.getReviewCnt(reviewDTO);
		if(reviewCnt==0){
			return -1;
		}
		int reviewUpCnt = this.userDAO.getReviewUpCnt(reviewDTO);
		return reviewUpCnt;
	}

	@Override
	public int getReviewDelCnt(ReviewDTO reviewDTO) {
		int reviewCnt = this.userDAO.getReviewCnt(reviewDTO);
		if(reviewCnt==0){
			return -1;
		}
		int reviewDelCnt = this.userDAO.getReviewDelCnt(reviewDTO);
		return reviewDelCnt;
	}

	

}
