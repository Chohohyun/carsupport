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
        	inputData("car_distance", "${carMaintanceDTO.car_distance}")
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
        // 정비내용 수정
        function goCarMaintanceUpdateProc(){
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
    			url:"/support/carMaintanceUpdateProc.do",
    			type:"post",
    			data: $("[name=carMaintanceUpDelProc]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data>=1){
    					alert("차량 정비내용 수정 성공!");
    					document.goCarMaintanceListForm.submit();
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
    					document.goCarMaintanceListForm.submit();
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
			document.goCarMaintanceListForm.submit();
        }
        </script>
</head>
	<body>
	<form name="goCarMaintanceListForm" method="post" action="/support/carMaintanceListForm.do">
	</form>
	<center>
		<form name="carMaintanceUpDelProc">
    
            <hl>차량 정비 수정/삭제 UI<br><br>
        
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
                    <th bgcolor="gray">정비내용
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
            
            <input type="hidden" name="car_maintance_info_no" value="${carMaintanceDTO.car_maintance_info_no}">
            
			<input type="button" value="수정" onClick="goCarMaintanceUpdateProc()"> &nbsp; &nbsp;
            <input type="button" value="삭제" onClick="goCarMaintanceDeleteProc()"> &nbsp; &nbsp;
            <input type="button" value="취소" class="cancle" onclick="goAdminMainPage();"> 
            
        </form>

	</center></body>

</html>