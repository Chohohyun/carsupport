package com.support.movement;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	int getAcceptPermit(String id);

	int getAcceptListAllCnt(DriverSearchDTO driverSearchDTO);

	List<Map<String, String>> getAcceptList(DriverSearchDTO driverSearchDTO);

	int getAcceptDriverCnt(int driver_no);

	int getDriverRegCnt(DriverDTO driverDTO);

	int getDriverUpDelListAllCnt(DriverSearchDTO driverSearchDTO);

	List<Map<String, String>> getDriverUpDelList(DriverSearchDTO driverSearchDTO);

	DriverDTO getDriverDTO(int driver_no);

	int getDriverUpCnt(DriverDTO driverDTO);

	int getDriverDelCnt(DriverDTO driverDTO);

	int getCarDriverDelCnt(DriverDTO driverDTO);

	int getUserRegCnt(UserDTO userDTO);

	int getUserUpDelListAllCnt(UserSearchDTO userSearchDTO);

	List<Map<String, String>> getUserUpDelList(UserSearchDTO userSearchDTO);

	UserDTO getUserDTO(int user_no);

	int getUserUpCnt(UserDTO userDTO);

	int getUserDelCnt(UserDTO userDTO);

	List<Map<String, String>> getDriverList();

	int getCarRegCnt(CarDTO carDTO);

	int getCarListAllCnt(CarSearchDTO carSearchDTO);

	List<Map<String, String>> getCarList(CarSearchDTO carSearchDTO);
	
	CarDTO getCarDTO(int car_info_no);

	int getCarUpdateCnt(CarDTO carDTO);

	int getCarDeleteCnt(int car_info_no);

	int getCarMaintanceRegCnt(CarMaintanceDTO carMaintanceDTO);

	int getCarMaintanceListAllCnt(CarSearchDTO carSearchDTO);

	List<Map<String, String>> getCarMaintanceList(CarSearchDTO carSearchDTO);

	CarMaintanceDTO getCarMaintanceDTO(int car_maintance_info_no);

	int getCarMaintanceUpdateCnt(CarMaintanceDTO carMaintanceDTO);

	int getCarMaintancDeleteCnt(int car_maintance_info_no);

	List<Map<String, String>> getQnaList(int question_group_no);

	int insertQna(QnaDTO qnaDTO);

	QnaDTO getQnaDTO(int question_no);

	int getBoardCnt(QnaDTO qnaDTO);

	int updateQna(QnaDTO qnaDTO);

	int deleteQna(QnaDTO qnaDTO);

	int getAdminDiscontentListAllCnt(DiscontentSearchDTO discontentSearchDTO);

	List<Map<String, String>> getAdminDiscontentList(DiscontentSearchDTO discontentSearchDTO);

	int getReadcountUp(int adminDiscontent_no);

	DiscontentDTO getDiscontentDTO(int adminDiscontent_no);

	int updatePrint_no(DiscontentDTO discontentDTO);

	int insertAdminDiscontent(DiscontentDTO discontentDTO);

	int getDiscontentCnt(DiscontentDTO discontentDTO);

	int getDiscontentUpCnt(DiscontentDTO discontentDTO);

	int getDiscontentDelCnt(DiscontentDTO discontentDTO);

	int getGroupCnt(Map<String, String> paramsMap);

	int getCheckCarNumber(CarDTO carDTO);

}
