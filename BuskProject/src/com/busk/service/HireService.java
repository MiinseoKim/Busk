package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.HireDao;
import com.busk.dto.hire;

public class HireService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;

		try {
			   HireDao dao = new HireDao();
       	       ArrayList<hire> hirelist = dao.getAllHireList();  
       	       if(hirelist.size()>0) {
       	    	   request.setAttribute("hirelist", hirelist);
       	       }
       	       
       	       foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/hire.jsp");       	       
		}catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}

}
