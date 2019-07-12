<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp"%>
<%@include file="userMainPage.jsp"%>


<html>
<head>
<title>불만사항 게시판(관리자용)</title>
<script>
	//***********************************************************
	// body 태그안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
	//***********************************************************
	$(document).ready(function(){
		//***********************************************************
		// name=boardRegForm 을 가진 form 태그와
		// name=boardContentForm 을 가진 form 태그를 안보이게 하기
		//***********************************************************
		$("[name=discontentRegForm], [name=discontentContentForm]").hide();
		
		
	})
	

	
	function goAdminDiscontentContentForm(data){
		document.adminDiscontentContentForm.adminDiscontent_no.value=data;
		document.adminDiscontentContentForm.submit();
	}
	
</script>


</head>

<body>
	<center>
		<br>

		<form name="discontentListForm" method=post
			action="/support/discontentListForm.do"></form>

		<table border=0>
			<tr>
				<td align=right>[검색 총 개수] :
					${requestScope.discontentListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
			<tr>
				<td>
					<table border=0 class="discontentList tbcss2" cellpadding=5
						cellspacing=0 width=500>
						<tr>
							<th>번호
							<th>제목
							<th>글쓴이
							<th>등록일
							<th>조회수 <!--****************************************************************-->
								<!--HttpServletRequest 객체에 boardList 라는 키값으로 저장된********--> <!--ArrayList<HashMap<String,String>> 객체를 꺼내고*****************-->
								<!--ArrayList<HashMap<String,String>> 객체 안의*********************-->
								<!--HashMap<String,String> 을 꺼내고 HashMap<String,String> 객체안의-->
								<!--키값에 대응하는 문자열을 꺼내서 출력하기************************--> <!--****************************************************************-->
								<!--HttpServletRequest 객체에 boardList 라는 키값으로 저장된********--> <!--ArrayList<HashMap<String,String>> 객체안의 <HashMap<String,String> 들을-->
								<!--자바 지역변수 board 에 1개씩 저장하고 반복문 안으로 들어가서--> <!--달러{지역변수board.HashMap객체키값명} 으로 표현하고 있다-->
								<!--반복문 돌때 마다 자바 지역변수 board 에는 n 번째 <HashMap<String,String> 객체가 저장된다-->
								<!--반복문 돌때마다 LoopTagStatus 객체의 index 라는 속성변수안의 데이터를 꺼내어--> <!--출력한다. 출력 시 형식은 EL 로 달러{loopTagStatus} 로 한다-->
								<!--반복문 돌때 마다 LoopTagStatus 객체의 count 라는 속성변수안의 데이터는 0부터--> <!--시작해서 1씩 증가 하면서 반복문 안에서 표현된다-->
								<!--현재 LoopTagStatus 객체의 메위주는 loopTagStatus 라는 지역 변수에 저장되어 있다-->
								<!--바로 varStatus="loopTagStatus" 에 선언된 지역변수이다--> <!--****************************************************************-->
								<c:forEach items="${requestScope.adminDiscontentList}"
									var="adminDiscontent" varStatus="loopTagStatus">
									<tr style="cursor: pointer"
										onClick="goAdminDiscontentContentForm(${adminDiscontent.discontent_no});">
										<td>
											<!-- ${(sessionScope.selectPageNo*sessionScope.rowCntPerPage-sessionScope.rowCntPerPage+1+loopTagStatus.index)} -->
											${discontentListAllCnt-(discontentSearchDTO.selectPageNo*discontentSearchDTO.rowCntPerPage-discontentSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}
										
										<td><c:if test="${adminDiscontent.print_no > 1 }">
												<c:forEach begin="1" end="${adminDiscontent.print_no }">
											&nbsp;
										</c:forEach>
										답변:
									</c:if> ${adminDiscontent.discontent_subject} <c:choose>
												<c:when test="${adminDiscontent.print_no==1}">
												<td>${adminDiscontent.user_name}
												</c:when>

												<c:otherwise>
												<td>${adminDiscontent.admin_name}
												</c:otherwise>
											</c:choose>
										
										<td>${adminDiscontent.reg_date}
										<td>${adminDiscontent.readcount}<!-- readcount는 BoardDAO에 getBoardList에 while문안에 "readcount" 요고다 -->
								</c:forEach>
					</table>
			<tr>
				<th><span class="pagingNumber"></span>
		</table>
		${requestScope.adminDiscontentListAllCnt==0?'검색된 글이 없습니다.':''}

		<!--*********************************************************************-->
		<!--[게시판 등록 화면]으로 이동하는 주소를 가진 form 태그 선언하기-->
		<!--이 form 태그 내부의 입력양식은 파라미터값으로 이동 페이지로 전달된다-->
		<!--*********************************************************************-->
		<form name="adminDiscontentRegForm" method="post"
			action="/support/adminDiscontentRegForm.do"></form>
		<!--*************************************************************************-->
		<!--[선택한 게시판 상세보기 화면]으로 이동하는 주소를 가진 form 태그 선언하기-->
		<!--이 form 태그 내부의 입력양식은 파라미터값으로 이동 페이지로 전달된다*****-->
		<!--*************************************************************************-->
		<form name="adminDiscontentContentForm" method="post"
			action="/support/adminDiscontentContentForm.do">
			<!--*********************************************************************-->
			<!--[게시판 글 고유번호]가 저장되는 [hidden 입력 양식] 선언**************-->
			<!--*********************************************************************-->
			<input type="hidden" name="adminDiscontent_no">
		</form>
</body>
</html>