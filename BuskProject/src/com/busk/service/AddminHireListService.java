package com.busk.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.BuskingDao;
import com.busk.dao.HireDao;
import com.busk.dto.apply;
import com.busk.dto.busking;
import com.busk.dto.hire;

public class AddminHireListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
	 
		System.out.println("세션에 저장된 이메일값 = " + email);
		try {
			   HireDao dao = new HireDao();
			  BuskingDao bdao = new BuskingDao();
          	    //공고리스트
			   ArrayList<hire> allhirelist = dao.getAllHireList();
			   System.out.println("모든 공고 리스트 =" + allhirelist);
			   request.setAttribute("allhirelist", allhirelist); 
			   
			   //지원리스트
			   ArrayList<apply> allapplylist = dao.getAllApplyList();
			   System.out.println("모든지원 리스트 =" + allapplylist);
			   request.setAttribute("allapplylist", allapplylist);
			   
			   //08.27민지시작
				//확정된 공연 리스트
				ArrayList<busking> allbuskinglist = bdao.getAllBuskingList(email);
				System.out.println("지원 리스트 =" + allbuskinglist);
				request.setAttribute("allbuskinglist", allbuskinglist);
			   
			   foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/WEB-INF/views/menu/addminbusking.jsp"); 
       	       }catch(Exception e) {
			e.printStackTrace();
		}
		return foward;
	}

}
