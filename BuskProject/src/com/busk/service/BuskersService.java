package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;
import com.busk.dto.member;

public class BuskersService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		try {
			   request.setCharacterEncoding("UTF-8");
		   	   response.setContentType("text/html;charset=UTF-8");
     	       MemberDao dao = new MemberDao();
			   ArrayList<member> buskerslist = dao.getBuskersList();
			   request.setAttribute("buskerslist", buskerslist);

       	       foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/buskers.jsp");       	       
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}
