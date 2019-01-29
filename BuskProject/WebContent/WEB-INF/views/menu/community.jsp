<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">

<script src="http://code.jquery.com/jquery-2.1.1.js"></script>


<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
<script type="text/javascript">	
	
	 $(document).ready(function(){
		$("#writeArticle").click(function(){
			location.href="writearticle.busk";
		});
		
		
		
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
	 });
	 </script>


<!-- Start 모달창관련 -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- End 모달창관련 -->

<link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/about.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/team.css" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800"
	rel="stylesheet">
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
				<li><a href="index.jsp">Home</a><span>|</span></li>
				<li>Community</li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="inner_sec_w3_agileinfo">
			<div class=container>

					<div class="col-md-7" style="height: 80px">
						<p style="font-size: 30px">
							<strong>공연 왕 버스커</strong>
						</p>
					</div>
					<div class="col-md-5" style="height: 80px">
						<p style="font-size: 30px">
							<strong>인기 왕 버스커</strong>
						</p>
					</div>							
					<div class="col-md-5">
						<div class="row">
							<div class="span4 well">
								<div class="row">
								<c:forEach var="buskingwang" items="${requestScope.buskingwang}">	
									<div class="col-md-4">
										<img id="TBusker" src="\upload${buskingwang.picture}" name="aboutme"
											width="120" height="120" border="0" class="img-circle">
									</div>
									<div class="col-md-8">

										<p style="font-size: 24px">
											<strong>${buskingwang.name}</strong>
										</p>
										<span class="badge badge-warning" style="font-size:16px">공연 횟수: ${buskingwang.count}</span>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-5">
						<div class="row">
							<div class="span4 well">
								<div class="row">
								<c:forEach var="ingiwang" items="${requestScope.ingiwang}">
									<div class="col-md-4">
										<img id="FBusker" src="\upload${ingiwang.picture}" name="aboutme"
											width="120" height="120" border="0" class="img-circle">
									</div>
									<div class="col-md-8">

										<p style="font-size: 24px">
											<strong>${ingiwang.name}</strong>
										</p>
										<span class=" badge badge-warning" style="font-size:16px">팬 수: ${ingiwang.count}</span>
										
									</div>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12" style="height: 50px"></div>
				
				

			</div>
			<br><br>
			<div class="col-md-10">
				<h2 class="headerw3" style="text-align: center; padding-left: 150px">자유게시판</h2>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-1">
				<c:if test="${sessionScope.email!=null}">
					<button type="button" id="writeArticle" class="btn btn-default">글쓰기</button>
				</c:if>

				<br>
				<br>
			</div>


			<table id="myTable" class="display">
				<thead>
					<tr>
						<th>글번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${requestScope.boardlist}">

						<tr>
							<td>${board.board_no}</td>
							<td><a id="modalLink" href="#aboutModal" data-toggle="modal"
								data-target="#profileModal" data-modal-id="${board.board_email}">${board.name}</a></td>
							<td><a href="communityarticle.busk?num=${board.board_no}">${board.board_title}</a></td>
							<td>${board.board_regdate}</td>
							<td>${board.board_pageview}</td>
						</tr>
						<!-- Start 모달창 -->
						<div class="modal fade" id="profileModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true"></button>
										<h4 class="modal-title" id="myModalLabel">이름 + 님의 프로필입니다.</h4>
									</div>
									<div class="modal-body">
										<center>
											<img id="profilePicture" src="" name="aboutme" width="140"
												height="140" border="0" class="img-circle"> <br><br>
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
											data-dismiss="modal">닫기</button>

									</div>
									<%-- </c:forEach> --%>
								</div>
							</div>
						</div>

						<!-- End 모달창 -->

					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>


	<!--footer-->
	<div class="contact-footer-w3layouts-agile" style="padding-top: 100px">
		<% pageContext.include("/WEB-INF/views/include/footer.jsp"); %>
	</div>
	<!--/footer -->


	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<!-- //js -->

	<!-- 게시판 css&js-->

	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
	</script>
	<script>
	$(document).ready( function () {
    	$('#myTable').DataTable({
    	"order":[[0,"desc"]]
    	});
	});
	</script>

	<!--  //게시판 css & js -->





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