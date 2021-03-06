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
        	inputData("car_distance", "${carDTO.car_distance}" );
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
        	if(is_empty("car_maintance_date")){
        		alert("날짜를 선택해주세요.");
        		return;
        	}
        	if(is_empty("car_maintance_code")){
        		alert("정비내용을 선택해주세요.");
        		return;
        	}
        	if(is_empty("car_distance")){
        		alert("주행거리를 입력해주세요.");
        		return;
        	}
        
       		$.ajax({
       			url:"/support/carMaintanceRegProc.do",
       			type:"post",
       			data: $("[name=carMaintanceRegProc]").serialize(),
       			datatype:"html",
       			
       			success:function(data){
       				if(data==1){
       					alert("차량 정비 내용 등록 성공!");
       					document.goCarListInfoForm.submit();
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
        function checkDate(){
        	var date = new Date(); 
    		var year = date.getFullYear(); 
    		var month = new String(date.getMonth()+1); 
    		var day = new String(date.getDate()); 

    		// 한자리수일 경우 0을 채워준다. 
    		if(month.length == 1){ 
    		  month = "0" + month; 
    		} 
    		if(day.length == 1){ 
    		  day = "0" + day; 
    		} 
    		var sysdate = year + "" + month + "" + day;
        	var regDate = $("[name=car_maintance_date]").val();
        	if(regDate>sysdate){
        		alert("미래 날짜를 선택할 수 없습니다.");
        		$("[name=car_maintance_date]").val("");
        	}
        
        }
        
        function goAdminMainPage(){
				document.goCarListInfoForm.submit();
        }
        </script>
    </head>

    <body><form name="goCarListInfoForm" method="post" action="/support/carListInfoForm.do">
	</form>
	<center>
            <hl>차량 정비 등록 UI</hl><br><br>
        <form name = "carMaintanceRegProc" >
            <table border=1 cellpadding=7 cellspacing=0 >
                <tr>
                    <th bgcolor="gray">차량번호
                    <td><input type="text" name="car_number" >
                </tr>
                <tr>
                    <th bgcolor="gray">정비일시
                    <td><input type="text" id="datepicker" onchange="checkDate();" placeholder="날짜선택▼" name="car_maintance_date">
                </tr>
                <tr>
                    <th  bgcolor="gray">정비내용
                    <td>
                        <select name="car_maintance_code" >
                            <option value="">정비내역선택
                            <option value="1">엔진오일교체
                            <option value="2">타이어교체
                            
                        </select>
                </tr>
                 <tr>
                    <th bgcolor="gray">주행거리
                    <td><input type="text" name="car_distance"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  placehoder="KM" >
                </tr>
      			<tr>
					<th bgcolor="gray">세부내용
					<td><textarea name="car_maintance_content" cols="50" rows="7"></textarea>
			</tr>
      
            </table><br>

            <input type="button" value="등록" class="delete" onclick="goCarMaintanceRegProc();"> &nbsp; &nbsp;
            <input type="button" value="취소" class="cancle" onclick="goAdminMainPage();"> 
            
        </form>
        </center>
        
    </body>
</html>
