<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<html>
<script>
	$(document).ready(function() {
		

		document.driverRegForm.style.display="none";

	});
		
	function changeToUser(){

		document.driverRegForm.style.display="none";
		document.userRegForm.style.display="block";

		$("[name=userRegFormBtn]").removeClass("btn--blue");
		$("[name=userRegFormBtn]").addClass("btn--red");
		$("[name=driverRegFormBtn]").removeClass("btn--red");
		$("[name=driverRegFormBtn]").addClass("btn--blue");
	}
	function changeToDriver(){

		document.userRegForm.style.display="none";
		document.driverRegForm.style.display="block";

		$("[name=driverRegFormBtn]").removeClass("btn--blue");
		$("[name=driverRegFormBtn]").addClass("btn--red");
		$("[name=userRegFormBtn]").removeClass("btn--red");
		$("[name=userRegFormBtn]").addClass("btn--blue");
	}
		
	function goLoginForm(){
		location.replace("/support/loginForm.do");

	}
	function goUserRegForm() {

		alert(1);
		 $.ajax({
			url:"/support/userRegForm.do",
			type:"post",
			data: $("[name=userRegForm]").serialize(),
			datatype:"html",
			
			success:function(data){
				if(data==1){
					alert("회원가입 성공!");
					location.replace("/support/loginForm.do");

				}
				else{
					alert("회원가입 실패!");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
function goDriverRegForm() {
		alert(1);
		$.ajax({
			url:"/support/driverRegForm.do",
			type:"post",
			data: $("[name=driverRegForm]").serialize(),
			datatype:"html",
			
			success:function(data){
				if(data==1){
					alert("회원가입 성공!");
					

				}
				else{
					alert("회원가입 실패!");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
</script> <!-- Jquery JS-->
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
                 <div class="form-row m-b-55">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                                            <input type="button" class="login100-form-btn btn btn--radius-2 btn--red" name = "userRegFormBtn" onclick="changeToUser();" value="일반회원">
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input40 input-group-desc">
                                        
               						 <input type="button" class="login100-form-btn btn btn--radius-2 btn--blue" name = "driverRegFormBtn"  onclick="changeToDriver();"value="운전자">
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         
                            </div>
               
                <br>
                <br>
                </center>
                    <form name="userRegForm" method="POST">
                        
                        <div class="form-row">
                            <div class="name">아이디</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="text" name="id" placeholder="아이디">
                                    
                                           <span class="focus-input100"></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">비밀번호</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="password" name="pwd1" placeholder="비밀번호">
                                    
                                           <span class="focus-input100"></span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">비밀번호 확인</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="password" name="pwd2" placeholder="비밀번호 확인">
                                    
                                           <span class="focus-input100"></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">이름</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                                       
                                           <input class="input100 input--style-5" type="text" name="name" placeholder="이름">
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
                                   		 <input type="radio" checked="checked" name="gender" value="1">
                                    		<span class="checkmark"></span>
                               			 </label>
                               			 <label class="radio-container m-r-55">여
                                   		 <input type="radio" checked="checked" name="gender" value="2">
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
                                 	 
                                        <div class="wrap-input40 input-group-desc">
                                            <input class="input100 input--style-5" type="text" name="jumin_num1" placeholder="앞주민번호">
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                                            <input class="input100 input--style-5" type="password" name="jumin_num2" placeholder="뒷주민번호">
                                            
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
                      						  <input class="input100 input--style-5" id="postal_code"  type="text" name="postal_code" >
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                        					<input type="button" class="login100-form-btn btn btn--radius-2 btn--red" onclick="searchPostal_code()" value="주소검색">
                                            
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         <div class="wrap-input40 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="road_addr"  type="text" name="road_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        
                                        </div>
                                        
                                 			  &nbsp;&nbsp;&nbsp;
                                          <div class="wrap-input50 input-group-desc">
                    					<input class="input100 input--style-5" id="jibun_addr" type="text" name="jibun_addr" >
                                            
                                           <span class="focus-input100"></span>
                                          
										<span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="wrap-input100 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="detail_addr"  type="text" name="detail_addr" >
                       					
                                           <span class="focus-input100"></span>
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
                                            <input class="input100 input--style-5" type="text" name="phone" placeholder="휴대폰번호">
                                            
                                           <span class="focus-input100"></span>
                                            <!-- <label class="label--desc">Phone Number</label> -->
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
                                            <input class="input100 input--style-5" type="text" name="email" placeholder="이메일주소">
                                            
                                           <span class="focus-input100"></span>
                                         <!--    <label class="label--desc">Phone Number</label> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">장애구분</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="disability_type">
                                            <option disabled="disabled" selected="selected" value="">Choose option</option>
                                        	<option value="1">신장</option>
											<option value="2">지체</option>
											<option value="3">뇌병변</option>
											<option value="4">지적</option>
											<option value="5">시각</option>
											<option value="6">호흡기</option>
											<option value="7">자폐</option>
											<option value="8">간질</option>
											<option value="9">정신</option>
											<option value="10">청각</option>
											<option value="11">언어</option>
											<option value="12">척추</option>
											<option value="12">장애</option>
											<option value="13">발달</option>
											<option value="14">노인</option>
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
                                        <select name="disability_grade">
                                            <option disabled="disabled" selected="selected" value="">Choose option</option>
                                            <option value="1">1급</option>
											<option value="2">2급</option>
											<option value="3">등급외</option>
											<option value="4">3급</option>
											<option value="5">중증</option>
											<option value="6">경증(등급 외)</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-row m-b-55">
                            <div class="name">휠체어</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                               			 <label class="radio-container m-r-55">사용
                                   		 <input type="radio" checked="checked" name="wheelchair" value="1">
                                   		 
                                    		<span class="checkmark"></span>
                               			 </label>
                               			 <label class="radio-container m-r-55">미사용
                                   		 <input type="radio" checked="checked" name="wheelchair" value="2">
                                    		<span class="checkmark"></span>
                               			 </label>
                                </div>
                               </div>
                            </div>
                        </div>
                       
                   
                        <div class="form-row m-b-55">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                                           
                            <input type="button" class=" login100-form-btn btn btn--radius-2 btn--red" onclick="goUserRegForm();" value="가입">
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input40 input-group-desc">
                                        
               						 
                            <input type="button" class="login100-form-btn btn btn--radius-2 btn--green" type="button" onclick="goLoginForm();" value="취소">
                               <span class="focus-input100"></span>
                                          
                                        </div>
                                         
                          
               
                        <center> </center>
                        </div>
                    </form>
                    
                    
                    <!-- ----------------------------------------------------------------------------------------------- -->
                    
                      <form name="driverRegForm" method="POST">
                        
                        <div class="form-row">
                            <div class="name">아이디</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="text" name="id" placeholder="아이디">
                                    
                                           <span class="focus-input100"></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">비밀번호</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="password" name="pwd1" placeholder="비밀번호">
                                    
                                           <span class="focus-input100"></span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">비밀번호 확인</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="password" name="pwd2" placeholder="비밀번호 확인">
                                    
                                           <span class="focus-input100"></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">이름</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                                       
                                           <input class="input100 input--style-5" type="text" name="name" placeholder="이름">
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
                                   		 <input type="radio" checked="checked" name="gender" value="1">
                                    		<span class="checkmark"></span>
                               			 </label>
                               			 <label class="radio-container m-r-55">여
                                   		 <input type="radio" checked="checked" name="gender" value="2">
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
                                 	 
                                        <div class="wrap-input40 input-group-desc">
                                            <input class="input100 input--style-5" type="text" name="jumin_num1" placeholder="앞주민번호">
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                                            <input class="input100 input--style-5" type="password" name="jumin_num2" placeholder="뒷주민번호">
                                            
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
                      						  <input class="input100 input--style-5" id="postal_code"  type="text" name="postal_code" >
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                        					<input type="button" class="login100-form-btn btn btn--radius-2 btn--red" onclick="searchPostal_code()" value="주소검색">
                                            
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         <div class="wrap-input40 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="road_addr"  type="text" name="road_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        
                                        </div>
                                        
                                 			  &nbsp;&nbsp;&nbsp;
                                          <div class="wrap-input50 input-group-desc">
                    					<input class="input100 input--style-5" id="jibun_addr" type="text" name="jibun_addr" >
                                            
                                           <span class="focus-input100"></span>
                                          
										<span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="wrap-input100 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="detail_addr"  type="text" name="detail_addr" >
                       					
                                           <span class="focus-input100"></span>
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
                                            <input class="input100 input--style-5" type="text" name="phone" placeholder="휴대폰번호">
                                            
                                           <span class="focus-input100"></span>
                                            <!-- <label class="label--desc">Phone Number</label> -->
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
                                            <input class="input100 input--style-5" type="text" name="email" placeholder="이메일주소">
                                            
                                           <span class="focus-input100"></span>
                                         <!--    <label class="label--desc">Phone Number</label> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-row m-b-55">
                            <div class="name">면허증번호</div>
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
                                            <input class="input100 input--style-5" type="text" name="driver_license_number" placeholder="면허증번호">
                                            
                                           <span class="focus-input100"></span>
                                            <!-- <label class="label--desc">Phone Number</label> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                       <div class="form-row m-b-55">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                                           
                            <input type="button" class=" login100-form-btn btn btn--radius-2 btn--red" onclick="goDriverRegForm();" value="가입">
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