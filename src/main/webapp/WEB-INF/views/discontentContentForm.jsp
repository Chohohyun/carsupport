<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp" %>
<%@include file="userMainPage.jsp" %>

<!-- 게시판에 보이는 글이 내가 클릭하기 직전에 삭제되었으면 경고를 띄우고  게시판 목록보기 화면으로 이동하기-->
<c:if test="${empty discontentDTO}">
   <script>
      alert("게시판 글이 삭제되었습니다");
      location.replace("/erp/discontentListForm.do")
   </script>
</c:if> 

<html>
<head>
   <title>게시판</title>
   <script>
      
      
      // 게시판 수정화면으로 이동하는 함수 선언
      function goDiscontentUpDelForm() {
         if("${sessionScope.id}"!="${discontentDTO.user_id}"){
        	 alert("자신의 게시물이 아닙니다.");
        	 return;
         }
         if(confirm("수정/삭제로 이동하시겠습니까?") == false) {return;}
         // name=boardUpDelForm 을 가진 form 태그의 action 값 url로 서버에 접속
         document.discontentUpDelForm.submit();
         
      }
   </script>
</head>

<body><center><br>
   <!-- [게시판 등록] 화면을 출력하는 form 태그 선언-->
   <form  class="discontentContentForm"   method="post"    name="discontentContentForm" >
      <b>[글 상세 보기]</b>
      <table  class="tbcss1"   width="500"      border="1"   bordercolor="#dddddd"   cellpadding="5"   align="center">
         <tr align="center">
            <th bgcolor="${headerColor}" width=60> 글번호
            <td   width=150>${discontentDTO.discontent_no}
            <th bgcolor="${headerColor}" width=60> 조회수
            <td   width=150>${discontentDTO.readcount}
         <tr align="center">
            <th bgcolor="${headerColor}" width=60> 작성자
            <c:if test="${discontentDTO.print_no==1}">
            <td>${discontentDTO.user_name}
            </td>
            </c:if>
            <c:if test="${discontentDTO.print_no==2}">
            <td>${discontentDTO.admin_name}
            </td>
            </c:if>
            <th bgcolor="${headerColor}" width=60> 작성일
            <td>${discontentDTO.reg_date}
         <tr>
            <th bgcolor="${headerColor}"> 글제목
            <td colspan="3">${discontentDTO.discontent_subject}
         <tr>
            <th bgcolor="${headerColor}"> 글내용
            <td colspan="3"><pre>${discontentDTO.discontent_content}</pre>                
      </table>
      
      <table><tr height=3><td></table>
      
      <input type="hidden"      name="discontent_no"   value="${discontentDTO.discontent_no}">
      <c:choose>
      		<c:when test="${discontentDTO.print_no==1}">
      	
      			<input type="button"   value="수정/삭제"   onClick="goDiscontentUpDelForm();">
      			<input type="button"   value="글목록보기"   onClick="document.discontentListForm.submit();">
      		
      			</c:when>
      		
      		<c:otherwise>
     
      			<input type="button"   value="글목록보기"   onClick="document.discontentListForm.submit();">
      		
      		</c:otherwise>
      </c:choose>
      
   </form>
   <!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 저장한 hidden 태그 출력하고 [게시판 목록]  화면으로 이동하는 form태그 선언-->
   <form name="discontentListForm"   method="post"   action="/support/discontentListForm.do">
   </form>
   
   
   <!--************************************************************************ -->
   <!-- 수정/삭제 화면으로 이동하기 위한 form 태그 선언-->
   <!--************************************************************************ -->
   <form name="discontentUpDelForm"   method="post"   action="/support/discontentUpDelForm.do">
      <!-- 게시판 상세보기 화면을  구성하는 글의 고유번호를 hidden 태그에 저장한다-->
      <!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야 하기 때문이다-->
      <input type="hidden"      name="discontent_no"   value="${discontentDTO.discontent_no}">   
   </form>
</body>
</html>