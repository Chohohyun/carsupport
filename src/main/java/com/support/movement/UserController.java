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

	//=================================
	// 예약 취소 메소드
	//=================================
	@RequestMapping(
			value="/cancelReservation.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int cancelReservation(
			HttpSession session,
			@RequestParam Map<String,String> paramsMap
			) {
		// 메소드 첫 줄에 도스창 찍는 명령어 안되면 매개변수 쪽으로 들어오다가 오류 발생 한 것
		System.out.println(paramsMap);


		int cancelReserveCnt = 0;
		try {
			System.out.println("go");
			cancelReserveCnt = this.userService.getCancelReservation(paramsMap);

		} catch(Exception e) {
			System.out.println("BoardController.insertQna 메소드에서 에러발생!");
			System.out.println(e);
			cancelReserveCnt = -1;
		}
		//
		return cancelReserveCnt;
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

	@RequestMapping(value="/reviewRegForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView reviewRegForm( 
			@RequestParam(value="reserve_apply_car_number") int reserve_apply_car_number, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("reviewRegForm.jsp"); 
		try { 
			System.out.println(reserve_apply_car_number);
			System.out.println("g하이");
			Map<String,String> map = new HashMap<String,String>();
			map = this.userService.getReserveInfo(reserve_apply_car_number);
			mav.addObject("reserveList",map);
		}catch(Exception e){ 
			System.out.println("UserController.reviewRegForm(~) 메소드 예외 발생"); 
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
	// 불만게시판 클릭하면 불만게시판 리스트 가져오기
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


	//**********************************
	// 불만게시판 글쓰기 클릭하면 글쓰기 form으로 이동
	//**********************************
	@RequestMapping(value="/discontentRegForm.do")
	public ModelAndView discontentRegForm(
			// HttpSession 객체가 들어올 매개변수 선언
			// 매개변수에 자료형이 HttpSession이면 웹서버가
			// 생성한 HttpSession 객체가 들어온다.
			HttpSession session) {


		// <참고>HttpSession 객체에 저장된 모든 데이터 제거한다.
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("discontentRegForm.jsp");
		return mav;
	}


	//=================================
	// 불만게시판에 입력한 글을 DB에  꽂아버리는 메소드
	//=================================
	@RequestMapping(
			value="/discontentRegProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int insertQna(
			DiscontentDTO discontentDTO,
			HttpSession session
			) {
		// 메소드 첫 줄에 도스창 찍는 명령어 안되면 매개변수 쪽으로 들어오다가 오류 발생 한 것
		System.out.println("insertQna 메소드 시작. discontentDTO 이상없음");

		//--------------------------------------
		// 게시판 글 입력하고 [게시판 입력 적용행의 개수] 저장할 변수 선언
		//--------------------------------------
		int discontentRegCnt = 0;
		System.out.println(discontentRegCnt);
		try {
			String id = (String)session.getAttribute("id");
			discontentDTO.setUser_id(id);
			//--------------------------------------
			// [BoardServiceImpl 객체]의 insertQna 메소드 호출로 게시판 입력하고 [게시판 입력 적용행의 개수] 얻기
			//--------------------------------------
			System.out.println("에러 테스트2");
			System.out.println(discontentDTO.getDiscontent_content());
			System.out.println(discontentDTO.getDiscontent_subject());

			System.out.println(discontentDTO.getUser_id());
			discontentRegCnt = this.userService.insertDiscontent(discontentDTO);
			System.out.println("에러 테스트3");

		} catch(Exception e) {
			System.out.println("BoardController.insertQna 메소드에서 에러발생!");
			discontentRegCnt = -1;
		}
		//
		return discontentRegCnt;
	}

	//**********************************
	// 불만게시판 상세보기
	//**********************************
	@RequestMapping(value="/discontentContentForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView discontentContent( 
			@RequestParam(value="discontent_no") int discontent_no, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("discontentContentForm.jsp"); 
		try { 

			System.out.println("driverDTO 아주 잘옴");
			DiscontentDTO discontentDTO = this.userService.getDiscontentDTO(discontent_no); 
			mav.addObject("discontentDTO",discontentDTO); 
			System.out.println("driverDTO 아주 잘옴");
		}catch(Exception e){ 
			System.out.println("BoardController.goBoardContentForm(~) 메소드 예외 발생"); 
		} 
		return mav; 
	} 

	//**********************************
	// 불만게시판 수정삭제폼으로 이동
	//**********************************
	@RequestMapping(value="/discontentUpDelForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView discontentUpDel( 
			@RequestParam(value="discontent_no") int discontent_no, 
			HttpSession session ) { 
		// ModelAndView객체 생성하기 
		// ModelAndView객체에 호출 JSP 페이지명을 저장하기 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("discontentUpDelForm.jsp"); 
		try { 

			System.out.println("driverDTO 아주 잘옴");
			DiscontentDTO discontentDTO = this.userService.getDiscontentDTO(discontent_no); 
			mav.addObject("discontentDTO",discontentDTO); 
			System.out.println("driverDTO 아주 잘옴");
		}catch(Exception e){ 
			System.out.println("BoardController.goBoardContentForm(~) 메소드 예외 발생"); 
		} 
		return mav; 
	} 
	//**********************************
	// 불만게시판 수정 삭제 시도 
	//**********************************
	@RequestMapping(
			value="/discontentUpDelProc.do",
			method = RequestMethod.POST,produces="application/json;charset=UTF-8"
			)
	@ResponseBody 
	public int driverUpDelProc(
			HttpSession session,HttpServletResponse response,
			DiscontentDTO discontentDTO,
			@RequestParam(value="upDel") String upDel
			) {

		int discontentUpDelCnt=0;
		try {
			System.out.println(upDel);
			if(upDel.equals("up")) {
				discontentUpDelCnt = this.userService.getDiscontentUpCnt(discontentDTO);
			}
			else {
				discontentUpDelCnt = this.userService.getDiscontentDelCnt(discontentDTO);
			}
			System.out.println("discontentUpDelCnt 된다 ");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LoginController.driverRegProc(~) 에서 에러 발생");
			discontentUpDelCnt=-3;
		} 
		return discontentUpDelCnt;
	}
}
