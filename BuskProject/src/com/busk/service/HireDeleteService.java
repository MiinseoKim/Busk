package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.HireDao;


public class HireDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		
		try {
			   HireDao dao = new HireDao();
			   System.out.println("deleteservice에서 받은 값:"+request.getParameter("hire_no"));
			   int hire_no = Integer.parseInt(request.getParameter("hire_no"));
       	       boolean result = dao.deleteMyHireList(hire_no);    	      
       	       System.out.println("삭제할 hire_no =" + result);
       	       if( result ==true) {
       	    	   response.setContentType("text/html; charset=UTF-8"); 
       	    	   PrintWriter out = response.getWriter();
       	    	   out.print("delete");
       	       }       	       
		}catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}

}
