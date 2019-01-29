<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="Stretch a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

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
	<link href="css/about.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="css/team.css" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Mallanna" rel="stylesheet">
</head>

<body>
	<!--Header-->
	<div class="top-bar_sub_w3layouts_agile">
		<% pageContext.include("/WEB-INF/views/include/topbar.jsp"); %>
	</div>
	<div class="header inner_banner" id="home">
		<!--/top-bar-->
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		<!--//top-bar-->

	</div>
	<!--//inner_banner-->
	<!--/short-->
	<div class="services-breadcrumb-w3ls-agile">
		<div class="inner_breadcrumb">

			<ul class="short">
				<li><a href="main.busk">Home</a><span>|</span></li>
				<li>About</li>
			</ul>
		</div>
	</div>
	<!--//short-->
	<!-- //inner_content -->
	<!--//Header-->
	<div class="banner_bottom">
		<div class="container">
			<h3 class="headerw3">About Us</h3>

			<div class="inner_sec_w3_agileinfo">
				<div class="ab_info">
					<img src="images/banner1.jpg" alt=" " class="img-responsive">
					<h4>We are Busk!!</h4>
					<p class="sub_p">Busker와  Fan의 자유로운 소통의 공간을 만듭니다.<br>
					</p>
				</div>
				<div class="news-main">
					<div class="col-md-6 news-left">
						<div class="col-md-6 b_left">
							<img src="images/about1.jpg" alt=" " class="img-responsive" style="height:300px; width:800px;">
						</div>
						<div class="col-md-6 b_right">
							<img src="images/about2.jpg" alt=" " class="img-responsive"  style="height:300px; width:800px;">
						</div>
					</div>
					<div class="col-md-6 news-right">
						<h4>Our Mission</h4>
						<p class="sub_p">버스커들의 뜨거운 열정을 응원합니다.
						</p>
						<p>버스커와 버스커, 버스커와 팬, 팬과 팬의 원활한 소통을 위해 노력하는 Bsuk 가 되겠습니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/tesimonials-->
	<div class="tesimonials">
		<div class="container">
			<h3 class="headerw3 two"></h3>
			<div class="inner_sec_w3_agileinfo">
				<div class="test_grid_sec">
					<div class="col-md-offset-2 col-md-8">
						<div class="carousel slide two" data-ride="carousel" id="quote-carousel">
							<!-- Bottom Carousel Indicators -->
							<ol class="carousel-indicators two">
								<li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#quote-carousel" data-slide-to="1"></li>
								<li data-target="#quote-carousel" data-slide-to="2"></li>
							</ol>

							<!-- Carousel Slides / Quotes -->
							<div class="carousel-inner">

								<!-- Quote 1 -->
								<div class="item active">
									<blockquote>
										<div class="test_grid">
											<div class="col-sm-3 text-center test_img">
												<i class="fa fa-user" aria-hidden="true"></i>

											</div>
											<div class="col-sm-9 test_img_info">
												<p>좋아하는 버스커와 소통할 수 있어서 너무 좋아요!! 버스커사이트 최고!</p>
												<h6>방민지</h6>
											</div>
										</div>
									</blockquote>
								</div>
								<!-- Quote 2 -->
								<div class="item">
									<blockquote>
										<div class="test_grid">
											<div class="col-sm-3 text-center test_img">
												<i class="fa fa-user" aria-hidden="true"></i>
											</div>
											<div class="col-sm-9 test_img_info">
												<p>제일 인기있는 버스커를 확인할 수 있어서 좋아요~ 제가 좋아하는 버스커가 다음엔 인기왕이 되었스면 좋겠어요 </p>
												<h6>김민서</h6>
											</div>
										</div>
									</blockquote>
								</div>
								<!-- Quote 3 -->
								<div class="item">
									<blockquote>
										<div class="test_grid">
											<div class="col-sm-3 text-center test_img">
												<i class="fa fa-user" aria-hidden="true"></i>
											</div>
											<div class="col-sm-9 test_img_info">
												<p>몇명의 팬이 있는지 확인 할 수 있어서 좋아요! 저 또한 다른 버스터의 팬이 될 수 있어서 Busk는 유용한 사이트라고 생각합니다!</p>
												<h6>우한결</h6>
											</div>
										</div>
									</blockquote>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- bootstrap-modal-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Luscious
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<img src="images/model.jpg" alt=" " class="img-responsive" />
					<p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
						consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur,
						vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- //bootstrap-modal-pop-up -->
	<!--footer-->
	<div class="contact-footer-w3layouts-agile">
		<% pageContext.include("/WEB-INF/views/include/footer.jsp"); %>
	</div>
	<!--/footer -->


	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!--search-bar-->
	<script src="js/main.js"></script>
	<!--gallery -->
	<script src="js/jquery.chocolat.js"></script>
	<!--light-box-files -->
	<script type="text/javascript">
		$(function () {
			$('.gallery-grid1 a').Chocolat();
		});
	</script>
	<!-- //gallery -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		$(function () {
			$("#slider4").responsiveSlides({
				auto: true,
				pager: true,
				nav: true,
				speed: 1000,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
	<!--//search-bar-->
	<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
	<script src="js/easyResponsiveTabs.js"></script>
	<!--Plug-in Initialisation-->
	<script type="text/javascript">
		$(document).ready(function () {

			//Vertical Tab
			$('#parentVerticalTab').easyResponsiveTabs({
				type: 'vertical', //Types: default, vertical, accordion
				width: 'auto', //auto or any width like 600px
				fit: true, // 100% fit in a container
				closed: 'accordion', // Start closed if in accordion view
				tabidentify: 'hor_1', // The tab groups identifier
				activate: function (event) { // Callback function if tab is switched
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
	<!-- stats -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->


	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->

	<script type="text/javascript">
		$(document).ready(function () {
			/*
									var defaults = {
							  			containerID: 'toTop', // fading element id
										containerHoverID: 'toTopHover', // fading element hover id
										scrollSpeed: 1200,
										easingType: 'linear' 
							 		};
									*/

			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>


</body>

</html>