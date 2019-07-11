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
	function goReviewRegForm(number){
		alert(1);
		document.reviewRegForm.reserve_apply_car_number.value=number;
		document.reviewRegForm.submit();
		
	}
</script>
<head>

</head>
    <body>
    <center>예약현황<br><br>
       <table border=1	class="" cellpadding=5	cellspacing=0> 
            <tr><th>번호<th>출발지<th>목적지<th>예약일시<th>운전자<th>예약결과<th>평점
				<c:forEach items="${userUtilDetailList}" var="user" varStatus="loopTagStatus"> 
 				<tr style="cursor: pointer"> 
 					<td>${loopTagStatus.index+1}</td> 							
 					<td>${user.start_point_longitude}</td>						
 					<td>${user.end_point_longitude}</td>
 					<td>${user.reservation_date}</td>
 					<td>${user.drvier_name}</td>
 					<td>${user.reserve_status_name}</td>
 					<td>
 					<c:choose>
 						<c:when test="${user.review_score=='미평가'}">
 						<input type="button" value="리뷰남기기" onclick="goReviewRegForm(${user.reserve_apply_car_number});">
 						</c:when>
 						<c:otherwise>
 						${user.review_score}점
 						</c:otherwise>
 					</c:choose>
 					</td>
 				</c:forEach> 

	  			<form name="reviewRegForm" method="post" action="/support/reviewRegForm.do">
	  			<input type="hidden" name="reserve_apply_car_number" value="" >
	  			</form> 
	</table>

</center>
    </body>
    </html>