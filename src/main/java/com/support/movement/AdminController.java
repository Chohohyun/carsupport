package com.support.movement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

// 깃허브 테스트합니다.
// 기섷브 테스트 2

// 깃 허브테스트343332432432141234
// 가상 URL 주소로 접속하면 호출되는 메소드를 소유한 컨트롤러 클래스 선언
// @Controller 를 붙임으로써 컨트롤러 클래스임을 지정한다.
@Controller
public class AdminController {
	// 속성변수 loginService 선언하고, LoginService라는 인터페이스를 구현한 클래스를 객체화하여 저장
	// *****************************************************
	// @Autowired 이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	//  이 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	// LoginService라는 인터페이스를 구현한 클래스의 이름을 몰라도 관계없다. 1개 존재하기만 하면 된다.

	@Autowired
	private AdminService adminService;





	// 가상주소 /erp/loginForm.do로 접속하면 호출되는 메소드 선언
	@RequestMapping(value="/adminMainPage.do")
	public ModelAndView adminMain(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMainPage.jsp");
		return mav;
	}

	// 가상주소 /support/driverRegForm.do로 접속하면 호출되는 메소드 선언
	@RequestMapping(value="/driverRegForm.do")
	public ModelAndView driverReg(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("driverRegForm.jsp");
		return mav;
	}

	// 가상주소 /erp/loginForm.do로 접속하면 호출되는 메소드 선언
	@RequestMapping(value="/driverAcceptForm.do")
	public ModelAndView driverAccept(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("driverAcceptForm.jsp");
		List<Map<String,String>> acceptList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");


			int acceptListAllCnt = this.adminService.getAcceptListAllCnt(id);
			System.out.println(acceptListAllCnt);
			if(acceptListAllCnt!=0) {
				acceptList= this.adminService.getAcceptList(id);
			}
			mav.addObject("acceptListAllCnt",acceptListAllCnt);
			mav.addObject("acceptList",acceptList);

		}catch (Exception e) {
			System.out.println("drivetAcceptForm을 불러오는 도중 오류");
		}
		return mav;
	}
	// 가상주소 /erp/driverUpDelForm.do로 접속하면 호출되는 메소드 선언
	@RequestMapping(value="/driverUpDelForm.do")
	public ModelAndView driverUpDel(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("driverUpDelForm.jsp");
		List<Map<String,String>> upDelList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");


			int upDelListAllCnt = this.adminService.getDriverUpDelListAllCnt(id);
			System.out.println(upDelListAllCnt);
			if(upDelListAllCnt!=0) {
				upDelList= this.adminService.getDriverUpDelList(id);
			}
			mav.addObject("upDelListAllCnt",upDelListAllCnt);
			mav.addObject("upDelList",upDelList);

		}catch (Exception e) {
			System.out.println("drivetAcceptForm을 불러오는 도중 오류");
		}
		return mav;
	}

	@RequestMapping(value="/driverUpDelDetailForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView driverUpDelDetail( 
			@RequestParam(value="driver_no") int driver_no, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("driverUpDelDetailForm.jsp"); 
		try { 

			System.out.println("driverDTO 아주 잘옴");
			DriverDTO driverDTO = this.adminService.getDriverDTO(driver_no); 
			mav.addObject("driverDTO",driverDTO); 
			System.out.println("driverDTO 아주 잘옴");
		}catch(Exception e){ 
			System.out.println("BoardController.goBoardContentForm(~) 메소드 예외 발생"); 
		} 
		return mav; 
	} 

	
	@RequestMapping(value="/userUpDelDetailForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView userUpDelDetail( 
			@RequestParam(value="user_no") int user_no, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("userUpDelDetailForm.jsp"); 
		try { 

			System.out.println("userDTO 아주 잘옴");
			UserDTO userDTO = this.adminService.getUserDTO(user_no); 
			mav.addObject("userDTO",userDTO); 
			System.out.println("userDTO 아주 잘옴");
		}catch(Exception e){ 
			System.out.println("BoardController.goBoardContentForm(~) 메소드 예외 발생"); 
		} 
		return mav; 
	} 
	//**********************************
	// 운전자 승인 작업
	//**********************************
	@RequestMapping(
			value="/acceptDriver.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public int driverRegProc(
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,String> paramsMap
			) {

		int acceptDriverCnt=0;
		String driver_noS = paramsMap.get("driver_no");
		int driver_no = Integer.parseInt(driver_noS);
		System.out.println("여기서 dirver_id값은"+driver_no);
		System.out.println(driver_no);
		try {

			acceptDriverCnt = this.adminService.getAcceptDriverCnt(driver_no);
			System.out.println("드라이버 됩니다");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(".acceptDriver(~) 에서 에러 발생");
			acceptDriverCnt=-1;
		} 
		return acceptDriverCnt;
	}
	//**********************************
	// 운전자 가입 (재영 작업)
	//**********************************
	@RequestMapping(
			value="/adminDriverRegForm.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)

	@ResponseBody 
	public int driverRegProc(
			HttpSession session,HttpServletResponse response,
			DriverDTO driverDTO
			) {

		int driverRegCnt=0;
		System.out.println(driverDTO.getAdmission_code());
		System.out.println("여기까진 가는건가?");
		try {
			session.removeAttribute("uri");

			driverRegCnt = this.adminService.getDriverRegCnt(driverDTO);
			System.out.println("드라이버 됩니다");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
			driverRegCnt=-1;
		} 
		return driverRegCnt;
	}

	//**********************************
	// 운전자 수정 삭제
	//**********************************
	@RequestMapping(
			value="/adminDrvierUpDelProc.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public int driverUpDelProc(
			HttpSession session,HttpServletResponse response,
			DriverDTO driverDTO,
			@RequestParam(value="upDel") String upDel
			) {

		int driverUpDelCnt=0;
		try {
			System.out.println(upDel);
			if(upDel.equals("up")) {
				driverUpDelCnt = this.adminService.getDriverUpCnt(driverDTO);
			}
			else {
				driverUpDelCnt = this.adminService.getDriverDelCnt(driverDTO);
			}
			System.out.println("드라이버 됩니다");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
			driverUpDelCnt=-1;
		} 
		return driverUpDelCnt;
	}
	// 가상주소 /support/userRegForm.do로 접속하면 호출되는 메소드 선언
	@RequestMapping(value="/userRegForm.do")
	public ModelAndView userReg(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userRegForm.jsp");
		return mav;
	}

	//**********************************
	// 유저
	//**********************************
	@RequestMapping(
			value="/adminUserRegForm.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)

	@ResponseBody 
	public int driverRegProc(
			HttpSession session,HttpServletResponse response,
			UserDTO userDTO
			) {

		int driverRegCnt=0;

		System.out.println("여기까진 가는건가?");
		try {
			session.removeAttribute("uri");

			driverRegCnt = this.adminService.getUserRegCnt(userDTO);
			System.out.println("드라이버 됩니다");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
			driverRegCnt=-1;
		} 
		return driverRegCnt;
	}
	// 가상주소 /erp/userUpDelForm.do로 접속하면 호출되는 메소드 선언
	@RequestMapping(value="/userUpDelForm.do")
	public ModelAndView userUpDel(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userUpDelForm.jsp");
		List<Map<String,String>> upDelList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");


			int upDelListAllCnt = this.adminService.getUserUpDelListAllCnt(id);
			System.out.println(upDelListAllCnt);
			if(upDelListAllCnt!=0) {
				upDelList= this.adminService.getUserUpDelList(id);
			}
			mav.addObject("upDelListAllCnt",upDelListAllCnt);
			mav.addObject("upDelList",upDelList);

		}catch (Exception e) {
			System.out.println("drivetAcceptForm을 불러오는 도중 오류");
		}
		return mav;
	}
	
	//**********************************
		// 유저 수정 삭제
		//**********************************
		@RequestMapping(
				value="/adminUserUpDelProc.do",
				method = RequestMethod.POST,produces="application/json;charset=UTF-8"
				)
		@ResponseBody 
		public int userUpDelProc(
				HttpSession session,HttpServletResponse response,
				UserDTO userDTO,
				@RequestParam(value="upDel") String upDel
				) {

			int userUpDelCnt=0;
			try {
				System.out.println(upDel);
				if(upDel.equals("up")) {
					userUpDelCnt = this.adminService.getUserUpCnt(userDTO);
				}
				else {
					userUpDelCnt = this.adminService.getUserDelCnt(userDTO);
				}
				System.out.println("드라이버 됩니다");

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
				userUpDelCnt=-1;
			} 
			return userUpDelCnt;
		}
		

}
