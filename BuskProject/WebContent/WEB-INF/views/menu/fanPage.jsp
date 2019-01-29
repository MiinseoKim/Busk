<!-- 08.27민지 통채로 복사해도 됩니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="type" value="${sessionScope.type}" />
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
<meta name="keywords"
	content="Stretch a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
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
<link href="css/fanPage.css?ver=1" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/chocolat.css" type="text/css"
	media="screen">
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Mallanna" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
<script type="text/javascript">
	function buskerPage(buskerEmail) {
		$.ajax({
			url : "emailConfirm.busk",
			data : {
				email : buskerEmail
			},
			dataType : "html",
			success : function(data) {
				console.log(data);

				location.href = "buskerPage.busk"
			}

		});

	}

	/*function fanPage(fanEmail) {
		 $.ajax( 
		{
			url:"emailConfirm.busk",
			data:{email:fanEmail},
			dataType:"html",
			success:function(data){
				console.log(data);
				
				location.href="buskerPage.busk"
			}
			
		}); 
		
	}*/
</script>
</head>

<body>
	<!--Header-->
	<div class="top-bar_sub_w3layouts_agile">
		<%
			pageContext.include("/WEB-INF/views/include/topbar.jsp");
		%>
	</div>
	<div class="header inner_banner" id="home">
		<!--/top-bar-->
		<%
			pageContext.include("/WEB-INF/views/include/header.jsp");
		%>
		<!--//top-bar-->
	</div>
	<!--//inner_banner-->
	<!--/short-->
	<div class="services-breadcrumb-w3ls-agile">
		<div class="inner_breadcrumb">

			<ul class="short">
				<li><a href="main.busk">Home</a><span>|</span></li>
				<li>Buskers</li>
			</ul>
		</div>
	</div>
	<!--//short-->


	<!--Gallery-->
	<div class="banner_bottom">
		<c:set var="buskerlist" value="${requestScope.buskerlist}"></c:set>
		<c:set var="fanlist" value="${requestScope.fanlist}"></c:set>
		<div class="container">
			<h3 class="headerw3">My Busker</h3>
			<div class="inner_sec_w3_agileinfo">

				<c:forEach var="busker" items="${buskerlist}">
					<div class="buskers">
						<a id="buskerPage" onclick="buskerPage('${busker.fan_b_email}')">
							<img src="upload/${busker.picture}" alt=" "
							class="img-responsive" />
							<div class="p-mask">
								<h4>${busker.bname }</h4>
							</div>
						</a>

					</div>
				</c:forEach>
				<c:if test="${type eq '2'}">
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h3 class="headerw3">My Fan</h3>
					<c:forEach var="fan" items="${fanlist}">
						<div class="buskers">
							<a id="modalLink" href="#aboutModal" data-toggle="modal"
								data-target="#profileModal" data-modal-id="${fan.fan_email}">
								<img src="upload/${fan.picture}" alt=" " class="img-responsive" />
								<div class="p-mask">
									<h4>${fan.fname }</h4>
								</div>
							</a>

						</div>
						<!-- Start 모달창 -->
						<div class="modal fade" id="profileModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true"></button>
										<h4 class="modal-title" id="myModalLabel">${fan.fname } 님의 프로필입니다.</h4>
									</div>
									<div class="modal-body">
										<center>
											<img id="profilePicture" src="" name="aboutme" width="140"
												height="140" border="0" class="img-circle"> <br>
											<h3 id="profileName" class="media-heading">${fan.fname }</h3>
											<br> <span id="profileEmail"><strong>${fan.fan_email}
													</strong><br></span> <br> <span id="profileLocation"><strong>지역
													들어갈 자리</strong></span> <br>
										</center>
										<hr>
										<center>
											<p id="profileDescript" class="text-left">자기소개 들어갈 자리</p>
											<br>
										</center>
									</div>
									<div class="modal-footer">

										<button type="button" class="btn btn-default"
											data-dismiss="modal">뒤로가기</button>

									</div>
									<%-- </c:forEach> --%>
								</div>
							</div>
						</div>

						<!-- End 모달창 -->
					</c:forEach>
				</c:if>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//Gallery-->

	<!--//inner_connectent-->
	<!--footer--><br><br><br>
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
	<!--gallery -->
	<script src="js/jquery.chocolat.js"></script>
	<!--light-box-files -->
	<script type="text/javascript">
		$(function() {
			$('.gallery-grid1 a').Chocolat();
		});
	</script>
	<!-- //gallery -->
	<!--//search-bar-->
	<link rel="stylesheet" type="text/css"
		href="css/easy-responsive-tabs.css " />
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
		$(document).ready(
				function() {

					$("#profileModal").on(
							'show.bs.modal',
							function profileModal(email) {
								//get data-id attribute of the clicked element
								var email = $(email.relatedTarget).data(
										'modal-id');
								console.log(email);
								console.log("글쓴이 이메일: " + email);
								var writer_email = {
									profile_email : email
								};

								console.log(writer_email);
								var result = document.getElementById('name');
								$.ajax({
									url : "profilemodal.busk",
									data : writer_email,
									datatype : "JSON",
									success : function(response) {
										var json = JSON.parse(response);
										console.log(json[0].name);
										console.log(json[0].email);
										$('#myModalLabel').html(
												json[0].name + " 님의 프로필");
										$("#profileName").html(
												"이름: " + json[0].name);
										$("#profilePicture").attr("src",
												json[0].picture);
										$("#profileEmail").html(
												"이메일 주소: " + json[0].email);
										$("#profileLocation").html(
												"지역: " + json[0].location);
										$("#profileDescript").html(
												json[0].descript);

									}
								});

							});
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