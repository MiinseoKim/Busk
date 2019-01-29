<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

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
		 
		$("#updateSubmit").click(function(){
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
	 
	</script>
<!-- <script type="text/javascript">
	 $(document).ready(function(){
		 $("#updateSubmit").click(function(){
				location.href="updatesubmit.busk";
				return false;
		 	}); 
	 });
</script> -->

<script type="text/javascript">

	$(document).ready(function(){
	$("#updateCancel").click(function(){
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

<c:set var="boardupdate" value="${requestScope.boardupdate}">
</c:set>


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
				<li>Update Post</li>
			</ul>
		</div>
	</div>


	<div class="banner_bottom">
		<div class="container">
			<h3 class="headerw3">글 수정</h3>
			<div class="inner_sec_w3_agileinfo">
			<c:forEach var="boardupdate" items="${requestScope.boardupdate}">
			
				<div class="row">
					<form role="form" action="updatesubmit.busk?num=${boardupdate.board_no}" id="contact-form"
						class="contact-form" enctype="multipart/form-data" method="post">
						<div class="row">
							<input type="hidden" class="form-control" name="board_no"
								id="board_no" value="${boardupdate.board_no}">
							<input type="hidden" class="form-control" name="existing_file"
								id="existing_file" value="${boardupdate.board_file}">
							
							
							<div class="col-md-2">
								<div class="form-group">
									<input type="text" class="form-control" name="board_title"
										autocomplete="off" id="board_title" 
										value="글번호: ${boardupdate.board_no}" readOnly>
								</div>
							
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<input type="text" class="form-control" name="board_title"
										autocomplete="off" id="board_title" 
										value="${boardupdate.board_title}">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="text" class="form-control" name="Writer"
										autocomplete="off" id="Writer" 
										value="작성자: ${boardupdate.name}" readOnly>
								</div>
							</div>
							
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control textarea"
									 rows="10"name="board_content" 
									 id="board_content" >${boardupdate.board_content}</textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<button id="updateSubmit" type="submit"
									class="btn main-btn pull-right">글 수정하기</button>

								<button id="updateCancel" class="btn main-btn pull-right">목록으로</button>
							</div>
						</div>
					</form>
				</div>
			</c:forEach>
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