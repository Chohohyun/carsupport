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
	function reviewRegForm(number){
		document.reviewRegForm.reserve_apply_car_number.value=number;
		document.reviewRegForm.submit();
		
	}
</script>
<head>

</head>
   <body><center><br>
	<!-- [게시판 등록] 화면을 출력하는 form 태그 선언-->
	<form  method="post" name="reviewRegForm" action="/support/reviewRegProc">
		
		
		<table class="tbcss1"	border="1"	bordercolor=gray	cellspacing="0"		cellpadding="5"	align="center">
			<tr>
				<th bgcolor="${headerColor}"> 이용날짜
				<td>${reserveList.reservation_date}</td>
			</tr>
			<tr>
				<th bgcolor="${headerColor}"> 목적지
				<td>${reserveList.end_road_addr}</td>
			</tr>
			<tr>
				<th bgcolor="${headerColor}"> 운전자
				<td>${reserveList.driver_name}</td>
			</tr>
			<tr>
				<th bgcolor="${headerColor}"> 별점
				<td></td>
			</tr>
			<tr>
				<th bgcolor="${headerColor}"> 평가내용
				<td><textarea name="content"rows="13" cols="40"></textarea></td>
			</tr>		
		</table>
		
		<table	border="0"><tr height=4><td></table> <!-- 여백을 위한 -->
		
		<input type="hidden"		name="b_no"	value="${param.b_no }">
		
		<input type="button"	value="저장"		onClick="checkBoardRegForm()">
		<input type="reset"	value="다시작성">
		<input type="button"	value="목록보기"		onClick="document.boardListForm.submit()">
	</form>
	
	<form name="boardListForm"	method="post"	action="/erp/boardListForm.do">
	</form>
	
	<input type="button" 	value="정보보기" 	onclick="print_html_info();">
	</center>
</body>
</html>