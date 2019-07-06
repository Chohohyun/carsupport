<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page import="java.util.*" %>
<%@ page import="com.support.movement.*" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 얘는 include directive에 포함되지 않는다. -->
 <script src="/support/resources/vendor2/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="/support/resources/vendor2/select2/select2.min.js"></script>
    <script src="/support/resources/vendor2/datepicker/moment.min.js"></script>
    <script src="/support/resources/vendor2/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/support/resources/js2/global.js"></script>


	<script src="/support/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="/support/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/support/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/support/resources/vendor/select2/select2.min.js"></script>
	<script src="/support/resources/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="/support/resources/js/main.js"></script>
<script src="/support/resources/jquery-1.11.0.min.js"></script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/support/resources/common.css?ver=<%=Math.random()%>" rel="stylesheet" type="text/css">

<!-- 사용자 정의 태그인 JSTL의 C 코어태그를 사용하여 변수 선언하기 -->
<!-- 변수 thColor 선언하고 데이터 #708090 저장하기 -->
<!-- C 코어 태그로 선언된 변수안의 꺼낼때는 EL문법으로 로 거낸다 -->
<c:set var="headerColor" value="#708090"/>
<c:set var="oddTrColor" value="#E8F0F4"/>
<c:set var="evenTrColor" value="#white"/>
<c:set var="mouseOverColor" value="#D0E0F4"/>

<script src="/support/resources/common.js?ver=<%=Math.random()%>"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function searchPostal_code() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postal_code').value = data.zonecode;
                document.getElementById("road_addr").value = roadAddr;
                document.getElementById("jibun_addr").value = data.jibunAddress;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
${warning}