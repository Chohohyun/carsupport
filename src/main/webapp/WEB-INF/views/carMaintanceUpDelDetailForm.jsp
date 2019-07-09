<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>
<html>
<head>
        <meta charset="UTF-8"> 
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
        <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
        
        <script>
        $(document).ready(function() {
        	inputData("car_number", "${carMaintanceDTO.car_number}" );
        	inputData("car_maintance_date", "${carMaintanceDTO.car_maintance_date}" );
        	inputData("car_maintance_code", "${carMaintanceDTO.car_maintance_code}" );
        	inputData("car_maintance_content", "${carMaintanceDTO.car_maintance_content}" );
        });  // $(document).ready(function() {        
        </script>
 

        <script type="text/javascript">
            $(function() { 
            $("#datepicker").datepicker({
	            dateFormat: 'yymmdd',
	            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                dayNamesMin: ['일','월','화','수','목','금','토'],
	                changeMonth: true, //월변경가능
	                changeYear: true, //년변경가능
	                showMonthAfterYear: true, //년 뒤에 월 표시
	            });
            });
        </script>
        <script>
        // 정비내용 수정
        function goCarMaintanceUpdateProc(){
    		$.ajax({
    			url:"/support/carMaintanceUpdateProc.do",
    			type:"post",
    			data: $("[name=carMaintanceUpDelProc]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data>=1){
    					alert("차량 정비내용 수정 성공!");
    					location.replace("/support/adminMainPage.do");
    				}
    				else{
    					alert("차량 정비내용 수정 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
     // 정비내용 삭제
        function goCarMaintanceDeleteProc(){
    		$.ajax({
    			url:"/support/carMaintanceDeleteProc.do",
    			type:"post",
    			data: $("[name=carMaintanceUpDelProc]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data==1){
    					alert("차량 정비내용 삭제 성공!");
    					location.replace("/support/adminMainPage.do");
    				}
    				else{
    					alert("차량 정비내용 삭제 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
     // 취소 버튼(메인페이지 이동)
        function goAdminMainPage(){
        	location.replace("/support/adminMainPage.do");
        }
        </script>
</head>
	<body><center>
		<form name="carMaintanceUpDelProc">
    
            <hl>차량 정비 수정/삭제 UI<br><br>
        
            <table border=1 cellpadding=7 cellspacing=0 >
                <tr>
                    <th>차량번호
                    <td><input type="text" name="car_number" >
                </tr>
                <tr>
                    <th>정비일시
                    <td><input type="text" id="datepicker" placeholder="날짜선택▼" name="car_maintance_date">
                </tr>
                <tr>
                    <th>정비내용
                    <td>
                        <select name="car_maintance_code" >
                            <option value="">정비내역선택
                            <option value="1">엔진오일교체
                            <option value="2">타이어교체
                            
                        </select>
                </tr>
      			<tr>
					<th>세부내용
					<td><textarea name="car_maintance_content" cols="50" rows="7"></textarea>
			</tr>
      
            </table><br>
            
            <input type="hidden" name="car_maintance_info_no" value="${carMaintanceDTO.car_maintance_info_no}">
            
			<input type="button" value="수정" onClick="goCarMaintanceUpdateProc()"> &nbsp; &nbsp;
            <input type="button" value="삭제" onClick="goCarMaintanceDeleteProc()"> &nbsp; &nbsp;
            <input type="button" value="취소" class="cancle" onclick="goAdminMainPage();"> 
            
        </form>

	</center></body>

</html>