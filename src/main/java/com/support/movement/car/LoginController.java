package com.support.movement.car;

import java.util.HashMap;
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
public class LoginController {
	// 속성변수 loginService 선언하고, LoginService라는 인터페이스를 구현한 클래스를 객체화하여 저장
	// *****************************************************
	// @Autowired 이 붙은 속성변수에는 인터페이스 자료형을 쓰고
	//  이 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	// LoginService라는 인터페이스를 구현한 클래스의 이름을 몰라도 관계없다. 1개 존재하기만 하면 된다.
	
	@Autowired
	private LoginService loginService;
	 
	
	
	
	
	// 가상주소 /erp/loginForm.do로 접속하면 호출되는 메소드 선언
	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginForm(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {

		// HttpSession 객체에 저장된 로그인 아이디 삭제하기
		session.removeAttribute("id");

		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/goRegForm.do")
	public ModelAndView RegForm(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {

		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("regForm.jsp");
		return mav;
	}
	
	@RequestMapping(
			value="/loginProc.do",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int loginProc(
			HttpSession session,HttpServletResponse response,
			// 파리미터명, 파라미터값이 저장된 HashMap 객체를 받아오는 매개변수 선언
			// 파라미터명은 키값으로 파라미터 값으로는 키값에 대응하는 저장 문자열 HashMap 객체 저장된다.
			@RequestParam Map<String,String> paramsMap
			) {
		int admin_idCnt=0;
		try {
			session.removeAttribute("uri");
			admin_idCnt = this.loginService.getAdminCnt(paramsMap);
			if(admin_idCnt>=1) {
				session.setAttribute("id", paramsMap.get("id"));
				// 아이디 암호 저장의사가 없을경우
				// 아이디 암호 저장한 Cookies 객체 생성하고 쿠키값을 null로 덮어 씌우고 수명 없애기
				// 그리고 이 쿠키를 HttpServletRequest 객체에 저장하기
				if(paramsMap.get("is_login")==null) {
					// Cookie 객체 생성하고 쿠키명 cookie, 쿠기값 null로 설정
					/*Cookie cookie1 = new Cookie("admin_id",null);
					cookie1.setMaxAge(0);
					response.addCookie(cookie1);
					Cookie cookie2 = new Cookie("pwd",null);
					cookie2.setMaxAge(0);
					response.addCookie(cookie2);*/
					
					Util.addCookie(response, "id", null, 0);
					Util.addCookie(response, "pwd", null, 0);
				}
				else {
					// Cookie 객체 생성하고 쿠키명 admin_id, 쿠기값 admin_id, 수명 60*60*24로 설정
					/*Cookie cookie1 = new Cookie("admin_id",admin_id);
					cookie1.setMaxAge(60*60*24);
					response.addCookie(cookie1);
					
					// Cookie 객체 생성하고 쿠키명 pwd, 쿠기값 pwd, 수명 60*60*24로 설정
					Cookie cookie2 = new Cookie("pwd",pwd);
					cookie2.setMaxAge(60*60*24);
					response.addCookie(cookie2);*/
					

					Util.addCookie(response, "id",paramsMap.get("id") , 60*60*24);
					Util.addCookie(response, "pwd", paramsMap.get("pwd"), 60*60*24);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.loginProc(~) 에서 에러 발생");
			admin_idCnt=-1;
		} 
		return admin_idCnt;
	}
}
