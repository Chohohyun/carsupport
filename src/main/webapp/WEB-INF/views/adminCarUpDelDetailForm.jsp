<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp" %>

<html>


	<head>

   
    <script>            
        $(document).ready(function() {
        	alert(1);
        	createDriverList();
        	inputData("car_year", "${carDTO.car_year}" );
        	inputData("car_code", "${carDTO.car_code}" );
        	
			
        	
        });  // $(document).ready(function() {
    
    	function createDriverList(){
        	alert(1);
    		var driverList = [];
        	$.ajax({
    			url:"/support/driverList.do"
    			,type:"post"
    			,datatype: "application/json"
    			,success : function(data){
    				alert(2);
    				var datalen = data.length;
    				
    				for(var i=0; i<datalen; i++){
    					driverList[i] = data[i].driver_name;
    					var option = $("<option value="+data[i].driver_no+">"+driverList[i]+"</option>");
    					$('[name=car_driver]').append(option);
    				}
    				var driver = $("<option value="+"${carDTO.driver_no}"+">"+"${carDTO.car_driver}"+"</option>");
					$('[name=car_driver]').append(driver);
    				
    				inputData("car_driver", "${carDTO.driver_no}" );
    			}
    			,error:function(){
    				alert("서버 접속 실패!");			
    			}
    		});
    	}

        
        function goCarUpdateProc(){
    		$.ajax({
    			url:"/support/carUpdateProc.do",
    			type:"post",
    			data: $("[name=carUpDelProcForm]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data>=0){
    					alert("차량수정 성공!");
    					location.replace("/support/adminMainPage.do");
    				}
    				else{
    					alert("차량수정 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
        
        function goCarDeleteProc(){
    		$.ajax({
    			url:"/support/carDeleteProc.do",
    			type:"post",
    			data: $("[name=carUpDelProcForm]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data==1){
    					alert("차량삭제 성공!");
    					location.replace("/support/adminMainPage.do");
    				}
    				else{
    					alert("차량삭제 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
        
        function goAdminMainPage(){
        	location.replace("/support/adminMainPage.do");
        }
    </script>
    </head>
    
    
    
    <body><center>
    	
         <h1>차량 상세보기 UI</h1><br><br>
         <form name = "carUpDelProcForm" method="POST">
         
            <table class="tbcss1" border=1 cellpadding=7 cellspacing=0 width="600">
                <tr>
                    <th bgcolor="gray">차량번호
                    <td><input type="text" name="car_number" placehoder="차량번호" value="${carDTO.car_number}"> 
                </tr>
                <tr>
                    <th bgcolor="gray">차량연식
                    <td> 
                        <select name="car_year" >
                            <option value="">연식선택
                            <script>
                                for(var i = 2010; i <= new Date().getFullYear(); i++) {
                                    document.write("<option value=" + i + ">" + i);
                                }
                            </script>
                        </select>년식
                </tr>
                <tr>
                    <th bgcolor="gray">주행거리
                    <td><input type="text" name="car_distance" placehoder="KM" value="${carDTO.car_distance}"> 
                </tr>
                <tr>
                    <th bgcolor="gray">차량종류
                    <td><input type="radio" name="car_code" id="car_code1" style="vertical-align:middle; margin: -1px 5px 0 1px;" value="1"><label for="car_code1">슬로프 </label> &nbsp; &nbsp;
                        <input type="radio" name="car_code" id="car_code2" style="vertical-align:middle; margin: -1px 5px 0 1px;" value="2"><label for="car_code2">리프트 </label>
                </tr>
                <tr>
                    <th bgcolor="gray">운전자
                    <td>
                        <select name="car_driver" class="car_driver">
                            
                            
                        </select>
                </tr>
	
            </table><br>
	
			<input type="hidden" name="car_info_no" value="${carDTO.car_info_no}">
			
            <input type="button" value="수정" onclick="goCarUpdateProc();"> &nbsp; &nbsp;
            <input type="button" value="삭제" onclick="goCarDeleteProc();"> &nbsp; &nbsp;
             <input type="button" value="취소" onclick="goAdminMainPage();"> 
        </form>	     
       
    </center></body>
        
        <!-- ==================================업데이트==================================
        <form action="adminCarUpdate.do">
        	<input type="hidden" name="car_info_no"> 
        </form>
         -->
        <!-- ==================================삭    제================================== 
         <form action="adminCarDelete.do">
        	<input type="hidden" name="car_info_no"> 
        </form>
        -->
   
</html>

