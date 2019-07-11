<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="driverMainPage.jsp" %>
<html>
<script>
$(document).ready(function() {

	
}); //$(document).ready(function() {
	//----------------------------------------
	// 정비내역등록 화면이으로 이동
	//----------------------------------------
	function goDriverGradeForm(RESERVE_APPLY_CAR_NUMBER){
		alert(RESERVE_APPLY_CAR_NUMBER);
		$("[name=driverGradeForm] [name=RESERVE_APPLY_CAR_NUMBER]").val( RESERVE_APPLY_CAR_NUMBER );
		document.driverGradeForm.submit();
	}
	
</script>
<head>

</head>
    <body>
    <center><h1>주행 기록 UI</h1><br><br>
    <!-- ----------------------[리스트 검색/요청]----------------------------- -->
    <!-- 
    <form name="carListForm" method="post" action="/support/carListForm.do">
    	검색 :  <input type="text" name="carsearch" size="20">	
    </form>
     -->
    <!-- ----------------------[리스트 출력 화면]----------------------------- -->
		<table border=0>
			
			<tr><td align=right> 검색 총 개수 : ${requestScope.driveListAllCnt} 개
	
			<tr><th align=center><span class="pagingNumber"></span>
			<tr><td>
			
				<table class="tbcss2 driveList" border="0" cellspacing="0" cellpadding="5" rules="rows" frame="hsides" width=700px>	
				<tr><th>번호<th>날짜<th>출발지<th>목적지<th>출발시간<th>도착시간<th>주행거리<th>리뷰

				<c:forEach items="${requestScope.driveList}" var="drive" varStatus="loopTagStatus">
					<tr style="cursor:pointer" onClick="gocarContentForm( ${drive.DRIVER_NO} )" >
						<td> ${selectPageNo*rowCntPerPage-rowCntPerPage+1+loopTagStatus.index}   <!-- 1증가일련번호-->						
						<td>${drive.RESERVATION_DATE}
						<td>${drive.START_ROAD_ADDR}
						<td>${drive.END_ROAD_ADDR}
						<td>${drive.START_TIME}
						<td>${drive.START_TIME}
						<td>
						<td><input type="button" value="리뷰" onClick="goDriverGradeForm( ${drive.RESERVE_APPLY_CAR_NUMBER} )">	
													
				</c:forEach>
				
			</table>
		</table>
		<br>
		${requestScope.driveListAllCnt==0? '  검색된 글이 없습니다.  ':''}
	
		
	<!-- 	
		<input type="hidden" name="keyword" value="${keyword}">
	-->
		<form name="driverGradeForm" method="post" action="/support/driverGradeForm.do">
			<input type="hidden" name="RESERVE_APPLY_CAR_NUMBER">
		</form>
	 
	</center>
    </body>
</html>