<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
						window.location.href = "adminhirelist.busk";
					}
				}
			});
		}else {
			return;
		} 
		}
	function apply_bt(a_email,h_no) {
		console.log("승인한 버스커 이메일:" + a_email);
	
		<c:forEach var="allhire" items="${requestScope.allhirelist}">
		var busking_h_email ='${allhire.hire_email}';
		console.log("busking_h_email값은 = " +'${allhire.hire_email}' );
		var busking_loc='${allhire.hire_loc}';
		var busking_num='${allhire.hire_num}';
		var busking_aud_num='${allhire.hire_aud_num}';
		var busking_date='${allhire.hire_date}';
		var busking_duration='${allhire.hire_duration}';
		var busking_budget='${allhire.hire_budget}';
		var busking_about='${allhire.hire_about}';
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
						window.location.href = "adminhirelist.busk";
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
<c:set var="allhirelist" value="${requestScope.allhirelist}">
</c:set>
<c:set var="allapplylist" value="${requestScope.allapplylist}">
</c:set>
<c:set var="buskerapplylist" value="${requestScope.buskerapplylist}">
</c:set>
<c:set var="allbuskinglist" value="${requestScope.allbuskinglist}">
</c:set>
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
	<!--//short-->
	<!-- //inner_content -->
	

	<!--//Header-->
	<!--/inner_connectent-->
	<!--Gallery-->
	<div class="banner_bottom">
		<div class="container">
			<h3 class="headerw3">버스커 구인공고 목록</h3>
			<div class="inner_sec_w3_agileinfo">
			 <div class="col-md-10">
			 
			 </div>
			 <div class="col-md-1">
			  
			 </div> 
			 <div class="col-md-1">
			 <%-- <c:if test="${sessionScope.sessionID!=null}"> --%>
			
			 <%-- </c:if> --%>
			 
			 <br><br>
			 </div>
			 
				<table id="allTable" class="display">
				    <thead>
				        <tr>
				        	<th>글번호</th>
				            <th>작성자</th>
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
				   <c:forEach var="allhire" items="${requestScope.allhirelist}">
			            <tr>
			            	<td>${allhire.hire_no}</td>
				            <td>${allhire.name}</td>
				            <td>${allhire.hire_regdate}</td>
				            <td>${allhire.hire_loc}</td>
				            <td>${allhire.hire_num}</td>
				            <td>${allhire.hire_type}</td>
				            <td>${allhire.hire_aud_num}</td>
				            <td>${allhire.hire_date}</td>
				            <td>${allhire.hire_duration}</td>
				            <td>${allhire.hire_budget}</td>
				            <td>${allhire.hire_about}</td>
				            <td><input type='button' id='delete_bt' onclick='delete_bt(${allhire.hire_no})' value='삭제'></td>
				        </tr>
	        		</c:forEach>
				    </tbody>
   			 </table>
   			 <div>
   			 <h3 class="headerw3">버스커 지원 목록</h3>
   			 <table id="allTable" class="display">
				    <thead>
				        <tr>
				        	<th>글번호</th>
				            <th>신청자</th>
				            <th>신청코멘트</th>
				            <th>공고게시글번호</th>
				            <th>승인</th>
				        </tr>
				    </thead>
				    <tbody>
				   <c:forEach var="allapply" items="${requestScope.allapplylist}">
			            <tr>
			            	<td>${allapply.apply_no}</td>
				            <td>${allapply.name}</td>
				            <td>${allapply.apply_comment}</td>
				            <td>${allapply.hire_no}</td>
				            <td><input type='button' id='apply_bt' onclick='apply_bt("${allapply.apply_email}",${allapply.hire_no})' value='승인'/></td>
				        </tr>
	        		</c:forEach>
				    </tbody>
				   
   			 </table>
   			 </div>
   			 <!-- 08.27민지 추가 -->
   			 <div>
   			 <h3 class="headerw3">확정된 공연 목록</h3>
   			 <table id="allTable" class="display">
				    <thead>
				        <tr>
				        	<th>글번호</th>
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
				   <c:forEach var="allbusking" items="${requestScope.allbuskinglist}">
			            <tr>
			            	<td>${allbusking.busking_no}</td>
				            <td>${allbusking.hname}</td>
				            <td>${allbusking.busking_loc}</td>
				            <td>${allbusking.busking_num}</td>
				            <td>${allbusking.busking_aud_num}</td>
				            <td>${allbusking.busking_date}</td>
				            <td>${allbusking.busking_duration}</td>
				            <td>${allbusking.busking_budget}</td>
				            <td>${allbusking.busking_about}</td>
				            <td>${allbusking.aname}</td>
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