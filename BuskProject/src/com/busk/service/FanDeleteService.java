package com.busk.service;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FanDao;

public class FanDeleteService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		int fan_no = Integer.parseInt(request.getParameter("fan_no"));
		try {
			   FanDao dao = new FanDao();
			  
          	   //모든 팬 리스트 출력 
			  boolean result = dao.deleteFanList(fan_no);
			  if(result==true) {
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
