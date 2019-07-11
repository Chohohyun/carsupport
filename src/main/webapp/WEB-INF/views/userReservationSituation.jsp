<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="userMainPage.jsp" %>
<html>
<script>
	$(document).ready(function() {
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
</script>
<head>

</head>
    <body>
    <center>예약현황<br><br>
       <table border=1	class="" cellpadding=5	cellspacing=0> 
            <tr><th>번호<th>목적지<th>예약날짜<th>예약상태<th>예약취소
				<c:forEach items="${userRevList}" var="user" varStatus="loopTagStatus"> 
 				<tr style="cursor: pointer"> 
 					<td>${loopTagStatus.index+1} 							
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

	  			<form name="upDelDriverForm" method="post" action="/support/driverUpDelDetailForm.do">
	  			<input type="hidden" name="driver_no" value="" >
	  			</form> 
	</table>

</center>
    </body>
    </html>