package com.busk.service;

import java.sql.SQLException;
import java.util.Enumeration;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BoardDao;
import com.busk.dto.board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class CommunityDeleteService implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String board_email = (String) session.getAttribute("email");
		
		String num = request.getParameter("num");
		int board_no = Integer.parseInt(num);
		
		BoardDao dao;
		boolean result;
		
		try {
			
		dao = new BoardDao();
			
		result = dao.boardDelete(board_no);
			
			if(result) {
	        	forward = new ActionForward();
	     	    forward.setRedirect(false);
	     	    forward.setPath("/community.busk");
	        }else {
				return null;
	        }
				
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return forward;
	}
}
		