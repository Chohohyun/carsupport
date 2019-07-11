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
	function goFindIdProc() {

		
		var name = $("[name=findIdForm] [name=name]").val();
		if(name_check(name)==false){
			alert("올바른 이름형식이 아닙니다.");
			$("[name=findIdForm] [name=name]").val("");
			$("[name=findIdForm] [name=name]").focus();
			return;
		}

		var phone = $("[name=findIdForm] [name=phone]").val();
		if(phone_check(phone)==false){
			alert("올바른 핸드폰 번호 형식이 아닙니다.");
			$("[name=findIdForm] [name=phone]").focus();
			return;
		}
		
		 $.ajax({
			url:"/support/findIdProc.do",
			type:"post",
			data: $("[name=findIdForm]").serialize(),
			dataType : 'json' ,
			
			success:function(result){
				var data = JSON.stringify(result.id);

				if(data!="null" && data.length!=0){
					alert("찾으시는 아이디는  "+data+"  입니다.");
				}
				else{
					alert("일치하는 아이디가 존재하지 않습니다.");
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
<title>아이디찾기</title>

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
					<h2 class="title">아이디찾기</h2>
				</div>
				<div class="card-body">
					<center>
					
						<br> <br>
					</center>
					<form name="findIdForm" method="POST">


						
						<div class="form-row m-b-55">
							<div class="name">이름</div>
							<div class="value">
								<div class="row row-refine">
									
									<div class="col-9">
										<div class="input-group wrap-input100">
											<input class="input100 input--style-5"
												type="text" name="name" placeholder="이름">

											<span class="focus-input100"></span>
											<!-- <label class="label--desc">Phone Number</label> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="form-row m-b-55">
							<div class="name">휴대폰번호</div>
							<div class="value">
								<div class="row row-refine">
									
									<div class="col-9">
										<div class="input-group wrap-input100">
											<input class="input100 input--style-5"
												onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
												type="text" name="phone" placeholder="휴대폰번호 숫자만 입력해주세요">

											<span class="focus-input100"></span>
											<!-- <label class="label--desc">Phone Number</label> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-row m-b-55">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                                           
                            <input type="button" class=" login100-form-btn btn btn--radius-2 btn--red" onclick="goFindIdProc();" value="찾기">
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