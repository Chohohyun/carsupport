package com.support.movement;

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
public class LoginServiceImpl implements LoginService{
	// 속성변수 loginDAO 선언하고, LoginDAO 라는 인터페이스를
	// 구현한 클래스를 객체화 하여 저장
	// **********************************************************
	// Autowired이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	// 이 인터페이를 구현한 클래스를 객체화하여 저장
	@Autowired
	private LoginDAO loginDAO;
	
	public int getAdminCnt(Map<String,String> admin_id_pwd) {
		int adminIdCnt = this.loginDAO.getAdminIdCnt(admin_id_pwd);
		if(adminIdCnt==1) {

			int adminCnt = this.loginDAO.getAdminCnt(admin_id_pwd);
			if(adminCnt==1) {
				return 1;
			}
			else {
				return 2;
			}
		}
		System.out.println("여기까진간다.?");
		int userIdCnt =  this.loginDAO.getUserIdCnt(admin_id_pwd);
		if(userIdCnt==1) {
			int userCnt = this.loginDAO.getUserCnt(admin_id_pwd);
			if(userCnt==1) {
				int userStatusCnt = this.loginDAO.getUserStatusCnt(admin_id_pwd);
				if(userStatusCnt==1) {
					return 3;
				}
				else {
					return -2;
				}
			}
			else {
				return 4;
			}
		}

		int driverIdCnt =  this.loginDAO.getDriverIdCnt(admin_id_pwd);
		if(driverIdCnt==1) {
			int driverCnt = this.loginDAO.getDriverCnt(admin_id_pwd);
			if(driverCnt==1) {
				int driverStatusCnt = this.loginDAO.getDriverStatusCnt(admin_id_pwd);
				if(driverStatusCnt==1) {
					return 5;
				}
				else {
					return -2;
				}
			}
			else {
				return 6;
			}
		}
		
		return 0;
	}

	@Override
	public int getUserRegCnt(UserDTO userDTO) {
		int userRegCnt = this.loginDAO.getUesrRegCnt(userDTO);
		return userRegCnt;
	}
	

	@Override
	public int getDriverRegCnt(DriverDTO driverDTO) {
		int driverRegCnt = this.loginDAO.getDriverRegCnt(driverDTO);
		return driverRegCnt;
	}

	@Override
	public String getId(Map<String, String> paramsMap) {
		int userCnt = this.loginDAO.findUserCnt(paramsMap);
		if(userCnt==1) {
			System.out.println("잘넘어가네");
			String id = this.loginDAO.findUserId(paramsMap);
			System.out.println(id+"일로옴");
			return id;
		}
		else {
			int driverCnt = this.loginDAO.findDriverCnt(paramsMap);
			if(driverCnt==1) {

				String id = this.loginDAO.findDriverId(paramsMap);
				
				return id;
			}

		}
		return null;
	}

	@Override
	public int getPwdInfoChk(Map<String, String> paramsMap) {
		int userPwdCnk = this.loginDAO.findUserPwdChk(paramsMap);
		if(userPwdCnk==1) {
			int userRandomPwd = this.loginDAO.insertRandomPwdUser(paramsMap);
			return userRandomPwd;
		}
		else {
			int driverPwdChk = this.loginDAO.findDriverPwdChk(paramsMap);
			if(driverPwdChk==1) {
				int driverRandomPwd = this.loginDAO.insertRandomPwdDriver(paramsMap);
				return driverRandomPwd;
			}
		}
		return 0;
	}

	@Override
	public int sendEmailCheck(Map<String, String> paramsMap) {
		int checkEmail = this.loginDAO.getCheckEmail(paramsMap);
		if(checkEmail==0) {
			int sendEmailChk = this.loginDAO.insertSendEmail(paramsMap);
			return sendEmailChk;
			
		}
		else {
			int sendEmailUp = this.loginDAO.updateSendEmail(paramsMap);
			return sendEmailUp;
		}
	}

	@Override
	public int emailAuthCheck(Map<String, String> paramsMap) {
		int emailAuthCheck = this.loginDAO.emailAuthCheck(paramsMap);
		return emailAuthCheck;
	}

	@Override
	public int getIdChk(Map<String, String> paramsMap) {
		int adminInChk = this.loginDAO.checkAdminId(paramsMap);
		if(adminInChk==0) {
			int userIdChk = this.loginDAO.checkUserId(paramsMap);
			if(userIdChk==0) {
				int driverIdChk = this.loginDAO.checkDriverId(paramsMap);
				if(driverIdChk==0) {
					return 0;
				}
				else {
					return 1;
				}
				
			}
			else {
				return 1;
			}
		}
		else {
			return 1;
		}
	}

}
