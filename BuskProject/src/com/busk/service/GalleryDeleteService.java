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

public class GalleryDeleteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			String no= request.getParameter("gallery_no");
			int num=Integer.parseInt(no);
			System.out.println(no);
			
			GalleryDao dao = new GalleryDao();
			int result = dao.delete(num);
			PrintWriter out=response.getWriter();
			System.out.println(result);
			if (result > 0) {				
				out.print("y");				
			} else {				
				out.print("n");
			}			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
