<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>
<html>
<script>
$(document).ready(function() {
	inputData("selectPageNo","${driverSearchDTO.selectPageNo}");
	inputData("keyword","${driverSearchDTO.keyword}");
	<c:forEach items="${driverSearchDTO.gender}" var="gender">
	inputData("gender","${gender}");
	</c:forEach>
	// 페이징 처리 관련 html 소스를 class= pagingNumber 가진 태그 안에 삽입하기
	$(".pagingNumber").html(
		getPagingNumber(
		"${upDelListAllCnt}", // 검색 결과 총 행 개수
		"${driverSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
		"5", // 페이지 당 출력행의 개수
		"10", // 페이지 당 보여줄 페이징번호 개수
		"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
		)
	);
	
});
	function upDelDriver(no){
		alert(no);
		
		var driver_no = no;
		
		alert(1);
		document.upDelDriverForm.driver_no.value=driver_no;
		document.upDelDriverForm.submit();
	}
	function goSearch(){
		alert(1);
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.driverSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword], [name=gender], [name=score]");
		inputData("selectPageNo","1");
		document.driverSearchForm.submit();
	}
</script>
<head>
<!-- Icons font CSS-->
<link
	href="/support/resources/vendor2/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="/support/resources/vendor2/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="/support/resources/vendor2/select2/select2.min.css"
	rel="stylesheet" media="all">
<link href="/support/resources/vendor2/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="/support/resources/css/main.css" rel="stylesheet"
	media="all">
<link href="/support/resources/css2/main.css" rel="stylesheet"
	media="all">



<link rel="icon" type="image/png"
	href="/support/resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="/support/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/support/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/support/resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="/support/resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="/support/resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/support/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/support/resources/css/main.css">



</head>
<body>

	<center>
		<h1>운전자 수정/삭제 리스트 UI</h1>
		<form class="driverSearchForm" name="driverSearchForm" method="post"
			action="/support/driverUpDelForm.do">
			<table class="tbcss1" width="800" border="1" bordercolor="#DDDDDD"
				cellpadding="5" align="center">
				<tr align="center">
					<th bgcolor="${headerColor}" colspan="6">운전자 검색</th>
				<tr align="center">
					<th bgcolor="${headerColor}" width=60>키워드
					<td width=250><input type="text" name="keyword">
					<th bgcolor="${headerColor}" width=60>성별
					<td width=150><input type="checkbox" name="gender"
						id="gender1" value="male">남자 <input type="checkbox"
						name="gender" id="gender2" value="female">여자
					<th bgcolor="${headerColor}">평점
					<td><select name="score">
							<option value=""></option>
							<option value="1">1점이하</option>
							<option value="2">1점~2점</option>
							<option value="3">2점~3점</option>
							<option value="4">3점~4점</option>
							<option value="5">4점~5점</option>
					</select>
			</table>
			<input type="hidden" name="selectPageNo">
			<!-- 
		<input type="hidden" name="ascDesc">
		<input type="hidden" name="selectOption"> -->
			<table>
				<tr height=4>
					<td>
			</table>
			<input type="button" value="검색" onClick="goSearch();"> <input
				type="button" value="전부검색" onClick="goSearchAll();"> <input
				type="reset" value="초기화"> 

		</form>
		<br> <br>
		<table border=0>

			<tr>

				<td align=right>검색 총 개수 : ${requestScope.upDelListAllCnt} 개
			<tr>
				<th align=center><span class="pagingNumber"></span>
			<tr>
				<td>

					<table class="tbcss2 accptList" border="0" cellspacing="0"
						cellpadding="5" rules="rows" frame="hsides" width=700px>
						<tr>
							<th>번호
							<th>운전자 이름
							<th>ID
							<th>면허증 번호
							<th>휴대폰
							<th>수정/삭제 <c:forEach items="${upDelList}" var="upDel"
									varStatus="loopTagStatus">
									<tr style="cursor: pointer">
										<td>${selectPageNo*rowCntPerPage-rowCntPerPage+1+loopTagStatus.index}
											<!-- 1증가일련번호-->
										<td>${upDel.driver_name}
										<td>${upDel.driver_id}
										<td>${upDel.driver_license_number}
										<td>${upDel.driver_phone}
										<td><input type="button" value="수정/삭제"
											onclick="upDelDriver(${upDel.driver_no})">
								</c:forEach>
					</table>
		</table>

		<br> ${requestScope.upDelListAllCnt==0? '  검색된 글이 없습니다.  ':''}
		
		<form name="upDelDriverForm" method="post"
			action="/support/driverUpDelDetailForm.do">
			<input type="hidden" name="driver_no" value="">
		</form>

	</center>
</body>
</html>