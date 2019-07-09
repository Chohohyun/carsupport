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
public class UserController {
	// 속성변수 loginService 선언하고, LoginService라는 인터페이스를 구현한 클래스를 객체화하여 저장
	// *****************************************************
	// @Autowired 이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	//  이 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	// LoginService라는 인터페이스를 구현한 클래스의 이름을 몰라도 관계없다. 1개 존재하기만 하면 된다.

	@Autowired
	private UserService userService;

	//**********************************
	// 예약신청 누르면 신청 form양식으로 이동
	//**********************************
	@RequestMapping(value="/userUseProcedure.do")
	public ModelAndView userUseProcedure(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userUseProcedure.jsp");
		return mav;
	}



	//**********************************
	// User가 로그인하면 이동하는 페이지
	//**********************************
	@RequestMapping(value="/userMainPage.do")
	public ModelAndView userMain(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userMainPage.jsp");
		return mav;
	}

	//**********************************
	// 예약신청 누르면 신청 form양식으로 이동
	//**********************************
	@RequestMapping(value="/userReservationForm.do")
	public ModelAndView userReservation(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userReservationForm.jsp");
		return mav;
	}


	//**********************************
	// 예약신청 눌렀을 때, 예약가능한지 체크하고 가능하면 신청하기.
	//**********************************
	@RequestMapping(
			value="/reservationCheck.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public int reservationCheck(
			HttpSession session,HttpServletResponse response,
			UserReservationDTO userReservationDTO
			) {

		int reservationCheckCnt=0;
		System.out.println("일단 여기까진 성공한다는것은 아주 좋은 징조");

		try {
			String userId = (String)session.getAttribute("id");
			reservationCheckCnt = this.userService.getReservationCheck(userReservationDTO,userId);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
			reservationCheckCnt=-1;
		} 
		return reservationCheckCnt;
	}


	//**********************************
	// 유저가 자신의 예약 현황을 볼 수 있는 페이지 
	//**********************************
	@RequestMapping(value="/userReservationSituation.do")
	public ModelAndView userReservationSituation(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userReservationSituation.jsp");
		List<Map<String,String>> userRevList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");
			System.out.println(id);

			int userRevListAllCnt = this.userService.getUserRevListAllCnt(id);
			System.out.println(userRevListAllCnt);

			userRevList= this.userService.getUserRevList(id);
			System.out.println(userRevList.size());
			mav.addObject("userRevListAllCnt",userRevListAllCnt);
			mav.addObject("userRevList",userRevList);


		}catch (Exception e) {
			System.out.println("drivetAcceptForm을 불러오는 도중 오류");
		}
		return mav;
	}



	//**********************************
	// 유저가 자신의 이용내역 현황을 볼 수 있는 페이지 
	//**********************************
	@RequestMapping(value="/userUtilizationDetails.do")
	public ModelAndView userUtilizationDetails(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userUtilizationDetails.jsp");
		List<Map<String,String>> userUtilDetailList = new ArrayList<Map<String,String>>();
		try {
			String id = (String) session.getAttribute("id");
			System.out.println(id);

			int userUtilDetailListAllCnt = this.userService.getUserUtilDetailListAllCnt(id);
			System.out.println(userUtilDetailListAllCnt);

			userUtilDetailList= this.userService.getUserUtilDetailList(id);
			mav.addObject("userUtilDetailListAllCnt",userUtilDetailListAllCnt);
			mav.addObject("userUtilDetailList",userUtilDetailList);


		}catch (Exception e) {
			System.out.println("drivetAcceptForm을 불러오는 도중 오류");
		}
		return mav;
	}

	//**********************************
	// 유저가 자신의 이용내역 현황을 볼 수 있는 페이지 
	//**********************************
	@RequestMapping(value="/userUpDelForm2.do")
	public ModelAndView userUpDelForm2(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userUpDelForm2.jsp");

		try {
			String id = (String) session.getAttribute("id");
			System.out.println(id);
			UserDTO userDTO = this.userService.getUserDTO(id); 

			mav.addObject("userDTO",userDTO);


		}catch (Exception e) {
			System.out.println("userUpDelForm2을 불러오는 도중 오류");
		}
		return mav;
	}


	//*********************************************************
	// 가상주소 /boardListForm.do 로 접근하면 호출되는 메소드 선언
	// 		@RequestMapping 내부에 ,method=RequestMethod.POST 가 없으므로
	//		가상주소 /boardListForm.do 로 접근 시 get 또는 post 방식 접근 모두 허용한다.
	//*********************************************************
	@RequestMapping( value="/discontentListForm.do" )
	public ModelAndView getDiscontentList(
			HttpSession session
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("discontentListForm.jsp");
		try {
			int discontentListAllCnt = this.userService.getDiscontentListAllCnt();
			
			//-----------------------------------------------------
			List<Map<String,String>> discontentList = this.userService.getDiscontentList();
			//-----------------------------------------------------
			
			//-----------------------------------------------------
			mav.addObject( "discontentList", discontentList );
			mav.addObject( "discontentListAllCnt", discontentListAllCnt );
		}catch(Exception ex) {
			//-----------------------------------------------------
			
			//-----------------------------------------------------
			System.out.println("UserController.getDiscontentList(~) 메소드 호출 시 에러발생");
			// System.out.println( ex.toString() ); //에러 찾을 때 유용!
		}
		//-----------------------------------------------------
		
		//-----------------------------------------------------
		return mav;
	}
}
