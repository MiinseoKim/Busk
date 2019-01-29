package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FanDao;
import com.busk.dao.HireDao;
import com.busk.dto.apply;
import com.busk.dto.fan;
import com.busk.dto.hire;

public class AdminFanService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
	 
		System.out.println("세션에 저장된 이메일값 = " + email);
		try {
			   FanDao dao = new FanDao();
			  
          	   //모든 팬 리스트 출력 
			   ArrayList<fan> fanlist = dao.getFanList();
			   System.out.println("모든 팬 리스트 =" + fanlist);
			   request.setAttribute("fanlist", fanlist); 
			  
			   foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/adminfan.jsp"); 
       	       }catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}
}
