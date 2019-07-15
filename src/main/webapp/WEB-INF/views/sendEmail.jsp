<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<html>
<script>
</script>

    <head>
    <script>
	$(document).ready(function () {
 
		
		inputData("rphone","${emailDTO.phone}");
		//document.smsForm.submit();
	});

	
    </script>
	</head>
	<body>
    <form method="post" name="smsForm" action="smssend.do">    <!--  <form method="post" name="smsForm" action="발송처리URL"> -->
   
        <input type="hidden" name="action" value="go"> 
        <textarea name="msg" cols="30" rows="10" style="width:455px;" placeholder="보낼 내용">[차량이동서비스] ${emailDTO.phone} 님 담당자가 예약취소하였습니다. 재신청 필요합니다.</textarea>
		<br />
        <!--=================  필수 입력사항 CAFE24 등록된 발신자 번호 등록 ============================-->
        <input type="hidden" name="sphone1" value="010">
        <input type="hidden" name="sphone2" value="3537">
        <input type="hidden" name="sphone3" value="0604">
		
		<br />받는 번호
	    <input type="text" name="rphone" value="${emialDTO.phone}" placeholder="받는 번호"> 
	    <input type="text" name="returnurl" maxlength="64" value="/support/userMainPage.do">
		<input type="submit" value="전송">
		
    </form>

    
            



</body>
</html>