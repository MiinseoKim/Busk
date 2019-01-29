package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.ApplyDao;

public class ApplyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		String apply_email = (String) session.getAttribute("email");
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			String apply_comment = request.getParameter("apply_comment");
			String hireno = request.getParameter("hire_no");
			int hire_no= Integer.parseInt(hireno);
			ApplyDao dao = new ApplyDao();
			int apply = dao.insertApply(apply_email,apply_comment,hire_no);
			if (apply > 0) {				
				out.print("y");
			}else {
				out.print("n");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return foward;
	}

}
