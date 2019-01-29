package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FannoteDao;

public class FannoteDeleteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		
		try {
				PrintWriter out = response.getWriter();
				String login_email = (String) session.getAttribute("email");
				int fannote_no = Integer.parseInt(request.getParameter("fannote_no"));
				FannoteDao dao = new FannoteDao();
				int fan = dao.fannoteDelete(fannote_no, login_email);
				out.print(fan);
	       
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}