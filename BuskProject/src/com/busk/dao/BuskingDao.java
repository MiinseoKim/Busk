package com.busk.dao;

import java.sql.Connection;

import java.sql.Date;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.busk.dto.busking;

public class BuskingDao {
	//커넥션 풀 DB이용
	DataSource datasource = null;
	public java.sql.Timestamp ts;
	public BuskingDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
	}
	
	public ArrayList<busking> getBuskingList() throws SQLException{
		Connection conn= datasource.getConnection();
		//연결 객체 얻기	
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql = "select m.name, b.busking_loc, b.busking_date from member m, busking b where m.email=b.busking_a_email and b.busking_date>sysdate order by b.busking_date";					
		ArrayList<busking> buskinglist = new ArrayList<busking>();		
		SimpleDateFormat date = new SimpleDateFormat("yyyy년 M월 dd일" ,Locale.KOREA);
		SimpleDateFormat time = new SimpleDateFormat("a h:mm" ,Locale.KOREA);
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		try {
			pstmt = conn.prepareStatement(sql);		
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				busking b=new busking();				
				b.setName(rs.getString("name"));				
				ts=rs.getTimestamp(3);
				try {
					java.util.Date convert= temp.parse(ts.toString());
					b.setDate(date.format(convert));
					b.setTime(time.format(convert));
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
				b.setBusking_loc(rs.getString("busking_loc"));
				buskinglist.add(b);
			}
			
		}catch(Exception e) {
			System.out.println("select :" + e.getMessage());
		}finally {
			rs.close();
			pstmt.close();
			conn.close(); //반환하기
		}
		return buskinglist;
	}
	//08.25민지시작
	public int insertBuskingList(int busking_no, String busking_h_email, String busking_loc,int busking_num,int busking_aud_num,String busking_date,int busking_duration,int busking_budget,String busking_about,String busking_a_email) throws SQLException{
		Connection conn= datasource.getConnection();
		//연결 객체 얻기	
		PreparedStatement pstmt = null;
		String sql = "insert into busking values(?,?,?,?,?,?,?,?,?,?)";
		int resultrow = 0;
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		String dt=busking_date;
		java.sql.Timestamp sqlTDate =null;
        java.util.Date datet;
    	try {
			datet = temp.parse(dt);
			ts = new Timestamp(datet.getTime());
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}   
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, busking_no);
			pstmt.setString(2, busking_h_email);
			pstmt.setString(3, busking_loc);
			pstmt.setInt(4, busking_num);
			pstmt.setInt(5, busking_aud_num);
			pstmt.setTimestamp(6, sqlTDate);
			pstmt.setInt(7, busking_duration);
			pstmt.setInt(8, busking_budget);
			pstmt.setString(9, busking_about);
			pstmt.setString(10, busking_a_email);
			
			
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("select :" + e.getMessage());
		}finally {
			
			pstmt.close();
			conn.close(); //반환하기
		}
 
		return resultrow;
	}
	//민지끝
	public ArrayList<busking> getAllBuskingList(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		System.out.println("dao에서 받은 email = " + email);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select busking_no,busking_h_email,busking_loc,busking_num,busking_aud_num,busking_date,busking_duration,busking_budget,busking_about,busking_a_email,(select name from member where busking_h_email = email)as hname,(select name from member where busking_a_email = email)as aname from busking";
		System.out.println(sql);
		ArrayList<busking> allbuskinglist = new ArrayList<busking>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				busking dto = new busking();
				dto.setBusking_no(rs.getInt(1));
				dto.setBusking_h_email(rs.getString(2));
				dto.setBusking_loc(rs.getString(3));
				dto.setBusking_num(rs.getInt(4));
				dto.setBusking_aud_num(rs.getInt(5));
				dto.setBusking_date(rs.getDate(6));
				dto.setBusking_duration(rs.getInt(7));
				dto.setBusking_budget(rs.getInt(8));
				dto.setBusking_about(rs.getString(9));
				dto.setBusking_a_email(rs.getString(10));
				dto.setHname(rs.getString(11));
				dto.setAname(rs.getString(12));
				System.out.println("applydao에서 가져온 이름"+rs.getString(12));
				 allbuskinglist.add(dto);
			}
			System.out.println( allbuskinglist);
		} catch (Exception e) {
			System.out.println("allbuskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return  allbuskinglist;
	}
	
	
	public ArrayList<busking> getMyBuskingList(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		System.out.println("dao에서 받은 email = " + email);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select busking_no,busking_h_email,busking_loc,busking_num,busking_aud_num,busking_date,busking_duration,busking_budget,busking_about,busking_a_email,(select name from member where busking_h_email = email)as hname,(select name from member where busking_a_email = email)as aname from busking where busking_h_email=?";
		System.out.println(sql);
		ArrayList<busking> mybuskinglist = new ArrayList<busking>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				busking dto = new busking();
				dto.setBusking_no(rs.getInt(1));
				dto.setBusking_h_email(rs.getString(2));
				dto.setBusking_loc(rs.getString(3));
				dto.setBusking_num(rs.getInt(4));
				dto.setBusking_aud_num(rs.getInt(5));
				dto.setBusking_date(rs.getDate(6));
				dto.setBusking_duration(rs.getInt(7));
				dto.setBusking_budget(rs.getInt(8));
				dto.setBusking_about(rs.getString(9));
				dto.setBusking_a_email(rs.getString(10));
				dto.setHname(rs.getString(11));
				dto.setAname(rs.getString(12));
				System.out.println("applydao에서 가져온 이름"+rs.getString(12));
				 mybuskinglist.add(dto);
			}
			System.out.println( mybuskinglist);
		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return  mybuskinglist;
	}
	
public ArrayList<Map<String, Object>> getBuskingWang() throws SQLException {
		
		// 연결 객체 얻기
		Connection conn = datasource.getConnection();

		ArrayList<Map<String, Object>> buskingwang = new ArrayList<Map<String, Object>>();
		
		PreparedStatement pstmt = null;

		String sql = "SELECT busking.busking_a_email , busking.T_COUNT , member.EMAIL, member.NAME, "
				+ "member.LOCATION, member.DESCRIPT, member.PICTURE, "
				+ "member.FACEBOOK, member.INSTAGRAM, member.YOUTUBE "
				+ "FROM (SELECT busking_a_email, COUNT(*) AS T_COUNT  FROM busking GROUP BY busking_a_email "
				+ "ORDER BY COUNT(*) DESC ) busking JOIN MEMBER ON busking.busking_a_email = member.EMAIL WHERE ROWNUM=1";
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("email", rs.getString("email"));
				map.put("name", rs.getString("name"));
				map.put("location", rs.getString("location"));
				map.put("descript", rs.getString("descript"));
				map.put("picture", rs.getString("picture"));
				map.put("facebook", rs.getString("facebook"));
				map.put("instagram", rs.getString("instagram"));
				map.put("youtube", rs.getString("youtube"));
				map.put("count", rs.getString("t_count"));
				
				buskingwang.add(map);
				}
		
			rs.close();
			pstmt.close();
			conn.close(); 
			return buskingwang; // 반환하기
	
	}
}
