<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<%@include file="userMainPage.jsp"%>
<%@include file="table.jsp"%>

<html>
<script>
	$(document).ready(function() {
	});
	function goReviewRegForm(number){
		alert(1);
		document.reviewRegForm.reserve_apply_car_number.value=number;
		document.reviewRegForm.submit();
		
	}
</script>
<head>

</head>
<body>
	<div class="page-wrapper bg-jy p-t-45 p-b-50">
		<div class="wrapper wrapper--w960">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">이용내역</h2>
				</div>
				<div class="card-bodyTable">
					<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100">
								<div class="table100">
									<table>
										<thead>
											<tr class="table100-head">
												<th class="column1">번호</th>
												<th class="column2">출발지</th>
												<th class="column3">도착지</th>
												<th class="column4">예약일시</th>
												<th class="column5">운전자</th>
												<th class="column6">예약상태</th>
												<th class="column7">평점</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${userUtilDetailList}" var="user"
												varStatus="loopTagStatus">
												<tr>
													<td>${loopTagStatus.index+1}</td>
													<td>${user.start_road_addr}</td>
													<td>${user.end_road_addr}</td>
													<td>${user.reservation_date}</td>
													<td>${user.driver_name}</td>
													<td>${user.reserve_status_name}</td>

													<c:choose>
														<c:when test="${user.review_score=='미평가'}">
															<td><input type="button" value="리뷰남기기"
																onclick="goReviewRegForm(${user.reserve_apply_car_number});">
															</td>
														</c:when>
														<c:otherwise>
															<td>${user.review_score}점</td>

														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<form name="reviewRegForm" method="post"
		action="/support/reviewRegForm.do">
		<input type="hidden" name="reserve_apply_car_number" value="">
	</form>


</body>
</html>