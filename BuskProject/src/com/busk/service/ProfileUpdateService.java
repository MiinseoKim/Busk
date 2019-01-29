package com.busk.service;


import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.busk.action.Action;


public class ProfileUpdateService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");		
		
		String dir = request.getRealPath("/upload");
		int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
	    String name=""; 
	    String originalname=""; 
	    String filename2=""; 	
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			MultipartRequest multi =null;
			multi = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());
			String hidden=multi.getParameter("hidden");
			 String pwd="";
			 if(hidden.equals("old")) { 
				  pwd = multi.getParameter("oldpwd");
			 }
			 else {
				  pwd = multi.getParameter("pwd");
			 }
			 System.out.println("파일 경로: "+dir);
			 name = multi.getParameter("name");
			 String descript = multi.getParameter("descript");
			 
			 //input태그 name의 값
			 String picture=(String)multi.getFileNames().nextElement();
			 //실제 파일 이름
			 originalname=multi.getOriginalFileName(picture);
			 System.out.println("실제 파일 이름 : "+originalname);
			 //중복 처리 이름
			 filename2="\\"+multi.getFilesystemName(picture);
			 System.out.println("중복처리 이름 : "+filename2);
			 //File file=multi.getFile(picture);
			 String location = multi.getParameter("location");
			 String facebook = multi.getParameter("facebook");
			 String instagram = multi.getParameter("instagram");
			 String youtube = multi.getParameter("youtube");
			 
			 MemberDao dao = new MemberDao();
			 System.out.println(filename2);
			 int result = dao.updateMember(email,name,pwd,descript,location,facebook,instagram,youtube,filename2);
       	     String msg = "";
       	     String url = "";
       	     System.out.println(result);
       	     	if(result >0) {
       	     	
       	     		msg = "정보가 수정되었습니다 :)";
       	     		url = "profile.busk";
       	     	}else {
       	     		msg = "정보 수정에 실패했습니다 :(";
       	     		url = "profile.busk";
       	     	}
       	       request.setAttribute("board_msg", msg);
       	       request.setAttribute("board_url", url);
       	   
       	       foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/profile.busk");
       
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return foward;
	
	}
}
