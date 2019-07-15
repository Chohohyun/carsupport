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
$("#driverEmail").hide();
});
function acceptEmail(type) {
	var email = $("[name=" + type + "RegForm] [name=email]").val();
	if (email_check(email) == false) {
		alert("올바른 이메일 형식이 아닙니다.");
		$("[name=" + type + "RegForm] [name=email]").focus();
		return;
	}
	$
			.ajax({
				url : "/support/checkEmail.do",
				type : "post",
				data : $("[name=" + type + "RegForm] [name=email]")
						.serialize(),
				datatype : "html",

				success : function(data) {
					if (data == 1) {
						alert("인증번호 전송 완료");

						if (type == 'user') {

							$("#userEmail").show();
							document.userRegForm.AuthenticationNumber.style.display = "block";
							document.userRegForm.AuthenticationNumberBtn.style.display = "block";
							var elem = document
									.getElementById("userEmailBtn");
							elem.value = "재전송";
							return;
						}
						if (type == 'driver') {
							alert(type);
							$("#driverEmail").show();
							document.driverRegForm.AuthenticationNumber.style.display = "block";
							document.driverRegForm.AuthenticationNumberBtn.style.display = "block";
							var elem = document
									.getElementById("driverEmailBtn");
							elem.value = "재전송";
							return;
						}
					} else if (data == 0) {
						alert("인증번호 db 문제실패");
					} else {

						alert("인증번호 전송실패");
					}
				},
				error : function() {
					alert("서버 접속 실패!");
				}

			});

}
function checkAuthenticationNumber(type) {
	var email = $("[name=" + type + "RegForm] [name=email]").val();

	var authenticationNumber = $(
			"[name=" + type + "RegForm] [name=AuthenticationNumber]").val();
	var map = {
		'email' : email,
		'authenticationNumber' : authenticationNumber
	};
	$.ajax({
		url : "/support/checkEmailAuth.do",
		type : "post",
		data : map,
		datatype : "html",

		success : function(data) {
			if (data == 1) {
				alert("인증번호 확인 완료");
				if (type == 'user') {
					$("#userEmail").hide();
					$("#userEmailText").attr("readonly", true);
					$("#userEmailBtn").attr("disabled", true);
					$("#userEmailBtn").removeClass("btn--red");
					$("#userEmailBtn").addClass("btn--gray");
					document.userRegForm.emailCheck.value = "1";
					return;
				} else {
					$("#driverEmail").hide();
					$("#driverEmailText").attr("readonly", true);
					$("#driverEmailBtn").attr("disabled", true);
					$("#driverEmailBtn").removeClass("btn--red");
					$("#driverEmailBtn").addClass("btn--gray");
					document.driverRegForm.emailCheck.value = "1";
					return;
				}
			} else if (data == 0) {
				alert("인증번호가 틀립니다. 다시확인해주세요.");
				return;
			} else {

				alert("인증번호 전송실패");
			}
		},
		error : function() {
			alert("서버 접속 실패!");
		}

	});

}
		
	function goMainPage(){
		location.replace("/support/adminMainPage.do");

	}
	
function goDriverRegForm() {
	var driverIdChk = $("[name=driverRegForm] [name=idChk]").val();

	if (driverIdChk== 0) {
		alert("아이디 중복확인을 먼저 해주세요.");
		$("[name=driverRegForm] [name=id]").focus();
		return;
	}
	var emailCheck = $("[name=driverRegForm] [name=emailCheck]").val();
	if (emailCheck == 0) {
		alert("이메일 인증을 먼저 받으세요.");
		return;
	}
	var driverId = $("[name=driverRegForm] [name=id]").val();
	if (id_check(driverId) == false) {
		alert("올바른 아이디형식이 아닙니다.");
		$("[name=driverRegForm] [name=id]").focus();
		return;
	}

	var driverPwd = $("[name=driverRegForm] [name=pwd1]").val();
	if (pwd_check(driverPwd) == false) {
		alert("올바른 암호형식이 아닙니다.");
		$("[name=driverRegForm] [name=pwd]").focus();
		return;
	}

	var pwd1 = $("[name=driverRegForm] [name=pwd1]").val();
	var pwd2 = $("[name=driverRegForm] [name=pwd2]").val();
	if (pwd2_check(pwd1, pwd2) == false) {
		$("[name=driverRegForm] [name=pwd2]").val("");
		$("[name=driverRegForm] [name=pwd2]").focus();
		return;
	}

	var name = $("[name=driverRegForm] [name=name]").val();
	if (name_check(name) == false) {
		alert("올바른 이름형식이 아닙니다.");
		$("[name=driverRegForm] [name=name]").val("");
		$("[name=driverRegForm] [name=name]").focus();
		return;
	}
	var gender = $("[name=driverRegForm] [name=gender]:checked").length;
	if (gender_check(gender) == false) {
		$("[name=driverRegForm] [name=gender]").focus();
		return;
	}

	var jumin_num1 = $("[name=driverRegForm] [name=jumin_num1]").val();
	var jumin_num2 = $("[name=driverRegForm] [name=jumin_num2]").val();
	alert(1);
	if (jumin_num_check(jumin_num1, jumin_num2) == false) {
		$("[name=driverRegForm] [name=jumin_num1]").focus();
		return;
	}

	var phone = $("[name=driverRegForm] [name=phone]").val();
	if (phone_check(phone) == false) {
		alert("올바른 핸드폰 번호 형식이 아닙니다.");
		$("[name=driverRegForm] [name=phone]").focus();
		return;
	}

	var postal_code = $("[name=driverRegForm] [name=postal_code]").val();
	if (is_empty2(postal_code) == false) {
		alert("주소를 검색해주세요.");
		return;
	}
	var email = $("[name=driverRegForm] [name=email]").val();
	if (email_check(email) == false) {
		alert("올바른 이메일 형식이 아닙니다.");
		$("[name=driverRegForm] [name=email]").focus();
		return;
	}

	var driver_license_number = $(
			"[name=driverRegForm] [name=driver_license_number]").val();
	if (driver_license_check(driver_license_number) == false) {
		alert("올바른 운전면허 형식이 아닙니다.");
		$("[name=driverRegForm] [name=driver_license_number]").focus();
		return;
	}

	if (confirm("가입하시겠습니까?") == false) {
		return;
	}
		alert($("[name=driverRegForm]").serialize());
		$.ajax({
			url:"/support/adminDriverRegForm.do",
			type:"post",
			data: $("[name=driverRegForm]").serialize(),
			datatype:"html",
			
			success:function(data){
				if(data==1){
					alert("운전자등록 성공!");
					

					location.replace("/support/adminMainPage.do");
				}
				else{
					alert("운전자등록 실패!");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
//**********************************
// 아이디 중복 체크 시도
//**********************************
function duplicationId(type) {
	var id = $("[name=" + type + "RegForm] [name=id]").val();
	if (id_check(id) == false) {
		alert("올바른 아이디형식이 아닙니다.");
		$("[name=" + type + "RegForm] [name=id]").focus();
		return;
	}
	$.ajax({
		url : "/support/idCheck.do",
		type : "post",
		data : $("[name=" + type + "RegForm] [name=id]").serialize(),
		datatype : "html",

		success : function(data) {
			if (data == 1) {
				alert("아이디가 이미 존재합니다! 다른 아이디를 적어주세요.");

				return;

			} else {
				if (confirm("사용가능한 아이디입니다. 사용하시겠습니까?") == false) {
					return;
				}
				$("#" + type + "Id").attr("readonly", true);
				$("[name=" + type + "RegForm] [name=idBtn]").removeClass(
						"btn--red");
				$("[name=" + type + "RegForm] [name=idBtn]").addClass(
						"btn--gray");
				$("#" + type + "IdBtn").attr("disabled", true);
				$("[name=" + type + "RegForm] [name=idChk]").val(1);
			}
		},
		error : function() {
			alert("에러다 이새끼야");
		}
	});
}
</script>
<!-- Jquery JS-->

<head>

<!-- Title Page-->
<title>회원가입</title>

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
<link rel="stylesheet" type="text/css"
	href="/support/resources/css2/main.css">


</head>

<body>
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">

				<div class="card-heading">
					<h2 class="title">운전자등록</h2>
				</div>
				<div class="card-body">



					<!-- ----------------------------------------------------------------------------------------------- -->

					
					<form name="driverRegForm" method="POST">

						<div class="form-row m-b-55">
							<div class="name">아이디</div>
							<div class="value">
								<div class="row row-refine">

									<div class="wrap-input50 input-group-desc">
										<input class="input100 input--style-5" type="text" name="id"
											id="driverId" placeholder="아이디"> <span
											class="focus-input100"></span>

									</div>

									&nbsp;&nbsp;&nbsp;
									<div class="wrap-input40 input-group-desc">
										<input type="button"
											class="login100-form-btn btn btn--radius-2 btn--red"
											name="idBtn" id="driverIdBtn"
											onclick="duplicationId('driver');" value="아이디중복확인"> <span
											class="focus-input100"></span>

									</div>
									<input type="hidden" name="idChk" id="driverIdChk" value="0">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">비밀번호</div>
							<div class="value">
								<div class="row row-refine">
									<div class="input-group wrap-input90">
										<input class="input100 input--style-5" type="password"
											name="pwd1" placeholder="비밀번호"> <span
											class="focus-input100"></span>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">비밀번호 확인</div>
							<div class="value">
								<div class="row row-refine">
									<div class="input-group wrap-input90">
										<input class="input100 input--style-5" type="password"
											name="pwd2" placeholder="비밀번호 확인"> <span
											class="focus-input100"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-row m-b-55">
							<div class="name">이름</div>
							<div class="value">
								<div class="row row-refine">
									<div class="row row-space">
										<div class="input-group wrap-input100">

											<input class="input100 input--style-5" type="text"
												name="name" placeholder="이름"> <span
												class="focus-input100"></span>

										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">성별</div>
							<div class="value">
								<div class="row row-refine">
									<div class="row row-space">
										<div class="input-group wrap-input100">
											<label class="radio-container m-r-55">남 <input
												type="radio" checked="checked" name="gender" value="1">
												<span class="checkmark"></span>
											</label> <label class="radio-container m-r-55">여 <input
												type="radio" checked="checked" name="gender" value="2">
												<span class="checkmark"></span>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">주민번호</div>
							<div class="value">

								<div class="row row-refine">

									<div class="wrap-input40 input-group-desc">
										<input class="input100 input--style-5"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											type="text" name="jumin_num1" placeholder="앞주민번호"> <span
											class="focus-input100"></span>

									</div>

									&nbsp;&nbsp;&nbsp;
									<div class="wrap-input50 input-group-desc">
										<input class="input100 input--style-5"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											type="password" name="jumin_num2" placeholder="뒷주민번호">

										<span class="focus-input100"></span>

									</div>
								</div>
							</div>
						</div>


						<div class="form-row m-b-55">
							<div class="name">주소</div>
							<div class="value">
								<div class="row row-refine">

									<div class="wrap-input40 input-group-desc">
										<input class="input100 input--style-5" id="driverpostal_code"
											onfocus="this.blur();" type="text" name="postal_code"
											placeholder="주소검색을 눌러주세요." readonly> <span
											class="focus-input100"></span>

									</div>

									&nbsp;&nbsp;&nbsp;
									<div class="wrap-input50 input-group-desc">
										<input type="button"
											class="login100-form-btn btn btn--radius-2 btn--red"
											onclick="searchPostal_code('driver')" value="주소검색"> <span
											class="focus-input100"></span>

									</div>
									<div class="wrap-input40 input-group-desc">

										<input class="input100 input--style-5" id="driverroad_addr"
											onfocus="this.blur();" type="text" name="road_addr"
											placeholder="주소검색을 눌러주세요." readonly> <span
											class="focus-input100"></span>

									</div>

									&nbsp;&nbsp;&nbsp;
									<div class="wrap-input50 input-group-desc">
										<input class="input100 input--style-5" id="driverjibun_addr"
											onfocus="this.blur();" type="text" name="jibun_addr"
											placeholder="주소검색을 눌러주세요." readonly> <span
											class="focus-input100"></span> <span id="guide"
											style="color: #999; display: none"></span>
									</div>
									<div class="wrap-input100 input-group-desc">

										<input class="input100 input--style-5" id="driverdetail_addr"
											type="text" name="detail_addr" placeholder="상세주소를 입력해주세요.">

										<span class="focus-input100"></span>
									</div>

								</div>
							</div>
						</div>


						<div class="form-row m-b-55">
							<div class="name">휴대폰번호</div>
							<div class="value">
								<div class="row row-refine">

									<div class="input-group wrap-input90">
										<input class="input100 input--style-5"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											type="text" name="phone" placeholder="휴대폰번호 숫자만 입력해주세요">

										<span class="focus-input100"></span>
									</div>
								</div>


							</div>
						</div>
						<div class="form-row m-b-55">
							<div class="name">이메일주소</div>
							<div class="value">
								<div class="row row-refine">

									<div class="wrap-input50 input-group-desc">
										<input class="input100 input--style-5" id="driverEmailText"
											type="text" name="email" placeholder="이메일주소"> <span
											class="focus-input100"></span>

									</div>

									&nbsp;&nbsp;&nbsp;
									<div class="wrap-input40 input-group-desc">

										<input type="button" name="checkEmailBtn" id="driverEmailBtn"
											class="login100-form-btn btn btn--radius-2 btn--red"
											onclick="acceptEmail('driver')" value="인증번호받기"> <span
											class="focus-input100"></span>

									</div>
								</div>
							</div>
						</div>
						<div class="form-row m-b-55" id="driverEmail">
							<div class="name">인증번호</div>
							<div class="value">
								<div class="row row-refine">

									<div class="wrap-input50 input-group-desc">
										<input class="input100 input--style-5" type="text"
											name="AuthenticationNumber" placeholder="인증번호입력"> <span
											class="focus-input100"></span>

									</div>

									&nbsp;&nbsp;&nbsp;
									<div class="wrap-input40 input-group-desc">

										<input type="button" name="AuthenticationNumberBtn"
											class="login100-form-btn btn btn--radius-2 btn--red"
											onclick="checkAuthenticationNumber('driver')" value="확인">
										<span class="focus-input100"></span>

									</div>
								</div>
							</div>
						</div>

						<input type="hidden" name="emailCheck" value="0">

						<div class="form-row m-b-55">
							<div class="name">면허증번호</div>
							<div class="value">
								<div class="row row-refine">
									<div class="input-group wrap-input90">
										<input class="input100 input--style-5" type="text"
												name="driver_license_number" placeholder="면허증번호"> 
										<span class="focus-input100"></span>
									</div>
									
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">

							<div class="wrap-input40 input-group-desc">

								<input type="button"
									class=" login100-form-btn btn btn--radius-2 btn--red"
									onclick="goDriverRegForm();" value="가입"> <span
									class="focus-input100"></span>

							</div>

							&nbsp;&nbsp;&nbsp;
							<div class="wrap-input40 input-group-desc">


								<input type="button"
									class="login100-form-btn btn btn--radius-2 btn--green"
									type="button" onclick="goMainPage();" value="취소"> <span
									class="focus-input100"></span> <input type="hidden"
									name="admission_code" value="y">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



</body>
</html>