package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FanDao;

public class FanCountService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		
		try {
				PrintWriter out = response.getWriter();
		   	    request.setCharacterEncoding("UTF-8");
			    response.setContentType("text/html;charset=UTF-8");
				String myEmail =(String) request.getAttribute("myEmail");
				String fanEmail = (String) request.getAttribute("fanEmail");
				if (myEmail.equals(fanEmail)) {
				int fan = 3;
				out.print(fan);
				} else {
				FanDao dao = new FanDao();
				int fan = dao.getFanCount(myEmail, fanEmail);			
				out.print(fan);  
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}
	

}