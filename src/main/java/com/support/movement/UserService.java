package com.support.movement;

import java.util.List;
import java.util.Map;

public interface UserService {

	int getReservationCheck(UserReservationDTO userReservationDTO,String userId);

	int getUserRevListAllCnt(UserRevSearchDTO userRevSearchDTO);

	List<Map<String, String>> getUserRevList(UserRevSearchDTO userRevSearchDTO);

	int getUserUtilDetailListAllCnt(String id);

	List<Map<String, String>> getUserUtilDetailList(String id);

	UserDTO getUserDTO(String id);

	int getDiscontentListAllCnt();

	List<Map<String, String>> getDiscontentList();

	int insertDiscontent(DiscontentDTO discontentDTO);

	DiscontentDTO getDiscontentDTO(int discontent_no);

	int getDiscontentUpCnt(DiscontentDTO discontentDTO);

	int getDiscontentDelCnt(DiscontentDTO discontentDTO);

	int getCancelReservation(Map<String, String> paramsMap);

	Map<String, String> getReserveInfo(int reserve_apply_car_number);

	int insertReview(ReviewDTO reviewDTO);

	ReviewDTO getReviewInfo(int reserve_apply_car_number);

	int getReviewUpCnt(ReviewDTO reviewDTO);

	int getReviewDelCnt(ReviewDTO reviewDTO);

}
