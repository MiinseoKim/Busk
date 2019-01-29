package com.busk.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;
import com.busk.dto.member;

public class LoginService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		try {
			String login_email = request.getParameter("email");
			String login_pwd = request.getParameter("pwd");
			MemberDao chkdao = new MemberDao();
			ArrayList<member> loginlist = chkdao.login(login_email, login_pwd);
			System.out.println(login_email+ login_pwd);
			System.out.println(loginlist);
			String type = chkdao.codetype(login_email);
			if (!loginlist.isEmpty()) {
				System.out.println("로그인성공");
				HttpSession session = request.getSession();
				session.setAttribute("email", login_email);
				session.setAttribute("type", type);
				System.out.println("세션 이메일값:" + login_email);
				System.out.println("세션 타입 코드:" + type);
				PrintWriter out = response.getWriter();
				out.print("Y");
			} else {
				System.out.println("로그인 실패");
				PrintWriter out = response.getWriter();
				out.print("N");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return foward;
	}

}
