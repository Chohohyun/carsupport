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
        	inputData("car_number", "${carDTO.car_number}" );
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
        function goCarMaintanceRegProc(){       	
       		$.ajax({
       			url:"/support/carMaintanceRegProc.do",
       			type:"post",
       			data: $("[name=carMaintanceRegProc]").serialize(),
       			datatype:"html",
       			
       			success:function(data){
       				if(data==1){
       					alert("차량 정비 내용 등록 성공!");
       					location.replace("/support/adminMainPage.do");
       				}
       				else{
       					alert("차량 정비 내용 등록 실패!");
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
            <hl>차량 정비 등록 UI<br><br>
        <form name = "carMaintanceRegProc" >
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

            <input type="button" value="등록" class="delete" onclick="goCarMaintanceRegProc();"> &nbsp; &nbsp;
            <input type="button" value="취소" class="cancle" onclick="goAdminMainPage();"> 
            
        </form>
    </body>
</html>
