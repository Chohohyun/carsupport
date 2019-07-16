<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp" %>
<%@include file="userMenuBar.jsp" %>

<html>
<head>
   <title>게시판</title>
   <script>
      // 게시판 수정 삭제 화면에 입력된 데이터의 유효성 체크 함수 선언
      function checkDisContentUpDelForm(upDel) {
    	  if("${sessionScope.id}"!="${discontentDTO.user_id}"){
         	 alert("자신의 게시물이 아닙니다.");
         	 return;
          }
         //------------------------------------------------------------------------------------------------------------------
         // 매개변수로 들어온 upDel에 del이 저장되었으면(삭제 버튼을 눌렀다면)암호 확인하고 삭제여부 묻기
         if(upDel == "del") {
            
            //<주의>------------------------------------------------------------------------------------------------
            // 아래코드를 생략하면 수정버튼 누르고 다시 취소를 누르면 [name=upDel] 에 up 이 들어간다.
            // 그리고 삭제 버튼 누르면 여전히 up 상태이기 때문에 삭제가 되지 않는다
            document.discontentUpDelForm.upDel.value="del";
            //--------------------------------------------------------------------------------------------------------
            if( confirm("정말 삭제 하시겠습니까?")==false) { return; }
         }
         //------------------------------------------------------------------------------------------------------------------
         // 매개변수로 들어온 upDel에 up이 저장되었으면(수정 버튼을 눌렀다면)입력양식의 유효성 체크하고 수정여부 묻기
         else if(upDel=="up") {
            
          
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
            
            if(confirm("정말 수정하시겠습니까?") == false) {return;}
         }
         //----------------------------------------------------------------------
         // 현재 화면에서 페이지 이동 없이 서버쪽 "support/boardUpDelProc.do" 를 호출
         // 게시판 수정 또는 삭제 적용 개수 가 있는 html 소스를  받기
         $.ajax({
            // 호출할 서버쪽 URL 주소 설정
            url : "/support/discontentUpDelProc.do"
            // 전송방법 설정
            , type : "post"
            // 서버에 보낼 파라미터값 설정
            , data : $("[name=discontentUpDelForm]").serialize()
            , success : function( upDelCnt ) {   
            
               // 게시판 새글 입력 행 적용개수 가 한개면 메세지 띄우고 /support/boardListForm.do 로 이동
            if(upDel == "up") {
               if(upDelCnt == 1) {
               alert("수정성공!");
               location.replace("/support/discontentListForm.do");
               } 
               else if (upDelCnt == -1) {
                  alert("삭제되어 수정이 불가능합니다")
                  location.replace("/support/discontentListForm.do");
               } else {
                  alert("서버 DB 연동 실패!")
               }
            }   
              else if(upDel=="del") {
               if(upDelCnt == 1) {
                  alert("삭제 성공!");
                  location.replace("/support/discontentListForm.do");
               } else if(upDelCnt == -1) {
                  alert("이미 삭제된 글입니다");
                  location.replace("/support/discontentListForm.do");
               }else {
                  alert("서버연동 실패");
               }
              }   
         } 
            // 서버의 응답을 못받았을 경우 실행할 익명함수
            , error : function() {
               alert("서버와 통신 실패");
            }
               
         });   
   }
      
   </script>

</head>

<body><center><br>
	<!-- [게시판 등록] 화면을 출력하는 form 태그 선언-->
	<form  method="post" name="discontentUpDelForm" >
		
		<b>[불만게시판 글쓰기]</b><br><br>
	
		<table class="tbcss1"	border="1"	bordercolor=gray	cellspacing="0"		cellpadding="5"	align="center">
		
			
			<tr>
				<th>  제 목
				<td><input type="text" 	size="40"		maxlength="50" name="discontent_subject" value="${discontentDTO.discontent_subject}">
			</tr>
			
			<tr>
				<th> 내 용
				<td><textarea name="discontent_content"  rows="13"	cols="40">${discontentDTO.discontent_content}</textarea>
			</tr>
		</table>
		
		<table	border="0"><tr height=4><td></table> <!-- 여백을 위한 -->
		
		    <input type="hidden"      name="upDel"      value="up">
      <input type="hidden"      name="discontent_no"      value="${discontentDTO.discontent_no}">
      
		  <input type="button"   value="수정"   onClick="checkDisContentUpDelForm('up');">
      <input type="button"   value="삭제"   onClick="checkDisContentUpDelForm('del');">
      <input type="button"   value="목록보기"   onClick="document.discontentListForm.submit();"> 

	</form>
	
	<form name="discontentListForm"	method="post"	action="/support/discontentListForm.do">
	</form>
	
	
</body>
</html>