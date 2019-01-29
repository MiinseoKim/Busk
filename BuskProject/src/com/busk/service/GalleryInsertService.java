package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.GalleryDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalleryInsertService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		String dir = request.getRealPath("/upload");
		System.out.println(dir);
		int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
	    String filename=""; 
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			MultipartRequest multi =null;
			multi = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());
			String picture=(String)multi.getFileNames().nextElement();
			filename="\\"+multi.getFilesystemName(picture);
			System.out.println(filename);
			
			GalleryDao dao = new GalleryDao();
			int result = dao.insert(email, filename);
			int no=dao.getGalleryno(email, filename);
			PrintWriter out=response.getWriter();
			System.out.println(no);
			if (result > 0) {				
				out.print(no+","+filename);				
			} else {				
				out.print("n");
			}			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
