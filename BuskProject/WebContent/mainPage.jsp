<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="buskinglist" value="${requestScope.buskinglist}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<script type="application/x-javascript">
	
	
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	

</script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Mallanna" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var list = new Array();
		<c:forEach var="i" items="${buskinglist }" varStatus="status">
		var temp = [ "${i.name}", "${i.date}", "${i.time}", "${i.busking_loc}" ];
		list.push(temp);
		</c:forEach>
		console.log(list);
		if (list.length != 0) {
			for (var i = 0; i < list.length; i++) {
				document.getElementById("date" + i).innerHTML = "# "
						+ list[i][1];
				document.getElementById("busker" + i).innerHTML = list[i][0];
				document.getElementById("time" + i).innerHTML = list[i][2];
				document.getElementById("place" + i).innerHTML = list[i][3];
			}
		}
	});
</script>

</head>

<body>
	<!--Header-->
	<div class="top-bar_sub_w3layouts_agile">
		<%
			pageContext.include("/WEB-INF/views/include/topbar.jsp");
		%>
	</div>
	<div class="header" id="home">
		<!--/top-bar-->
		<%
			pageContext.include("/WEB-INF/views/include/header.jsp");
		%>
		<!--//top-bar-->
		<!-- banner-text -->
		<div class="slider">
			<div class="callbacks_container">
				<ul class="rslides callbacks callbacks1" id="slider4">
					<li>
						<div class="banner-top">
							<div class="banner-info-w3ls-agileinfo"></div>
						</div>
					</li>
					<li>
						<div class="banner-top1">
							<div class="banner-info-w3ls-agileinfo"></div>
						</div>
					</li>
					<li>
						<div class="banner-top2">
							<div class="banner-info-w3ls-agileinfo"></div>
						</div>
					</li>
					<li>
						<div class="banner-top3">
							<div class="banner-info-w3ls-agileinfo"></div>
						</div>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>

			<!--banner Slider starts Here-->
		</div>
		<!--//Slider-->
	</div>



	<!--//Header-->
	<!-- /event-title-->
	<div class="newsletter">
		<div class="col-sm-12 newsleft">
			<h3>Coming up Events</h3>
		</div>

		<div class="clearfix"></div>
	</div>
	<!-- //event-title-->


	<!--/ad-->
	<div class="top_spl_courses">
		<div class="container">
			<h3 class="headerw3">We are BUSK !</h3>
			<div class="inner_sec_w3_agileinfo">

				<div class="col-md-6 edu-left">
					<h4 class="sub-hdng two">For Your Music Life</h4>
					<p class="paragraph">안녕하세요 Busk에 오신걸 환영합니다!</p>
					<p class="paragraph two">우리는 신개념 버스킹 커뮤니티사이트입니다.
					좋아하는 버스커를 찾아보세요!</p>

				</div>
				<div class="col-md-6 edu_img">
					<img src="images/main1.jpg" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- /ad -->

	<!--/event-list-->
	<div class="services">
		<div class="container">
			<h3 class="headerw3">Coming up Events</h3>
			<div class="inner_sec_w3_agileinfo">
				<div class="col-md-4 grid_info_main">
					<div class="grid_info">
						<div class="icon_info">
							<h1>
								<strong id="date0">지금 도전하세요!</strong>
							</h1>
							<h5 id="busker0">&nbsp;&nbsp;&nbsp;</h5>
							<p id="time0">&nbsp;&nbsp;&nbsp;</p>
							<p id="place0">&nbsp;&nbsp;&nbsp;</p>
						</div>
					</div>
					<div class="grid_info second">
						<div class="icon_info">
							<h1>
								<strong id="date1">지금 도전하세요!</strong>
							</h1>
							<h5 id="busker1">&nbsp;&nbsp;&nbsp;</h5>
							<p id="time1">&nbsp;&nbsp;&nbsp;</p>
							<p id="place1">&nbsp;&nbsp;&nbsp;</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 grid_info_main">
					<div class="grid_info">
						<div class="icon_info">
							<h1>
								<strong id="date2">지금 도전하세요!</strong>
							</h1>
							<h5 id="busker2">&nbsp;&nbsp;&nbsp;</h5>
							<p id="time2">&nbsp;&nbsp;&nbsp;</p>
							<p id="place2">&nbsp;&nbsp;&nbsp;</p>
						</div>
					</div>
					<div class="grid_info second">
						<div class="icon_info">
							<h1>
								<strong id="date3">지금 도전하세요!</strong>
							</h1>
							<h5 id="busker3">&nbsp;&nbsp;&nbsp;</h5>
							<p id="time3">&nbsp;&nbsp;&nbsp;</p>
							<p id="place3">&nbsp;&nbsp;&nbsp;</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 grid_info_main">
					<div class="grid_info">
						<div class="icon_info">
							<h1>
								<strong id="date4">지금 도전하세요!</strong>
							</h1>
							<h5 id="busker4">&nbsp;&nbsp;&nbsp;</h5>
							<p id="time4">&nbsp;&nbsp;&nbsp;</p>
							<p id="place4">&nbsp;&nbsp;&nbsp;</p>
						</div>
					</div>
					<div class="grid_info second">
						<div class="icon_info">
							<h1>
								<strong id="date5">지금 도전하세요!</strong>
							</h1>
							<h5 id="busker5">&nbsp;&nbsp;&nbsp;</h5>
							<p id="time5">&nbsp;&nbsp;&nbsp;</p>
							<p id="place5">&nbsp;&nbsp;&nbsp;</p>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//event-list-->


	<!--what-we-do-->
	<div class="top_spl_courses">
		<div class="container">
			<h3 class="headerw3">이렇게 사용하세요 !</h3>
			<div class="inner_sec_w3_agileinfo">
				<div class="tabs-grids">
					<div id="parentVerticalTab">
						<ul class="resp-tabs-list hor_1">
							<li>BUSKERS</li>
							<li>FANS & 예비공연기획자</li>
							<li>ENTERTAINMENTS</li>


						</ul>
						<div class="resp-tabs-container hor_1">
							<div class="text-info">
								<h4>버스커</h4>
								<p>버스커 개인 페이지를 통해 나를 적극적으로 홍보해 보세요. 전국 각지의 팬이 생길 수 있어요. </p>
								<p class="sec">Hire페이지에서 당신을 기다리고 있는 멋진 공연기획에 지원하세요!</p>
								<img src="images/banner1.jpg" alt=" " class="img-responsive" />

							</div>
							<div class="text-info">
								<h4>버스킹 FANS & 예비 공연기획자</h4>
								<p>매일 같은 노래들이 지겹지 않나요? Busk.com에서 당신만을 위한 새로운 그 목소리를 찾아보세요.</p>
								<p class="sec">Buskers 페이지에서 취향에 맞는 버스커를 찾고 다양한 팬 활동을 할 수 있어요.<br>
								공연 일정표에서 취향에 맞는 뮤지션의 공연을 찾아보세요.<br>
								공연을 위한 장소를 제공하실 수 있는 예비 공연기획자시라면 지금 당장 Hire페이지에 공연 공고를 등록하세요.<br>
								당신이 원하는 공연을 만들어줄 멋진 버스커를 Busk.com에서 연결해드릴게요.</p>
								<img src="images/banner2.jpg" alt=" " class="img-responsive" />

							</div>

							<div class="text-info">
								<h4>Entertainments</h4>
								<p>Music industry에 몸담고 계신가요?</p>
								<p class="sec">Buskers 페이지에서 새로운 색깔을 가진 당신의 신인을 찾아보세요.<br>
								전국 각지의 Busker들의 정보를 확인하고, youtube 채널과 페이스북 등을 통해 공연 영상을 확인하세요.<br>
								당신의 casting을 보다 간결하게! Busk.com
								</p>
								<img src="images/banner3.jpg" alt=" " class="img-responsive" />

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	
	<!--footer-->
	<div class="contact-footer-w3layouts-agile">
		<%
			pageContext.include("/WEB-INF/views/include/footer.jsp");
		%>
	</div>
	<!--/footer -->


	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!--search-bar-->
	<script src="js/main.js"></script>
	<script src="js/responsiveslides.min.js"></script>
	<script>
		$(function() {
			$("#slider4").responsiveSlides({
				auto : true,
				pager : true,
				nav : true,
				speed : 1000,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
	<!--//search-bar-->
	<link rel="stylesheet" type="text/css"
		href="css/easy-responsive-tabs.css " />
	<script src="js/easyResponsiveTabs.js"></script>
	<!--Plug-in Initialisation-->
	<script type="text/javascript">
		$(document).ready(function() {

			//Vertical Tab
			$('#parentVerticalTab').easyResponsiveTabs({
				type : 'vertical', //Types: default, vertical, accordion
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				tabidentify : 'hor_1', // The tab groups identifier
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#nested-tabInfo2');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
		});
	</script>
	<!--/script-->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->

	<script type="text/javascript">
		$(document).ready(function() {
			/*
			
									var defaults = {
							  			containerID: 'toTop', // fading element id
										containerHoverID: 'toTopHover', // fading element hover id
										scrollSpeed: 1200,
										easingType: 'linear' 
							 		};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>


</body>

</html>