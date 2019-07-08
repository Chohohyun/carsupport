<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<html>
<script>
	
		
	$(document).ready(function(){
		inputData("id","${driverDTO.id}");
		inputData("pwd1","${driverDTO.pwd1}");
		inputData("pwd2","${driverDTO.pwd1}");
		inputData("name","${driverDTO.name}");
		inputData("gender","${driverDTO.gender}");
		inputData("jumin_num1","${driverDTO.jumin_num1}");
		inputData("jumin_num2","${driverDTO.jumin_num2}");
		inputData("postal_code","${driverDTO.postal_code}");
		inputData("detail_addr","${driverDTO.detail_addr}");
		inputData("road_addr","${driverDTO.road_addr}");
		inputData("jibun_addr","${driverDTO.jibun_addr}");
		inputData("email","${driverDTO.email}");
		inputData("phone","${driverDTO.phone}");
		inputData("driver_license_number","${driverDTO.driver_license_number}");
		inputData("driver_no","${driverDTO.driver_no}");
	});
	
		
	function goMainPage(){
		location.replace("/support/driverUpDelForm.do");

	}
	
	function goUpDelProc(upDel) {
		if(upDel=="del"){
			document.driverUpDelForm.upDel.value="del";
			if(confirm("정말 삭제 하시겠습니까?")==false){ 
				 			return; 
			} 

		}
		
		else{
			if(confirm("정말 수정 하시겠습니까?")==false){ 
	 			return; 
	 		}
		}
		alert($("[name=driverUpDelForm]").serialize());
		$.ajax({
			url:"/support/adminDrvierUpDelProc.do",
			type:"post",
			data: $("[name=driverUpDelForm]").serialize(),
			datatype:"html",
			success:function(data){
				if(upDel=="del")
				{
					if(data==1){
						alert("운전자삭제 성공!");
						

						location.replace("/support/driverUpDelForm.do");
					}
					else{
						alert("운전자삭제 실패!");
					}
				}
				else{
					if(data==1){
						alert("운전자수정 성공!");

						location.replace("/support/driverUpDelForm.do");
					}
					else{
						alert("운전자수정 실패!");
					}
				}
				
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
	
	function goUpProc() {
		alert(1);
		alert($("[name=driverUpDelForm]").serialize());
		$.ajax({
			url:"/support/adminDriverRegForm.do",
			type:"post",
			data: $("[name=driverUpDelForm]").serialize(),
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
                    
                      <form name="driverUpDelForm" method="POST">
                        
                        <div class="form-row">
                            <div class="name">아이디</div>
                            <div class="value">
                                <div class="input-group wrap-input100">
                                    <input class="input100 input--style-5" type="text" name="id" placeholder="아이디" >
                                    
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
                          	<input type="hidden" name="admission_code" value="y">
                          	
                          	<input type="hidden" name="driver_no">
                          	<input type="hidden" name="upDel" value="up"> 
                       </div>    
                    </form>
                </div>
            </div>
        </div>
    </div>

   

</body>
</html>