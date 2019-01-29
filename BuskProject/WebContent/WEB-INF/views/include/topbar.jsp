<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="type" value="${sessionScope.type}" />
<!DOCTYPE html>
<html>
<head>
<title>Busk</title>
<style>

#buskerh5{
		width:180px;
		margin-left:-50%;
	}


</style>
</head>
<body>
<script>
function logout(){
	var logout = confirm("로그아웃 하시겠습니까?");
	{
		if (logout == true) {
			$.ajax({
				type : "get",
				url : "logout.busk",
				dataType : "html",
				success : function(data) {
					if (data == "logout") {
						alert("로그아웃 되었습니다.");
						location.href = "main.busk";
					} else  {
						alert("로그아웃 실패하였습니다.");
						location.href = "main.busk";
					}
				},
				error : function(xhr) {
				}
			});
			
		}
	}
}

</script>

<h6 class="bar-title">MAKE YOUR OWN PERFORMANCE </h6>
		<div class="search">
	
				<c:choose>
				    <c:when test="${empty type}">
				        <h5 class="bar-login"><a class="sign" href="#" data-toggle="modal" data-target="#myModal2">SignIn</a>
				        		&nbsp;<a class="sign" href="join.busk" >SignUp</a></h5>
				    </c:when>
				    <c:when test="${type eq '2'}">
				        <h5 id="buskerh5" class="bar-login"><a class="sign" href="mybuskerPage.busk" >Busker's Page</a>
				        		&nbsp;<a class="sign" href="javascript:logout()" >Logout</a></h5>
				    </c:when>
				    <c:otherwise>
				    <h5 class="bar-login"><a class="sign" href="javascript:logout()" >Logout</a></h5>
				    </c:otherwise>
				</c:choose>		
	
			<div class="cd-main-header">
				<ul class="cd-header-buttons">
					<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
				</ul>
				<!-- cd-header-buttons -->
			</div>
			<div id="cd-search" class="cd-search">
				<form action="#" method="post">
					<input name="Search" type="search" placeholder="Click enter after typing...">
				</form>
			</div>
		</div>
	
		<div class="clearfix"> </div>
		
		
		<!-- Login Modal -->
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
								<form action="login.busk" method="post" id="loginform">
									<input type="email" name="login_email" id="login_email" placeholder="E-mail" required="">
									<input type="password" name="login_password" id="login_password" placeholder="Password" required="">
									<div class="tp">
										<input type="button" id="login_submit" value="Sign In">
									</div>
								</form>
							</div>
							<p><a href="join.busk" > Don't have an account?</a></p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Login Modal -->
	<script type="text/javascript" src="js/login_check.js"></script>
</body>
</html>