package com.busk.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BoardDao;

public class CommunityDetailService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		// 파라미터로 넘어온 글번호를 가져온다.
		String num = request.getParameter("num");
		System.out.println(num);
		int board_no = Integer.parseInt(num);
		String pageNum = request.getParameter("pageNum");
		BoardDao dao;
		try {
			dao = new BoardDao();
			
			ArrayList<Map<String, Object>> boarddetail;

			boarddetail = dao.getDetail(board_no);
			boolean result = dao.updateCount(board_no);

			request.setAttribute("boarddetail", boarddetail);
			request.setAttribute("pageNum", pageNum);
			if (result) {
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/menu/communityArticle.jsp");

				
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
