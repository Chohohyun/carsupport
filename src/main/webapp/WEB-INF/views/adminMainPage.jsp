<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 

body, div, ul, li, table, tr, td, th{margin:0px; padding:0px;}

ul, li{list-style:none;}

body {
	font-family: NanumGothic, '나눔고딕', NanumGothicWeb, "Malgun Gothic",Gulim,sans-serif;
	/*background: #ddd;*/
	font-size:10px;
}

#wrap {
	width:100%;
	position: relative;
}

#header {
	width:100%;
	background:#000;

}

/*
style 소스의 type = text를 제어하는 css로 한다.
a:link : 클릭하지 않은 링크
a:visited : 한번 클릭했던 혹은 다녀갔던 링크
a:hover : 링크를 클릭하려고 마우스를 가져갔을 때
decoration : 밑줄
none : 없는 상태
underline : 있는 상태
a:active : 링크부분에서 마우스를 누르고 있는 동안의 상태*/

a:link { color: white; text-decoration: none;}
a:visited { color: white; text-decoration: none;}
a:hover { color: white; text-decoration: underline;}

/*네비게이션 색상*/

.navi_bg{
	background:#222;
}

/*네비게이션 전체 영역 제어*/

.nav {
	height:35px;
	list-style: none;
	width:840px;
	margin:auto;
	background: #222;
	font-size: 12px;
	color:#fff;
}

/*주메뉴 영역 제어*/

.topnav{
	text-align:center;
	width:100px;
	height:15px;
	cursor:pointer;
	font-weight:bold;
}

/*주메뉴 마우스 오버시*/

.topnav:hover{
	color:#d3d3d3;
}

/*주메뉴,서브메뉴 한묶음 제어*/

.navi_set{
	float: left;
	padding:10px;
	position: relative;
}

/*서브메뉴 전체영역 제어*/

.subnav{
	position: absolute;
	left: 0; top: 35px;
	background: #333;
	display: none;

}

/*서브메뉴 한칸 제어*/

.subnav li{
	padding:10px;
	width:100px;
	text-align:center;
	border-bottom:1px solid #222;
	border-top:1px solid #444;
	cursor:pointer;
}

/*서브메뉴 마우스 오버시*/

.subnav li:hover{
	background:#555;
}

</style>

<link type="text/css" href="./css/style.css" rel="stylesheet" />
<script>
function driverAcceptForm(){
		location.replace("/support/driverAcceptForm.do");
	}

	function driverRegForm(){
		location.replace("/support/driverRegForm.do");
	}
	function driverUpDelForm(){
		location.replace("/support/driverUpDelForm.do");
	}
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function(){  
	  
		$(".topnav").hover(function() { //마우스를 topnav에 오버시
			$(this).parent().find(".subnav").slideDown('normal').show(); //subnav가 내려옴.
			$(this).parent().hover(function() {  
			}, function(){  
				$(this).parent().find(".subnav").slideUp('fast'); //subnav에서 마우스 벗어났을 시 원위치시킴  
			});  
		});  
	  
	});  
</script>


 <!-- Title Page-->
    <title>회원가입</title>

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
<div id="wrap">
	<div id="header">	
			<div class="navi_bg">
				<div class="nav">  

					<li class="navi_set">  
						<div class="topnav" onclick="top.location.href='http://blog.naver.com/hyoyeol';">HOME</div>
					</li>  

					<li class="navi_set">  
						<div class="topnav">차량관리</div>
						<ul class="subnav">  
							<li><a href="#">차량 등록</a></li>  
							<li><a href="#">차량 수정/삭제</a></li> 
							<li><a href="#">차량 정보</a></li>  
							<li><a href="#">차량별 정비내역</a></li>  
						</ul>  
					</li> 
					
					<li class="navi_set">  
						<div class="topnav">운전자관리</div>
						<ul class="subnav">  
								 <li>
	<a href="javascript:driverAcceptForm();">운전자 승인</a></li>
		 <li>
      <a href="javascript:driverRegForm();">운전자 등록</a></li>
		 <li>
      <a href="javascript:driverUpDelForm();">운전자 수정/삭제</a></li>  
						</ul>  
					</li> 

					<li class="navi_set">  
						<div class="topnav">회원관리</div>
						<ul class="subnav">  
							<li><a href="#">회원 등록</a></li>  
							<li><a href="#">회원 수정/삭제</a></li>  
						</ul>  
					</li>

					<li class="navi_set">  
						<div class="topnav">게시판관리</div>
						<ul class="subnav">  
							<li><a href="#">Q/A 게시판</a></li>  
							<li><a href="#">불만게시판</a></li>  
						</ul>  
					</li> 

					<li class="navi_set">  
						<div class="topnav">통계관리</div>
						<ul class="subnav">  
							<li><a href="#">차량 통계</a></li>  
							<li><a href="#">운전자 통계</a></li> 
							<li><a href="#">회원 통계</a></li>  
						</ul>  
					</li>
				
					<li class="navi_set">  
						<div class="topnav" onclick="top.location.href='http://blog.naver.com/hyoyeol';">로그아웃</div> 
					</li>

				</div>
			</div>
	</div>
</div>  
</body>
</html>
