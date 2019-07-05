<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<script>
	$(document).ready(function() {
		
		//$(".admin_id").val("abc");
		//$(".pwd").val("abc123");
		inputData("admin_id",'${cookie.admin_id.value}');
		inputData("pwd",'${cookie.pwd.value}');
		
		<c:if test="${!empty cookie.admin_id.value}">
		inputData("is_login","y")
		</c:if>
		
		$("[name=loginForm] .login").click(function() {
			checkLoginForm();
		});
		//$('[name="loginForm"]').find('. login').click(function(){
	});
		
	function goRegForm(){
		document.goRegForm.submit();
	}
	function checkLoginForm() {
		// 입력된 아이디를 가져와 변수에 저장
		var admin_id = $(".admin_id").val();
		// 아이디를 입력 안했으면 경고하고 함수 중단
		if (admin_id.split(" ").join("") == "") {
			$(".admin_id").val("");
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

		if (is_empty("login_option")) {
			alert("로그인할 페이지를 선택해 주십시요");
			$("[name='login_option']").focus();
			return;
		}
		alert( $('[name="login_option"]:checked').val());

		$.ajax({
			url:"/erp/loginProc.do",
			type:"post",
			// 일일이 써야함
			//data:{'admin_id':admin_id, 'pwd':pwd}
			// 여러개도 가능	
			data: $("[name=loginForm]").serialize(),
			datatype:"html",
			/* success:function(html){
				var idCnt = $(html).text();
				alert(idCnt);
				idCnt = idCnt.split(" ").join("");
				if(idCnt==1){
					alert("로그인 성공!");
					//location.replace("/erp/boardListForm.do");
				}
				else{
					alert("로그인 실패!");
				}
			}, */
			success:function(data){
				if(data==1){
					alert("로그인 성공!");
/* 
					 만약 post 방식으로 "erp/boardListForm.do 에 접근하고 싶다면?
							
					 POST 방식으로 보내려고 할 때 여기에 폼 하나 만들고 폼을 SUBMIT 
					
						<form name="boardListForm" method="post" action="/erp/boardListForm.do">
						</form>  */
							// body태그 하단에 폼태그를 선언하고
							// location.replace 대신 아래 코드를 사용한다.
					// document.boardListForm.submit();

					if($('[name="login_option"]:checked').val() == 1){

						location.replace("/erp/boardListForm.do");
					}
					else{

						location.replace("/erp/contactSearchForm.do");	
					}
				}
				else{
					alert("로그인 실패!");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		});

	}
</script>
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

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="id" placeholder="ID(아이디)">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pwd" placeholder="Password(암호)">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn login">
							로그인
						</button>
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
	
	<form name="goRegForm" method="get" action="/support/goRegForm.do"></form>
	
<!--===============================================================================================-->	
	<script src="/support/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/support/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/support/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/support/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/support/resources/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="/support/resources/js/main.js"></script>

</body>
</html>