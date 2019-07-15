package com.support.movement;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.board.email.Email;
import spring.board.email.EmailSender;

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
	/*
	@Autowired
		private EmailSender emailSender;
		@Autowired
		private Email email;*/


	@Autowired
	private JavaMailSender mailSender;



	
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



	//**********************************
	// 회원가입으로 이동
	//**********************************
	@RequestMapping(value="/regForm.do")
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
	//**********************************
	// 회원가입으로 이동
	//**********************************
	@RequestMapping(value="/findIdForm.do")
	public ModelAndView FindIdForm(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {

		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findIdForm.jsp");
		return mav;
	}
	//**********************************
	// 회원가입으로 이동
	//**********************************
	@RequestMapping(value="/findPwdForm.do")
	public ModelAndView FindPwdForm(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {

		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findPwdForm.jsp");
		return mav;
	}
	//**********************************
	// 로그인 시도
	//**********************************
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


	//**********************************
	// 유저 회원가입 시도
	//**********************************
	@RequestMapping(
			value="/userRegForm.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)

	@ResponseBody 
	public int userRegProc(
			HttpSession session,HttpServletResponse response,
			UserDTO userDTO
			) {
		int userRegCnt=0;
		try {
			session.removeAttribute("uri");

			userRegCnt = this.loginService.getUserRegCnt(userDTO);
			System.out.println("됩시다");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.loginProc(~) 에서 에러 발생");
			userRegCnt=-1;
		} 
		return userRegCnt;
	}


	//**********************************
	// 운전자 가입 (재영 작업)
	//**********************************
	@RequestMapping(
			value="/driverRegForm.do",
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

			driverRegCnt = this.loginService.getDriverRegCnt(driverDTO);
			System.out.println("드라이버 됩니다");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
			driverRegCnt=-1;
		} 
		return driverRegCnt;
	}

	//**********************************
	// 아이디 찾기 시도
	//**********************************
	@RequestMapping(
			value="/findIdProc.do",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	// String 리턴이 안돼서 Map으로 함
	public Map<String,String> findIdProc(
			HttpServletRequest request,HttpSession session,HttpServletResponse response,
			// 파리미터명, 파라미터값이 저장된 HashMap 객체를 받아오는 매개변수 선언
			// 파라미터명은 키값으로 파라미터 값으로는 키값에 대응하는 저장 문자열 HashMap 객체 저장된다.
			@RequestParam Map<String,String> paramsMap
			) {
		String id = "";

		Map<String,String> map = new HashMap<String,String>();
		try {
			id = this.loginService.getId(paramsMap);
			map.put("id", id);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.loginProc(~) 에서 에러 발생");

		} 
		return map;
	}
	//**********************************
	// 암호 찾기 시도
	//**********************************
	@RequestMapping(
			value="/findPwdProc.do",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int findPwdProc(
			HttpServletRequest request,HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,String> paramsMap
			) {
		String pwd = getRandomPwd(10);
		int pwdInfoChk = 0;
		try {
			paramsMap.put("pwd", pwd);
			pwdInfoChk = this.loginService.getPwdInfoChk(paramsMap);
			if(pwdInfoChk==1){
				String setfrom = "jjocharito@gmail.com";
				String tomail = paramsMap.get("email"); // 받는 사람 이메일
				String title = "교통약자지원센터 임시비밀번호 안내 메일입니다."; // 제목
				String content = "고객님의 변경된 임시비밀번호는 ["+paramsMap.get("pwd")+"] 입니다.\n"
						+ "변경된 임시비밀번호로 로그인 후 회원정보에서 비밀번호를 수정해주세요. "; // 내용

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println("LoginController.loginProc(~) 에서 에러 발생");

		} 

		return pwdInfoChk;
	}



	private String getRandomPwd(int num) {
		int index = 0;
		char[] charset = new char[] {
				'0','1','2','3','4','5','6','7','8','9',
				'a','b','c','d','e','f','g','h','i','j','k','l',
				'm','n','o','p','q','r','s','t','u','v','w','x','y','z',
				'A','B','C','D','E','F','G','H','I','J','K','L',
				'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};

		StringBuffer sb = new StringBuffer();
		for(int i=0;i<num;i++) {
			index = (int)(charset.length * Math.random());
			sb.append(charset[index]);


		}
		return sb.toString();
	}


	private String getRandomEmail(int num) {
		int index = 0;
		char[] charset = new char[] {
				'0','1','2','3','4','5','6','7','8','9'};

		StringBuffer sb = new StringBuffer();
		for(int i=0;i<num;i++) {
			index = (int)(charset.length * Math.random());
			sb.append(charset[index]);


		}
		return sb.toString();
	}
	//**********************************
	// 이메일
	//**********************************
	@RequestMapping(
			value="/checkEmail.do",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int checkEmail(
			HttpServletRequest request,HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,String> paramsMap
			) {
		System.out.println(paramsMap);
		String authenticationNumber = getRandomEmail(6);
		paramsMap.put("authenticationNumber", authenticationNumber);
		int emailChk = 0;
		try {
			emailChk = this.loginService.sendEmailCheck(paramsMap);
			if(emailChk==1){
				String setfrom = "jjocharito@gmail.com";
				String tomail = paramsMap.get("email"); // 받는 사람 이메일
				String title = "교통약자지원센터 회원가입 이메일 인증번호 안내 메일입니다."; // 제목
				String content = "이메일 인증번호는 ["+authenticationNumber+"] 입니다.\n"
						+ "인증번호입력칸에 해당 인증번호를 입력하시고 버튼을 클릭해주세요. "; // 내용

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println("LoginController.loginProc(~) 에서 에러 발생");
			emailChk=-1;

		} 

		return emailChk;
	}

	//**********************************
	// 이메일
	//**********************************
	@RequestMapping(
			value="/checkEmailAuth.do",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int checkEmailAuth(
			HttpServletRequest request,HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,String> paramsMap
			) {
		System.out.println(paramsMap);
		int emailChk = 0;
		try {
			emailChk = this.loginService.emailAuthCheck(paramsMap);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println("LoginController.loginProc(~) 에서 에러 발생");
			emailChk=-1;

		} 

		return emailChk;
	}

	//**********************************
	// 아이디 중복 체크 시도
	//**********************************
	@RequestMapping(
			value="/idCheck.do",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int idCheck(
			HttpServletRequest request,HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,String> paramsMap
			) {
		int idChk = 0;
		try {
			idChk = this.loginService.getIdChk(paramsMap);


		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println("LoginController.loginProc(~) 에서 에러 발생");

		} 

		return idChk;
	}

}
