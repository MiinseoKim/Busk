package com.busk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;

public class ProfilePwdCheckService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		ActionForward forward = null;
		String pwdCheck = null;
		String oldpwd = request.getParameter("oldpwd");

		try {

			MemberDao dao = new MemberDao();
			pwdCheck = dao.UpdatePwdCheck(email,oldpwd);
			request.setAttribute("pwdCheck", pwdCheck);

			PrintWriter out = response.getWriter();
			out.print(pwdCheck);

		} catch (Exception e) {
			System.out.println("ID 검증 오류 :" + e.getMessage());
		}

		return forward;
	}
}
