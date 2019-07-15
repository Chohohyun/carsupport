<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>

<html>
<head>

<meta charset="utf-8">
<title>서울시각장애인 생활이동지원센터</title>
<!-- CSS -->
<link rel="stylesheet" href="code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="/support/resources/cssUserMain/bootstrap.min.css" rel="stylesheet">
<link href="/support/resources/cssUserMain/kbucall_web.css" rel="stylesheet">


<link type="text/css" href="/support/resources/cssUserMain/style.css" rel="stylesheet" />
<!-- javascript -->
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" src="/support/resources/jsUserMain/common/jquery.js"></script>
<script type="text/javascript" src="/support/resources/jsUserMain/common/jquery.cookie.js"></script>	
<script type="text/javascript" src="/support/resources/jsUserMain/common/jquery-ui.custom.min.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-135363789-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-135363789-1');
</script>
<script type="text/javascript">
	function menuLink(link_url) {
		location.href = link_url;
	}
	
	function contents_link(contents_no) {
		location.href = "/contents.do?contents_no="+contents_no;
	}
</script>

</head>

<body>	
	<div id="skipToContent">
		<a href="#container">본문 바로가기</a>
		
	</div>
	<!-- 헤더 -->
	<header id="header_wrap">
		<section>
			<a href="/" class="header_logo" title="서울시각장애인 생활이동지원센터"><img src="/support/resources/imagesUserMain/img_logo.png" alt="서울시각장애인 생활이동지원센터 로고"></a>
			<nav class="header_nav">
				<ul class="header_quick">
					<li><a href="/order/main.do?menu_no=3&amp;c_no=13" title="인터넷접수">인터넷접수</a></li>
					
						
													
							<li><a href="/login.do" title="로그인">로그인</a></li>
						
					
				</ul>
				<ul class="header_menu">
		
					<li>
					
						
						
							<a href="/sub.do?menu_no=1&amp;c_no=6" title="센터소개">센터소개</a>
						
											
					</li>
		
					<li>
					
						
						
							<a href="/sub.do?menu_no=3&amp;c_no=15" title="장애인 복지콜">장애인 복지콜</a>
						
											
					</li>
		
					<li>
					
						
						
							<a href="/sub.do?menu_no=5&amp;c_no=21" title="장애인 바우처택시">장애인 바우처택시</a>
						
											
					</li>
		
					<li>
					
						
						
							<a href="/sub.do?menu_no=4&amp;c_no=16" title="참여/열린마당">참여/열린마당</a>
						
											
					</li>
		
				</ul>
			</nav>
		</section>
	</header>
	<!--// 헤더 -->

	
	
<script type="text/javascript">
	$(function() {
		
	});

	function mainLink(url) {
		location.href = url;
	}
</script>
		<!-- 메인 -->
		<main id="main_wrap">
			<!-- 메인 비주얼 영역 -->
			<article class="main_visual_wrap" style="background: #0d1f3d url('/support/resources/banner/main/20190425104951720') center top no-repeat;">
				<section class="main_visual">
					<div class="main_msg">
						<p>시각장애인의 생활이동편의와 발이 되겠습니다.</p>
						<h2>서울시각장애인 생활·이동지원센터 </h2>						
						<div class="main_call">
							<ul>
								<li>신청접수 : 02-2092-0000<a href="tel:02-2092-0000" title="신청접수  02-2092-0000 전화연결"><img src="/support/resources/imagesUserMain/icon_call.png" alt="장애인복지콜 신청접수"></a></li>
								<li>1600-4477<a href="tel:1600-4477" title="신청접수  1600-4477 전화연결"><img src="/support/resources/imagesUserMain/icon_call.png" alt="장애인복지콜 신청접수"></a></li>
							</ul>						
						</div>
					</div>
				</section>
			</article>
			<!--// 메인 비주얼 영역 -->

			<!-- 메인 컨텐츠 영역 -->
			<article id="container" tabindex="0" class="main_contents" title="본문">
				<nav class="main_menu">
					<ul>
						<li class="menu_btn_method"><a href="javascript:void(0);" onclick="mainLink('/order/main.do?menu_no=3&amp;c_no=13'); return false;" title="이용안내">이용안내</a></li>
						<li class="menu_btn_method"><a href="javascript:void(0);" onclick="mainLink('/sub.do?menu_no=3&amp;c_no=12');" title="예약방법">예약방법</a></li>
						<li class="menu_btn_call"><a href="javascript:void(0);" onclick="mainLink('/sub.do?menu_no=3&amp;c_no=12');" title="예약하기">예약하기</a></li>
						<li class="menu_btn_voucher"><a href="javascript:void(0);" onclick="mainLink('/sub.do?menu_no=5&amp;c_no=21');" title="이용현황">이용현황</a></li>
					</ul>
				</nav>
				<section class="main_notice">
					<div class="main_notice_l">
						<span class="notice_header">공지사항<a href="/board.do?menu_no=4&amp;c_no=16" title="공지사항">전체보기</a></span>
						<ul>
							
								
									
										<li><a href="/board/view.do?menu_no=4&amp;c_no=16&amp;b_c_no=132">서울시각장애인생활이동지원센터 관제원 모집(~7/12)</a><span>06/28</span></li>
									
										<li><a href="/board/view.do?menu_no=4&amp;c_no=16&amp;b_c_no=124">2019년 상반기 장애인 바우처택시 신청접수 안내 </a><span>04/10</span></li>
									
										<li><a href="/board/view.do?menu_no=4&amp;c_no=16&amp;b_c_no=129">서울시각장애인생활이동지원센터 예약 합승제 시범 실시 안내</a><span>06/04</span></li>
									
										<li><a href="/board/view.do?menu_no=4&amp;c_no=16&amp;b_c_no=128">서울시각장애인생활이동지원센터 운전원 모집(~6/12)</a><span>05/21</span></li>
									
										<li><a href="/board/view.do?menu_no=4&amp;c_no=16&amp;b_c_no=121">2018년 서울시각장애인생활.이동지원센터 세입.세출결산서</a><span>03/25</span></li>
									
								
								
							
						</ul>
					</div>
					<div class="main_notice_r">
						<span class="notice_header">센터소식<a href="/board.do?menu_no=4&amp;c_no=39" title="센터소식">전체보기</a></span>
						<ul>
							
								
								
									<li>등록된 글이 없습니다.</li>
								
							
						</ul>
					</div>
				</section>
			</article>
			<!--// 메인 게시판 영역 -->

			<!-- 메인 배너 영역 -->
			<article class="main_banner_wrap">
				<ul class="main_banner">
								
					<li><a href="http://kbuseoul.org/" target="_blank" title="서울특별시시각장애인연합회 배너"><img src="/support/resources/banner/2019/6/20190612012430090" alt="서울특별시시각장애인연합회 배너"></a></li>
								
					<li><a href="http://www.seoul.go.kr/main/index.jsp" target="_blank" title="서울특별시 배너"><img src="/support/resources/banner/2019/6/20190612012442495" alt="서울특별시 배너"></a></li>
								
					<li><a href="http://www.kbuwel.or.kr/" target="_blank" title="사단법인한국시각장애인연합회 배너"><img src="/support/resources/banner/2019/6/20190612014403873" alt="사단법인한국시각장애인연합회 배너"></a></li>
					
				</ul>
			</article>
			<!--// 메인 배너 영역 -->
		</main>
		<!--// 메인 -->


		

		<!-- 푸터 -->
		<footer>
			<article class="footer_wrap">
				<div class="footer_link">
					<a href="/sub.do?menu_no=1&amp;c_no=6" title="센터소개">센터소개</a>
					<span> I </span>
					<a href="/contents.do?contents_no=2" title="개인정보 취급방침">개인정보 취급방침</a>					  
					<span> I </span>
					<a href="/contents.do?contents_no=3" title="이용자준수사항">이용자준수사항</a>
				</div>
				<span class="footer_callnum">
				전화. 1600-4477 / 02-2092-0000&nbsp;&nbsp;&nbsp;팩스. 02-937-0099&nbsp;&nbsp;&nbsp;
				민원 및 대절. 02-2092-0088&nbsp;&nbsp;&nbsp;바우처택시. 02-2092-0055
				</span>
				<p>서울특별시 동작구 상도로216 (인경빌딩 3, 4층)</p>
				<small>Copyright ⓒ 2018 kbucall. All Right Reserved.</small>
				
				<!-- 웹접근성 인증마크 -->
				<div class="wa_wrap">
					<a href="http://www.kwacc.or.kr/CertificationSite/WA/List" title="한국웹접근성평가센터 인증현황 바로가기 _새창" target="_blank">
					<img src="/support/resources/imagesUserMain/WA.png" alt="국가공인 웹 접근성 품질인증마크 ">
					</a>
				</div>				
			</article>			
		</footer>
		<!--// 푸터 -->	
	
</body>
</html>