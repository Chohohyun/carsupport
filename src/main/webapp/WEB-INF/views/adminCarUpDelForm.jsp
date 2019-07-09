<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>
<html>
<script>
$(document).ready(function() {

	
}); //$(document).ready(function() {
	//----------------------------------------
	// 수정/삭제 화면이으로 이동
	//----------------------------------------
	function goCarUpDelDetailForm(car_info_no){
		alert(car_info_no);
		$("[name=carContentForm] [name=car_info_no]").val(car_info_no);
		document.carContentForm.submit();
	}

</script>
<head>

</head>
    <body>
    <center><h1>차량 수정/삭제 리스트 UI</h1><br><br>
    <!-- ----------------------[리스트 검색/요청]----------------------------- -->
    <!-- 
    <form name="carListForm" method="post" action="/support/carListForm.do">
    	검색 :  <input type="text" name="carsearch" size="20">	
    </form>
     -->
    <!-- ----------------------[리스트 출력 화면]----------------------------- -->
		<table border=0>
			
			<tr><td align=right> 검색 총 개수 : ${requestScope.carListAllCnt} 개
	
			<tr><th align=center><span class="pagingNumber"></span>
			<tr><td>
			
				<table class="tbcss2 carList" border="0" cellspacing="0" cellpadding="5" rules="rows" frame="hsides" width=700px>	
				<tr><th>번호<th>차량번호<th>차량연식<th>주행거리<th>차량종류<th>수정/삭제

				<c:forEach items="${requestScope.carList}" var="car" varStatus="loopTagStatus">
					<tr style="cursor:pointer" onClick="gocarContentForm( ${car.car_info_no} )" >
						<td> ${selectPageNo*rowCntPerPage-rowCntPerPage+1+loopTagStatus.index}   <!-- 1증가일련번호-->						
						<td>${car.car_number}
						<td>${car.car_year}
						<td>${car.car_distance}
						<td>${car.car_code}
						<td><input type="button" value="수정/삭제" onClick="goCarUpDelDetailForm( ${car.car_info_no} )">								
				</c:forEach>
				
			</table>
		</table>
	
		<br>
		${requestScope.carListAllCnt==0? '  검색된 글이 없습니다.  ':''}
		
		
		
		
	<!-- 	
		<input type="hidden" name="keyword" value="${keyword}">
	-->
		<form name="carContentForm" method="post" action="/support/carContent.do">
			<input type="hidden" name="car_info_no">
		</form>
	 
	</center>
    </body>
</html>