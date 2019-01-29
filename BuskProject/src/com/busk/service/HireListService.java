package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.ApplyDao;
import com.busk.dao.BuskingDao;
import com.busk.dao.HireDao;
import com.busk.dto.apply;
import com.busk.dto.busking;
import com.busk.dto.hire;

public class HireListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String type = (String) session.getAttribute("type");
		System.out.println("세션에 저장된 이메일값 = " + email);
		try {// 일반회원일때
			HireDao dao = new HireDao();
			ApplyDao adao = new ApplyDao();
			BuskingDao bdao=new BuskingDao();
			// MemberDao memdao=new MemberDao();

			// 공고리스트
			ArrayList<hire> myhirelist = dao.getMyHireList(email);
			System.out.println("내가올린 공고 리스트 =" + myhirelist);
			request.setAttribute("myhirelist", myhirelist);

			// 지원리스트
			ArrayList<apply> myapplylist = dao.getMyApplyList(email);
			System.out.println("지원 리스트 =" + myapplylist);
			request.setAttribute("myapplylist", myapplylist);
			

			if (type.equals("2")) {
				ArrayList<apply> buskerapplylist = adao.getApplyList(email);
				System.out.println("내가 지원한 리스트 =" + buskerapplylist);
				request.setAttribute("buskerapplylist", buskerapplylist);
			}
			//확정된 공연 리스트
			ArrayList<busking> mybuskinglist = bdao.getMyBuskingList(email);
			System.out.println("지원 리스트 =" + mybuskinglist);
			request.setAttribute("mybuskinglist", mybuskinglist);
			
			
			foward = new ActionForward();
			foward.setRedirect(false);
			foward.setPath("/WEB-INF/views/menu/busking.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foward;
	}
}
