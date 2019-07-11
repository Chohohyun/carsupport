<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<html>
<script>
	$(document).ready(function() {
		

	

	});
		
	
	function goLoginForm(){
		location.replace("/support/loginForm.do");

	}
	function goFindPwdProc() {

		
		var id = $("[name=findPwdForm] [name=id]").val();
		if(id_check(id)==false){
			alert("올바른 아이디형식이 아닙니다.");
			$("[name=findPwdForm] [name=id]").focus();
			return;
		}

		var email = $("[name=findPwdForm] [name=email]").val();
		if(email_check(email)==false){
			alert("올바른 이메일 형식이 아닙니다.");
			$("[name=findPwdForm] [name=email]").focus();
			return;
		}
		
		 $.ajax({
			url:"/support/findPwdProc.do",
			type:"post",
			data: $("[name=findPwdForm]").serialize(),
			dataType : 'html' ,
			
			success:function(data){
				if(data==1){
					alert("임시비밀번호를 해당 이메일로 전송하였습니다.");
					location.replace("/support/loginForm.do");
				}
				else{
					alert("일치하는 아이디가 없습니다.");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
</script>
<!-- Jquery JS-->

<head>

<!-- Title Page-->
<title>비밀번호찾기</title>

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

<link href="/support/resources/css2/main.css" rel="stylesheet"
	media="all">
<link href="/support/resources/css/main.css" rel="stylesheet"
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
					<h2 class="title">비밀번호찾기</h2>
				</div>
				<div class="card-body">
					<center>
					
						<br> <br>
					</center>
					<form name="findPwdForm" method="POST">


						
						<div class="form-row m-b-55">
							<div class="name">아이디</div>
							<div class="value">
								<div class="row row-refine">
									
									<div class="col-9">
										<div class="input-group wrap-input100">
											<input class="input100 input--style-5"
												type="text" name="id" placeholder="아이디">

											<span class="focus-input100"></span>
											<!-- <label class="label--desc">Phone Number</label> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="form-row m-b-55">
							<div class="name">이메일</div>
							<div class="value">
								<div class="row row-refine">
									
									<div class="col-9">
										<div class="input-group wrap-input100">
											<input class="input100 input--style-5"
												type="text" name="email" placeholder="이메일">

											<span class="focus-input100"></span>
											<!-- <label class="label--desc">Phone Number</label> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-row m-b-55">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                                           
                            <input type="button" class=" login100-form-btn btn btn--radius-2 btn--red" onclick="goFindPwdProc();" value="찾기">
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input40 input-group-desc">
                                        
               						 
                            <input type="button" class="login100-form-btn btn btn--radius-2 btn--green" type="button" onclick="goLoginForm();" value="취소">
                               <span class="focus-input100"></span>
                          </div>           
                       </div>    
					</form>
				</div>
			</div>
		</div>
	</div>



</body>
</html>