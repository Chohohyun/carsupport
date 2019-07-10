package com.support.movement;

import java.util.List;
import java.util.Map;

public interface UserDAO {

	int getReservationAlreadyCnt(UserReservationDTO userReservationDTO);

	int getPossibleCarCnt(UserReservationDTO userReservationDTO);

	int getReservationCheck(UserReservationDTO userReservationDTO);

	String getUserNo(String userId);

	int getUserRevListAllCnt(String id);

	List<Map<String, String>> getUserRevList(String id);

	int getUserUtilDetailListAllCnt(String id);

	List<Map<String, String>> getUserUtilDetailList(String id);

	UserDTO getUserDTO(String id);

	List<Map<String, String>> getDiscontentList();

	int getDiscontentListAllCnt();

	int insertDiscontent(DiscontentDTO discontentDTO);

	DiscontentDTO getDiscontentDTO(int discontent_no);

	int getReadcountUp(int discontent_no);

	int getDiscontentCnt(DiscontentDTO discontentDTO);

	int getDiscontentDelCnt(DiscontentDTO discontentDTO);

	int getDiscontentUpCnt(DiscontentDTO discontentDTO);

	int getDriverAcceptList(List<String> driverList);


	List<String> getDriverList(UserReservationDTO userReservationDTO);


}
