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
	createCarList();
	inputData("car_number","${carSearchDTO.car_number}");
	inputData("carList","${carSearchDTO.car_number}");
	inputData("keyword","${carSearchDTO.keyword}");
	inputData("car_code","${carSearchDTO.car_code}");
	inputData("selectPageNo","${carSearchDTO.selectPageNo}");
	inputData("maintance_year","${carSearchDTO.maintance_year}");
	inputData("maintance_month","${carSearchDTO.maintance_month}");
	inputData("maintance_code","${carSearchDTO.maintance_code}");
	
	
	// 페이징 처리 관련 html 소스를 class= pagingNumber 가진 태그 안에 삽입하기
	$(".pagingNumber").html(
		getPagingNumber(
		"${carMaintanceListAllCnt}", // 검색 결과 총 행 개수
		"${carSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
		"5", // 페이지 당 출력행의 개수
		"10", // 페이지 당 보여줄 페이징번호 개수
		"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
		)
	);
}); 

	function searchCar(){
		var car_number = $('[name=carList]').val();
		alert(car_number);
		document.carMaintanceListSearchForm.car_number.value=car_number;
		document.carMaintanceListSearchForm.submit();
		
	}
	 
	function goCarMaintanceUpDelDetailForm(car_maintance_info_no){
		alert(car_maintance_info_no);
		
		$("[name=carMaintanceContent] [name=car_maintance_info_no]").val( car_maintance_info_no );
		document.carMaintanceContent.submit();
	}
	
	function createCarList(){
    	alert(1);
		var carList = [];
    	$.ajax({
			url:"/support/carList.do"
			,type:"post"
			,datatype: "application/json"
			,success : function(data){
				var datalen = data.length;
				alert(datalen)
				for(var i=0; i<datalen; i++){
					carList[i] = data[i].car_number;
					var option = $("<option value="+data[i].car_number+">"+carList[i]+"</option>");
					$('[name=carList]').append(option);
		        	inputData("carList", "${carSearchDTO.car_number}" );
				}
			
			
			}
			,error:function(){
				alert("서버 접속 실패!");			
			}
		});
	}
	function goSearch(){
		alert(1);
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.carMaintanceListSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword], [name=car_code], [name=carList], [name=maintance_code]");
		setEmpty2(" [name=maintance_year], [name=maintance_month]");
		inputData("selectPageNo","1");
		document.carMaintanceListSearchForm.submit();
	}

</script>
<head>

</head>
    <body>
    <center><h1>차량 정비 수정/삭제 리스트 UI</h1><br><br>
    
    <form class="carMaintanceListSearchForm" name="carMaintanceListSearchForm" method="post" action="/support/carMaintanceListForm.do">
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
			<tr align="center">
			<th bgcolor="${headerColor}">정비일
			<td width="250"><select name="maintance_year">
											<option value=""></option>
											<option value="2000">2000</option>
											<option value="2001">2001</option>
											<option value="2002">2002</option>
											<option value="2003">2003</option>
											<option value="2004">2004</option>
											<option value="2005">2005</option>
											<option value="2006">2006</option>
											<option value="2007">2007</option>
											<option value="2008">2008</option>
											<option value="2009">2009</option>
											<option value="2010">2010</option>
											<option value="2011">2011</option>
											<option value="2012">2012</option>
											<option value="2013">2013</option>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>
										년 
										<select name="maintance_month" >
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
			<th bgcolor="${headerColor}">정비종류
			<td width="250"><select name="maintance_code">
											<option value=""></option>
											<option value="1">엔진오일교체</option>
											<option value="2">타이어교체</option>
											<option value="3">연료휠터교환</option>
											<option value="4">부동액충전</option>
											<option value="5">하부점검</option>
											<option value="6">범퍼교체</option>
											<option value="7">기타</option>
											
										</select>
		</table>
		<input type="hidden" name="selectPageNo">
		<input type="hidden" name="car_number">
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
			
			<tr>
			
			<td align=right> 검색 총 개수 : ${requestScope.carMaintanceListAllCnt} 개
			<tr>
			<td align=right><select name="carList"  onchange="searchCar()">
			<option value="">차량선택</option>
			</select>
			<tr><th align=center><span class="pagingNumber"></span>
			<tr><td>
			
				<table class="tbcss2 carMaintanceList" border="0" cellspacing="0" cellpadding="5" rules="rows" frame="hsides" width=700px>	
				<tr><th>번호<th>차량번호<th>차량정비날짜<th>수정/삭제

				<c:forEach items="${requestScope.carMaintanceList}" var="car" varStatus="loopTagStatus">
					<tr style="cursor:pointer" onClick="gocarContentForm( ${car.car_maintance_info_no} )" >
						<td>${selectPageNo*rowCntPerPage-rowCntPerPage+1+loopTagStatus.index}   <!-- 1증가일련번호-->						
						<td>${car.car_number}
						<td>${car.car_maintance_date}
						<td><input type="button" value="수정/삭제" onClick="goCarMaintanceUpDelDetailForm( ${car.car_maintance_info_no} )">								
				</c:forEach>
				
			</table>
		</table>
	
		<br>
		${requestScope.carListAllCnt==0? '  검색된 글이 없습니다.  ':''}
		
		
		
		
	<!-- 	
		<input type="hidden" name="keyword" value="${keyword}">
	-->
		<form name="carMaintanceContent" method="post" action="/support/carMaintanceContent.do">
			<input type="hidden" name="car_maintance_info_no">
		</form>
		
		<form name="searchCarForm" method="post" action="/support/carMaintanceListForm.do">
			
		</form>
	 
	</center>
    </body>
</html>