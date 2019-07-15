package com.support.movement;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


// Repository를 붙임으로써 DAO 클래스 임을 지정하게 되고, bean 태그로 자동 등록된다.
@Repository
public class AdminDAOImpl implements AdminDAO{

	// SqlSessionTemplate 객체를 생성해 속변 sqlSession 에 저장
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getAcceptPermit(String id) {
		int acceptPermit = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getAcceptPermit",id);
		return acceptPermit;
	}

	@Override
	public int getAcceptListAllCnt(DriverSearchDTO driverSearchDTO) {
		int acceptListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getAcceptListAllCnt",driverSearchDTO);
		return acceptListAllCnt;
	}

	@Override
	public List<Map<String, String>> getAcceptList(DriverSearchDTO driverSearchDTO) {
		List<Map<String, String>> acceptList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getAcceptList",driverSearchDTO);
		return acceptList;
	}

	@Override
	public int getAcceptDriverCnt(int driver_no) {
		System.out.println("dao층까지왔다"+driver_no);
		int acceptDriverCnt = this.sqlSession.update("com.support.movement.AdminDAO.getAcceptDriverCnt",driver_no);
		System.out.println("dao층 나갑니다.");
		return acceptDriverCnt;
	}

	@Override
	public int getDriverRegCnt(DriverDTO driverDTO) {
		int driverRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getDriverRegCnt",driverDTO);
		return driverRegCnt;
	}

	@Override
	public int getDriverUpDelListAllCnt(DriverSearchDTO driverSearchDTO) {
		int upDelListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getDriverUpDelListAllCnt",driverSearchDTO);
		return upDelListAllCnt;
	}

	@Override
	public List<Map<String, String>> getDriverUpDelList(DriverSearchDTO driverSearchDTO) {
		List<Map<String, String>> upDelList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getDriverUpDelList",driverSearchDTO);
		return upDelList;
	}

	@Override
	public DriverDTO getDriverDTO(int driver_no) {
		DriverDTO driverDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getDriverDTO",driver_no);
		return driverDTO;
	}

	@Override
	public int getDriverUpCnt(DriverDTO driverDTO) {
		int driverUpCnt = this.sqlSession.update("com.support.movement.AdminDAO.getDriverUpCnt",driverDTO);
		return driverUpCnt;
	}

	@Override
	public int getDriverDelCnt(DriverDTO driverDTO) {
		int driverDelCnt = this.sqlSession.update("com.support.movement.AdminDAO.getDriverDelCnt",driverDTO);
		return driverDelCnt;
	}

	@Override
	public int getCarDriverDelCnt(DriverDTO driverDTO) {
		int carDriverDelCnt = this.sqlSession.update("com.support.movement.AdminDAO.getCarDriverDelCnt",driverDTO);
		return carDriverDelCnt;
	}

	@Override
	public int getUserRegCnt(UserDTO userDTO) {
		int userRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getUserRegCnt",userDTO);
		return userRegCnt;
	}

	@Override
	public int getUserUpDelListAllCnt() {
		int upDelListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getUserUpDelListAllCnt");
		return upDelListAllCnt;
	}

	@Override
	public List<Map<String, String>> getUserUpDelList() {
		List<Map<String, String>> upDelList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getUserUpDelList");
		return upDelList;
	}

	@Override
	public UserDTO getUserDTO(int user_no) {
		UserDTO userDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getUserDTO",user_no);
		return userDTO;
	}

	@Override
	public int getUserUpCnt(UserDTO userDTO) {
		int userUpCnt = this.sqlSession.update("com.support.movement.AdminDAO.getUserUpCnt",userDTO);
		return userUpCnt;
	}

	@Override
	public int getUserDelCnt(UserDTO userDTO) {
		int userDelCnt = this.sqlSession.update("com.support.movement.AdminDAO.getUserDelCnt",userDTO);
		return userDelCnt;
	}

	@Override
	public List<Map<String, String>> getDriverList() {
		List<Map<String, String>> driverList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getDriverList");
		return driverList;
	}

	@Override
	public int getCarRegCnt(CarDTO carDTO) {
		int carRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getCarRegCnt",carDTO);
		return carRegCnt;
	}

	@Override
	public int getCarListAllCnt(CarSearchDTO carSearchDTO) {
		int carListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getCarListAllCnt",carSearchDTO);
		return carListAllCnt;
	}

	@Override
	public List<Map<String, String>> getCarList(CarSearchDTO carSearchDTO) {
		List<Map<String, String>> carList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getCarList",carSearchDTO);
		return carList;
	}

	@Override
	public CarDTO getCarDTO(int car_info_no) {
		CarDTO carDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getCarDTO", car_info_no);
		return carDTO;
	}

	@Override
	public int getCarUpdateCnt(CarDTO carDTO) {
		int carUpdateCnt = this.sqlSession.update(
				"com.support.movement.AdminDAO.getCarUpdateCnt", carDTO);
		return carUpdateCnt;
	}

	@Override
	public int getCarDeleteCnt(int car_info_no) {
		int carDeleteCnt = this.sqlSession.delete(
				"com.support.movement.AdminDAO.getCarDeleteCnt", car_info_no);
		return carDeleteCnt;
	}
	@Override
	public int getCarMaintanceRegCnt(CarMaintanceDTO carMaintanceDTO) {
		int carMaintanceRegCnt = this.sqlSession.insert(
				"com.support.movement.AdminDAO.getCarMaintanceRegCnt",carMaintanceDTO);
		return carMaintanceRegCnt;
	}

	@Override
	public int getCarMaintanceListAllCnt(CarSearchDTO carSearchDTO) {
		int carMaintanceListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getCarMaintanceListAllCnt",carSearchDTO);
		return carMaintanceListAllCnt;
	}

	@Override
	public List<Map<String, String>> getCarMaintanceList(CarSearchDTO carSearchDTO) {
		List<Map<String, String>> carMaintanceList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getCarMaintanceList",carSearchDTO);
		return carMaintanceList;
	}
	@Override
	public CarMaintanceDTO getCarMaintanceDTO(int car_maintance_info_no) {
		CarMaintanceDTO carMaintanceDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getCarMaintanceDTO", car_maintance_info_no);
		return carMaintanceDTO;
	}


	@Override
	public int getCarMaintanceUpdateCnt(CarMaintanceDTO carMaintanceDTO) {
		int carMaintanceUpdateCnt = this.sqlSession.update(
				"com.support.movement.AdminDAO.getCarMaintanceUpdateCnt", carMaintanceDTO);
		return carMaintanceUpdateCnt;
	}

	@Override
	public int getCarMaintancDeleteCnt(int car_maintance_info_no) {
		int carMaintanceDeleteCnt = this.sqlSession.delete(
				"com.support.movement.AdminDAO.getCarMaintancDeleteCnt", car_maintance_info_no);
		return carMaintanceDeleteCnt;
	}

	// QnA 게시판 목록을 가져오는 메소드
	@Override
	public List<Map<String, String>> getQnaList(int question_group_no) {
		List<Map<String,String>>  qnaList = sqlSession.selectList(
				"com.support.movement.AdminDAO.getQnaList",question_group_no
				);
		return qnaList;
	}


	// QnA 게시판 글 입력 후 성공여부를 숫자로 리턴하는 메소드
	@Override
	public int insertQna(QnaDTO qnaDTO) {

		int qnaRegCnt = sqlSession.insert(
				"com.support.movement.AdminDAO.insertQna" 
				, qnaDTO			
				);
		return qnaRegCnt;

	}

	@Override
	public QnaDTO getQnaDTO(int question_no) {
		
		QnaDTO qnaDTO = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getQnaDTO"
				, question_no);
		return qnaDTO;
	}

	@Override
	public int getBoardCnt(QnaDTO qnaDTO) {
		int boardCnt = sqlSession.selectOne(
				"com.support.movement.AdminDAO.getBoardCnt"  
				, qnaDTO
		);
		return boardCnt;
	}

	@Override
	public int updateQna(QnaDTO qnaDTO) {
		int updateCnt = sqlSession.update(
				"com.support.movement.AdminDAO.updateQna"  
				, qnaDTO
		);
	
		return updateCnt;
	}

	@Override
	public int deleteQna(QnaDTO qnaDTO) {
		int deleteCnt = sqlSession.delete(
				"com.support.movement.AdminDAO.deleteQna"  
				, qnaDTO
		);
	
		return deleteCnt;
	}

	@Override
	public int getAdminDiscontentListAllCnt() {
		int adminDiscontentListAllCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getAdminDiscontentListAllCnt"
				);
		return adminDiscontentListAllCnt;
	}

	@Override
	public List<Map<String, String>> getAdminDiscontentList() {
		List<Map<String,String>> adminDiscontentList = this.sqlSession.selectList(
				"com.support.movement.AdminDAO.getAdminDiscontentList"
				);
		return adminDiscontentList;
	}

	@Override
	public int getReadcountUp(int adminDiscontent_no) {
		int readcountUpCnt = this.sqlSession.update("com.support.movement.AdminDAO.getReadcountUp", adminDiscontent_no);
		return readcountUpCnt;
	}

	@Override
	public DiscontentDTO getDiscontentDTO(int adminDiscontent_no) {
		DiscontentDTO discontentDTO = this.sqlSession.selectOne("com.support.movement.AdminDAO.getDiscontentDTO", adminDiscontent_no);
		return discontentDTO;
	}

	@Override
	public int updatePrint_no(DiscontentDTO discontentDTO) {
		int updatePrint_noCnt = sqlSession.update(
				"com.support.movement.AdminDAO.updatePrint_no"  // 실행할 SQL 구문의 위치 지정
				, discontentDTO												// 실행할 SQL 구문에서 사용할 데이터 
		);
		
		return updatePrint_noCnt;
	}

	@Override
	public int insertAdminDiscontent(DiscontentDTO discontentDTO) {
		int DiscontentRegCnt = sqlSession.insert(
				"com.support.movement.AdminDAO.insertAdminDiscontent" 
				, discontentDTO			
		);
		return DiscontentRegCnt;
	}

	@Override
	public int getDiscontentCnt(DiscontentDTO discontentDTO) {
		int discontentCnt = this.sqlSession.selectOne(
				"com.support.movement.AdminDAO.getDiscontentCnt"
				, discontentDTO
				);
		return discontentCnt;
	}

	@Override
	public int getDiscontentUpCnt(DiscontentDTO discontentDTO) {
		int discontentUpCnt = this.sqlSession.update(
				"com.support.movement.AdminDAO.getDiscontentUpCnt"
				, discontentDTO
				);
		return discontentUpCnt;
	}

	@Override
	public int getDiscontentDelCnt(DiscontentDTO discontentDTO) {
		int discontentDelCnt = this.sqlSession.delete(
				"com.support.movement.AdminDAO.getDiscontentDelCnt"
				, discontentDTO
				);
		return discontentDelCnt;
	}

	@Override
	public int getGroupCnt(Map<String, String> paramsMap) {
		int groupCnt = this.sqlSession.selectOne("com.support.movement.AdminDAO.getGroupCnt",paramsMap);
		return groupCnt;
	}

	@Override
	public int getCheckCarNumber(CarDTO carDTO) {
		int checkCarNumber = this.sqlSession.selectOne("com.support.movement.AdminDAO.getCheckCarNumber",carDTO);
		return checkCarNumber;
	}


}
