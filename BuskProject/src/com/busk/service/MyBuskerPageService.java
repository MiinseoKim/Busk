package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.FannoteDao;
import com.busk.dao.GalleryDao;
import com.busk.dao.MemberDao;
import com.busk.dto.fannote;
import com.busk.dto.gallery;
import com.busk.dto.member;

public class MyBuskerPageService implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		try {
			   request.setCharacterEncoding("UTF-8");
		   	   response.setContentType("text/html;charset=UTF-8");
     	       MemberDao dao = new MemberDao();
     	       FannoteDao fandao = new FannoteDao();
     	       GalleryDao galdao = new GalleryDao();
     	       String email = (String)session.getAttribute("email");
			   ArrayList<member> buskerslist = dao.getBuskerPageList(email);
			   ArrayList<fannote> fannotelist = fandao.getFannoteList(email);
			   ArrayList<gallery> gallerylist = galdao.getGalleryList(email);
			   request.setAttribute("buskerslist", buskerslist);
			   request.setAttribute("fannotelist", fannotelist);
			   request.setAttribute("gallerylist", gallerylist);

       	       foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/buskerPage.jsp");    	       
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}