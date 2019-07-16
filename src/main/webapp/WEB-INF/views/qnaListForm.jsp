<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- common.jsp 소스 파일 가져오기 [Include Directive] 기술-->
<!--  여러 JSP 페이지에 공통으로 들어갈 코드가 있다면 이 방법을 사용한다-->
<%@include file="common.jsp"%>
<c:if test="${id=='abc'}">
<%@include file="adminMainPage.jsp"%>
</c:if>
<c:if test="${id!='abc'}">
<%@include file="userMenuBar.jsp"%>
</c:if>

<!-- 게시판 화면을 구성하는 태그 -->
<html>
<script>

	$(document).ready(function() {
	

	    // id = movieList 를 가진 태그를 관리하는 jQuery 객체의 메위주를 변수 tableObj 에 저장
	    var tableObj = $(".qnaList");
	
	    // id = movieList 를 가진 태그 내부에 모든 tr을 관리 jQuery 객체 생성해 변수 trObj에 저장
	    // var trObj = $("#movieList tr")
	    var trObj = tableObj.find("tr");
	
	    // 홀수 tr을 관리하는 jQuery 객체 메위주를 변수 trOddObj 에 저장
	    var trOddObj = trObj.filter(":even");
	    // 짝수 tr을 관리하는 jQuery 객체 메위주를 변수 trEvenObj 에 저장
	    var trEvenObj = trObj.filter(":odd");
	    //-------------------------------------------------------------------------------------
	    // 짝수번째 tr 감추기
	    trEvenObj.hide();
	   
	 	// 홀수 tr 에 마우스 대면 손모양 보이기
	    trOddObj.css("cursor", "pointer");
	    
	     trObj.filter(":even").click(function () {  
	    	trEvenObj.hide();
	        $(this).next().show();
	    });  
	
	     
	     $(".qna_group").css("cursor","pointer");
	     $(".content").css("cursor","pointer");   
	}); 


	
	
	//********************************************************************************** 
	//  글쓰기 페이지로 이동하는 함수 설정
	
	function goQnaRegForm() { 
		// name=boardRegForm 을 가진 form 태그 안의 action 에 설정된 URL로 이동하기
		// 이동시 form 태그안의 모든 입력 양식이 파라미터 값으로 전송
		document.qnaRegForm.submit(); 
	}			
	//**********************************************************************************
	
	//*******************************************************************
	// 버튼 클릭시 게시판 항목이 분류돼서 화면에 보여준다
	//*******************************************************************
	function goQnaList(data) {
		document.qnaOptionForm.question_group_no.value=data;
		document.qnaOptionForm.submit();
	}
	
function goQnaUpDelForm(data) {
		if("${sessionScope.id}"!='abc'){
			
			  // id = movieList 를 가진 태그를 관리하는 jQuery 객체의 메위주를 변수 tableObj 에 저장
		    var tableObj = $(".qnaList");
		
		    // id = movieList 를 가진 태그 내부에 모든 tr을 관리 jQuery 객체 생성해 변수 trObj에 저장
		    // var trObj = $("#movieList tr")
		    var trObj = tableObj.find("tr");
			 var trEvenObj = trObj.filter(":odd");
			    //-------------------------------------------------------------------------------------
			    // 짝수번째 tr 감추기
			trEvenObj.hide();
			return;
		}
		document.qnaUpDelForm.question_no.value=data;
		document.qnaUpDelForm.submit();
	}
	
</script>


<head>





</head>
<body>
	<!---------------------------------------------------------------------------------------------------------- -->
	<center>
		<table>
			<tr>
				<td>QnA 게시판<br>
				<br>
			<tr>
				<c:if test="${id=='abc'}">
					<td><input type="button" value=" 글쓰기 "
						onclick="goQnaRegForm();">
				</c:if>
		</table>
		<br>

		<table border=1 cellpadding=5 cellspacing=0 width=400
			class="qna_group">
			<tr>
				<td><input type="button" class="qna_group" value="공지사항"
					onClick="goQnaList('1');">
				<td><input type="button" class="qna_group" value="이용관련"
					onClick="goQnaList('2');">
				<td><input type="button" class="qna_group" value="사이트관련"
					onClick="goQnaList('3');">
		</table>
		<br>

		<table border=1 class="qnaList" cellpadding=5 cellspacing=0 width=400>
			<c:forEach items="${requestScope.qnaList}" var="qna"
				varStatus="loopTagStatus">
				<tr bgcolor=#FAFAAA>
					<td align="center">${qna.question_subject }
				<tr bgcolor="white"
					onclick="javascript:goQnaUpDelForm(${qna.question_no});">
					<td align="center"><textarea name="content" class="content"
							rows="10" cols="40">${qna.question_content }</textarea>
			</c:forEach>
		</table>


		<!-- [QnA 글쓰기 화면] 으로 이동하는 form 태그  -->
		<!-- 이동시 form 태그안의 모든 입력 양식이 파라미터 값으로 전송된다. -->
		<form name="qnaRegForm" method="post" action="/support/qnaRegForm.do">
		</form>
		<form name="qnaOptionForm" method="post"
			action="/support/qnaListForm.do">
			<input type="hidden" name="question_group_no">
		</form>

		<form name="qnaUpDelForm" method="post"
			action="/support/qnaUpDelForm.do">
			<input type="hidden" name="question_no">
		</form>
	</center>
</body>
</html>