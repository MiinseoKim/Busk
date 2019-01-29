<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
	<link href="css/buskers.css?ver=1" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen">
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Mallanna" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
	<script type="text/javascript">
	
		function buskerPage(buskerEmail) {
			 $.ajax( 
				{
				url:"emailConfirm.busk",
				data:{email:buskerEmail},
				dataType:"html",
				success:function(data){
					location.href="buskerPage.busk";
				}
				
			}); 
			
		}
		function buskerSearch() {
			var searchBuskerName = $('#searchBusker').val().trim();

			$.ajax({
				type:"get",
				url:"buskersSearch.busk",
				data:{searchBusker:searchBuskerName},
				dataType:"JSON",
				success:function(data){
					var searchedBusker = "";
					$.each(data, function(index){
						searchedBusker 
						+= 
						"<div class='buskers'><a id='buskerPage' onclick=\"buskerPage(&#39;"+data[index].email+"')\"><img src='upload/" 
						+ data[index].picture + "' alt=' ' class='img-responsive' /><div class='p-mask'><h4>"
						+ data[index].name + "</h4><p>지역 : " + data[index].location 
						+ "</p><ul><li class='fa fa-heart'>&nbsp;" +  data[index].fan_count 
						+ "</li><li class='fa fa-photo'>&nbsp;" + data[index].gallery_count 
						+ "</li></ul></div></a></div>";
							
					});
					$('.inner_sec_w3_agileinfo').empty();
					$('.inner_sec_w3_agileinfo').append(searchedBusker);
				},
				error:function(xhr){
					alert('검색결과가 없어!!');
				}
			});
		}
	
	</script>
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
		<!--/ banner-text -->
		<!--// banner-text -->
	</div>
	<!--//inner_banner-->
	<!--/short-->
	<div class="services-breadcrumb-w3ls-agile">
		<div class="inner_breadcrumb">

			<ul class="short">
				<li><a href="index.html">Home</a><span>|</span></li>
				<li>Buskers</li>
			</ul>
		</div>
	</div>
	<!--//short-->
	<!-- //inner_content -->

	<!-- Modal1 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">

						<div class="login-m_page_img">

							<img src="images/model.jpg" alt=" " class="img-responsive" />

						</div>
						<div class="login-m_page">
							<h3 class="sign">Sign In</h3>
							<div class="login-form-wthree-agile">
								<form action="#" method="post">
									<input type="email" name="email" placeholder="E-mail" required="">
									<input type="password" name="password" placeholder="Password" required="">
									<div class="tp">
										<input type="submit" value="Sign In">
									</div>
								</form>
							</div>
							<div class="login-social-grids">
								<ul>
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-rss"></i></a></li>
								</ul>
							</div>
							<p><a href="#" data-toggle="modal" data-target="#myModal3"> Don't have an account?</a></p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal1 -->
	<!-- Modal2 -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">

						<div class="login-m_page_img">

							<img src="images/model.jpg" alt=" " class="img-responsive" />

						</div>
						<div class="login-m_page">
							<h3 class="sign">Sign Up</h3>
							<div class="login-form-wthree-agile">
								<form action="#" method="post">
									<input type="text" name="name" placeholder="Username" required="">
									<input type="email" name="email" placeholder="Email" required="">
									<input type="password" name="password" placeholder="Password" required="">
									<input type="password" name="password" placeholder="Confirm Password" required="">
									<input type="submit" value="Sign Up">
								</form>
							</div>
							<p><a href="#"> By clicking Sign up, I agree to your terms</a></p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal2 -->

	<!--//Header-->
	<!--/inner_connectent-->
	<!--Gallery-->
	<div class="banner_bottom">
	<c:set var="buskerslist" value="${requestScope.buskerslist}"></c:set>
		<div class="container">
			<h3 class="headerw3" >Buskers</h3>
			<div><input type="text" id="searchBusker" placeholder="버스커 이름을 입력하세요"><button onclick="buskerSearch()">검색</button>&nbsp;<a href="buskers.busk">전체보기</a></div>
			<div class="inner_sec_w3_agileinfo">

					<c:forEach var="busker" items="${buskerslist}">
					<div class="buskers">	
						<a id="buskerPage" onclick="buskerPage('${busker.email}')">	
						<img src="upload/${busker.picture }" alt="${busker.picture }" class="img-responsive" />
						<div class="p-mask">
							<h4>${busker.name }</h4>
							<p>지역 : ${busker.location }</p>
							<ul>
							<li class="fa fa-heart">&nbsp;${busker.fan_count }</li>
							<li class="fa fa-photo">&nbsp;${busker.gallery_count}</li>
							</ul>
						</div>
						</a>
						
					</div>
					</c:forEach>
				
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//Gallery-->

	<!--//inner_connectent-->
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
	<!--//search-bar-->
	<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
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