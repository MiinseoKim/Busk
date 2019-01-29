package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BuskingDao;
import com.busk.dto.busking;

public class MainPageService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		try {
			   BuskingDao dao = new BuskingDao();
       	       ArrayList<busking> buskinglist = dao.getBuskingList();
       	       if(buskinglist.size()>0) {
       	    	   request.setAttribute("buskinglist", buskinglist);
       	       }
       	       
       	       foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/mainPage.jsp");       	       
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}
