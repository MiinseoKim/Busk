package com.busk.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busk.action.Action;
import com.busk.action.ActionForward;
import com.busk.dao.ApplyDao;
import com.busk.dao.BuskingDao;
import com.busk.dao.HireDao;
public class BuskingApplyService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;	
		
		try {			
			System.out.println("buskingApplyService에 찍힌 busking_num값 ="+request.getParameter("busking_h_email"));
			String  busking_h_email=request.getParameter("busking_h_email");
			String busking_loc=request.getParameter("busking_loc");
			int busking_num=Integer.parseInt(request.getParameter("busking_num"));
			int busking_aud_num=Integer.parseInt(request.getParameter("busking_aud_num"));
			String busking_date=request.getParameter("busking_date");
			System.out.println(busking_date);
			int idx=request.getParameter("busking_duration").indexOf(" ");
			int busking_duration=Integer.parseInt(request.getParameter("busking_duration").substring(0, idx));
			System.out.println(busking_duration);
			int busking_budget=Integer.parseInt(request.getParameter("busking_budget"));
			String busking_about=request.getParameter("busking_about");
			String busking_a_email=request.getParameter("busking_a_email");
			int busking_no=Integer.parseInt(request.getParameter("busking_no"));
     	       
			BuskingDao dao = new BuskingDao();
			   int resultrow = dao.insertBuskingList(busking_no, busking_h_email, busking_loc, busking_num, busking_aud_num, busking_date, busking_duration, busking_budget, busking_about, busking_a_email);
			   
			  //08.27민지 
			   //승인하면, 버스커 지원목록에서 해당 공고에 지원한  데이터를 Apply테이블에서 삭제
			   ApplyDao adao  = new ApplyDao();
			   boolean adelete = adao.deleteApplyList(busking_no);
			   
			   //승인하면, 해당 공고를 Hire테이블에서 삭제
			   HireDao hdao = new HireDao();
			   boolean hdelete = hdao.deleteMyHireList(busking_no);
			   System.out.println("hire테이블 삭제에에에에에 공고 번호="+ busking_no + "삭제여부=" + hdelete);
			  
			   if(resultrow>0 &&hdelete==true&&adelete==true ) {
				   response.setContentType("text/html; charset=UTF-8"); 
       	    	   PrintWriter out = response.getWriter();
       	    	   out.print("apply");   
			   }
		}catch(Exception e) {
			e.printStackTrace();
		}

		return foward;
	}
	

}
