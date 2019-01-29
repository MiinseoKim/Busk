package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.MemberDao;

public class LeaveService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ActionForward forward = null;
		String email = (String) session.getAttribute("email");
		System.out.println(email);
		try {
			PrintWriter out = response.getWriter();
			String pw = request.getParameter("password");
			MemberDao dao = new MemberDao();
			String chk = dao.UpdatePwdCheck(email, pw);		
			if (chk.equals("y")) {		
				int lv = dao.leave(email);
				session.invalidate();
				System.out.println(lv);
				if (lv > 0) {
					out.print("gb");
				} else {
					out.print("f");
				}
			} else {
				out.print("비밀번호가 일치하지 않습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}

}
