<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.busk.service.EmailSend"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Busk 이메일 인증</title>

<script type="text/javascript">
function confirmemail(emailconfirm_value, authNum){
	var emailhidden="<%=request.getParameter("emailhidden")%>";
	var usertype="<%=request.getParameter("usertype")%>";
	
    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
	if(!emailconfirm_value || emailconfirm_value != authNum){		
		alert("일치하지 않습니다");
		emailconfirm_value="";
		$("#emailconfirm").val()="";
		$("#emailconfirm").focus();
	}
	else if(emailconfirm_value==authNum){
		if(usertype=="fan"){
			alert("인증 완료되었습니다");
			emailconfirm_value="";
			emailhidden="Y";
			console.log(emailhidden);
			//request.setAttribute("emailhidden",emailhidden);
			self.close();
			window.opener.document.getElementById("emailhidden").value = emailhidden;
		}else if(usertype=="busker"){
			alert("인증 완료되었습니다");
			emailconfirm_value="";
			emailhidden="Y";
			console.log(emailhidden);
			//request.setAttribute("emailhidden",emailhidden);
			self.close();
			window.opener.document.getElementById("emailhidden2").value = emailhidden;
			
		}
	}
	
}
</script>
</head>
<body>
	<%
		String email = request.getParameter("email");
		System.out.print(email);
		// 위에서 작성한 java파일 객체 생성
		EmailSend emailconfirm = new EmailSend();
		String authNum = emailconfirm.connectEmail(email);
	%>
	<form method="post" action="" name="emailcheck" id="emailcheck">
		<table>
			<tr>
				<th colspan="2">인증번호를 입력하세요.</th>
			</tr>
			<tr>
				<td><input type="text" name="emailconfirm" id="emailconfirm"></td>
				<td><input type="button" value="확인"
					onclick="javascript:confirmemail(emailcheck.emailconfirm.value, <%=authNum%>)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>





