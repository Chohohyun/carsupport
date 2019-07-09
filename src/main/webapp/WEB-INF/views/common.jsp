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
    function searchPostal_code(where) {
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
                document.getElementById(where+'postal_code').value = data.zonecode;
                document.getElementById(where+"road_addr").value = roadAddr;
                document.getElementById(where+"jibun_addr").value = data.jibunAddress;
               
              	//주소-좌표 변환 객체를 생성합니다
        		var geocoder = new kakao.maps.services.Geocoder();
        		//주소로 좌표를 검색합니다
        		geocoder.addressSearch(roadAddr, function(result, status) {
        		
        		// 정상적으로 검색이 완료됐으면 
        		 if (status === kakao.maps.services.Status.OK) {
        		
        		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        			alert(result[0].y);
        			
        			alert(result[0].x);
        			alert(1); 
                   	if(where=="start"||where=="end"){
                   		document.getElementById(where+"Latitude").value = result[0].y;
                   		document.getElementById(where+"Longitude").value = result[0].x;
                   	}
                   	
                   	
        		    // 결과값으로 받은 위치를 마커로 표시합니다
        		    var marker = new kakao.maps.Marker({
        		        map: map,
        		        position: coords
        		    });
        		
        		    // 인포윈도우로 장소에 대한 설명을 표시합니다
        		    var infowindow = new kakao.maps.InfoWindow({
        		        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        		    });
        		    infowindow.open(map, marker);
        		
        		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        		    map.setCenter(coords);
        		}
        		 else{
        			 alert(안되네);
        		 }
        	});    
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

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function searchPostal_code(where) {
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
                document.getElementById(where+'postal_code').value = data.zonecode;
                document.getElementById(where+"road_addr").value = roadAddr;
                document.getElementById(where+"jibun_addr").value = data.jibunAddress;
                
                if(where=="start"||where=="end"){
                	
               
	              	//주소-좌표 변환 객체를 생성합니다
	        		var geocoder = new kakao.maps.services.Geocoder();
	        		//주소로 좌표를 검색합니다
	        		geocoder.addressSearch(roadAddr, function(result, status) {
	        		
		        		// 정상적으로 검색이 완료됐으면 
		        		 if (status === kakao.maps.services.Status.OK) {
		        		
		        		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        			alert(result[0].y);
		        			document.getElementById(where+"Latitude").value = result[0].y;
		        			document.getElementById(where+"Longitude").value = result[0].x;
		        		    // 결과값으로 받은 위치를 마커로 표시합니다
		        		   /*  var marker = new kakao.maps.Marker({
		        		        map: map,
		        		        position: coords
		        		    });
		        		 */
		        		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		        		  /*   var infowindow = new kakao.maps.InfoWindow({
		        		        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        		    });
		        		    infowindow.open(map, marker); */
		        		
		        		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        		  /*   map.setCenter(coords); */
		        		}
		        		 else{
		        			 alert(안되네);
		        		 }
	        		});    
                }
        		
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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afb80388cd8571347e7d0d57ac49714a&libraries=services"></script>


<script>
function setCenter() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}        
</script>
${warning}