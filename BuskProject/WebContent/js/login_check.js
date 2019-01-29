$("#login_submit").click(function(){  
	console.log("알럿");
	console.log($("#login_email").val());
	var data={
			
			email:$("#login_email").val(),
			pwd:$("#login_password").val()
	};
    $.ajax({      
        url:"login.busk",
        data:data,
        dataType:"html",
        success:function(data){   
           console.log(data);
        	if(data=="Y"){        	
        	alert("로그인 성공");
        	location.href="/BuskProject/main.busk";
           }else if(data=="N"){
        	   alert("로그인 실패");
        	   location.href="/BuskProject/main.busk";
           }
           }
    });  

      
});  
