package com.busk.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FannoteDao;
import com.busk.dto.fannote;

public class FannoteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		
		try {
				String content = request.getParameter("fannote_content");
				String fannote_b_email = (String) session.getAttribute("mail");
				String fannote_email = (String) session.getAttribute("email");
				FannoteDao dao = new FannoteDao();
				int fan = dao.fannoteInsert(fannote_b_email, fannote_email,content);
				
				foward = new ActionForward();
       	        foward.setRedirect(false);
       	        foward.setPath("/WEB-INF/views/menu/buskerPage.jsp");	       
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}