<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>


<html>
<head>
<title>불만사항 게시판(관리자용)</title>
<script>
	//***********************************************************
	// body 태그안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
	//***********************************************************
	$(document).ready(function(){
		
		inputData("selectPageNo","${discontentSearchDTO.selectPageNo}");
		inputData("keyword","${discontentSearchDTO.keyword}");
		$(".pagingNumber").html(
				getPagingNumber(
				"${adminDiscontentListAllCnt}", // 검색 결과 총 행 개수
				"${discontentSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
				"5", // 페이지 당 출력행의 개수
				"10", // 페이지 당 보여줄 페이징번호 개수
				"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
				)
			);
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
	
	function goSearch(){
		alert(1);
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.discontentSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword]");
		inputData("selectPageNo","1");
		document.discontentSearchForm.submit();
	}
	
</script>


</head>

<body>
	<center>
		
		<h1>불만게시판 관리자용UI</h1>
		<form class="discontentSearchForm" name="discontentSearchForm" method="post"
			action="/support/adminDiscontentListForm.do">
			<table class="tbcss1" width="800" border="1" bordercolor="#DDDDDD"
				cellpadding="5" align="center">
				<tr align="center">
					<th bgcolor="${headerColor}" colspan="6">회원 검색</th>
				<tr align="center">
					<th bgcolor="${headerColor}" width=60>키워드
					<td width=250><input type="text" name="keyword">
			</table>
			<input type="hidden" name="selectPageNo">
			<!-- 
		<input type="hidden" name="ascDesc">
		<input type="hidden" name="selectOption"> -->
			<table>
				<tr height=4>
					<td>
			</table>
			<input type="button" value="검색" onClick="goSearch();"> <input
				type="button" value="전부검색" onClick="goSearchAll();"> <input
				type="reset" value="초기화"> 

		</form>
		<br> <br>
		<table border=0>

			<tr>

				<td align=right>검색 총 개수 : ${requestScope.adminDiscontentListAllCnt} 개
			<tr>
				<th align=center><span class="pagingNumber"></span>
			<tr>
				<td>

					<table class="tbcss2 discontentList" border="0" cellspacing="0"
						cellpadding="5" rules="rows" frame="hsides" width=700px>
						<tr>
							<th>번호
							<th>제목
							<th>글쓴이
							<th>등록일
							<th>조회수
							<c:forEach items="${adminDiscontentList}" var="adminDiscontent"
									varStatus="loopTagStatus">
									<tr style="cursor: pointer" onClick="goAdminDiscontentContentForm(${adminDiscontent.discontent_no});">
										<td>${selectPageNo*rowCntPerPage-rowCntPerPage+1+loopTagStatus.index}
											<!-- 1증가일련번호-->
										<td><c:if test="${adminDiscontent.print_no > 1 }">
												<c:forEach begin="1" end="${adminDiscontent.print_no }">
													&nbsp;
												</c:forEach>
												답변:
											</c:if> ${adminDiscontent.discontent_subject}
										<c:choose>
												<c:when test="${adminDiscontent.print_no==1}">
												<td>${adminDiscontent.user_name}
												</c:when>

												<c:otherwise>
												<td>${adminDiscontent.admin_name}
												</c:otherwise>
										</c:choose>
										<td>${adminDiscontent.reg_date}
										<td>${adminDiscontent.readcount}
								</c:forEach>
					</table>
		</table>

		<br> ${requestScope.adminDiscontentListAllCnt==0? '  검색된 글이 없습니다.  ':''}
		
			
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
		
		</center>
</body>
</html>