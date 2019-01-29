package com.busk.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FannoteDao;
import com.busk.dto.fannote;

public class FannoteSettingService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		
		
		try {
				PrintWriter out = response.getWriter();
				String email = (String)session.getAttribute("mail");
				System.out.println(email);
				FannoteDao fandao = new FannoteDao();
				ArrayList<fannote> fannotelist = fandao.getFannoteList(email);
				request.setAttribute("fannotelist", fannotelist);
				out.print(fannotelist);
				
				foward = new ActionForward();
	       	    foward.setRedirect(false);
	       	    foward.setPath("/WEB-INF/views/menu/buskerPage.jsp"); 
				/*PrintWriter out = response.getWriter();
		   	    request.setCharacterEncoding("UTF-8");
			    response.setContentType("text/html;charset=UTF-8");
				String myEmail =(String) request.getAttribute("myEmail");
				String fanEmail = (String) request.getAttribute("fanEmail");

				System.out.println("내 이메일은 " + myEmail + "이고 니 이메일은 " + fanEmail + "이다. 나도 팬카운트서비스다");
				MemberDao dao = new MemberDao();
				int fan = dao.getFanCount(myEmail, fanEmail);
				System.out.println("fan의 숫자가 무엇일까 궁금하지 않냐? fan 숫자는" + fan + "이고 난 팬카운트에서 구현된다.");
				
				out.print(fan);*/
				/*request.setAttribute("fan", fan);
       	       foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/buskerPage.jsp");  */    	       
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}