package com.support.movement;

import java.util.List;
import java.util.Map;

public interface UserService {

	int getReservationCheck(UserReservationDTO userReservationDTO,String userId);

	int getUserRevListAllCnt(String id);

	List<Map<String, String>> getUserRevList(String id);

}
