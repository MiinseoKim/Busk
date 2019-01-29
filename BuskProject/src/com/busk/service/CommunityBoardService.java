package com.busk.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BoardDao;
import com.busk.dao.MemberDao;
import com.busk.dto.board;
import com.busk.dto.member;

public class CommunityBoardService implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			   BoardDao bdao = new BoardDao();		
       	       ArrayList<Map<String, Object>> boardlist = bdao.getBoardList();
       	       request.setAttribute("boardlist", boardlist);
       	       forward = new ActionForward();
       	       forward.setRedirect(false);
       	       forward.setPath("/WEB-INF/views/menu/community.jsp");
       	  
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	
	
	}
}
