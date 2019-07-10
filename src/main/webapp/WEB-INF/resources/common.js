//***************************************************
// <회원가입>과 <운전자 등록> 시 유효성 체크 함수 
//***************************************************

   // id 유효성 체크 함수(영어 소문자 또는 숫자로 6~15자)
   function id_check(id){
       try{
           /*
           var val=$("[name='id']").val();
            */
           var val = $.trim(id);
           if(val==""){
               return false;
           }
           var check_RegExp = new RegExp(/^[a-z][a-z0-9]{5,14}$/).test(val);
           return check_RegExp;
       }
       catch(e){
           alert("id_check()에서 에러발생");
           return false;
       }
   }
   
   //--------------------------------------------------------------------------
   // 암호 유효성 체크 함수(영문 또는 숫자만 6~15자)
   function pwd_check(pwd){
       try{
           /*var val=$("[name='pwd']").val();*/
           var val = $.trim(pwd);
           
           if(val==""){
               return false;
           }
           
           var check_RegExp = new RegExp(/^[a-z0-9]{6,15}$/).test(val);
           return check_RegExp;
       }
       catch(e){
           alert("pwd_check()에서 에러발생");
           return false;
       }
   }
   
   //--------------------------------------------------------------------------
   // 암호 재확인하는 유효성 체크 함수
   function pwd2_check(pwd,pwd2){
       try{
           /*var pwd = $("[name = 'pwd']").val();
           var pwd2 = $("[name = 'pwd2']").val();
   */
           if(pwd != pwd2) {
               alert("암호를 똑같이 입력해주세요.");
               return false;
           }   
           else{
        	   return true;
           }
       }
       catch(e){
           alert("pwd_check()에서 에러발생");
           return false;
       }
   }
   
   //--------------------------------------------------------------------------
   // 이름 유효성 체크 함수(한글만 2~10자 사이)
   function name_check(name){
       try{
          /* var val=$("[name='name']").val();*/
           var val = $.trim(name);
           
           if(val==""){
               return false;
           }
           
           var check_RegExp = new RegExp(/^[가-힣]{2,10}$/).test(val);
           return check_RegExp;
       }
       catch(e){
           alert("name_check()에서 에러발생");
           return false;
       }
   }
   
   //--------------------------------------------------------------------------
   // 성별 유효성 체크 함수(성별에 체크가 되었는지 확인)
   function gender_check(gender){
       try{
           
           
           if(gender == 0) {
               alert("성별을 선택해 주세요.");
               return false;
           }
       }
       catch(e){
           alert("gender_check()에서 에러발생");
           return false;
       }
   }
   
   //--------------------------------------------------------------------------
   // 주민번호 유효성 체크 함수
   function jumin_num_check(num1,num2) {
       
	 
       var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
       var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열
      
       for (var i=0; i<num1.length; i++) {
           arrNum1[i] = num1.charAt(i);
       } // 주민번호 앞자리를 배열에 순서대로 담는다.
      
       for (var i=0; i<num2.length; i++) {
           arrNum2[i] = num2.charAt(i);
       } // 주민번호 뒷자리를 배열에 순서대로 담는다.
    
       var tempSum=0;
      
       for (var i=0; i<num1.length; i++) {
           tempSum += arrNum1[i] * (2+i);
       } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함
      
       for (var i=0; i<num2.length-1; i++) {
           if(i>=2) {
               tempSum += arrNum2[i] * i;
           }
           else {
               tempSum += arrNum2[i] * (8+i);
           }
       } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
   
       if((11-(tempSum%11))%10!=arrNum2[6]) {
           alert("올바른 주민번호가 아닙니다.");
           //num1.value = "";
           //num2.value = "";
           return false;
       }else{/*
           alert("올바른 주민등록번호 입니다.");*/
           return true;
       }
   }
   
   //--------------------------------------------------------------------------
   // 휴대폰 유효성 체크 함수
   function phone_check(phone){
       try{
           /*var val=$("[name='phone']").val();*/
           val = $.trim(phone);
           
           if(val==""){
               return false;
           }
   
           var check_RegExp = new RegExp(/^01[0|1|6|9|7][0-9]{3,4}[0-9]{4}$/).test(val);
           return check_RegExp;
       }
       catch(e){
           alert("phone_check()에서 에러발생");
           return false;
       }
   }
   
   //--------------------------------------------------------------------------
   // 이메일 유효성 체크 함수(한글만 2~10자 사이)
   function email_check(email){
       try{
           /*var val=$("[name='email']").val();*/
           val = $.trim(email);
           
           if(val==""){
               return false;
           }
   
           var check_RegExp = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/).test(val);
           return check_RegExp;
       }
       catch(e){
           alert("email_check()에서 에러발생");
           return false;
       }
   }
   
   //***************************************************
   // 운전면허 유효성 체크 함수
   //***************************************************
   function driver_license_check(license){
       try{
           val = $.trim(license);
           
           if(val==""){
               return false;
           }
           // 강원14충북15충남16전북17전남18경북19경남20제주21대구22인천23대전25울산26
           var check_RegExp = 
           new RegExp(/^[서울|11|부산|12|경기|13|강원|14|충북|15|충남|16|전북|17|전남|18|경북|19|경남|20|제주|21|대구|22|인천|23|대전|25|울산|26]{2}-[0-9]{2}-[0-9]{6}-[0-9]{2}$/).test(val);
           return check_RegExp;
       }
       catch(e){
           alert("driver_license_check()에서 에러발생");
           return false;
       }
   }
   
   //***************************************************
   // // 차량번호판 유효성 체크 함수 
   //***************************************************
   function car_number_check(carNumber){
       try{
           val = $.trim(carNumber);
           
           if(val==""){
               return false;
           }

           var check_RegExp = new RegExp(/^[0-9]{2}[가-힣]{1}[0-9]{4}|[가-힣]{1}[0-9]{4}$/).test(val);
           return check_RegExp;
       }
       catch(e){
           alert("car_number_check()에서 에러발생");
           return false;
       }
   }
   
   //***************************
   // 주행거리 유효성 체크 함수
   //***************************
    function car_distance_check(distance){
        
        try{
            val = $.trim(distance);
            
            if(val==""){
                return false;
            }

            var check_RegExp = new RegExp(/^[1-9]{1}[0-9]*$/).test(val);
            if(check_RegExp==false){
            	check_RegExp = new RegExp(/^0$/).test(val);
            }
            return check_RegExp;
        }
        catch(e){
            alert("car_distance_check()에서 에러발생");
            return false;
        }
    }

// 이 위까지 새로만든 유효성 함수(재영)
//******************************************************************************************
    
    
    
   

    function is_empty2(name){

    	try{
    		alert(1);
    			var tmp=$.trim(name);

        		alert(2);
    			tmp=tmp.split(" ").join("");
    			if(tmp!=""){
    				return true;
    			}

        		alert(3);
    		return false;
    	}catch (e) {
    		alert("is_empty('"+nameV+"')함수에서 에러 발생!");
    		return false;
    	}

    }    
    
    
    
//비어있는지 확인
function is_empty(nameV){

	try{
		var flag = true;

		var obj = $("[name="+nameV+"]");
		if(obj.is(":checkbox")|| obj.is(":radio")){
			if(obj.filter(":checked").length>0){
				flag=false;

			}
		}
		else{
			var tmp=obj.val();
			tmp=$.trim(tmp);
			obj.val(tmp);
			tmp=tmp.split(" ").join("");
			if(tmp!=""){
				flag=false;
			}
		}
		return flag;
	}catch (e) {
		alert("is_empty('"+nameV+"')함수에서 에러 발생!");
		return false;
	}

}

//키워드에 특수문자가 들어가는지?
function is_special_char(nameV){
	try{
		var val=$("[name="+nameV+"]").val();
		val = $.trim(val);
		if(val==""){
			return false;
		}

		var is_special = new RegExp(/[^a-zA-Z가-힣0-9_]/).test(val);
		return is_special;

	}
	catch(e){
		alert("is_special_char 에서 에러");
		return false;
	}
}

function inputData(nameV,data){
	try{
		// 만약 데이터가 null 또는 undefined 면 함수 중단
		if(data==null || data == undefined){
			return;
		}
		// 만약 길이가 없거나 공백으로만 구성되어 있으면 함수 중단
		if((data+"").split(" ").join("")==""){
			return;
		}

		//name 값을 가진 입력 양식을 관리하는 JQuery 객체 생성하기
		var obj = $("[name="+nameV+"]");

		// 만약 입력 양식이 checkbox 또는 radio면
		// nameV 변수 안의 데이터를 가진 checkbox 또는 radio 를 체크하기
		if(obj.is(":checkbox") || obj.is(":radio")){
			obj.filter("[value="+data+"]").prop("checked",true);
		}

		// 만약 아니면 naveV 변수 안의 데이터를 삽입하기
		else{
			obj.val(data);
		}
	}
	catch(e){
		alert("inputData에서 에러 발생")
	}
}

//입력 양식에 value 값을 삭제하거나 체크 값을 풀어주는 함수 선언하기
function setEmpty(nameV){
	try {
		// name 값이라는 가진 양식을 관리하는 JQuery 객체 생성하기
		var obj = $("[name="+nameV+"]");

		if(obj.length==0){
			alert("name="+nameV+"을 가진 입력양식이 없습니다.");
			return;
		}

		// 만약 입력 양식이 checkbox 또는 radio면
		// nameV 변수 안의 데이터를 가진 checkbox 또는 radio 를 체크하기
		if(obj.is(":checkbox") || obj.is(":radio")){
			obj.prop("checked",false);
		}

		// 만약 아니면 naveV 변수 안의 데이터를 삽입하기
		else{
			obj.val("");
		}
	} catch (e) {
		alert("setEmpty에서 에러 발생")
		// TODO: handle exception
	}
}

function setEmpty2(selector){
	try {
		var jqueryObj = $(selector);
		jqueryObj.each(function(){
			var thisObj = $(this);
			if(thisObj.is(":checkbox") || thisObj.is(":radio")){
				thisObj.prop("checked",false);
			}
			else{
				thisObj.val("");
			}
		})
	} catch (e) {
		// TODO: handle exception
	}
}

function is_pattern(nameV, patternObj){
	try {

		var jqObj = $("[name="+nameV+"]");
		if(jqObj.is(":checkbox") || jqObj.is(":radio") || jqObj.is("select")){
			alert("checkbox 또는 radio 또는 select 는 is_pattern 함수의 호출 대상이 아닙니다.");
			return;
		}
		var value= jqObj.val();
		return patternObj.test(value);
	} catch (e) {
		alert("is_pattern('"+nameV+"' ~) 함수에서 에러 발생!");
		// TODO: handle exception
	}
}

function setTableTrBgColor(tableClassV,headerColor,oddBgColor,evenBgColor,mouseOnBgColor){
	try{
		var firstTrObj= $("."+tableClassV+" tr:eq(0)");
		var trObjs=firstTrObj.siblings("tr");
		firstTrObj.css('background',headerColor)
	
		trObjs.filter(":odd").css('background',evenBgColor);
		trObjs.filter(":even").css('background',oddBgColor);

		trObjs.hover(
				function(){
					$(this).css('background',mouseOnBgColor);
				},
				function(){
					if($(this).index()%2==0){
						$(this).css('background',evenBgColor);
					}else{

						$(this).css('background',oddBgColor);
					}
				});
	}catch(e){
		alert("setTableTrBgColor('"+tableClassV+"',~) 함수 호출시 에러발생");
	}
}


function printMenubar(  
	menunbarBgColor 
	,mouseoverBgColor
	,mouseoverFontColor
	,mouseoutBgColor
	,mouseoutFontColor
	,menubarArr
){
	//-------------------------------------	
	// 메뉴바 출력하기
	//-------------------------------------	
	var menubars = [];
	/* menubars.push("<style>");
	menubars.push(".tbcss0, .tbcss0 td, .tbcss0 th{ ");
	menubars.push("	border-collapse: collapse; ");
	menubars.push("	border:0px solid gray;");
	menubars.push("	font-size: 9pt;
	menubars.push("	font-family: tahoma,굴림,돋움,verdana; ");
	menubars.push(" }");
	menubars.push("</style>"); */
	
	menubars.push("<table border=0 width='100%' bgcolor='"+menunbarBgColor+"' cellpadding=0 cellspacing=0><tr><td>");
	//---
	menubars.push("<table border=0 class='menubar' bgcolor='"+mouseoutBgColor+"' align='center' cellpadding=3");
	menubars.push("<tr>");		
	for( var i=0 ; i<menubarArr.length; i++ ){
		menubars.push("<th style='cursor:pointer;' onclick=\"location.href='"+menubarArr[i][0]+"';\">");
		menubars.push(   "   "+menubarArr[i][1]+"   ");
	}
	menubars.push("</table></table>");	
	//-------------------------------------	
	// 메뉴바 html 소스 출력 얻기
	//-------------------------------------	
	$("body").prepend( menubars.join("") );		
	//-------------------------------------	
	// 현재 화면의 URL을 가진 메뉴바의 인덱스 번호 얻기
	//-------------------------------------	
	var nowPageURL = location.href;  //alert(nowPageURL)
	var choicedMenunarIdx = 0;
	//---
	for( var i=0 ; i<menubarArr.length ; i++ ){
		if( nowPageURL.lastIndexOf(menubarArr[i][0])>=0 ){
			choicedMenunarIdx = i; break;
		}
	}
	//-------------------------------------	
	// 메뉴바에 [마우스 오버], [마우스 아웃] 시 실행할 코딩 설정하기
	//-------------------------------------	
	var menubarThObjs = $(".menubar th");
	menubarThObjs.hover(
		function(){
			var thisObj = $(this);
			// [마우스 오버] 한 메뉴바의 배경색 지정
		    thisObj.css("background-color",mouseoverBgColor);
			// [마우스 오버] 한 메뉴바의 글자색 지정
			thisObj.html( "<font color="+mouseoverFontColor+"><b>" + thisObj.text() +"</b></font>" );
			// [마우스 오버] 한 메뉴바 형제 메뉴바의 배경색, 글자색 지정                                               
			thisObj.siblings().each(function(){
				$(this).css("background-color",mouseoutBgColor); 
				$(this).html( "<font color="+mouseoutFontColor+"><b>" + $(this).text() +"</b></font>" );
			});
		}
		,function(){	
			var thisObj = $(this);
			// [마우스 아웃] 한 메뉴바의 배경색 지정
			thisObj.css("background-color",mouseoutBgColor); 
			// [마우스 아웃] 한 메뉴바의 글자색 지정
			thisObj.html( "<font color="+mouseoutFontColor+"><b>" + thisObj.text() +"</b></font>" );
			// 선택된 메뉴바를 코딩으로 [마우스 오버]하기
			menubarThObjs.eq( choicedMenunarIdx ).mouseover();
		}
	);	
	//-------------------------------------	
	// 현재 화면의 URL을 가진 메뉴바를 코딩으로 [마우스 오버] 하기
	//-------------------------------------	
	menubarThObjs.eq( choicedMenunarIdx ).mouseover();
}



//**************************************************************
//검색화면에서 검색 결과물의 페이징 번호 출력 소스 리턴
//**************************************************************
function getPagingNumber(
	totRowCnt               // 검색 결과 총 행 개수
	, selectPageNo_str         // 선택된 현재 페이지 번호
	, rowCntPerPage_str     // 페이지 당 출력행의 개수
	, pageNoCntPerPage_str  // 페이지 당 출력번호 개수
	, jsCodeAfterClick      // 페이지 번호 클릭후 실행할 자스 코드
) {
	//--------------------------------------------------------------
	// name=nowPage을 가진 hidden 태그없으면 경고하고 중지하는 자바스크립트 소스 생성해 저장
	//--------------------------------------------------------------
	$(document).ready(function( ){
		
		if( $('[name=selectPageNo]').length==0 ){
			alert("name=nowPage 을 가진 hidden 태그가 있어야 가능함.');" );
		}
	});
	var arr = [];
	try{
		if( totRowCnt==0 ){	return ""; }	
		if( jsCodeAfterClick==null || jsCodeAfterClick.length==0){
			alert("getPagingNumber(~) 함수의 5번째 인자는 존재하는 함수명이 와야 합니다");
			return "";
		}			
		//--------------------------------------------------------------
		// 페이징 처리 관련 데이터 얻기
		//--------------------------------------------------------------
		if( selectPageNo_str==null || selectPageNo_str.length==0 ) { 
			selectPageNo_str="1";  // 선택한 현재 페이지 번호 저장
		} 
		if( rowCntPerPage_str==null || rowCntPerPage_str.length==0 ) { 
			rowCntPerPage_str="10";  // 선택한 현재 페이지 번호 저장
		}
		if( pageNoCntPerPage_str==null || pageNoCntPerPage_str.length==0 ) { 
			pageNoCntPerPage_str="10";  // 선택한 현재 페이지 번호 저장
		}
		//---
		var selectPageNo = parseInt(selectPageNo_str, 10);
		var rowCntPerPage = parseInt(rowCntPerPage_str,10);
		var pageNoCntPerPage = parseInt(pageNoCntPerPage_str,10);
		if( rowCntPerPage<=0 || pageNoCntPerPage<=0 ) { return; }
		//--------------------------------------------------------------
		//최대 페이지 번호 얻기
		//--------------------------------------------------------------
		var maxPageNo=Math.ceil( totRowCnt/rowCntPerPage );   
			if( maxPageNo<selectPageNo ) { selectPageNo = 1; }

		//--------------------------------------------------------------
		// 선택된 페이지번호에 따라 출력할 [시작 페이지 번호], [끝 페이지 번호] 얻기
		//--------------------------------------------------------------
		var startPageNo = Math.floor((selectPageNo-1)/pageNoCntPerPage)*pageNoCntPerPage+1;  // 시작 페이지 번호
		var endPageNo = startPageNo+pageNoCntPerPage-1;                                      // 끝 페이지 번호
			if( endPageNo>maxPageNo ) { endPageNo=maxPageNo; }
			/*//--------------------------------------------------------------
			// <참고>위 코딩은 아래 코딩으로 대체 가능
			//--------------------------------------------------------------
			var startPageNo = 1;
			var endPageNo = pageNoCntPerPage;
			while( true ){
				if( selectPageNo <= endPageNo ){ startPageNo = endPageNo - pageNoCntPerPage + 1; break; }
				endPageNo = endPageNo + pageNoCntPerPage;
			}*/

		//---
		var cursor = " style='cursor:pointer' ";
		//arr.push( "<table border=0 cellpadding=3 style='font-size:13'  align=center> <tr>" );
		//--------------------------------------------------------------
		// [처음] [이전] 출력하는 자바스크립트 소스 생성해 저장
		//--------------------------------------------------------------
		//arr.push( "<td align=right width=110> " );
		if( startPageNo>pageNoCntPerPage ) {
			arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('1');"
							+jsCodeAfterClick+";\">[처음]</span>" );
			arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
				+(startPageNo-1)+"');"+jsCodeAfterClick+";\">[이전]</span>   " );
		}
		//--------------------------------------------------------------
		// 페이지 번호 출력하는 자바스크립트 소스 생성해 저장
		//--------------------------------------------------------------
		//arr.push( "<td align=center>  " );
		for( var i=startPageNo ; i<=endPageNo; ++i ){
			if(i>maxPageNo) {break;}
			if(i==selectPageNo || maxPageNo==1 ) {
				arr.push( "<b>"+i +"</b> " );
			}else{
				arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
							+(i)+"');"+jsCodeAfterClick+";\">["+i+"]</span> " );
			}
		}
		//--------------------------------------------------------------
		// [다음] [마지막] 출력하는 자바스크립트 소스 생성해 저장
		//--------------------------------------------------------------
		//arr.push( "<td align=left width=110>  " );
		if( endPageNo<maxPageNo ) {
			arr.push( "   <span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
						+(endPageNo+1)+"');"+jsCodeAfterClick+";\">[다음]</span>" );
			arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
						+(maxPageNo)+"');"+jsCodeAfterClick+";\">[마지막]</span>" );
		}
		//arr.push( "</table>" );
		return arr.join( "" );
	}catch(ex){
		alert("getPagingNumber(~) 메소드 호출 시 예외발생!");
		return "";
	}
}

//**************************************************************
function printPagingNumber(
//**************************************************************
	totRowCnt               // 검색 결과 총 행 개수
	, selectPageNo_str         // 선택된 현재 페이지 번호
	, rowCntPerPage_str     // 페이지 당 출력행의 개수
	, pageNoCntPerPage_str  // 페이지 당 출력번호 개수
	, jsCodeAfterClick      // 페이지 번호 클릭후 실행할 자스 코드
) {
	document.write(
		getPagingNumber(
			totRowCnt               // 검색 결과 총 행 개수
			, selectPageNo_str         // 선택된 현재 페이지 번호
			, rowCntPerPage_str     // 페이지 당 출력행의 개수
			, pageNoCntPerPage_str  // 페이지 당 출력번호 개수
			, jsCodeAfterClick      // 페이지 번호 클릭후 실행할 자스 코드
		) 
	);
}
	
function print_html_info(   ){
	$('.jsp_src').remove();
	var formObjs = $("form");
	//---------------------------------------------------------
	for( var i=0 ; i<formObjs.length ; i++ ){
			var html = [];
			var cnt = 0;
			var name_bank = [];
			var formObj = formObjs.eq(i);
			html.push("<caption>폼태그명 => "+ formObj.attr("name") + "</caption>" );
			formObj.find("input,select,textarea").not("[type=button]").each(function(ii){
				var thisObj = $(this);
				var type = "";
				var name = thisObj.attr("name");
				var value = thisObj.val();
				//---
				if( (":" + name_bank.join(":") + ":").indexOf(":"+name+":")>=0 ) { return; }
				else                               { name_bank.push(name); }
				//---
				if( thisObj.is("select") )         { type = "select"; }
				else if( thisObj.is("textarea") )  { type = "textarea"; }
				else if( thisObj.is(":checkbox") ) { type = "checkbox"; }
				else if( thisObj.is(":radio") )    { type = "radio"; }
				else                               { type = thisObj.attr("type"); }
				//---
				if( thisObj.is(":checkbox") || thisObj.is(":radio") ){
					var tmp = "";
					formObj.find("[name="+name+"]").filter(":checked").each(function(){
						tmp = tmp + "," + $(this).val();
					})
					value = tmp;
					if( value.indexOf(",")==0 ) { value = value.substring(1); }
				}
				//---
				if( cnt++%2==1)   { html.push("<tr bgcolor=bluelight>"); }
				else         { html.push("<tr>"); }
				html.push("<th>"+ (type==""?" ":type) );
				html.push("<th>"+ (name==""?" ":name)  );
				html.push("<th>"+ (value==""?" ":value) ) ;
				//-------------
				//$("[name="+name+"]").remove();
			});
			$("body").append( "<div class=jsp_src><hr><table border=1 align=center cellpadding=3><tr bgcolor=gray><th>타입<th>이름<th>값"+ html.join("") + "</table></div>")
	}
}
	
	


	
	
