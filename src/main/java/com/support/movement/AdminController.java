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





	//**********************************
	// 관리자가 로그인하면 이동하는 페이지
	//**********************************
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
	@RequestMapping(value="/driverRegForm2.do")
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
	@RequestMapping(
			value="/driverAcceptForm.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView driverAccept(
			HttpSession session, HttpServletResponse response,
			DriverSearchDTO driverSearchDTO
			){
		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		System.out.println(1);
		mav.setViewName("driverAcceptForm.jsp");
		List<Map<String,String>> acceptList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");
			if(driverSearchDTO.getSelectPageNo()==0) {
				driverSearchDTO.setSelectPageNo(1);
			}
			System.out.println(2);

			int acceptListAllCnt = this.adminService.getAcceptListAllCnt(id,driverSearchDTO);

			System.out.println(3);
			System.out.println(acceptListAllCnt);

			System.out.println(4);
			if(acceptListAllCnt!=0) {

				System.out.println(5);
				acceptList= this.adminService.getAcceptList(id,driverSearchDTO);

				System.out.println(6);
			}
			mav.addObject("driverSearchDTO",driverSearchDTO);
			mav.addObject("acceptListAllCnt",acceptListAllCnt);
			mav.addObject("acceptList",acceptList);

		}catch (Exception e) {
			System.out.println("drivetAcceptForm을 불러오는 도중 오류");
		}
		return mav;
	}




	//**********************************
	// 운전자 수정 및 삭제를 위해 운전자 목록을 불러오는 페이지
	//**********************************
	@RequestMapping(
			value="/driverUpDelForm.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView driverUpDel(
			HttpSession session, HttpServletResponse response,
			DriverSearchDTO driverSearchDTO
			){
		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("driverUpDelForm.jsp");
		List<Map<String,String>> upDelList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");
			if(driverSearchDTO.getSelectPageNo()==0) {
				driverSearchDTO.setSelectPageNo(1);
			}
			System.out.println("여기?");
			int upDelListAllCnt = this.adminService.getDriverUpDelListAllCnt(id,driverSearchDTO);
			System.out.println(upDelListAllCnt);
			if(upDelListAllCnt!=0) {
				upDelList= this.adminService.getDriverUpDelList(id,driverSearchDTO);
			}
			mav.addObject("driverSearchDTO",driverSearchDTO);
			mav.addObject("upDelListAllCnt",upDelListAllCnt);
			mav.addObject("upDelList",upDelList);

		}catch (Exception e) {
			System.out.println("drivetAcceptForm을 불러오는 도중 오류");
		}
		return mav;
	}



	//**********************************
	// 운전자 목록에서 한명의 운전자를 수정하기 위해 상세보기로 이동
	//**********************************
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


	//**********************************
	// 유저 목록에서 한명의 유저를 수정하기 위해 상세보기로 이동
	//**********************************
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
	// 운전자 가입
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
	// 운전자 수정 삭제 시도 
	//**********************************
	@RequestMapping(
			value="/adminDriverUpDelProc.do",
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


	//**********************************
	// 유저 회원가입 시키기 관리자용
	//**********************************
	@RequestMapping(value="/userRegForm2.do")
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
	// 유저 등록 시키기 눌렀을 때
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


	//**********************************
	// 유저 수정 삭제를 위해 상세보기로 이동
	//**********************************
	@RequestMapping(
			value="/userUpDelForm.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView userUpDel(
			HttpSession session, HttpServletResponse response,
			UserSearchDTO userSearchDTO
			){
		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userUpDelForm.jsp");
		List<Map<String,String>> upDelList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");
			if(userSearchDTO.getSelectPageNo()==0) {
				userSearchDTO.setSelectPageNo(1);
			}

			int upDelListAllCnt = this.adminService.getUserUpDelListAllCnt(id,userSearchDTO);
			System.out.println(upDelListAllCnt);
			if(upDelListAllCnt!=0) {
				upDelList= this.adminService.getUserUpDelList(id,userSearchDTO);
			}
			mav.addObject("userSearchDTO",userSearchDTO);
			mav.addObject("upDelListAllCnt",upDelListAllCnt);
			mav.addObject("upDelList",upDelList);

		}catch (Exception e) {
			System.out.println("userUpDel을 불러오는 도중 오류");
		}
		return mav;
	}

	//**********************************
	// 유저 수정 삭제 시도
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



	/* 차량관리 */

	//***************************************************
	// 차량 등록 UI 이동
	//***************************************************
	@RequestMapping(value="/adminCarRegForm.do")
	public ModelAndView adminCarRegForm( HttpSession session ) {
		System.out.println("차량등록페이지");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminCarRegForm.jsp");
		return mav;
	}

	//----------------------
	// 운전자 리스트 (SelectBox용도)
	//----------------------
	@RequestMapping(
			value="/driverList.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public List<Map<String,String>> dirverList(){
		List<Map<String,String>> driverlist = this.adminService.getDriverList();	
		System.out.println(driverlist+"llllll");
		return driverlist;

	}

	//-----------------------
	//차량 등록 진행 (DB INSERT)
	//-----------------------
	@RequestMapping(
			value="/adminCarRegProc.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public int carRegProc(
			HttpSession session, HttpServletResponse response,
			CarDTO carDTO
			){
		int carRegCnt = 0;
		try {
			if(carDTO.getCar_driver()==null) {
				carDTO.setCar_driver("0");
			}
			carRegCnt = this.adminService.getCarRegCnt(carDTO);
		} catch (Exception e) {
			System.out.println("carRegProc을 불러오는 도중 오류");
		}
		return carRegCnt;
	}

	//***************************************************
	//차량 수정/삭제 리스트 UI 이동 (리스트와 리스트수량)
	//***************************************************
	@RequestMapping(
			value="/adminCarUpDelForm.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView adminCarUpDelForm(
			HttpSession session, HttpServletResponse response,
			CarSearchDTO carSearchDTO
			){
		System.out.println("차량리스트페이지");
		ModelAndView mav = new ModelAndView();
		int carListAllCnt = 0;
		List<Map<String,String>> carList = new ArrayList<Map<String,String>>();
		try {
			if(carSearchDTO.getSelectPageNo()==0) {
				carSearchDTO.setSelectPageNo(1);
			}
			carListAllCnt = this.adminService.getCarListAllCnt(carSearchDTO);
			if(carListAllCnt!=0) {
				carList= this.adminService.getCarList(carSearchDTO);
			}

		} catch (Exception e) {
			System.out.println("adminCarUpDelForm을 불러오는 도중 오류");
		}
		mav.setViewName("adminCarUpDelForm.jsp");
		mav.addObject("carSearchDTO",carSearchDTO);
		mav.addObject("carListAllCnt", carListAllCnt);
		mav.addObject("carList", carList);
		return mav;
	}
	//***************************************************
	//차량 정보 상세보기 UI 이동 (차 고유넘버)
	//***************************************************
	@RequestMapping(value="/carContent.do")
	public ModelAndView adminCarUpDelDetailForm( 
			HttpSession session
			, @RequestParam(value="car_info_no") int car_info_no
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminCarUpDelDetailForm.jsp");
		CarDTO carDTO = this.adminService.getCarDTO(car_info_no); 
		mav.addObject("carDTO", carDTO);
		System.out.println(carDTO.getCar_code());
		System.out.println(carDTO.getCar_distance());
		System.out.println(carDTO.getCar_info_no());
		System.out.println(carDTO.getCar_driver());
		System.out.println(carDTO.getCar_number());
		System.out.println(carDTO.getCar_year());
		System.out.println(carDTO.getDriver_no());
		return mav;
	}

	//***************************************************
	//차량 정보 업데이트 (차 고유넘버)
	//***************************************************
	@RequestMapping(
			value="/carUpdateProc.do"
			, method = RequestMethod.POST,produces="application/json;charset=UTF-8"

			) 
	@ResponseBody 
	public int carUpdateProc(			
			HttpSession session
			,CarDTO carDTO)
	{
		int carUpdateCnt =0;
		try {
			carUpdateCnt = this.adminService.getCarUpdateCnt(carDTO); 
		} catch (Exception e) {
			System.out.println("adminCarDeleteCnt을 불러오는 도중 오류");
		}

		return carUpdateCnt;
	}

	//***************************************************
	//차량 정보 삭제  (차 고유넘버)
	//***************************************************
	@RequestMapping(
			value="/carDeleteProc.do"
			, method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)	
	@ResponseBody 
	public int carDeleteProc( 
			HttpSession session
			, @RequestParam(value="car_info_no") int car_info_no
			) 
	{
		int carDeleteCnt =0;
		try {
			carDeleteCnt = this.adminService.getCarDeleteCnt(car_info_no); 
		} catch (Exception e) {
			System.out.println("adminCarDeleteCnt을 불러오는 도중 오류");
		}

		return carDeleteCnt;
	}

	//***************************************************
	// 차량 정보 UI 이동
	//***************************************************
	@RequestMapping(value="/carListInfoForm.do"	,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView carListInfoForm(
			HttpSession session, HttpServletResponse response,
			CarSearchDTO carSearchDTO
			){
		System.out.println("차량정보페이지");
		ModelAndView mav = new ModelAndView();
		System.out.println(carSearchDTO);
		int carListAllCnt = 0;
		List<Map<String,String>> carList = new ArrayList<Map<String,String>>();
		try {
			if(carSearchDTO.getSelectPageNo()==0) {
				carSearchDTO.setSelectPageNo(1);
			}
			carListAllCnt = this.adminService.getCarListAllCnt(carSearchDTO);
			if(carListAllCnt!=0) {
				carList= this.adminService.getCarList(carSearchDTO);
			}

		} catch (Exception e) {
			System.out.println("carListInfoForm을 불러오는 도중 오류");
		}
		mav.setViewName("carListInfoForm.jsp");
		mav.addObject("carList", carList);
		mav.addObject("carListAllCnt", carListAllCnt);
		System.out.println("차정보리스트완?");
		return mav;
	}

	//***************************************************
	// 차량 정비 등록 UI 이동
	//***************************************************
	@RequestMapping(value="/carMaintenanceRegForm.do")
	public ModelAndView carMaintenanceRegForm( 
			HttpSession session 
			, @RequestParam(value="car_info_no") int car_info_no
			) {
		System.out.println("차량정비등록페이지");
		ModelAndView mav = new ModelAndView();
		CarDTO carDTO = this.adminService.getCarDTO(car_info_no); 

		mav.addObject("carDTO", carDTO);
		mav.setViewName("carMaintenanceRegForm.jsp");
		return mav;
	}


	//-----------------------
	//차량 정비 내용 등록 진행 (DB INSERT)
	//-----------------------
	@RequestMapping(
			value="/carMaintanceRegProc.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public int carMaintanceRegProc(
			HttpSession session, HttpServletResponse response,
			CarMaintanceDTO carMaintanceDTO
			){
		int carMaintanceRegCnt = 0;
		try {
			carMaintanceRegCnt = this.adminService.getCarMaintanceRegCnt(carMaintanceDTO);
		} catch (Exception e) {
			System.out.println("carRegProc을 불러오는 도중 오류");
		}
		return carMaintanceRegCnt;
	}

	//***************************************************
	// 차량 정비 수정/삭제 리스트 UI 이동
	//***************************************************
	@RequestMapping(
			value="/carMaintanceListForm.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView carMaintananceList(
			HttpSession session, HttpServletResponse response,
			CarSearchDTO carSearchDTO
			){

		System.out.println("차량정비수정삭제페이지");
		int carMaintanceListAllCnt = 0;
		List<Map<String,String>> carMaintanceList = new ArrayList<Map<String,String>>();
		ModelAndView mav = new ModelAndView();
		try {
			if(carSearchDTO.getSelectPageNo()==0) {
				carSearchDTO.setSelectPageNo(1);
			}
			System.out.println(carSearchDTO.getCar_number());
			carMaintanceListAllCnt = this.adminService.getCarMaintanceListAllCnt(carSearchDTO);
			if(carMaintanceListAllCnt!=0) {
				carMaintanceList= this.adminService.getCarMaintanceList(carSearchDTO);
			}

		} catch (Exception e) {
			System.out.println("carListInfoForm을 불러오는 도중 오류");
		}
		mav.addObject("carMaintanceListAllCnt", carMaintanceListAllCnt);
		mav.addObject("carMaintanceList", carMaintanceList);
		mav.addObject("carSearchDTO",carSearchDTO);

		mav.setViewName("carMaintanceListForm.jsp");
		return mav;
	}
	//----------------------
	// 차 리스트 (SelectBox용도)
	//----------------------
	@RequestMapping(
			value="/carList.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public List<Map<String,String>> carList(
			HttpSession session, HttpServletResponse response,
			CarSearchDTO carSearchDTO
			){
		System.out.println(carSearchDTO);
		List<Map<String,String>> carList = this.adminService.getCarList(carSearchDTO);	
		System.out.println(carList+"llllll");
		return carList;

	}
	//***************************************************
	// 차량 정비 수정/삭제 상세보기 UI 이동 (차량정비 고유 넘버) 
	//***************************************************
	@RequestMapping(value="/carMaintanceContent.do")
	public ModelAndView adminCarMaintanceUpDelDetailForm( 
			HttpSession session
			, @RequestParam(value="car_maintance_info_no") int car_maintance_info_no
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("carMaintanceUpDelDetailForm.jsp");
		CarMaintanceDTO carMaintanceDTO = this.adminService.getCarMaintanceDTO(car_maintance_info_no); 
		mav.addObject("carMaintanceDTO", carMaintanceDTO);

		return mav;
	}

	//***************************************************
	//차량 정비내용 정보 업데이트 (차 정비 고유넘버)
	//***************************************************
	@RequestMapping(
			value="/carMaintanceUpdateProc.do"
			, method = RequestMethod.POST,produces="application/json;charset=UTF-8"

			) 
	@ResponseBody 
	public int carMaintanceUpdateProc(			
			HttpSession session
			,CarMaintanceDTO carMaintanceDTO)
	{
		int carMaintanceUpdateCnt =0;
		try {
			carMaintanceUpdateCnt = this.adminService.getCarMaintanceUpdateCnt(carMaintanceDTO); 
		} catch (Exception e) {
			System.out.println("carMaintanceUpdateProc을 불러오는 도중 오류");
		}

		return carMaintanceUpdateCnt;
	}

	//***************************************************
	//차량 정비내용 정보 삭제  (차 정비 고유넘버)
	//***************************************************
	@RequestMapping(
			value="/carMaintanceDeleteProc.do"
			, method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)	
	@ResponseBody 
	public int carMaintancDeleteProc( 
			HttpSession session
			, @RequestParam(value="car_maintance_info_no") int car_maintance_info_no
			) 
	{
		int carMaintancDeleteCnt =0;
		try {
			carMaintancDeleteCnt = this.adminService.getCarMaintancDeleteCnt(car_maintance_info_no); 
		} catch (Exception e) {
			System.out.println("carMaintancDeleteProc을 불러오는 도중 오류");
		}

		return carMaintancDeleteCnt;
	}


	//**********************************
	// QnA 게시판 목록 가져오기
	//**********************************
	@RequestMapping( value="/qnaListForm.do" )  
	public ModelAndView qnaBoardList (
			@RequestParam(value="question_group_no", defaultValue="1") int question_group_no 
			,HttpSession session
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaListForm.jsp");

		try {
			String id= (String) session.getAttribute("id");
			List<Map<String,String>> qnaList = this.adminService.getQnaList(question_group_no );
			//------------------------------------------------------------------
			// ModelAndView 객체에  검색 개수, 게시판 검색 목록 저장하기
			// ModelAndView 객체에 addObject 메소드로 저장된 것은
			// 추후 HttpServletRequest 객체에 setAttribute 메소드 호출로 다시 재저장 된다
			mav.addObject("qnaList", qnaList);
			mav.addObject("id",id);

		}catch(Exception e) {
			System.out.println("AdminController.qnaList(~) 메소드 호출 시 에러발생!");
			System.out.println( e.toString() );
		}
		//---------------------
		// [ModelAndView 객체] 리턴하기
		//---------------------
		return mav;
	}

	//==============================
	// QnA 게시판 <글쓰기> 화면으로 이동하기 위한 메소드
	//==============================
	@RequestMapping( value="/qnaRegForm.do" )
	public ModelAndView goQnaRegForm(

			){
		//---------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//---------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaRegForm.jsp");
		return mav;
	}

	//=================================
	// QnA 게시판에 입력한 글을 DB에  꽂아버리는 메소드
	//=================================
	@RequestMapping(
			value="/qnaRegProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int insertQna(
			QnaDTO qnaDTO
			) {
		// 메소드 첫 줄에 도스창 찍는 명령어 안되면 매개변수 쪽으로 들어오다가 오류 발생 한 것
		System.out.println("insertQna 메소드 시작. qnaDTO 이상없음");

		//--------------------------------------
		// 게시판 글 입력하고 [게시판 입력 적용행의 개수] 저장할 변수 선언
		//--------------------------------------
		int qnaRegCnt = 0;
		System.out.println(qnaRegCnt);
		try {
			//--------------------------------------
			// [BoardServiceImpl 객체]의 insertQna 메소드 호출로 게시판 입력하고 [게시판 입력 적용행의 개수] 얻기
			//--------------------------------------
			System.out.println("에러 테스트2");
			qnaRegCnt = this.adminService.insertQna(qnaDTO);
			System.out.println("에러 테스트3");

		} catch(Exception e) {
			System.out.println("BoardController.insertQna 메소드에서 에러발생!");
			qnaRegCnt = -1;
		}
		//
		return qnaRegCnt;
	}


	//****************************************
	@RequestMapping(
			value="/qnaUpDelForm.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
			) 
	public ModelAndView goQnaUpDelForm( 
			@RequestParam(value="question_no") int question_no, 
			HttpSession session ) { 

		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("qnaUpDelForm.jsp"); 
		try { 

			System.out.println("QnaDTO 아주 잘옴");
			QnaDTO qnaDTO = this.adminService.getQnaDTO(question_no); 
			System.out.println(qnaDTO.getContent());
			mav.addObject("qnaDTO", qnaDTO); 
			System.out.println("qnaDTO 아주 잘옴");
		}catch(Exception e){ 
			System.out.println("BoardController.goQnaUpDelForm() 메소드 예외 발생"); 
		} 
		return mav; 
	} 
	//******************************************************************************************
	// support/qnaUpDelProc.do 로 접근하면 호출되는 메소드
	//******************************************************************************************
	@RequestMapping(
			value="/qnaUpDelProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int qnaUpDelProc(
			QnaDTO qnaDTO
			, @RequestParam( value="upDel" ) String upDel
			) {
		int qnaUpDelCnt = 0;

		try {
			// 만약 수정 모드이면 수정 실행하고 수정 적용행의 개수를 저장
			if( upDel.equals("up") ) {
				qnaUpDelCnt= this.adminService.updateQna(  qnaDTO );
			}
			// 만약 삭제 모드이면 삭제 실행 후 삭제 적용행의 개수를 저장
			else {
				qnaUpDelCnt = this.adminService.deleteQna(  qnaDTO );

			}
		} catch(Exception e) {
			qnaUpDelCnt = -10;
			System.out.println("BoardController.qnaUpDelProc(~) 메소드 예외발생");
		}
		return qnaUpDelCnt;
	}


	//*********************************************************
	// 불만게시판 글 목록을 싹 다 가져오는 메소드
	//*********************************************************
	@RequestMapping(
			value="/adminDiscontentListForm.do"
			,method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public ModelAndView getAdminDiscontentList(
			HttpSession session, HttpServletResponse response,
			DiscontentSearchDTO discontentSearchDTO
			){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminDiscontentListForm.jsp");
		try {
			if(discontentSearchDTO.getSelectPageNo()==0) {
				discontentSearchDTO.setSelectPageNo(1);
			}
			int adminDiscontentListAllCnt = this.adminService.getAdminDiscontentListAllCnt(discontentSearchDTO);
			// System.out.println(adminDiscontentListAllCnt); 이상없음
			//-----------------------------------------------------
			List<Map<String,String>> adminDiscontentList = this.adminService.getAdminDiscontentList(discontentSearchDTO);
			//-----------------------------------------------------

			//-----------------------------------------------------
			mav.addObject( "discontentSearchDTO", discontentSearchDTO );
			mav.addObject( "adminDiscontentList", adminDiscontentList );
			mav.addObject( "adminDiscontentListAllCnt", adminDiscontentListAllCnt );
		}catch(Exception ex) {
			//-----------------------------------------------------

			//-----------------------------------------------------
			System.out.println("adminController.getAdminDiscontentList(~) 메소드 호출 시 에러발생");
			// System.out.println( ex.toString() ); //에러 찾을 때 유용!
		}
		//-----------------------------------------------------

		//-----------------------------------------------------
		return mav;
	}

	//*********************************
	// 불만게시판 글 상세보기 메소드(관리자용)
	//**********************************
	@RequestMapping(value="/adminDiscontentContentForm.do"
			, method=RequestMethod.POST
			,produces="application/json;charset=UTF-8") 
	public ModelAndView goAdminDiscontentContentForm( 
			@RequestParam(value="adminDiscontent_no") int adminDiscontent_no, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndVie 객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("adminDiscontentContentForm.jsp"); 
		try { 

			DiscontentDTO discontentDTO = this.adminService.getDiscontentDTO(adminDiscontent_no);
			mav.addObject("discontentDTO",discontentDTO); 

		}catch(Exception e){ 
			System.out.println("AdminController.goAdminDiscontentContentForm( ) 메소드 예외 발생"); 
		} 
		return mav; 
	}


	//==============================
	// [불만게시판] 답글을 작성하는 페이지로 이동하는 메소드
	//==============================
	@RequestMapping( value="/adminDiscontentRegForm.do" )
	public ModelAndView goAdminDiscontentRegForm(
			// 파라미터명이 b_no 인 파라미터값을 받아오는 매개변수 b_no 선언하기
			// 만약 파라미터명이 없으면 null 값이 들어오므로
			// 매개변수의 자료형은 String 으로 하던가
			// 아니면 defaultValue 를 사용하여 원하는 기본값을 받아오도록 한다.
			@RequestParam(value="discontent_no") int discontent_no
			){
		//---------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//---------------------
		ModelAndView mav = new ModelAndView();
		mav.addObject("discontent_no",discontent_no);
		mav.setViewName("adminDiscontentRegForm.jsp");
		return mav;
	}

	//======================================
	// [불만 게시판]에 입력한 글을 DB에  메다꽂아 버리는 메소드
	//======================================
	@RequestMapping(
			value="/adminDiscontentRegProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int insertAdminDiscontent(

			DiscontentDTO discontentDTO
			) {
		// 메소드 첫 줄에 도스창 찍는 명령어 안되면 매개변수 쪽으로 들어오다가 오류 발생 한 것
		System.out.println("insertAdminDiscontent 메소드 시작");

		//--------------------------------------
		// 게시판 글 입력하고 [게시판 입력 적용행의 개수] 저장할 변수 선언
		//--------------------------------------
		int DiscontentRegCnt = 0;
		System.out.println(DiscontentRegCnt);
		System.out.println(discontentDTO.getDiscontent_no());
		System.out.println(discontentDTO.getDiscontent_content());
		System.out.println(discontentDTO.getDiscontent_subject());
		try {
			//--------------------------------------
			// [BoardServiceImpl 객체]의 insertBoard 메소드 호출로 게시판 입력하고 [게시판 입력 적용행의 개수] 얻기
			//--------------------------------------
			DiscontentRegCnt = this.adminService.insertAdminDiscontent(discontentDTO);
			System.out.println(DiscontentRegCnt);

		}catch(Exception e) {
			System.out.println("AdminController.insertAdminDiscontent(~)에서 에러발생!");
			DiscontentRegCnt = -1;
		}
		//
		return DiscontentRegCnt;
	}

	//********************************************************************
	// [불만게시판 답글] 수정/삭제 하는(관리자 전용) 폼으로 이동하는 메소드
	//********************************************************************
	@RequestMapping(value="/adminDiscontentEditForm.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8") 
	public ModelAndView discontentEdit( 
			@RequestParam(value="discontent_no") int discontent_no, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("adminDiscontentEditForm.jsp"); 
		try { 

			System.out.println("driverDTO 아주 잘옴");
			DiscontentDTO discontentDTO = this.adminService.getDiscontentDTO(discontent_no); 
			mav.addObject("discontentDTO",discontentDTO); 
			System.out.println("driverDTO 아주 잘옴");
		}catch(Exception e){ 
			System.out.println("BoardController.goBoardContentForm(~) 메소드 예외 발생"); 
		} 
		return mav; 
	} 
	//**********************************
	// [불만게시판 답글] 수정 삭제 하는 메소드 
	//**********************************
	@RequestMapping(
			value="/adminDiscontentUpDelProc.do",
			method = RequestMethod.POST
			, produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public int adminDiscontentUpDelProc(
			HttpSession session,HttpServletResponse response,
			DiscontentDTO discontentDTO,
			@RequestParam(value="upDel") String upDel
			) {

		int discontentUpDelCnt=0;
		try {
			System.out.println(upDel);
			System.out.println(discontentDTO.getDiscontent_no());
			if(upDel.equals("up")) {
				discontentUpDelCnt = this.adminService.getDiscontentUpCnt(discontentDTO);
			}
			else {
				discontentUpDelCnt = this.adminService.getDiscontentDelCnt(discontentDTO);
			}
			System.out.println("discontentUpDelCnt 된다 ");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("AdminController.adminDiscontentUpDelProc(~) 에서 에러 발생");
			discontentUpDelCnt=-3;
		} 
		return discontentUpDelCnt;
	}




	//**********************************
	// 개수찾기
	//**********************************
	@RequestMapping(
			value="/admindiscontentRepleChk.do"
			, method=RequestMethod.POST
			, produces="application/json;chrset=utf-8"
			)
	@ResponseBody 
	public int gogogo(
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,String> paramsMap
			) {

		System.out.println("hi");
		System.out.println(paramsMap);
		int groupCnt = 0;
		try {	

			groupCnt = this.adminService.getGroupCnt(paramsMap);
			System.out.println("여기까진 오나");
			System.out.println(groupCnt);
		}catch (Exception e) {
			System.out.println(e);
			groupCnt= -1;
		}
		return groupCnt;
	}
}
