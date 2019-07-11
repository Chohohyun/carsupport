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
public class DriverController {
	// 속성변수 loginService 선언하고, LoginService라는 인터페이스를 구현한 클래스를 객체화하여 저장
	// *****************************************************
	// @Autowired 이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	//  이 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	// LoginService라는 인터페이스를 구현한 클래스의 이름을 몰라도 관계없다. 1개 존재하기만 하면 된다.

	@Autowired
	private DriverService driverService;

	//**********************************
	// 운전자가 로그인하면 이동하는 페이지
	//**********************************
	@RequestMapping(value="/driverMainPage.do")
	public ModelAndView driverMain(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("driverMainPage.jsp");
		return mav;
	}

	//**********************************
	// Driver가 차량정보 누르면 차량정보 form양식으로 이동
	//**********************************

	@RequestMapping(value="/driverCarInfo.do")
	public ModelAndView driverCarInfo(

			HttpSession session) {

		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();

		CarDTO carDTO = this.driverService.getDriverCarInfo(id);

		mav.addObject("carDTO",carDTO);
		mav.setViewName("driverCarInfoUpDelForm.jsp");
		return mav;
	}

	//**********************************
	// Driver가 주행기록 누르면 신청 form양식으로 이동
	//**********************************
	@RequestMapping(value="/driverHistory.do")
	public ModelAndView userReservation(

			HttpSession session) {

		String id = (String) session.getAttribute("id");
		List<Map<String,String>> driveList = new ArrayList<Map<String,String>>();

		ModelAndView mav = new ModelAndView();

		int driveListAllCnt = 0;


		try {
			driveListAllCnt = this.driverService.getDriveListAllCnt(id);
			System.out.println(driveListAllCnt);
			if(driveListAllCnt>0) {
				driveList= this.driverService.getDriveList(id);
			}

			mav.addObject("driveListAllCnt",driveListAllCnt);
			mav.addObject("driveList",driveList);
		} catch (Exception e) {

		}


		mav.setViewName("driveListForm.jsp");
		return mav;
	}


	//**********************************
	// 운전자가 자기 회원정보를 볼 수 있는 페이지 
	//**********************************
	@RequestMapping(value="/driverUpDelForm2.do")
	public ModelAndView driverUpDelForm2(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("driverUpDelForm2.jsp");

		try {
			String id = (String) session.getAttribute("id");
			System.out.println(id);
			DriverDTO driverDTO = this.driverService.getDriverDTO(id); 

			mav.addObject("driverDTO",driverDTO);


		}catch (Exception e) {
			System.out.println("driverUpDelForm2을 불러오는 도중 오류");
		}
		return mav;
	}

}
