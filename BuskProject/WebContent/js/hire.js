
jQuery(document).ready(function($) {
	var date= new Date();
	var dd=date.getDate();
	var mm=("0" + (date.getMonth() + 1)).slice(-2);
	var lm=("0" + (date.getMonth() + 2)).slice(-2);
	var yyyy=date.getFullYear();
	var today=yyyy+"-"+mm+"-"+dd;
	var lastday=yyyy+"-"+lm+"-"+dd;
	document.getElementById("datepicker").setAttribute("min",today);
	document.getElementById("datepicker").setAttribute("max",lastday);
	
//	$("#datepicker").datepicker({		
//    });
	
	$("#submit").click(function() {

		console.log($("#checkbox").is(":checked"));

		if ($("#location").val() == "") {
			alert("공연장소를 입력 해주세요");
			$("#location").focus();
		} else if ($("#buskernum").val() == "") {
			alert("모집 인원을 임력 해주세요");
			$("#buskernum").focus();
		} else if ($("#buskingtype").val() == "") {
			alert("버스킹 타입을 입력 해주세요");
			$("#buskingtype").focus();
		} else if ($("#audnum").val() == "") {
			alert("공연 규모를 입력 해주세요");
			$("#audnum").focus();
		} else if ($("#datepicker").val() == "") {
			alert("입력값을 채워주세요");
			$("#datepicker").focus();
		} else if ($("#timepicker").val() == "") {
			alert("공연 일시를 입력 해주세요");
			$("#timepicker").focus();
		} else if ($("#duration").val() == "") {
			alert("공연 일시를 입력 해주세요");
			$("#duration").focus();
		} else if ($("#cost").val() == "") {
			alert("예산을 입력 해주세요");
			$("#cost").focus();
		} else if ($("#about").val() == "") {
			alert("소개말을 입력 해주세요");
			$("#about").focus();
		} else if ($("#checkbox").is(":checked") == false) {
			alert("이용 약관에 동의해주세요.");
		} else {
			console.log($("#about").val());
			$.ajax({
				type : "get",
				url : "inserthire.busk",
				data : {
					location : $("#location").val(),
					buskernum : $("#buskernum").val(),
					buskingtype : $("#buskingtype").val(),
					audnum : $("#audnum").val(),
					date : $("#datepicker").val(),
					time : $("#timepicker").val(),
					duration : $("#duration").val(),
					cost : $("#cost").val(),
					about : $("#about").val(),
					unit : $("#unit").val()
				},
				dataType : "html",
				success : function(data) {
					if (data == "n") {
						alert("등록에 실패했습니다.");
						location.href = "hire.busk";
					} else if (data == "y") {
						console.log(data);
						alert("등록 되었습니다.");
						location.href = "hire.busk";
					}
				},
				error : function(xhr) {

				}
			});
		}

	});
	
	
});
function apply(num,type,email,user) {
	if (type==""||type==null) {
		console.log(type);
		alert("로그인 후 이용 가능합니다.");
	}else if(type==3){
		alert("버스커만 이용 가능합니다.");
	}else if(email==user){
		alert("본인이 등록한 공고에는 지원할 수 없습니다.");
	}else {
		var ok = prompt("정말 지원하시겠습니까?\n공고자 측에서 승인을 하면 취소할 수 없습니다.\n지원 후 공고자와 충분한 상의를 하세요 \n\n 지원을 원하시면 아래에 공고자에게 보낼 메세지를 적어주세요.(필수)");
		if (ok != "" && ok != null) {
			$.ajax({
				type : "get",
				url : "apply.busk",
				data : {
					hire_no : num,
					apply_comment : ok
				},
				dataType : "html",
				success : function(data) {
					console.log(data);
					if (data == "no") {
						alert("지원에 실패했습니다.");
					} else if (data == "y") {
						console.log(data);
						alert("지원 되었습니다.");
					}
				},
				error : function(xhr) {

				}
			});
		} else {
			alert("지원이 취소되었습니다.");
		}
	}
}




