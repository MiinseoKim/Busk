package com.busk.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;

public class EmailjbService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			MemberDao dao = new MemberDao();
			String usertype = request.getParameter("usertype");
			String usertype2 = request.getParameter("usertype2");
			System.out.println(usertype + usertype2);
			// 이메일 중복확인
			if (usertype2 == null) {
				String fanemailconfirm = request.getParameter("fanemailconfirm");
				System.out.println("ajax" + fanemailconfirm);
				boolean fanemailjb = dao.confirmId(fanemailconfirm);
				System.out.println(fanemailjb);

				if (fanemailjb == false) {
					System.out.println("이메일 존재  !!!");
					PrintWriter out = response.getWriter();
					out.print("N");
				} else {
					System.out.println("이메일 인증 !!!!!!!!!!!!!");
					PrintWriter out = response.getWriter();
					out.print("Y");
				}
			} else if (usertype == null) { // 버스커 인증
				System.out.println("버스커인증");
				String buskeremailconfirm = request.getParameter("buskeremailconfirm");
				System.out.println(buskeremailconfirm);
				boolean buskeremailjb = dao.confirmId(buskeremailconfirm);
				boolean buskeremailjb2 = dao.confirmIdAuth(buskeremailconfirm);
				System.out.println("ajax" + buskeremailconfirm);
				
				if (buskeremailjb == false || buskeremailjb2 == false) {
					System.out.println("이메일 존재 !!!");
					PrintWriter out = response.getWriter();
					out.print("N");
				} else  {
					System.out.println("이메일 인증 !!!!!!!!!!!!!");
					PrintWriter out = response.getWriter();
					out.print("Y");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NamingException e) {

			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
