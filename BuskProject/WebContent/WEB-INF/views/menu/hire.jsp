<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="user" value="${sessionScope.email}" />
	<c:set var="type" value="${sessionScope.type}" />
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

<link href="css/hire.css?ver=1" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/team.css" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800"	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Mallanna" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<style>
.form-control {
	width: 90%;
}

td {
	border: 1px solid #DDDDDD;
}

table {
	width: 100%;
	height: 80px;
	color: #777777;
}

.about {
	height: 200px;
	overflow: auto;
	text-align: center;
	vertical-align: middle;
}

.autoCompleteContainer {
  border: 2px solid lightblue;
  width: 90%;
  margin-left: 1%;
  font-size: 0.5rem;
  font-weight: 300;
  box-sizing: border-box;
}

.autoCompleteBox {
  padding: 0.8rem;
  height: 4rem;
  font-size: 2rem;
  box-sizing: border-box;
}

.mainName {
  font-weight: 700;
  font-size: 1.8rem;
}

.fullAddr {
  color: gray;
  font-size: 1.5rem;
}

.selected {
  background-color: gainsboro;
}
</style>


</head>

<body>

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

	<div class="services-breadcrumb-w3ls-agile">
		<div class="inner_breadcrumb">

			<ul class="short">
				<li><a href="main.busk">Home</a><span>|</span></li>
				<li>Hire</li>
			</ul>
		</div>
	</div>

	<div class="banner_bottom">
	<c:if test="${sessionScope.email!=null}">
		<button data-toggle="modal" data-target="#squarespaceModal"
			class="btn center-block btn-success">여기를 클릭해서 멋진 버스커를 모집하세요!</button>
			</c:if>
	</div>


	<div class="sub_table">
		<div class="container">
			<div class="row">
				<div class="table_title">
					<h3 class="headerw3" id="hireHeader1">Now Hiring!</h3>
					<h2 id="hireHeader2">어디든 당신의 무대가 될 수 있어요.</h2>
					<br> <br>
					<p>WANTED</p>
					<hr>
					<h1>마음에 드는 공고에 지원하세요 !</h1><br><br>
				</div>
				
				<c:set var="hirelist" value="${requestScope.hirelist}"></c:set>
				<c:choose>
				<c:when test="${empty hirelist}">
				<br><br>&nbsp;&nbsp;&nbsp;지금 공고를 올려보세요 !<br><br><br>
				</c:when>
				<c:otherwise>
				<c:forEach items="${hirelist}" var="h">
				<div class="card col-md-4 col-xs-12">
					<div class="box-1 center">
						<div class="panel panel-success panel-pricing">
							<div class="panel-heading">
								<h3>${h.date}</h3>
							</div>
							<table>
								<tr>
									<td>시간 :<br>${h.time}</td>
									<td>보수 :<br>${h.hire_budget}원</td>
									<td>공연시간 :<br>${h.hire_duration}</td>
								</tr>
							</table>
							<div class="about panel-body text-center">
								<p>
									<strong>${h.hire_about}</strong>
								</p>
							</div>
							
							<div class="panel-footer">
								<input type="button" class="btn btn-lg btn-block btn-success" id="apply" 
								onclick="apply(${h.hire_no}, '${type}','${h.hire_email}', '${user}')" value="지원 하기">
							</div>
						</div>
					</div>
				</div>
				
				</c:forEach>
				</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>



	<div class="contact-footer-w3layouts-agile">
		<%
			pageContext.include("/WEB-INF/views/include/footer.jsp");
		%>
	</div>

	<!-- 모달창 모달창 모달창 모달창 모달창 모달창 모달창 모달창 모달창 -->
	<div class="modal fade" id="squarespaceModal" tabindex="-1"
		role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<br>
					<h3 class="modal-title" id="lineModalLabel">내 동료가 되어주세요!</h3>
				</div>
				<div class="modal-body">

					<!-- content goes here -->
					<form id="modal" method="post" action="inserthire.busk">
						<div class="form-group locapi">
							<label for="exampleInputLoc1">공연 장소</label> <input type="text"
								class="form-control" name="location" id="location"
								placeholder="공연 장소를 최대한 자세히 입력해주세요!">
						</div>
						<div class="form-group ">
							<label for="exampleInputBnum1">버스커 모집 인원</label> <input
								type="number" class="form-control" name="buskernum"
								id="buskernum" min="1" placeholder="몇명의 버스커가 필요한지 숫자로 입력해주세요!">
						</div>
						<div class="form-group">
							<label for="exampleInputBtype1">어떤 버스커를 찾으시나요?</label> <input
								type="text" class="form-control" name="buskingtype"
								id="buskingtype" placeholder="예: 재즈싱어, 기타연주자, 3인조 밴드 등등..">
						</div>
						<div class="form-group">
							<label for="exampleInputAnum1">예상 관중 규모</label> <input
								type="number" class="form-control" name="audnum" id="audnum"
								min="5" placeholder="관객의 규모는 얼마나 될 것 같나요?">
						</div>
						<div class="form-group">
							<label for="exampleInputDate1">공연 일시</label>
							<div>
								<input type="date" class="form-control col-xs-6" id="datepicker" name="date" min="" max="">
								<input type="time" class="form-control col-xs-6" id="timepicker" name="time" placeholder="예: O시간 O분">
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputDur1">공연 진행 시간</label>
							<div>
								<input type="number" min="1" class="form-control col-xs-6"
									name="duration" id='duration' placeholder="숫자를 입력후 단위를 선택하세요 !">
								<select name="unit" class="form-control col-xs-6" id="unit">
									<option class="active" value="시간">시간</option>
									<option value="일">일</option>
								</select>
							</div>
						</div><br><br>
						<div class="form-group">
							<label for="exampleInputPay1">공연 보수</label> <input type="number"
								class="form-control" name="cost" id='cost' min="20000"
								placeholder="숫자만 입력해주세요! 예:10만원 -> 100000">
						</div>
						<div class="form-group">
							<label for="exampleInputHintro">공연 소개말</label> <input type="text"
								class="form-control" name="about"
								id='about' placeholder="얼마나 멋진 공연이 될 지 버스커들에게 알려주세요!">
						</div>
						<div class="form-group">

							<p class="help-block">
								위 기재사항을 다시한번 꼼꼼히 확인해주세요.<br> 등록된 공고 내용이 바뀌면 버스커들이 헷갈리기 때문에
								수정하실 수 없어요!<br> 수정을 원하실 경우 공고 취소 후 재등록 하셔야 하며, <br> 이미
								지원한 지원자가 있는 경우<br> 저희 Busk는 이 부분에 대해 법적 책임을 지지 않습니다.
							</p>
						</div>
						<div class="checkbox">
							<label class="checkboxlabel"> <input type="checkbox"
								id="checkbox"> 위 사항에 동의합니다.
							</label>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default" id="submit"
								role="button">등록</button>
						</div>

						<!-- <div class="btn-group" role="group">
					<button type="button" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Save</button>
				</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/hire.js"></script>
	<script src="js/location.js"></script> 
	<script src="js/jquery.chocolat.js"></script>
	<!--light-box-files -->
	<script type="text/javascript">
		$(function() {
			$('.gallery-grid1 a').Chocolat();
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
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

			/*
			var defaults = {
					containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */
			$('.modal').on('hidden.bs.modal', function(e) {

				$(this).find('form')[0].reset()
			});

			$("#form_div, #form_div1").hide();

			$("#join1").click(function() {
				$("#form_div, #form_div1").toggle("slow");
			});

			$("#join2").click(function() {
				$("#form_div, #form_div1").toggle("slow");
			});

			$("#join3").click(function() {
				$("#form_div, #form_div1").toggle("slow");
			});

			$("#join4").click(function() {
				$("#form_div, #form_div1").toggle("slow");
			});
		});
	</script>



	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>


</body>

</html>