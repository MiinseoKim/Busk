package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.HireDao;

public class HireInsertService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			String location = request.getParameter("location");
			String buskernum = request.getParameter("buskernum");
			String buskingtype = request.getParameter("buskingtype");
			String audnum = request.getParameter("audnum");
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			String num = request.getParameter("duration");
			String unit = request.getParameter("unit");
			String duration = num + " " + unit;
			String budget = request.getParameter("cost");
			String about = request.getParameter("about");
			
			HireDao dao = new HireDao();
			int result = dao.insertHire(email, location, buskernum, buskingtype, audnum, date, time, duration, budget,about);
			PrintWriter out=response.getWriter();
			System.out.println(result);
			if (result > 0) {				
				
				out.print("y");
				
			} else {
				
				out.print("n");
			}			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
