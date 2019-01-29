jQuery(document).ready(
		function($) {
			$("#fansubmit").click(function() {
				console.log($("#f_emailauth").val());
				 var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				if($("#f_user").val()=="" || $("#f_user").val()==null || $("#f_user").val()=="Your NickName"){
					alert("이름을 입력하세요");
					$("#f_user").focus();
				}
				else if ($("#f_pw").val() != $("#f_pwconfirm").val()) {
					alert("패스워드를 확인하세요");
					$("#f_pwconfirm").focus();
				} else if ($("#f_emailauth").val() == "N") {
					alert("메일인증을 시도하세요.");
				} else if ($("#f_email").val() != $("#f_currentemail").val()) {
					alert("이메일 중복확인을 시도하세요.");
					$("#f_emaildup").val("N");
					$("#f_emailauth").val("N");
				} else if (!reg_pwd.test($("#f_pw").val())) {
					alert("패스워드는 영문 숫자를 혼합하여 6~20자리 이내로 입력하세요.");
					$("#f_pw").focus();
				} else {
					$("#f_insertform").submit();
					alert("가입을 축하합니다.");
				}
			});

			$("#buskersubmit").click(function() {
						console.log($("#b_user").val());
						var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
						if($("#b_user").val()=="" || $("#b_user").val()==null || $("#b_user").val()=="Your NickName"){
							alert("이름을 입력하세요");
							$("#b_user").focus();
						}
						else if ($("#b_pw").val() != $("#b_pwconfirm").val()) {
							alert("패스워드를 확인하세요");
						} else if ($("#b_emailauth").val() == "N") {
							alert("메일인증을 시도하세요.");
						}else if ($("#b_email").val() != $("#b_currentemail").val()) {
							alert("이메일 중복확인을 시도하세요.");
							$("#b_emaildup").val("N");
							$("#b_emailauth").val("N");
						}else if ($("#video").val() == "") {
							alert("동영상파일을 업로드하세요.");
						} else if (!reg_pwd.test($("#b_pw").val())) {
							alert("패스워드는 영문 숫자를 혼합하여 6~20자리 이내로 입력하세요.");
							$("#b_pw").focus();
						}else {
							$("#b_insertform").submit();
							alert("가입을 축하합니다.");
						}
					});

			$("#fanemailjb").click(function() {
						console.log($("#f_email").val() );
						var etest=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
						if ($("#f_email").val() == null || $("#f_email").val() == "" ||$("#f_email").val() =="Email") {
							alert("이메일을 입력해주세요");
							$("#f_email").focus();
						}else if (!etest.test($("#f_email").val())) {
							alert("이메일을 형식이 아닙니다.");
							$("#f_email").focus();
						}else if($("#f_emaildup").val()=="Y" && $("#f_email").val() == $("#f_currentemail").val() ){
							alert("이메일 인증이 이미 완료되었습니다.");
						} else {
							var data2 = {
								fanemailconfirm : $("#f_email").val(),
								usertype : $("#f_usertype").val()
							};
							console.log($("#f_email").val());
							$.ajax({
								url : "emailjb.busk",
								data : data2,
								dataType : "html",
								success : function(data) {
									console.log(data);
									if (data == "N") {
										alert("아이디 중복");
										$("#f_email").focus();
										$("#f_emaildup").val("N");
									} else {
										alert("아이디 사용 가능");
										$("#f_emaildup").val("Y");
										$("#f_currentemail").val($("#f_email").val());
									}
								}
							});
						}
					});
			$("#buskeremailjb").click(function() {
				var etest=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if ($("#b_email").val() == null || $("#b_email").val() == "" || $("#b_email").val() == "Email") {
					alert("이메일을 입력해주세요");
					$("#b_email").focus();
				}else if (!etest.test($("#b_email").val())) {
					alert("이메일을 형식이 아닙니다.");
					$("#b_email").focus();
				} else if($("#b_emaildup").val()=="Y" && $("#b_email").val() == $("#b_currentemail").val()){
					alert("이메일 인증이 이미 완료되었습니다.");
				}else {
					var data = {
						buskeremailconfirm : $("#b_email").val(),
						usertype2 : $("#b_usertype").val()
					};
					$.ajax({
						url : "emailjb.busk",
						data : data,
						dataType : "html",
						success : function(data) {
							console.log(data);
							if (data == "N") {
								alert("아이디 중복");
								$("#b_email").focus();
								$("#b_emaildup").val("N");
							} else {
								alert("아이디 사용 가능");
								$("#b_emaildup").val("Y");
								$("#b_currentemail").val($("#b_email").val());
							}
						}
					});
				}
			});

		});

function emailcheck(email, hidden, usertype) {
	if(usertype=="fan"){
		if($("#f_emaildup").val() == "N" || $("#f_email").val() != $("#f_currentemail").val()){
			alert("이메일을 중복확인을 해주세요.");
		}else {
			console.log("새창으로 이동");
			console.log(hidden);
			var url = "emailCheck.jsp?email=" + email +  "&usertype=" + usertype;
			open(url, "emailwindow",
					"width=250, height=130, statusbar=no, menubar=no, scrollbars=no");
		}
	}else if(usertype=="busker"){
		if($("#b_emaildup").val() == "N" || $("#b_email").val() != $("#b_currentemail").val()) {
			alert("이메일을 중복확인을 해주세요.");
		}else {
			console.log("새창으로 이동");
			console.log(hidden);
			var url = "emailCheck.jsp?email=" + email + "&usertype=" + usertype;
			open(url, "emailwindow",
					"width=250, height=130, statusbar=no, menubar=no, scrollbars=no");
		}
	}

}

function checkPwd() {
	var pw1 = $("#f_pw").val();
	var pw2 = $("#f_pwconfirm").val();
	if (pw1 != pw2) {
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
	} else {
		document.getElementById('checkPwd').style.color = "green";
		document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";

	}

}

function checkPwd2() {
	var pw1 = $("#b_pw").val();
	var pw2 = $("#b_pwconfirm").val();
	if (pw1 != pw2) {
		document.getElementById('checkPwd2').style.color = "red";
		document.getElementById('checkPwd2').innerHTML = "동일한 암호를 입력하세요.";
	} else {
		document.getElementById('checkPwd2').style.color = "green";
		document.getElementById('checkPwd2').innerHTML = "암호가 확인 되었습니다.";

	}

}