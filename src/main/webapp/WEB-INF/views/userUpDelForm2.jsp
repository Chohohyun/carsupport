<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="userMainPage.jsp" %>
<html>
<script>
	
		
	$(document).ready(function(){
		inputData("id","${userDTO.id}");
		inputData("pwd1","${userDTO.pwd1}");
		inputData("pwd2","${userDTO.pwd1}");
		inputData("name","${userDTO.name}");
		inputData("gender","${userDTO.gender}");
		inputData("jumin_num1","${userDTO.jumin_num1}");
		inputData("jumin_num2","${userDTO.jumin_num2}");
		inputData("postal_code","${userDTO.postal_code}");
		inputData("detail_addr","${userDTO.detail_addr}");
		inputData("road_addr","${userDTO.road_addr}");
		inputData("jibun_addr","${userDTO.jibun_addr}");
		inputData("email","${userDTO.email}");
		inputData("phone","${userDTO.phone}");
		inputData("disability_grade","${userDTO.disability_grade}");
		inputData("disability_type","${userDTO.disability_type}");
		inputData("wheelchair","${userDTO.wheelchair}");
		inputData("user_no","${userDTO.user_no}");
	});
	
		
	function goUpDelPage(){
		location.replace("/support/userMainPage.do");

	}
	
	function goUpDelProc(upDel) {
		if(upDel=="del"){
			document.userUpDelForm.upDel.value="del";
			if(confirm("정말 삭제 하시겠습니까?")==false){ 
				 			return; 
			} 

		}
		
		else{
			if(confirm("정말 수정 하시겠습니까?")==false){ 
	 			return; 
	 		}
		}
		alert($("[name=userUpDelForm]").serialize());
		$.ajax({
			url:"/support/adminUserUpDelProc.do",
			type:"post",
			data: $("[name=userUpDelForm]").serialize(),
			datatype:"html",
			success:function(data){
				if(upDel=="del")
				{
					if(data==1){
						alert("회원삭제 성공!");
						

						location.replace("/support/loginForm.do");
					}
					else{
						alert("회원삭제 실패!");
					}
				}
				else{
					if(data==1){
						alert("회원수정 성공!");

						location.replace("/support/userMainPage.do");
					}
					else{
						alert("회원수정 실패!");
					}
				}
				
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
	
	

</script> <!-- Jquery JS-->
   
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
	<link rel="stylesheet" type="text/css" href="/support/resources/css2/main.css">
    
    
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
           
                <div class="card-heading">
                    <h2 class="title">운전자수정/삭제</h2>
                </div>
                <div class="card-body">
                
                   
                    
                    <!-- ----------------------------------------------------------------------------------------------- -->
                    
                      <form name="userUpDelForm" method="POST">
                        
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
                      						  <input class="input100 input--style-5" id="userpostal_code"  type="text" name="postal_code" >
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                        					<input type="button" class="login100-form-btn btn btn--radius-2 btn--red" onclick="searchPostal_code('user')" value="주소검색">
                                            
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         <div class="wrap-input40 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="userroad_addr"  type="text" name="road_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        
                                        </div>
                                        
                                 			  &nbsp;&nbsp;&nbsp;
                                          <div class="wrap-input50 input-group-desc">
                    					<input class="input100 input--style-5" id="userjibun_addr" type="text" name="jibun_addr" >
                                            
                                           <span class="focus-input100"></span>
                                          
										<span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="wrap-input100 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="userdetail_addr"  type="text" name="detail_addr" >
                       					
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
                                 	 
                                           <div class="wrap-input20 input-group-desc">
                                           
                            <input type="button" class=" login100-form-btn btn btn--radius-2 btn--blue" onclick="goUpDelProc('up');" value="수정">
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input20 input-group-desc">
                                        
               						 
                            <input type="button" class="login100-form-btn btn btn--radius-2 btn--red" type="button" onclick="goUpDelProc('del');" value="삭제">
                               <span class="focus-input100"></span>
                          
                          </div> 
                          
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input20 input-group-desc">
                                        
               						 
                            <input type="button" class="login100-form-btn btn btn--radius-2 btn--green" type="button" onclick="goUpDelPage();" value="취소">
                               <span class="focus-input100"></span>
                          
                          </div>               
                          	
                          	<input type="hidden" name="user_no">
                          	<input type="hidden" name="upDel" value="up"> 
                       </div>    
                    </form>
                </div>
            </div>
        </div>
    </div>

   

</body>
</html>