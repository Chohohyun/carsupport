<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<html>
<script>
	
	function upDelUser(no){
		alert(no);
		
		var user_no = no;
		
		alert(1);
		document.upDelUserForm.user_no.value=user_no;
		document.upDelUserForm.submit();
	}
</script>
<head>
   <!-- Icons font CSS-->
    <link href="/support/resources/vendor2/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="/support/resources/vendor2/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/support/resources/css/main.css" rel="stylesheet" media="all">
    <link href="/support/resources/css2/main.css" rel="stylesheet" media="all">
    
    
    
	<link rel="icon" type="image/png" href="/support/resources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/main.css">
    
    
        
</head>
    <body>
    <center>회원정보 관리<br><br>
       <table border=1	class="" cellpadding=5	cellspacing=0> 
            <tr><th>번호<th>회원이름<th>회원ID<th>휴대폰<th>수정/삭제
				<c:forEach items="${upDelList}" var="upDel" varStatus="loopTagStatus"> 
 				<tr style="cursor: pointer"> 
 					<td>${loopTagStatus.index+1} 							
 					<td>${upDel.user_name} 
 					<td>${upDel.user_id}
 					<td>${upDel.user_phone}
 					<td><input type="button" value="수정/삭제" onclick="upDelUser(${upDel.user_no})"> 
 				</c:forEach> 

	  			<form name="upDelUserForm" method="post" action="/support/userUpDelDetailForm.do">
	  			<input type="hidden" name="user_no" value="" >
	  			</form> 
	</table>

</center>
    </body>
</html>