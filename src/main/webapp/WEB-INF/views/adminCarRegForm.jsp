<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>

<html>

	<head>
    <meta charset="UTF-8"> 
   
    <script>            
        $(document).ready(function() {
        	var driverList = [];
        	$.ajax({
				url:"/support/driverList.do"
				,type:"post"
				,datatype: "application/json"
				,success : function(data){
					
					var datalen = data.length;
					
					for(var i=0; i<datalen; i++){
						driverList[i] = data[i].driver_name;
						var option = $("<option value="+data[i].driver_no+">"+driverList[i]+"</option>");
						$('[name=car_driver]').append(option);
					}
				}
				,error:function(){
					alert("서버 접속 실패!");			
				}
			});
        });  // $(document).ready(function() {
        
        
        function goCarRegProc(){
    		$.ajax({
    			url:"/support/adminCarRegProc.do",
    			type:"post",
    			data: $("[name=carRegForm]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data==1){
    					alert("차량등록 성공!");
    					location.replace("/support/adminMainPage.do");
    				}
    				else{
    					alert("차량등록 실패!");
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
    	
         <h1>차량 등록 UI</h1><br><br>
         <form name = "carRegForm" method="POST" action="adminCarRegProc.do">
            <table class="tbcss1" border=0 cellpadding=7 cellspacing=0 width="600">
                <tr>
                    <th bgcolor="gray">차량번호
                    <td><input type="text" name="car_number" placehoder="차량번호">
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
                    <td><input type="text" name="car_distance" placehoder="KM" >
                </tr>
                <tr>
                    <th bgcolor="gray">차량종류
                    <td><input type="radio" name="car_code" id="car_code1" style="vertical-align:middle; margin: -1px 5px 0 1px;" value="1"><label for="car_code1">슬로프 </label> &nbsp; &nbsp;
                        <input type="radio" name="car_code" id="car_code2" style="vertical-align:middle; margin: -1px 5px 0 1px;" value="2"><label for="car_code2">리프트 </label>
                </tr>
                <tr>
                    <th bgcolor="gray">운전자
                    <td>
                        <select name="car_driver" >
                            <option value="">운전자선택
                            
                        </select>
                </tr>
      
            </table><br>

            <input type="button" value="등록"  onclick="goCarRegProc();"> &nbsp; &nbsp;
            <input type="button" value="취소"  onclick="goAdminMainPage();"> 
            
        </form>
    </center></body>
</html>

