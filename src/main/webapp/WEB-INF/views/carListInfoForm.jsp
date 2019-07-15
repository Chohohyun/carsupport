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
	inputData("keyword","${carSearchDTO.keyword}");
	inputData("car_code","${carSearchDTO.car_code}");
	inputData("selectPageNo","${carSearchDTO.selectPageNo}");
	
	// 페이징 처리 관련 html 소스를 class= pagingNumber 가진 태그 안에 삽입하기
	$(".pagingNumber").html(
		getPagingNumber(
		"${carListAllCnt}", // 검색 결과 총 행 개수
		"${carSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
		"5", // 페이지 당 출력행의 개수
		"10", // 페이지 당 보여줄 페이징번호 개수
		"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
		)
	);
	
}); //$(document).ready(function() {
	//----------------------------------------
	// 정비내역등록 화면이으로 이동
	//----------------------------------------
	function goCarMaintenanceRegForm(car_info_no){
		alert(car_info_no);
		$("[name=carMaintenanceRegForm] [name=car_info_no]").val( car_info_no );
		document.carMaintenanceRegForm.submit();
	}
	function goSearch(){
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.carInfoSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword], [name=car_code]");
		inputData("selectPageNo","1");
		document.carInfoSearchForm.submit();
	}

</script>
<head>

</head>
    <body>
    <center><h1>차량 정보 UI</h1><br><br>
    
     <form class="carInfoSearchForm" name="carInfoSearchForm" method="post" action="/support/adminCarUpDelForm.do">
	<table class="tbcss1" width = "800" border="1" bordercolor="#DDDDDD" cellpadding="5" align="center">
		<tr align="center">
			<th bgcolor="${headerColor}" colspan="6">차량 정보 검색</th>
		<tr align="center">
			<th bgcolor="${headerColor}" width=60>키워드
			<td width=250><input type="text" name="keyword"> 
			<th bgcolor="${headerColor}" width=60>차량종류
			<td width="150"><select name="car_code">
					<option value="0"></option>
					<option value="1">슬로프</option>
					<option value="2">리프트</option>
				</select>
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
				<tr><th>번호<th>차량번호<th>남은 차량연식<th>정비까지 남은 KM<th>차량종류<th>수정/삭제

				<c:forEach items="${requestScope.carList}" var="car" varStatus="loopTagStatus">
					<tr style="cursor:pointer" onClick="gocarContentForm( ${car.car_info_no} )" >
						<td> ${selectPageNo*rowCntPerPage-rowCntPerPage+1+loopTagStatus.index}   <!-- 1증가일련번호-->						
						<td>${car.car_number}
						<td>${car.car_year}
						<td>${car.car_distance}
						<td>${car.car_code}
						<td><input type="button" value="정비내역등록" onClick="goCarMaintenanceRegForm( ${car.car_info_no} )">								
				</c:forEach>
				
			</table>
		</table>
		<br>
		${requestScope.carListAllCnt==0? '  검색된 글이 없습니다.  ':''}
	
		
	<!-- 	
		<input type="hidden" name="keyword" value="${keyword}">
	-->
		<form name="carMaintenanceRegForm" method="post" action="/support/carMaintenanceRegForm.do">
			<input type="hidden" name="car_info_no">
		</form>
	 
	</center>
    </body>
</html>