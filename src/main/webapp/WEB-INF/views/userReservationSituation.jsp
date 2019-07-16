<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="userMenuBar.jsp" %>
<html>
<script>
$(document).ready(function() {
	//***********************************************************
	// 검색 조건의 흔적 남기기2
	//***********************************************************
	inputData("keyword","${userRevSearchDTO.keyword}");
	inputData("selectPageNo","${userRevSearchDTO.selectPageNo}");
	inputData("reservation_year","${userRevSearchDTO.reservation_year}");
	inputData("reservation_month","${userRevSearchDTO.reservation_month}");
	
	//***********************************************************
	// 페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
	//***********************************************************
	$(".pagingNumber").html(
			getPagingNumber(
			"${userRevListAllCnt}", // 검색 결과 총 행 개수
			"${userRevSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
			"5", // 페이지 당 출력행의 개수
			"10", // 페이지 당 보여줄 페이징번호 개수
			"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
			)
		);
	
});
	function userCancelReservation(number){
		alert(number);
		var num = {"reserve_apply_car_number":number};
		 $.ajax({
			url:"/support/cancelReservation.do",
			type:"post",
			data: num,
			dataType : 'html' ,
			
			success:function(data){
				if(data==1){
					alert("예약이 취소되었습니다.");
					location.replace("/support/userReservationSituation.do");
				}
				else{
					alert("예약을 취소하던 중 오류 발생");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 
	}
	function goSearch(){
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.reservationSituationInfoSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword], [name=reservation_year], [name=reservation_month]");
		inputData("selectPageNo","1");
		document.reservationSituationInfoSearchForm.submit();
	}
</script>
<head>

</head>
 <body>
    <center>예약현황<br><br>
    
    	<form class="reservationSituationInfoSearchForm" name="reservationSituationInfoSearchForm" method="post" action="/support/userReservationSituation.do">
		<table class="tbcss1" width = "800" border="1" bordercolor="#DDDDDD" cellpadding="5" align="center">
		<tr align="center">
			<th bgcolor="${headerColor}" colspan="6">예약 정보 검색</th>
		<tr align="center">
			<th bgcolor="${headerColor}" width=60>키워드
			<td width="250"><input type="text" name="keyword"> 
			<th bgcolor="${headerColor}" width=60>예약날짜
			<td width="250"><select name="reservation_year">
											<option value=""></option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>
										년 
										<select name="reservation_month" >
											<option value=""></option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
										월
		</table>
		<input type="hidden" name="selectPageNo">
		<!-- <input type="hidden" name="ascDesc">
		<input type="hidden" name="selectOption"> -->
				<table>
					<tr height=4>
						<td>
				</table>
		<input type="button" value="검색" onClick="goSearch();"> 
		<input type="button" value="전부검색" onClick="goSearchAll();"> 
		<input type="reset" value="초기화">
		
		</form>
		
		
		<table border=0>
		<tr>
			<td align=right>
				[검색 총 개수] : ${requestScope.userRevListAllCnt}
		
		<tr>
			<td>
				<table class="tbcss2 userRevList" border="0" cellspacing="0" cellpadding="5" rules="rows" frame="hsides" width=700px>	
					 <tr><th>번호<th>출발지<th>목적지<th>예약날짜<th>예약상태<th>예약취소
				
					<c:forEach items="${userRevList}" var="user" varStatus="loopTagStatus"> <!--boardList는 BoardListFormAction에 request.setAttribute("boardList", boardList);에서 "boardList" 요고다--> <!--board 는 지역변수-->
						<tr style="cursor:pointer">
							<td> ${userRevListAllCnt-loopTagStatus.index+1}
							<td>${user.start_road_addr}
							<td>${user.end_road_addr}
							<td>${user.reservation_date}	
							<td>${user.reserve_status_name} 
							<c:choose>
 								<c:when test="${user.reserve_status_code==1 || user.reserve_status_code==2}">
 									<td><input type="button" value="예약취소" onclick="userCancelReservation(${user.reserve_apply_car_number});">
 								</c:when>
 								<c:otherwise>
 						
 									<td>
 								</c:otherwise>
 							</c:choose>			
					</c:forEach>
				</table>
				
		<tr>
			<th><span class="pagingNumber"></span>			
	</table>
	${requestScope.userRevListAllCnt==0?'검색된 글이 없습니다.':''}
    </center>
     
           
    </body>
    </html>