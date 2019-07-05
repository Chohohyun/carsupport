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
<head>
   
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
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
           
                <div class="card-heading">
                    <h2 class="title">회원가입</h2>
                </div>
                <div class="card-body">
                 <center>
                <button class="btn btn--radius-2 btn--red" >장애인</button>
                <button class="btn btn--radius-2 btn--blue" >운전자</button>
                <br>
                <br>
                </center>
                    <form method="POST">
                        
                        <div class="form-row">
                            <div class="name">아이디</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="text" name="company">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">암호</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="email" name="email">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">암호재입력</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="email" name="email">
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">이름</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                                       
                                           <input class="input100 input--style-5" type="text" name="last_name" placeholder="이름">
                                           <span class="focus-input100"></span>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-row m-b-55">
                            <div class="name">성별</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                               			 <label class="radio-container m-r-55">남
                                   		 <input type="radio" checked="checked" name="exist">
                                    		<span class="checkmark"></span>
                               			 </label>
                               			 <label class="radio-container m-r-55">여
                                   		 <input type="radio" checked="checked" name="exist">
                                    		<span class="checkmark"></span>
                               			 </label>
                                </div>
                               </div>
                            </div>
                        </div>
                        
                         <div class="form-row m-b-55">
                            <div class="name">주민번호</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc  wrap-input100">
                                            <input class="input100 input--style-5" type="text" name="area_code">
                                        
                                        </div>
                                    </div> 
                                    <div class="col-9">
                                        <div class="input-group-desc  wrap-input100">
                                            <input class="input100 input--style-5" type="text" name="phone">
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-row m-b-55">
                            <div class="name">이메일주소</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <!-- <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="area_code">
                                            <label class="label--desc">Area Code</label>
                                        </div>
                                    </div> -->
                                    <div class="col-9">
                                        <div class="input-group-desc  wrap-input100">
                                            <input class="input100 input--style-5" type="text" name="phone">
                                            <label class="label--desc">Phone Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-row m-b-55">
                            <div class="name">휴대폰번호</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <!-- <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="area_code">
                                            <label class="label--desc">Area Code</label>
                                        </div>
                                    </div> -->
                                    <div class="col-9">
                                        <div class="input-group-desc wrap-input100">
                                            <input class="input100 input--style-5" type="text" name="phone">
                                            <label class="label--desc">Phone Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">장애유형</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="subject">
                                            <option disabled="disabled" selected="selected">Choose option</option>
                                            <option>Subject 1</option>
                                            <option>Subject 2</option>
                                            <option>Subject 3</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">장애등급</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="subject">
                                            <option disabled="disabled" selected="selected">Choose option</option>
                                            <option>Subject 1</option>
                                            <option>Subject 2</option>
                                            <option>Subject 3</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row p-t-20">
                            <label class="label label--block">휠체어</label>
                            <div class="p-t-15">
                                <label class="radio-container m-r-55">Yes
                                    <input type="radio" checked="checked" name="exist">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="radio-container">No
                                    <input type="radio" name="exist">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Subject</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="subject">
                                            <option disabled="disabled" selected="selected">Choose option</option>
                                            <option>Subject 1</option>
                                            <option>Subject 2</option>
                                            <option>Subject 3</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                        <div class="form-row p-t-20">
                            <label class="label label--block">Are you an existing customer?</label>
                            <div class="p-t-15">
                                <label class="radio-container m-r-55">Yes
                                    <input type="radio" checked="checked" name="exist">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="radio-container">No
                                    <input type="radio" name="exist">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                        <div>
                        <center>
                            <button class="btn btn--radius-2 btn--red" type="submit">가입</button>
                            <button class="btn btn--radius-2 btn--green" type="submit">취소</button>
                            </center>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="/support/resources/vendor2/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="/support/resources/vendor2/select2/select2.min.js"></script>
    <script src="/support/resources/vendor2/datepicker/moment.min.js"></script>
    <script src="/support/resources/vendor2/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/support/resources/js2/global.js"></script>


<!-- end document-->
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