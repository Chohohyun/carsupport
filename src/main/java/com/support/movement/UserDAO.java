package com.support.movement;

import java.util.List;
import java.util.Map;

public interface UserDAO {

	int getReservationPossibleCnt(UserReservationDTO userReservationDTO);

	String getPossibleCarCnt(UserReservationDTO userReservationDTO);

	int getReservationCheck(UserReservationDTO userReservationDTO);

	String getUserNo(String userId);

	int getUserRevListAllCnt(String id);

	List<Map<String, String>> getUserRevList(String id);

}
