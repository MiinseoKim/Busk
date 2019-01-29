<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="email" value="${sessionScope.email}" />
<c:set var="type" value="${sessionScope.type}" />
<c:set var="test" value="${memberinfo}"/>
<%
	String msg = (String) request.getAttribute("board_msg");
	String url = (String) request.getAttribute("board_url");
	if (msg != null && url != null) {
%>
<script>
		alert('<%=msg%>');		
	    location.href='<%=url%>';
</script>

<%
	}
%>
<!DOCTYPE html>
<html>

<!-- String id = (String)session.getAttribute("sessionId"); -->

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html;charset=UTF-8">
<style>
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

#leave {
	margin-left: 70%;
}

#gholder {
	width: auto;
	height: auto;
}
</style>
<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
<script src="js/location.js"></script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>

<script type="application/x-javascript">
			
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
</script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
						$("#btnupdate").click(function() {
							console.log($("#picture").val());
							if ($("#oldpwd").val() == "") {
								alert("기존 비밀번호를 입력하세요");
								$("#oldpwd").focus();
								return false;

							} else if ($("#name").val() == "") {
								alert("이름을 입력하세요");
								$("#name").focus();
								return false;

							} else if ($("#pwd").val() != "") {
								if ($("#pwd").val() != $("#pwdchk").val()) {
									alert("새 비밀번호와 비밀번호 확인값이 일치하지 않아요!");
									$("#pwd").val("");
									$("#pwdchk").val("");
									$("#pwd").focus();
									return false;

								} else {
									$("#hidden").val("pwd");
									$.ajax({
										url : "updatepwdchk.busk",
										data : {
											oldpwd : $('#oldpwd').val()
										},
										dataType : "html",
										success : function(pwdCheck) {
											console.log(pwdCheck);
											if (pwdCheck == 'y') {
												$('#updateform').submit();

											} else {
												alert("기존 비밀번호가 일치하지 않습니다.");
												$("#oldpwd").focus();
												return false;
											}
										}
									});
								}

							} else if ($("#pwd").val() == "") {
								$("#hidden").val("old");
								$.ajax({
									url : "updatepwdchk.busk",
									data : {
										oldpwd : $('#oldpwd').val()
									},
									dataType : "html",
									success : function(pwdCheck) {
										console.log(pwdCheck);
										if (pwdCheck == 'y') {
											$('#updateform').submit();
										} else {
											alert("기존 비밀번호가 일치하지 않습니다.");
											$("#oldpwd").focus();
											return false;

										}
									}
								});
								return false;
							}
						});
						var upload = document.getElementById('picture'), holder = document.getElementById('holder');
						upload.onchange = function(e) {
							e.preventDefault();
							var file = upload.files[0], reader = new FileReader();
							reader.onload = function(event) {
								var img = new Image();
								img.src = event.target.result;
								//if (img.width > 300) { // holder width
								img.width = 200;
								//}
								//if (img.height > 300) { // holder width
								img.height = 200;
								//}
								img.class="img-responsive img-circle";
								holder.innerHTML = '';
								holder.appendChild(img);
							};
							reader.readAsDataURL(file);
							return false;
						};

						$("#gallery").change(function(){
							console.log($("#gallery").val());	
							//사진 파일 비동기 업로드
							$("#galleryform").ajaxForm({
								url : "galleryinsert.busk",
								enctype : "multipart/form-data",
					            success: function(ginsert,status){
									if (ginsert == 'n') {
										alert("추가에 실패했습니다.");											
									} else {										
										var array=ginsert.split(",");
										var no=array[0];
										var source="\\upload"+array[1];
										
										var img = new Image();
										img.src = source;

										var div = document.createElement("div");
										div.style = "display:inline;margin-top:2%;";
										div.id=no;

										var img="<img src="+source+" style='width:200px; height:200px;margin:1%;'>";
										var btn = "<input type=button id='delete' onclick='javascript:deletepic("+no+")' value='삭제하기'>";
										console.log(img+btn);
										div.innerHTML=img+btn;
										gholder.appendChild(div);
										alert("추가 되었습니다.");
									}
					            },
					            error: function(){
					                //에러발생을 위한 code페이지
					            }
							});$("#galleryform").submit();
						});						

						$("#leave").click(function() {
							var pwd = prompt("정말 탈퇴하시겠습니까? \n탈퇴 후 삭제된 개인정보는 되돌릴 수 없습니다. \n\n탈퇴를 위해 비밀번호를 입력하세요.");
							if(pwd!=null || pwd!=""){
								$.ajax({
									url: "leave.busk",
									data: {
										password : pwd
									},
									dataType : "html",
									success:function(result){
										console.log(result);
										if(result=="gb"){
											alert("회원 탈퇴가 완료되었습니다.");
											location.href="/BuskProject/main.busk";
										}else if(result=="f"){
											alert("회원 탈퇴에 실패했습니다.");
											return false;
										}else{
											alert(result);
											return false;
										}
									}
								});
							}else{ return false;}
						});

			});
	function deletepic(no) {
		console.log(no);
		$.ajax({
			url : "gallerydelete.busk",
			data : {
				gallery_no : no
			},
			dataType : "html",
			success : function(ginsert) {
				console.log(ginsert);
				if (ginsert == 'y') {
					document.getElementById(no).innerHTML="";
				} else {
					alert("삭제 실패했습니다.");

				}
			}
		});
	}
</script>
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
	<c:set var="memberinfo" value="${requestScope.memberinfo}">
	</c:set>
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

	<div class="services-breadcrumb-w3ls-agile">
		<div class="inner_breadcrumb">

			<ul class="short">
				<li><a href="main.busk">Home</a><span>|</span></li>
				<li>My Profile</li>
			</ul>
		</div>
	</div>

	<div class="banner_bottom">
		<div class="container">
			<h3 class="headerw3">My Profile</h3>
			<div class="inner_sec_w3_agileinfo">

				<div class="news-main">
					<form name="updateform" action="profileupdate.busk" id="updateform"
						method="post" enctype="multipart/form-data">
						<div class="col-md-6 news-left">
							<c:forEach var="member" items="${memberinfo}">
								<div class="col-md-12 b_right" id="holder">
									<img id="profilePicture" src="${member.picture}" width="200" height="200"
										alt="your profile picture" class="img-responsive img-circle">

								</div>
								<div class="col-md-12 b_right">
									<div class="form-group">
										<label for="exampleInputFile">프로필 사진 변경</label> <input
											type="file" name="picture" id="picture">
										<p class="help-block">변경을 원하시는 사진을 선택하고 수정 버튼을 눌주세요.</p>

									</div>
								</div>
						</div>
						<div class="col-md-6 news-right">
							<div class="form-group">
								<label for="exampleInputName1">이름</label> <input type="text"
									class="form-control" name="name" id="name"
									value="${member.name}">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">기존 비밀번호</label> <input
									type="password" class="form-control" name="oldpwd" id="oldpwd"
									placeholder="기존 비밀번호 입력은 필수입니다."> <input type="hidden"
									class="form-control" name="hidden" id="hidden" value="old">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword2">새 비밀번호</label> <input
									type="password" class="form-control" name="pwd" id="pwd"
									placeholder="변경하실 비밀번호를 입력해주세요">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword2">새 비밀번호 확인</label> <input
									type="password" class="form-control" name="pwdchk" id="pwdchk"
									placeholder="변경하실 비밀번호를 한번 더 입력해주세요">
							</div>

							<div class="form-group">
								<label for="exampleInputIntro1">내 소개</label> <input type="text"
									class="form-control" name="descript" id="descript"
									value="${member.descript}">
							</div>

							<div class="form-group locapi">
								<label for="exampleInputLocation1">지역</label> <input type="text"
									class="form-control" name="location" id="location"
									value="${member.location}">
							</div>

							<div class="form-group">
								<label for="exampleInputSNS1">Facebook</label> <input
									type="text" class="form-control" name="facebook" id="facebook"
									value="${member.facebook}">
							</div>

							<div class="form-group">
								<label for="exampleInputSNS2">Instagram</label> <input
									type="text" class="form-control" name="instagram"
									id="instagram" value="${member.instagram}">
							</div>

							<div class="form-group">
								<label for="exampleInputSNS3">YouTube</label> <input type="text"
									class="form-control" name="youtube" id="youtube"
									value="${member.youtube}">
							</div>
							</c:forEach>
							<button type="button" id="btnupdate" class="btn btn-default">수정</button>
							<a href="" id="leave">회원 탈퇴</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${type eq '2'}">
		<div style="margin-left:5%;margin-bottom:3%;">
			<form enctype="multipart/form-data" method=post id="galleryform">
				<label for="exampleInputFile">갤러리 사진 추가</label> <input type="file"
					name="gallery" id="gallery">
			</form>
			<div id="gholder">
				<c:set var="gallerylist" value="${requestScope.gallerylist}"></c:set>
				<c:forEach var="gallery" items="${gallerylist}">
					<div style="display: inline;margin-top:2%;" id=${gallery.gallery_no }>
						<img src=${gallery.gallery_file } style="width: 200px; height: 200px; margin:2%;">
						<input type="button" onclick="deletepic('${gallery.gallery_no }')"
							value="삭제하기">
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>

	<div class="contact-footer-w3layouts-agile">
		<%
			pageContext.include("/WEB-INF/views/include/footer.jsp");
		%>
	</div>


	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<!--search-bar-->
	<script src="js/main.js"></script>



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
			/*
									var defaults = {
							  			containerID: 'toTop', // fading element id
										containerHoverID: 'toTopHover', // fading element hover id
										scrollSpeed: 1200,
										easingType: 'linear' 
							 		};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>


</body>

</html>