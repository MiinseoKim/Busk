package com.busk.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;
import com.busk.dto.member;

import net.sf.json.JSONArray;

public class BuskerSearchService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		
		try {
		   	   PrintWriter out = response.getWriter();
			   request.setCharacterEncoding("UTF-8");
		   	   response.setContentType("text/html;charset=UTF-8");
		   	   String searchBusker = request.getParameter("searchBusker");
		   	   System.out.println("서비스 + 입력한 값 : " +searchBusker);
     	       MemberDao dao = new MemberDao();
     	       try {
			   ArrayList<member> buskerSearchlist = dao.getBuskerSearchList(searchBusker);
			   System.out.println("서비스 꺼내온 값 : " + buskerSearchlist);
			   JSONArray array = JSONArray.fromObject(buskerSearchlist);
			   out.println(array);
			   
			   /*request.setAttribute("buskerSearchlist", buskerSearchlist);
			   System.out.println("서비스에 오지 않는건가 >> " + buskerSearchlist);*/
     	       } catch (Exception e ) {
     	    	   e.printStackTrace();
     	       }
			   /*foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/buskers.jsp");   */	       
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}