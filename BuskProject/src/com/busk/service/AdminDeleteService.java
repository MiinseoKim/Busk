package com.busk.service;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;

//08.27민지시작
public class AdminDeleteService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		
		String email = request.getParameter("email");
		System.out.println("받아온 이메일 = " + email);
		try {
			   MemberDao dao = new MemberDao();
          	   //멤버 삭제
			  boolean result = dao.deleteMemberList(email);
			   System.out.println("삭제 결과 =" + result);
			   if(result ==true) {
				   response.setContentType("text/html; charset=UTF-8"); 
       	    	   PrintWriter out = response.getWriter();
       	    	   out.print("delete");
			   }
			  
       	       }catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}
}
