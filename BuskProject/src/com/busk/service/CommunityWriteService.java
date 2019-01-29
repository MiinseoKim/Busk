package com.busk.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BoardDao;
import com.busk.dto.board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class CommunityWriteService implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String board_email = (String) session.getAttribute("email");
		
		int fileSize= 5*1024*1024;
		String uploadPath = request.getServletContext().getRealPath("/upload");

		try {
			// 파일업로드 
            MultipartRequest multi = new MultipartRequest
                    (request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
 
            // 파일이름 가져오기
            String fileName = "";
            Enumeration<String> names = multi.getFileNames();
            if(names.hasMoreElements())
            {
                String name = names.nextElement();
                fileName = multi.getFilesystemName(name);
            }

        BoardDao dao = BoardDao.getInstance();
        board dto = new board();
        
        dto.setBoard_no(dao.getSeq());
        dto.setBoard_email(board_email);
        dto.setBoard_title(multi.getParameter("board_title"));
        dto.setBoard_content(multi.getParameter("board_content"));
        dto.setBoard_file(multi.getParameter("board_file"));
			
        boolean result = dao.boardInsert(dto);
        
        if(result) {
        	forward = new ActionForward();
     	    forward.setRedirect(false);
     	    forward.setPath("/community.busk");
        }
        
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("글 작성 오류: " + e.getMessage());
		}
		return forward;
	}
}	
		
		
		
		



