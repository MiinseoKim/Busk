package com.busk.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FanDao;

public class IngiWangService implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			   FanDao fdao = new FanDao();		
       	       ArrayList<Map<String, Object>> ingiwang = fdao.getIngiWang();
       	       request.setAttribute("ingiwang", ingiwang);
       	       System.out.println(ingiwang.get(0));
       	       forward = new ActionForward();
       	       forward.setRedirect(false);
       	       forward.setPath("/WEB-INF/views/menu/community.jsp");
       	  
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	
	
	}
}
