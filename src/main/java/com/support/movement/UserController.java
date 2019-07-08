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





	// 가상주소 /support/userMainPage.do로 접속하면 호출되는 메소드 선언
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

	// 가상주소 /support/userReservationFrom.do로 접속하면 호출되는 메소드 선언
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
	// 운전자 수정 삭제
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

			userReservationDTO.setUser_id((String)session.getAttribute("id"));
			reservationCheckCnt = this.userService.getReservationCheck(userReservationDTO);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
			reservationCheckCnt=-1;
		} 
		return reservationCheckCnt;
	}
}
