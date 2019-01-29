<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="type" value="${sessionScope.type}" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function loginchk(index) {
		var type = "${sessionScope.type}";
		if (type == 3 || type == 2 ) {
			if(index==1){
				location.href = "profile.busk";
				$("#profile").attr("href","profile.busk");
			}else if (index == 2) {
				location.href = "message.busk";
				$("#message").attr("href","message.busk");
			} else if (index == 3) {
				location.href = "hirelist.busk";
				$("#busking").attr("href","hirelist.busk");
			} else if (index == 4) {
				location.href = "fanpage.busk";
				$("#fan").attr("href","fanpage.busk");
			} 
		}else if(type == 1){
			if(index==1){
				location.href = "profile.busk";
				$("#profile").attr("href","profile.busk");
			}else if (index == 2) {
				location.href = "message.busk";
				$("#message").attr("href","message.busk");
			} else if (index == 3) {
				location.href = "adminhirelist.busk";
				$("#adminbusking").attr("href","adminhirelist.busk");
			} else if (index == 4) {
				location.href = "adminfanlist.busk";
				$("#adminfanlist").attr("href","adminfanlist.busk");
			}  else if (index == 5) {
				location.href = "adminpage.busk";
				$("#adminpage").attr("href","adminpage.busk");
			}
		}else {
			alert("로그인 후 이용 가능합니다.");
		}		
	}
	function navSelect(index) {
		var len = document.getElementsByTagName("a").length;
		for (var i = 1; i < len + 1; i++) {
			if (i == index) {
				document.getElementById("a" + i).className = "active";
			} else {
				document.getElementById("a" + i).className = "";
			}
		}
	}
</script>
</head>
<body>
	<div class="top-bar">
		<div class="header-nav-agileits">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<h1>
						<a class="navbar-brand" href="main.busk">Busk <span>Busking
								Community</span></a>
					</h1>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil"
					id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="top_nav">
							<li><a id="a1" href="about.busk" class=""
								onclick="navSelect(1)">About</a></li>
							<li><a id="a2" href="community.busk" class=""
								onclick="navSelect(2)">Community</a></li>
							<li><a id="a3" href="buskers.busk" class=""
								onclick="navSelect(3)">Buskers</a></li>
							<li><a id="a4" href="hire.busk" class=""
								onclick="navSelect(4)">Hire</a></li>
							<li class="dropdown"><a id="a5" href="#"
								class="dropdown-toggle" data-toggle="dropdown"
								data-hover="Pages" role="button" aria-haspopup="true"
								aria-expanded="false" class="" onclick="navSelect(5)">My
									Page <span class="fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu">
								<c:if test="${type ne '1'}">
									<li><a id="profile" class="logingonly" onclick="loginchk(1)">프로필</a></li>
									</c:if>
									<!-- <li><a id="message" class="logingonly" onclick="loginchk(2)">메세지</a></li> -->
									<li><a id="busking" class="logingonly" onclick="loginchk(3)">구인 목록</a></li>
									<li><a id="fan" class="logingonly" onclick="loginchk(4)">팬</a></li>						
									<c:if test="${type eq '1'}">
									<li><a id="admin" class="logingonly" onclick="loginchk(5)">관리자 페이지</a></li>
									</c:if>
	
								</ul></li>
						</ul>
					</nav>
				</div>
			</nav>

		</div>
	</div>
</body>
</html>