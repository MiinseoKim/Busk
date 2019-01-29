package com.busk.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BuskingDao;
import com.busk.dao.MemberDao;
import com.busk.dto.member;

public class JoinService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		System.out.println("service창입니다");
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			MemberDao dao = new MemberDao();
			String usertype = request.getParameter("usertype");
			String usertype2 = request.getParameter("usertype2");

			if (usertype2==null) {
				String fanemail = request.getParameter("fanemail");
				String fanpwd = request.getParameter("fanpassword");
				String fanname = request.getParameter("fanuser");
				int fancheck = dao.faninsert(fanemail, fanpwd, fanname);
				System.out.println("서비스에서 팬채킹" + fancheck);
				String code = dao.codetype(fanemail);
				System.out.println("팬코드 채킹" + code);

				if (fancheck > 0) {
					System.out.println("팬가입 성공");					
					out.print("<script> alert('가입을 축하드립니다.'); </script>");
					foward = new ActionForward();
					foward.setRedirect(false);
					foward.setPath("/main.busk");
				} else {
					System.out.println("팬가입 실패");					
					out.print("<script> alert('가입에 실패했습니다.'); </script>");
					foward = new ActionForward();
					foward.setRedirect(true);
					foward.setPath("join.busk");
				}
			} else if (usertype==null) {
				String buskeremail = request.getParameter("email");
				String buskerpwd = request.getParameter("password");
				String buskername = request.getParameter("user");
				String buskervideo = request.getParameter("video");
				int buskercheck = dao.buskerinsert(buskeremail, buskerpwd, buskername, buskervideo);

				System.out.println("서비스에서 버스커채킹" + buskercheck);
				String code2 = dao.codetype(buskeremail);
				System.out.println("버스커코드 채킹" + code2);

				if (buskercheck > 0) {
					System.out.println("버스커 가입성공");
					out.print("<script>alert('가입을 축하드립니다.');</script>");
					foward = new ActionForward();
					foward.setRedirect(false);
					foward.setPath("/main.busk");
				} else {
					System.out.println(" 가입실패");
					out.print("<script>alert('가입에 실패했습니다.');</script>");
					foward = new ActionForward();
					foward.setRedirect(true);
					foward.setPath("join.busk");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foward;
	}
}
