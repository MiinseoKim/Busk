package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;

import com.busk.dao.MemberDao;

import com.busk.dto.member;

public class AdminPageService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
	 
		System.out.println("세션에 저장된 이메일값 = " + email);
		try {
			  MemberDao mdao = new MemberDao();
          	   //모든 멤버 리스트 출력 
			   ArrayList<member> allmemberlist = mdao.getAllMemberList();
			   System.out.println("모든 멤버 리스트 =" + allmemberlist);
			   request.setAttribute("allmemberlist", allmemberlist); 
			  
			   foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/admin.jsp"); 
       	       }catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}
}
