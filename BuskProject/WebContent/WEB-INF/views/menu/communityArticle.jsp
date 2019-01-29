<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<c:set var="boarddetail" value="${requestScope.boarddetail}">
</c:set>

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
	$(document).ready(function() {
		$("#toBoard").click(function() {
			location.href = "community.busk";
		});
});
</script>

<!-- <script type="text/javascript">

//댓글 목록 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});

function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'bno':bno},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}

//댓글 등록

function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}

//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
}

$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});


</script> -->


<link href="css/communityArticle.css" rel='stylesheet' type='text/css' />

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
		<%
			pageContext.include("/WEB-INF/views/include/header.jsp");
		%>
	</div>

	<div class="services-breadcrumb-w3ls-agile">
		<div class="inner_breadcrumb">
			<ul class="short">
				<li><a href="main.busk">Home</a><span>|</span></li>
				<li>Article Contents</li>
			</ul>
		</div>
	</div>

	<div class="banner_bottom">
		<div class="container">
			<div class="inner_sec_w3_agileinfo">
			
				<c:forEach var="boarddetail" items="${requestScope.boarddetail}">
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="col-md-2 well">글번호: &nbsp;
								${boarddetail.board_no}</div>
							<div class="col-md-8 well">제목: &nbsp;
								${boarddetail.board_title}</div>
							<div class="col-md-2 well">작성자: &nbsp; 
								${boarddetail.name}</div>
						</div>
					</div>

					<div class="container-fluid">
						<div class="row-fluid">
							<div class="col-md-12 well">${fn:replace(boarddetail.board_content,cn,br)}
							</div>
						</div>
					</div>

					<br>

					<div class="container-fluid">
						<div class="row-fluid">
							<div class="col-md-4">글 작성 시간: &nbsp;
								${boarddetail.board_regdate}
							</div>
							<div class="col-md-5"></div>
							<div class="col-md-3">
							
							<c:if test="${sessionScope.email == boarddetail.board_email }">
							
								<button onclick="location='communitydelete.busk?num=${boarddetail.board_no}'" 
								id="deleteArticle" class="btn main-btn pull-right">
									글 삭제</button>

								<button onclick="location='communityupdate.busk?num=${boarddetail.board_no}'"
								 id="updateArticle" class="btn main-btn pull-right">
									글 수정</button>
									
							</c:if>
							     <button id="toBoard" class="btn main-btn pull-right">목록으로</button>
							
							</div>
						</div>
						<!-- End Row -->
					</div>
					<!-- End Container -->

				</c:forEach>	
				
				<div class="container-fluid">

					<form action="/bbs/replyForm.bbs" method="post">
						<div id="contentForm">
							<input type="hidden" name="pageNum" value="${pageNum}"> <input
								type="hidden" name="depth" value="${article.depth}"> <input
								type="hidden" name="pos" value="${article.pos}"> <input
								type="hidden" name="groupId" value="${article.groupId}">

							<div class="input-group" role="group" aria-label="..."
								style="margin-top: 10px; width: 100%;">
								<textarea class="form-control" rows="3" id="commentContent"
									placeholder="댓글을 입력하세요." style="width: 100%;"></textarea>
								<div class="btn-group btn-group-sm" role="group"
									aria-label="...">
									<c:if test="${sessionScope.email == null}">
										<input type="button" class="btn btn-default" value="댓글 쓰기"
											disabled="disabled">
									</c:if>
									<c:if test="${sessionScope.email != null}">
										<input type="button" class="btn btn-default" value="댓글 쓰기"
											id="commentWrite">
									</c:if>
									<input type="button" class="btn btn-default"
										value="댓글 읽기(${article.commentCount})"
										onclick="getComment(1, event)" id="commentRead">
								</div>
							</div>

							<!-- Comment 태그 추가 -->
							<div class="input-group" role="group" aria-label="..."
								style="margin-top: 10px; width: 100%;">
								<div id="showComment" style="text-align: center;"></div>
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