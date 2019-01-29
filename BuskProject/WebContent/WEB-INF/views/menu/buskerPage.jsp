<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 임시 게시판용이다~ -->
<link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- 임시 게시판 끝이다 -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/buskerPage.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/chocolat.css" type="text/css"
	media="screen">
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Mallanna" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.js"></script>


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->



<script>
	$(function(){
		$('.fan-heart').click(function(){
			  $.ajax(
				{
					url:"fanCount.busk",
					dataType:"html",
					success:function(data){
						if(data==1){
							var number = $('.button-text').text()*1;
							var changeNumber = number + 1;
							$('.button-text').text(changeNumber);
						} else if(data==0){
							var number = $('.button-text').text()*1;
							var changeNumber = number - 1;
							$('.button-text').text(changeNumber);
						} else if(data==3){
							alert("자기 자신의 팬은 될 수 없습니다.");
						}
						
					},
					error:function(xhm){
						console.log("로그인이 필요한 기능입니다.");
					}
				}
			);  
			
		});
	});
	function fannote_add() {
		var content = $('#fannote_content').val();
		$.ajax(
				{
					url:"fannoteAdd.busk",
					data:{fannote_content:$('#fannote_content').val()},
					dataType:"html",
					success:function(data){
		            	location.href="buskerPage.busk";
					},
					error:function(xhm){
						alert("로그인해주세요");
					}
				}
			);
	};
	function deleteFannote(a) {
		if (confirm("삭제하시겠습니까?") == true){
			$.ajax({
				url:"fannoteDelete.busk",
				data:{fannote_no:a},
				dataType:"html",
				success:function(data){
					if(data == 1){
						location.href="buskerPage.busk";
						alert("삭제되었습니다.");
					} else if (data == 3) {
						alert("자신의 글만 삭제할 수 있습니다.");
					}
				}
			});
		} 
	};
	$("#profileModal").on('show.bs.modal', function profileModal(email){
		
		//get data-id attribute of the clicked element
	    var email = $(email.relatedTarget).data('modal-id');
		console.log(email);
		console.log("글쓴이 이메일: " + email);
			 var writer_email = {
					 profile_email:email
			 };
			
			 console.log(writer_email);
			 var result = document.getElementById('name');
			    $.ajax({
			        url : "profilemodal.busk",
			        data : writer_email, 
			        datatype: "JSON",
			        success : function(response){
			        	var json=JSON.parse(response);
			        	console.log(json[0].name);
			        	console.log(json[0].email);
			        	$('#myModalLabel').html(json[0].name +" 님의 프로필");
			        	$("#profileName").html("이름: "+json[0].name);
			        	$("#profilePicture").attr("src",json[0].picture);
			        	$("#profileEmail").html("이메일 주소: "+json[0].email);
			        	$("#profileLocation").html("지역: "+json[0].location);
			        	$("#profileDescript").html(json[0].descript);
			        	
			        }
			    }); 
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
	<div class="header inner_banner" id="home">
		<!--/top-bar-->
		<%
			pageContext.include("/WEB-INF/views/include/header.jsp");
		%>
		<!--//top-bar-->
	</div>
	<!--//inner_banner-->


	<c:set var="buskerslist" value="${requestScope.buskerslist}"></c:set>
	<c:set var="fannotelist" value="${requestScope.fannotelist}"></c:set>
	<c:set var="gallerylist" value="${requestScope.gallerylist}"></c:set>
	<c:forEach var="busker" items="${buskerslist}">
		<!-- 버스커 소개 -->
		<div class="container-fluid bg-1 text-center">
			<h2 class="margin"></h2>
			<img src="upload${busker.picture}"
				class="img-responsive img-circle margin mainPicture"
				style="display: inline" alt="${busker.picture}" width="350"
				height="350">
			<h2>
				<strong>${busker.name}</strong>
			</h2>
			<h4></h4>
		</div>
		<!-- Second Container -->
		<div class="container-fluid bg-2 text-center">
			<div class="container">
				<div class="heartmessage col-md-3">
					<button class="fan-heart">
						<div class="button-icon">
							<i class="fa fa-heart"></i>
						</div>
						<div class="button-text">${busker.fan_count}</div>
						<div class="button-fantext">fans</div>
					</button>
					<br>
					<br>
					<ul class="sns_icon">
						<li><a class="fa fa-facebook"
							href="https://${busker.facebook }"></a></li>
						<li><a class="fa fa-instagram"
							href="https://${busker.instagram }"></a></li>
						<li><a class="fa fa-youtube"
							href="https://${busker.youtube }"></a></li>
					</ul>
				</div>
				<div class="selfintroduce col-md-3">
					<p>
						<br>${busker.descript}<br>
						<br>
					</p>
				</div>


				<div class="fannote col-md-6">
					<input type="text" id="fannote_content" placeholder="Comment">
					<button onclick="fannote_add()">Add</button>
					<table id="example" class="table compact fannote_table"
						style="width: 100%">
						<thead>
							<tr>
								<th>Name</th>
								<th>Comment</th>
								<th>Date</th>
								<th></th>
							</tr>
						</thead>
						<tbody class="fannoteSetting">
							<c:forEach var="fannote" items="${fannotelist}">
								<tr>
									<td id=""><a id="modalLink" href="#aboutModal"
										data-toggle="modal" data-target="#profileModal"
										data-modal-id="${fannote.fannote_email}">
											${fannote.fannote_name}</a></td>
									<td id="">${fannote.fannote_content}</td>
									<td>${fannote.fannote_regdate}</td>
									<td><button onclick="deleteFannote(${fannote.fannote_no})">X</button></td>
								</tr>
								<!-- Start 모달창 -->
								<div class="modal fade" id="profileModal" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">

											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true"></button>
												<h4 class="modal-title" id="myModalLabel">이름 + 님의
													프로필입니다.</h4>
											</div>
											<div class="modal-body">
												<center>
													<img id="profilePicture" src="" name="aboutme" width="140"
														height="140" border="0" class="img-circle"> <br>
													<h3 id="profileName" class="media-heading">이름 들어갈 자리</h3>
													<br> <span id="profileEmail"><strong>이메일
															들어갈 자리</strong><br></span> <br> <span id="profileLocation"><strong>지역
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

										</div>
									</div>
								</div>

								<!-- End 모달창 -->
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</c:forEach>


	<div class="container">
		<div id="gallery" class="gallery">
			<div class="col-xs-12"><br>
				<h3 class="galleryText">Gallery</h3>
			</div>
			<div class="gallery-grid col-sm-12">

				<c:choose>
					<c:when test="${empty gallerylist}">
					<br><br>
						<br>&nbsp;&nbsp;&nbsp;마이 페이지의 프로필 메뉴에서 이미지를 추가해 보세요!<br>
						<br><br><br><br><br>
					</c:when>
					<c:otherwise>
						<c:forEach var="gallery" items="${gallerylist}">
							<div class="gallery-grid1">
								<a title="" href="upload/${gallery.gallery_file }"> <img
									src="upload${gallery.gallery_file}"
									alt="${gallery.gallery_file}" class="galeryimg-responsive" />
								</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>



			</div>
			<!-- /. gallery-grid-->

			<div class="spacer"></div>

			<div class="mobile-grid-wrap owl-carousel owl-theme"
				id="owl-carousel">
				<div class="mobile-grid owl-wrapper"></div>
			</div>
		</div>
	</div>



	<!--//Gallery-->

	<!--//inner_connectent-->
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


	<!-- 여기도 게시판이다~ -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
	</script>
	<link rel="stylesheet" type="text/css"
		href="css/easy-responsive-tabs.css " />
	<script>
	$(document).ready(function() {
    $('#example').DataTable();
	} );
	</script>
	<!-- 여기까지 게시판이다.~ -->



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
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>


</body>

</html>