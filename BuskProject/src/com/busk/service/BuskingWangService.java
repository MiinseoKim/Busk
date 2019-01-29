package com.busk.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BuskingDao;
import com.busk.dao.FanDao;

public class BuskingWangService implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			   BuskingDao bdao = new BuskingDao();		
       	       ArrayList<Map<String, Object>> buskingwang = bdao.getBuskingWang();
       	       request.setAttribute("buskingwang", buskingwang);
       	       forward = new ActionForward();
       	       forward.setRedirect(false);
       	       forward.setPath("/WEB-INF/views/menu/community.jsp");
       	  
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	
	}
}
