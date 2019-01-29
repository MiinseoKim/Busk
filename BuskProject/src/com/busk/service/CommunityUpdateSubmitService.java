package com.busk.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BoardDao;
import com.busk.dao.MemberDao;
import com.busk.dto.board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CommunityUpdateSubmitService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("업뎃섭밋서비스체크1");
	       
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String board_email = (String) session.getAttribute("email");
		
		int fileSize= 5*1024*1024;
		String uploadPath = request.getServletContext().getRealPath("/upload");
		System.out.println("업뎃섭밋서비스체크2");
	       
		BoardDao dao;
        MultipartRequest multi;
		try {
			System.out.println("업뎃섭밋서비스체크3");
			
		multi = new MultipartRequest
                    (request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());

		System.out.println("업뎃섭밋서비스체크4");
       
		//파라미터 값 가져오기
        int num = Integer.parseInt(multi.getParameter("board_no"));
        
        //파라미터 값 dto에 세팅
        board dto = new board();
        dto.setBoard_no(num);
        dto.setBoard_email(board_email);
        dto.setBoard_title(multi.getParameter("board_title"));
        dto.setBoard_content(multi.getParameter("board_content"));     
        dto.setBoard_file(multi.getParameter("board_file"));
        
        System.out.println("업뎃섭밋서비스체크5 dto: " + dto);
        dao = new BoardDao();
        boolean result = dao.boardUpdate(dto);
        
        System.out.println("업뎃섭밋서비스체크6 result: " + result);
   
        if(result) {
        	forward = new ActionForward();
     	    forward.setRedirect(false);
     	    forward.setPath("/community.busk");
        }
        
        } catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return forward;
	}
}
