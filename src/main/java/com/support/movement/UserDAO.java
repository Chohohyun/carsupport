package com.support.movement;

public interface UserDAO {

	int getReservationPossibleCnt(UserReservationDTO userReservationDTO);

	int getPossibleCarCnt(UserReservationDTO userReservationDTO);

}
