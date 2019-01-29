//08.27민지 시작 통채로 복사 해도 됩니다
package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FanDao;
import com.busk.dto.fan;

public class FanPageService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		try {
			   FanDao dao = new FanDao();
			  
          	   //내가 like한 버스커 리스트 출력 
			 ArrayList<fan> buskerlist = dao.getMyBuskerList(email);
			   request.setAttribute("buskerlist", buskerlist); 
			   System.out.println("내가 like한 버스커 리스트 출력 = " +buskerlist );
			   
			 //나를 like한 팬 리스트 출력
       	    ArrayList<fan> fanlist = dao.getMyFanList(email);
       	 request.setAttribute("fanlist", fanlist); 
       	   System.out.println("나를 like한 팬 리스트 출력 = " +fanlist );
			  
       	   
       	foward = new ActionForward();
	       foward.setRedirect(false);
	    foward.setPath("/WEB-INF/views/menu/fanPage.jsp"); 
	    
	    
       	       }catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}

}
