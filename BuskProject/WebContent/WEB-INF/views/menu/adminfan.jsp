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
		var fan_no = {
				fan_no:a
		};
		console.log(fan_no);
		if (confirm("정말 삭제하시겠습니까?") !=false) {
			
			$.ajax({
				url:"adminfandelete.busk",
				data:fan_no,
				dataType:"html",
				success:function(response){
					console.log(response);
					if(response="delete"){
						alert("삭제되었습니다.");
						window.location.href = "adminfanlist.busk";
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
<c:set var="fanlist" value="${requestScope.fanlist}">
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
   			 <div>
   			 <h3 class="headerw3">팬 목록</h3>
   			 <table id="allTable" class="display">
				    <thead>
				        <tr>
				        	<th>팬 번호</th>
				            <th>팬 이름</th>
				            <th>버스커 이름</th>
				            <th>삭제</th>
				        </tr>
				    </thead>
				    <tbody>
				   <c:forEach var="fan" items="${requestScope.fanlist}">
			            <tr>
			            	<td>${fan.fan_no}</td>
				            <td>${fan.fname}</td>
				            <td>${fan.bname}</td>
				            <td><input type='button' id='delete_bt' onclick='delete_bt(${fan.fan_no})'  value='삭제'/></td>
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