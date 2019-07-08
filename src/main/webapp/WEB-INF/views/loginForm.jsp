<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<html>
<script>
	$(document).ready(function() {
		
		//$(".admin_id").val("abc");
		//$(".pwd").val("abc123");
		inputData("id",'${cookie.id.value}');
		inputData("pwd",'${cookie.pwd.value}');
		
		<c:if test="${!empty cookie.id.value}">
		inputData("is_login","y")
		</c:if>
		
		//$('[name="loginForm"]').find('. login').click(function(){
	});
		
	function goRegForm(){
		document.goRegForm.submit();
	}
	function checkLoginForm() {
		// 입력된 아이디를 가져와 변수에 저장
		var id = $(".id").val();
		// 아이디를 입력 안했으면 경고하고 함수 중단
		if (id.split(" ").join("") == "") {
			$(".id").val("");
			alert("아이디를 입력하지 않았습니다.");
			return;
		}

		// 입력된 비밀번호를 가져와 변수에 저장
		var pwd = $(".pwd").val();
		// 비밀번호를 입력 안했으면 경고하고 함수 중단
		if (pwd.split(" ").join("") == "") {
			$(".pwd").val("");
			alert("비밀번호를 입력하지 않았습니다.");
			return;
		}
		$.ajax({
			url:"/support/loginProc.do",
			type:"post",	
			data: $("[name=loginForm]").serialize(),
			datatype:"html",
			success:function(data){
				if(data==1){
					alert("관리자 로그인 성공!");
					location.replace("/support/adminMainPage.do");
				}
				else if(data==3){
					alert("일반회원 로그인 성공!");
					location.replace("/support/userMainPage.do");
					
				}
				else if(data==5){
					alert("운전자 로그인 성공!");
					location.replace("/support/driverMainPage.do");
				}
				else if(data==-2){
					alert("승인되지 않거나 탈퇴한 회원입니다.");
				}
				else if(data==2||data==4||data==6){
					alert("비밀번호가 틀렸습니다.");
				}
				else{
					alert("존재하는 아이디가 없습니다");
				}
				
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		});

	}
</script>
<head>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/support/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/support/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/support/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="/support/resources/images/img-01.png" alt="IMG">
				</div>

				<form name="loginForm" method="post" action="/support/loginProc.do" class="login100-form validate-form">
					<span class="login100-form-title">
						교통약자이동지원센터
					</span>

					<div class="wrap-input100 validate-input" >
						<input class="input100 id" type="text" name="id" placeholder="ID(아이디)">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100 pwd" type="password" name="pwd" placeholder="Password(암호)">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<input type="button" class="login100-form-btn login" onclick="checkLoginForm();" value="로그인">
							
					
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="javascript:goRegForm();">
							회원가입
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<form name="goRegForm" method="get" action="/support/regForm.do"></form>
	

</body>
</html>