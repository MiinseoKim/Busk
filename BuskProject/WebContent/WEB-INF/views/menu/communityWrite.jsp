<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
		 
	 		$("#writeSubmit").click(function(){
			
	
			if($("#board_title").val() =="" || $("#board_content").val() =="" ){
			$('#contact-form').bootstrapValidator({
				//  live: 'disabled',
				  message: 'This value is not valid',
				  feedbackIcons: {
				      valid: 'glyphicon glyphicon-ok',
				      invalid: 'glyphicon glyphicon-remove',
				      validating: 'glyphicon glyphicon-refresh'
				  },
				  fields: {
				      board_title: {
				          validators: {
				              notEmpty: {
				                  message: '글 제목을 입력해주세요.'
				              }
				          }
				      },
				      board_content: {
				          validators: {
				              notEmpty: {
				                  message: '글 내용을 입력해주세요.'
				              }
				          }
				      }
				  }
				});
			
             }else{
	     			$('#contact-form').submit();
	  				return false;	
	          	}
		
		});
	 });
	
	</script>

	<script>
	 $(document).ready(function(){
		$("#writeCancel").click(function(){
		location.href="community.busk";
		return false;
		});
	 });
	</script>

<link href="css/communityWrite.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/about.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/team.css" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Mallanna" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>


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
				<li><a href="index.jsp">Home</a><span>|</span></li>
				<li>New Post</li>
			</ul>
		</div>
	</div>


	<div class="banner_bottom">
		<div class="container">
			<h3 class="headerw3">글쓰기</h3>
			<div class="inner_sec_w3_agileinfo">
				<div class="row">
					<form role="form" action="communitywrite.busk" id="contact-form"
						class="contact-form" enctype="multipart/form-data" method="post">
						<div class="row">

							<input type="hidden" class="form-control" name="board_email"
								id="board_email">


							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control" name="board_title"
										autocomplete="off" id="board_title" placeholder="글 제목">
								</div>
							</div>

							

						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control textarea" rows="10"
										name="board_content" id="board_content" placeholder="글 내용"></textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<button id="writeSubmit" type="submit"
									class="btn main-btn pull-right">글 등록하기</button>

								<button id="writeCancel" class="btn main-btn pull-right">글
									작성 취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="contact-footer-w3layouts-agile">
		<%
			pageContext.include("/WEB-INF/views/include/footer.jsp");
		%>
	</div>

</body>
</html>