package com.busk.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BoardDao;
import com.busk.dao.MemberDao;
import com.busk.dto.member;

import net.sf.json.JSONArray;

public class ProfileModalService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		// 파라미터로 넘어온 이메일을 가져온다
		String email = request.getParameter("profile_email");
		System.out.println("서비스 email: " + email);
		ArrayList<member> memberinfo = null;
		MemberDao dao;
		try {
			dao = new MemberDao();
			System.out.println(email);
			memberinfo = dao.getMemberByEmail(email);
			System.out.println("서비스 memberinfo: " + memberinfo);
			JSONArray jsonArr = JSONArray.fromObject(memberinfo);
			PrintWriter out;
			out = response.getWriter();
			out.println(jsonArr);
			System.out.println("jsonArr: "+jsonArr);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
}
