<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="userMenuBar.jsp" %>
<html>
<script>
	$(document).ready(function(){
				
		/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
		
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		//주소로 좌표를 검색합니다
		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			alert(coords);
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
	});     */
});
		
	function goMainPage(){
		location.replace("/support/userMainPage.do");

	}
	function checkDate(){
    	var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 
		var sysdate = year + "" + month + "" + day;
    	var regDate = $("[name=car_reservation_date]").val();
    	if(regDate>sysdate){
    		alert("과거 날짜를 선택할 수 없습니다.");
    		$("[name=car_reservation_date]").val("");
    		return;
    	}
    }   
   	function checkHour(){
   		if(is_empty("car_reservation_date")){
    		alert("날짜를 먼저선택해주세요.");
    		$("[name=car_reservation_hour]").val("");
    		return;
    	}
   
   		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		var hour = new String(date.getHours());
		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 
		if(hour.length==1){
			hour = "0" + hour;
		}
		var sysdate = year + "" + month + "" + day ;
    	var regDate = $("[name=car_reservation_date]").val();
    	var regHour = $("[name=car_reservation_hour]").val();
    	if(regDate==sysdate){
    		if(hour>=regHour){
    			alert("과거 시간을 선택할 수 없습니다.");
    			return;
    		}
    	}
    		
   		
   		
   	}
</script>
<script>
function reservationCheck() {
			var start_postal_code = $("[name=start_postal_code]").val();
			if (is_empty2(start_postal_code) == false) {
			alert("출발지를 검색해주세요.");
			return;
			}
			var end_postal_code = $("[name=end_postal_code]").val();
			if (is_empty2(end_postal_code) == false) {
			alert("도착지 검색해주세요.");
			return;
			}
			
			if(is_empty("car_reservation_date")){
        		alert("날짜를 선택해주세요.");
        	return;
        	}
			if(is_empty("car_reservation_hour")){
				alert("시간을 선택해주세요.");
			return;
			}
		alert(1);
		alert($("[name=carReservationForm]").serialize());
		$.ajax({
			url:"/support/reservationCheck.do",
			type:"post",
			data: $("[name=carReservationForm]").serialize(),
			datatype:"html",
			
			success:function(data){
				if(data==1){
					alert("예약신청 성공!");
					location.replace("/support/userMainPage.do");
					
				}
				else if(data==0){
					alert("예약신청 도중 오류발생.");
				}
				else if(data==-2){
					alert("예약가능한 차량이 없습니다. 날짜나 차량종류를 변경해주세요.");
				}
				else{
					alert("예약실패");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
</script> <!-- Jquery JS-->
   
<head>
   
    <!-- Title Page-->
    <title>회원가입</title>
    
    <!-- 신청 날짜 달력 코드 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
        <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css" />

        <script type="text/javascript">
            $(function() { 
            $("#datepicker").datepicker({
            dateFormat: 'yymmdd',
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNamesMin: ['일','월','화','수','목','금','토'],
                changeMonth: true, //월변경가능
                changeYear: true, //년변경가능
                showMonthAfterYear: true, //년 뒤에 월 표시
            });
            });
    	</script>


    <!-- Icons font CSS-->
    <link href="/support/resources/vendor2/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="/support/resources/vendor2/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/support/resources/css/main.css" rel="stylesheet" media="all">
    <link href="/support/resources/css2/main.css" rel="stylesheet" media="all">
    
    
    
	<link rel="icon" type="image/png" href="/support/resources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css2/main.css">
    
    
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
           
                <div class="card-heading">
                    <h2 class="title">예약하기</h2>
                </div>
                <div class="card-body">
                
                   
                    
                    <!-- ----------------------------------------------------------------------------------------------- -->
                    
                      <form name="carReservationForm" method="POST">
                        
                         <div class="form-row m-b-55">
                            <div class="name">출발지</div>
                            <div class="value">
                                <div class="row row-refine">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                      						  <input class="input100 input--style-5" id="startpostal_code"  type="text" placeholder="주소검색을 눌러주세요." name="start_postal_code" onfocus="this.blur();" readonly>
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                        					<input type="button" class="login100-form-btn btn btn--radius-2 btn--red" onclick="searchPostal_code('start')" value="주소검색">
                                            
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         <div class="wrap-input40 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="startroad_addr"  type="text" placeholder="주소검색을 눌러주세요." name="start_road_addr" onfocus="this.blur();" readonly>
                       					
                                           <span class="focus-input100"></span>
                                        
                                        </div>
                                        
                                 			  &nbsp;&nbsp;&nbsp;
                                          <div class="wrap-input50 input-group-desc">
                    					<input class="input100 input--style-5" id="startjibun_addr" type="text" placeholder="주소검색을 눌러주세요." name="start_jibun_addr" onfocus="this.blur();" readonly>
                                            
                                           <span class="focus-input100"></span>
                                          
										<span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="wrap-input100 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="startdetail_addr"  type="text" name="start_detail_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        </div>
                                
                                </div>
                            </div>
                        </div> 
                      
                      	<input type="hidden" name="startLatitude" id="startLatitude">
                      	<input type="hidden" name="startLongitude" id="startLongitude">
                      	
                         <div class="form-row m-b-55">
                            <div class="name">도착지</div>
                            <div class="value">
                                <div class="row row-refine">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                      						  <input class="input100 input--style-5" id="endpostal_code"  type="text" placeholder="주소검색을 눌러주세요."  onfocus="this.blur();" name="end_postal_code" readonly>
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                        					<input type="button" class="login100-form-btn btn btn--radius-2 btn--red" onclick="searchPostal_code('end')" value="주소검색">
                                            
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         <div class="wrap-input40 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="endroad_addr"  type="text" name="end_road_addr"  placeholder="주소검색을 눌러주세요." onfocus="this.blur();" eadonly>
                       					
                                           <span class="focus-input100"></span>
                                        
                                        </div>
                                        
                                 			  &nbsp;&nbsp;&nbsp;
                                          <div class="wrap-input50 input-group-desc">
                    					<input class="input100 input--style-5" id="endjibun_addr" type="text" name="end_jibun_addr"  placeholder="주소검색을 눌러주세요." onfocus="this.blur();" readonly>
                                            
                                           <span class="focus-input100"></span>
                                          
										<span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="wrap-input100 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="edndetail_addr"  type="text" name="end_detail_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        </div>
                                
                                </div>
                            </div>
                        </div> 
                        
                        
                      	<input type="hidden" name="endLatitude" id="endLatitude">
                      	<input type="hidden" name="endLongitude" id="endLongitude">
                        <!-- 
                        <div class="form-row m-b-55">
                            <div class="name">지도확인</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                                       
										<div id="map" style="width:100%;height:350px;"></div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div> -->
                         <div class="form-row m-b-55">
                            <div class="name">차량종류</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                               			 <label class="radio-container m-r-55">슬로프
                                   		 <input type="radio" checked="checked" name="car_code" value="1">
                                    		<span class="checkmark"></span>
                               			 </label>
                               			 <label class="radio-container m-r-55">리프트
                                   		 <input type="radio"  name="car_code" value="2">
                                    		<span class="checkmark"></span>
                               			 </label>
                                </div>
                               </div>
                            </div>
                        </div>
                        
                        
                         <div class="form-row m-b-55">
                            <div class="name">예약일시</div>
                            <div class="value">
                                <div class="row row-refine">
                                 	 
                                        <div class="wrap-input40 input-group-desc">
                                        
                                            <input class="input100 input--style-5" type="text" onchange="checkDate();" id="datepicker" name="car_reservation_date" placeholder="날짜선택▼">
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                                            <div class="rs-select2 js-select-simple select--no-search">
                                        	<select name="car_reservation_hour" onchange="checkHour();">
                                            <option disabled="disabled" selected="selected"  value="">시간을 선택해주세요</option>
                                            <option value="08">오전8시</option>
											<option value="10">오전10시</option>
											<option value="12">오후12시</option>
											<option value="14">오후2시</option>
											<option value="16">오후4시</option>
											<option value="18">오후6시</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        
                        
						                        
						<script>
						
						</script>
                        
                        
                        
                       <div class="form-row m-b-55">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                                           
                            <input type="button" class=" login100-form-btn btn btn--radius-2 btn--red" onclick="reservationCheck();" value="예약신청">
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input40 input-group-desc">
                                        
               						 
                            <input type="button" class="login100-form-btn btn btn--radius-2 btn--green" type="button" onclick="goMainPage();" value="취소">
                               <span class="focus-input100"></span>
                          </div>           
                       </div>    
                    </form>
                </div>
            </div>
        </div>
    </div>

   

</body>
</html>