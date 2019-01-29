<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="type" value="${sessionScope.type}" />
<c:set var="myhirelist" value="${requestScope.myhirelist}">
</c:set>
<c:set var="myapplylist" value="${requestScope.myapplylist}">
</c:set>
<c:set var="buskerapplylist" value="${requestScope.buskerapplylist}">
</c:set>
<c:set var="mybuskinglist" value="${requestScope.mybuskinglist}">
</c:set>
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
<script>
   $(document).ready(function() {
       $('table.display').DataTable( {
           fixedHeader: {
               header: true,
               footer: true
           }
       } );
		$(".scroll").click(function (event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop: $(this.hash).offset().top
			}, 900);
		});
		
		$().UItoTop({
			easingType: 'easeOutQuart'
		});
       
       
   } );
   </script>
	<script type="text/javascript">

	function delete_bt(a) {
		console.log(a);
		var hire_no = {
				hire_no:a
		};
		console.log(hire_no);
		if (confirm("정말 삭제하시겠습니까?") !=false) {
			
			$.ajax({
				url:"hiredelete.busk",
				data:hire_no,
				dataType:"html",
				success:function(response){
					console.log(response);
					if(response="delete"){
						alert("삭제되었습니다.");
						window.location.href = "hirelist.busk";
					}
				}
			});
		}else {
			return;
		} 
		}
	function apply_bt(a_email,h_no) {
		console.log("승인한 버스커 이메일:" + a_email);
	
		<c:forEach var="myhire" items="${requestScope.myhirelist}">
		var busking_h_email ='${myhire.hire_email}';
		console.log("busking_h_email값은 = " +'${myhire.hire_email}' );
		var busking_loc='${myhire.hire_loc}';
		var busking_num='${myhire.hire_num}';
		var busking_aud_num='${myhire.hire_aud_num}';
		var busking_date='${myhire.hire_date}';
		var busking_duration='${myhire.hire_duration}';
		var busking_budget='${myhire.hire_budget}';
		var busking_about='${myhire.hire_about}';
		var busking_a_email=a_email;
		var busking_no=h_no;
		</c:forEach>
		
		var data2 = {
				 busking_h_email:busking_h_email,
				 busking_loc:busking_loc,
				 busking_num:busking_num,
				 busking_aud_num:busking_aud_num,
				 busking_date:busking_date,
				 busking_duration:busking_duration,
				 busking_budget:busking_budget,
				 busking_about: busking_about,
				 busking_a_email:a_email,
				 busking_no:h_no,
		};
		console.log(data2);
		if (confirm("정말 승인하시겠습니까?") !=false) {
			
			$.ajax({
				url:"buskingapply.busk",
				data:data2,
				dataType:"html",
				success:function(response){
					console.log(response);
					if(response=="apply"){
						alert("승인되었습니다.");
						window.location.href = "hirelist.busk";
					}
				}
			});
		}else {
			return;
		} 
		}
	 </script>
	
<link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
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
				<li>HireList</li>
			</ul>
		</div>
	</div>
	<!--//short-->
	<!-- //inner_content -->
	

	<!--//Header-->
	<!--/inner_connectent-->
	<!--Gallery-->
	<div class="banner_bottom">
		<div class="container">
			<h3 class="headerw3">나의 구인공고 목록</h3>
			<div class="inner_sec_w3_agileinfo">
			 
				<table id="myTable" class="display">
				    <thead>
				        <tr>
				        	<th>글번호</th>
				            <th>작성일</th>
				            <th>행사지역</th>
				            <th>버스커인원</th>
				            <th>버스킹종류</th>
				            <th>관중규모</th>
				            <th>공연일시</th>
				            <th>공연시간</th>
				            <th>예산</th>
				            <th>내용</th>
				            <th>삭제</th>
				        </tr>
				    </thead>
				    <tbody  class="aa">
				   <c:forEach var="myhire" items="${requestScope.myhirelist}">
			            <tr>
			            	<td>${myhire.hire_no}</td>
				            <td>${myhire.hire_regdate}</td>
				            <td>${myhire.hire_loc}</td>
				            <td>${myhire.hire_num}</td>
				            <td>${myhire.hire_type}</td>
				            <td>${myhire.hire_aud_num}</td>
				            <td>${myhire.hire_date}</td>
				            <td>${myhire.hire_duration}</td>
				            <td>${myhire.hire_budget}</td>
				            <td>${myhire.hire_about}</td>
				            <td><input type='button' id='delete_bt' onclick='delete_bt(${myhire.hire_no})' value='삭제'></td>
				        </tr>
	        		</c:forEach>
				    </tbody>
   			 </table><br><br>
   			 <div>
   			 <h3 class="headerw3">버스커 지원 목록</h3>
   			 <table id="myTable" class="display">
				    <thead>
				        <tr>
				            <th>신청자</th>
				            <th>신청코멘트</th>
				            <th>공고게시글번호</th>
				            <th>승인</th>
				        </tr>
				    </thead>
				    <tbody>
				   <c:forEach var="myapply" items="${requestScope.myapplylist}">
			            <tr>
				            <td>${myapply.aname}</td>
				            <td>${myapply.apply_comment}</td>
				            <td>${myapply.hire_no}</td>
				            <td><input type='button' id='apply_bt' onclick='apply_bt("${myapply.apply_email}",${myapply.hire_no})' value='승인'/></td>
				        </tr>
	        		</c:forEach>
				    </tbody>
				   
   			 </table>
   			 </div><br><br>
   			 <c:if test="${type eq '2'}">
   			 <div>
   			 <h3 class="headerw3">내가 지원한 목록</h3>
   			 <table id="myTable" class="display">
				    <thead>
				        <tr>
				            <th>신청자</th>
				            <th>신청코멘트</th>
				            <th>공고게시글번호</th>
				        </tr>
				    </thead>
				    <tbody>
				   <c:forEach var="buskerapply" items="${requestScope.buskerapplylist}">
			            <tr>
				            <td>${buskerapply.name}</td>
				            <td>${buskerapply.apply_comment}</td>
				            <td>${buskerapply.hire_no}</td>
				        </tr>
	        		</c:forEach>
				    </tbody>
				   
   			 </table>
   			 </div>
   			 </c:if><br><br>
   			 <!-- 08.27민지 추가  -->
   			 <div>
   			 <h3 class="headerw3">확정된 공연 목록</h3>
   			 <table id="myTable" class="display">
				    <thead>
				        <tr>
				            <th>작성자</th>
				            <th>행사지역</th>
				            <th>버스커인원</th>
				            <th>관중규모</th>
				            <th>공연일시</th>
				            <th>공연시간</th>
				            <th>예산</th>
				            <th>내용</th>
				            <th>공연자</th>
				        </tr>
				    </thead>
				    <tbody>
				   <c:forEach var="mybusking" items="${requestScope.mybuskinglist}">
			            <tr>
				            <td>${mybusking.hname}</td>
				            <td>${mybusking.busking_loc}</td>
				            <td>${mybusking.busking_num}</td>
				            <td>${mybusking.busking_aud_num}</td>
				            <td>${mybusking.busking_date}</td>
				            <td>${mybusking.busking_duration}</td>
				            <td>${mybusking.busking_budget}</td>
				            <td>${mybusking.busking_about}</td>
				            <td>${mybusking.aname}</td>
				        </tr>
				        </c:forEach>
				    </tbody>
				   
   			 </table>
   			 </div>
			</div>

		</div>
	</div>
	<!-- 지원목록테이블 -->

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
	
	<!-- 게시판 css&js-->
	
	<script type="text/javascript" src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
	</script>
	<script>
	$(document).ready( function () {
    	$('#http://datatables.net/tn/3').DataTable({
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

	<!-- start-smoth-scrolling -->

	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
	
</body>

</html>