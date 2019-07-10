<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>


<html>
<head>

<script>
	
	// 게시판 등록 화면에 입력된 데이터의 유효성 체크 함수 선언
	function checkDiscontentRegForm() {
		
		
		if(is_empty("discontent_subject")) {
			alert("제목을 입력하세요");
			$("[name=discontent_subject]").focus();
			return;
		}
		
		if(is_empty("discontent_content")) {
			alert("내용을 입력하세요");
			$("[name=discontent_content]").focus();
			return;
		}
		
		//-----------------------------------------------------------------------
		var content = $("[name=discontent_content]").val();
		if (content.length > 1000) {
				alert("내용은 1000자를 넘을 수 없습니다");
				return;
			} 
		
		if(confirm("정말 저장하시겠습니까?") == false) {return;}
		
		//alert($("[name=qnaRegForm]").serialize());
		//return;
		//----------------------------------------------------------------------
		// 현재 화면에서 페이지 이동 없이 서버쪽 "/support/qnaRegProc.do" 를 호출
		// 게시판 입력 행 적용 개수 가 있는 html 소스를 문자열로 받기
		$.ajax({
			// 호출할 서버쪽 URL 주소 설정
			url : "/support/discontentRegProc.do"
			
			// 전송방법 설정
			, type : "post"
			
			// 서버에 보낼 파라미터값 설정
			, data : $("[name=discontentRegForm]").serialize()
			
			, success : function( qnaRegCnt ) {
				if(qnaRegCnt == 1) {
					alert("게시판 새글 등록 성공!");
					location.replace("/support/discontentListForm.do");
				}
				// [게시판 새글 입력 행 적용 개수] 가 1개가 아니면 경고하기
				else {
					alert("게시판 새글 등록 실패. 관리자에게 문의바람")
				}
			}
			
			// 서버의 응답을 못받았을 경우 실행할 익명함수
			, error : function() {
				alert("서버와 Ajax 통신 실패");
			}
			
		});
		//onClick="checkBoardRegForm()">
	}
</script>
</head>
<body><center><br>
	<!-- [게시판 등록] 화면을 출력하는 form 태그 선언-->
	<form  method="post" name="discontentRegForm" action="/support/discontentRegProc.do">
		
		<b>[불만게시판 글쓰기]</b><br><br>
	
		<table class="tbcss1"	border="1"	bordercolor=gray	cellspacing="0"		cellpadding="5"	align="center">
		
			
			<tr>
				<th>  제 목
				<td><input type="text" 	size="40"		maxlength="50" name="discontent_subject">
			</tr>
			
			<tr>
				<th> 내 용
				<td><textarea name="discontent_content" 	rows="13"	cols="40"></textarea>
			</tr>
		</table>
		
		<table	border="0"><tr height=4><td></table> <!-- 여백을 위한 -->
		
		<input type="hidden" name="upDel"value="up">
		<input type="hidden" name="dicontent_no" value="${discontentDTO.dicontent_no}">
		<input type="button" value="저장"	 onClick="checkDiscontentRegForm()">
		<input type="reset"	 value="다시작성" >
		<input type="button" value="목록보기"		onClick="document.discontentListForm.submit()">
	</form>
	
	<form name="discontentListForm"	method="post"	action="/support/discontentListForm.do">
	</form>
	
	
</body>
</html>