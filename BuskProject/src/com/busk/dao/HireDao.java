package com.busk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;
import java.sql.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.busk.dto.apply;
import com.busk.dto.hire;
import com.busk.dto.member;

public class HireDao {

	DataSource datasource = null;
	public java.sql.Timestamp ts;

	public HireDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	// email,location,buskernum,audnum,date,time,duration,cost,about
	public int insertHire(String email, String location, String buskernum, String buskertype, String audnum,
			String date, String time, String duration, String budget, String about) throws SQLException {
		int audnum1 = Integer.parseInt(audnum);
		int buskernum1 = Integer.parseInt(buskernum);
		int budget1 = Integer.parseInt(budget);
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dt = date + " " + time + ":00";
		java.sql.Timestamp sqlTDate = null;
		java.util.Date datet;
		try {
			datet = temp.parse(dt);
			sqlTDate = new Timestamp(datet.getTime());
		} catch (ParseException e1) {

			e1.printStackTrace();
		}

		int resultrow = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = "insert into hire values(seq_hire.nextval, ?,sysdate, ?, ?, ?, ?, ?, ?, ? ,?)";
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, location);
			pstmt.setInt(3, buskernum1);
			pstmt.setString(4, buskertype);
			pstmt.setInt(5, audnum1);
			pstmt.setTimestamp(6, sqlTDate);
			pstmt.setString(7, duration);
			pstmt.setInt(8, budget1);
			pstmt.setString(9, about);
			resultrow = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmt.close();
			conn.close();
		}

		return resultrow;
	}

	/*public ArrayList<hire> getHireList() throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select hire_date, hire_duration, hire_budget, hire_about, hire_no from hire where hire_date>sysdate order by hire_date";
		ArrayList<hire> hirelist = new ArrayList<hire>();
		SimpleDateFormat date = new SimpleDateFormat("yyyy년 M월 dd일", Locale.KOREA);
		SimpleDateFormat time = new SimpleDateFormat("a h:mm", Locale.KOREA);
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				hire dto = new hire();
				ts = rs.getTimestamp(1);
				try {
					java.util.Date convert = temp.parse(ts.toString());
					dto.setDate(date.format(convert));
					dto.setTime(time.format(convert));
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
				dto.setHire_duration(rs.getString(2));
				dto.setHire_budget(rs.getInt(3));
				dto.setHire_about(rs.getString(4));
				dto.setHire_no(rs.getInt(5));

				hirelist.add(dto);

			}

		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return hirelist;
	}*/

	public ArrayList<hire> getAllHireList() throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =  "select h.hire_regdate,h.hire_date, h.hire_duration,h.hire_email,h.hire_loc,h.hire_num,h.hire_type,h.hire_aud_num,h.hire_budget, h.hire_about, h.hire_no, m.name from hire h,member m where h.hire_email=m.email order by hire_date";
		ArrayList<hire> allhirelist = new ArrayList<hire>();
		SimpleDateFormat date = new SimpleDateFormat("yyyy년 M월 dd일", Locale.KOREA);
		SimpleDateFormat time = new SimpleDateFormat("a h:mm", Locale.KOREA);
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				hire dto = new hire();
				ts = rs.getTimestamp(2);
				try {
					java.util.Date convert = temp.parse(ts.toString());
					dto.setDate(date.format(convert)); // 공연날짜
					dto.setTime(time.format(convert));
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
				dto.setHire_regdate(rs.getDate(1));
				dto.setHire_date(rs.getDate(2));
				dto.setHire_duration(rs.getString(3));
				dto.setHire_email(rs.getString(4));
				dto.setHire_loc(rs.getString(5));
				dto.setHire_num(rs.getInt(6));
				dto.setHire_type(rs.getString(7));
				dto.setHire_aud_num(rs.getInt(8));
				dto.setHire_budget(rs.getInt(9));
				dto.setHire_about(rs.getString(10));
				dto.setHire_no(rs.getInt(11));
				dto.setName(rs.getString(12));
				allhirelist.add(dto);
			}
		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}
		return allhirelist;
	}

	public ArrayList<hire> getMyHireList(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		System.out.println("dao에서 받은 email = " + email);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select h.hire_regdate,h.hire_date, h.hire_duration,h.hire_email,h.hire_loc,h.hire_num,h.hire_type,h.hire_aud_num,h.hire_budget, h.hire_about, h.hire_no, m.name"
				+ " from hire h join member m on h.hire_email=m.email where h.hire_email=? order by hire_date";
		System.out.println(sql);
		ArrayList<hire> myhirelist = new ArrayList<hire>();
		SimpleDateFormat date = new SimpleDateFormat("yyyy년 M월 dd일", Locale.KOREA);
		SimpleDateFormat time = new SimpleDateFormat("a h:mm", Locale.KOREA);
		SimpleDateFormat temp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();						
			while (rs.next()) {
				hire dto = new hire();
				ts = rs.getTimestamp(2);
				temp.format(ts);
				java.util.Date convert = temp.parse(ts.toString());
				dto.setDate(date.format(convert)); // 공연날짜
				dto.setTime(time.format(convert));
				dto.setHire_regdate(rs.getDate(1));
				dto.setHire_date(rs.getDate(2));
				dto.setHire_duration(rs.getString(3));
				dto.setHire_email(rs.getString(4));
				dto.setHire_loc(rs.getString(5));
				dto.setHire_num(rs.getInt(6));
				dto.setHire_type(rs.getString(7));
				dto.setHire_aud_num(rs.getInt(8));
				dto.setHire_budget(rs.getInt(9));
				dto.setHire_about(rs.getString(10));
				dto.setHire_no(rs.getInt(11));
				dto.setName(rs.getString(12));
				myhirelist.add(dto);
			}
			System.out.println(myhirelist);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return myhirelist;
	}
	public boolean deleteMyHireList(int hire_no) throws SQLException{
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		System.out.println("delete Dao 에 들어온 파라미터 =" +  hire_no);
		System.out.println("delete Dao 들어옴");
		String sql = "delete from hire where hire_no=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hire_no);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;
			return true;
		} catch (Exception ex) {
			System.out.println("buskersDelete :" + ex.getMessage());
		} finally {
			pstmt.close();
			conn.close(); // 반환하기
		}
		return false;
	}
	
	public ArrayList<apply> getMyApplyList(String email) throws SQLException{
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		System.out.println("APPLYdao에서 받은 email = "+email);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select apply_no, apply_email,apply_comment,hire_no, (select name from member where apply_email = email) as aname from apply where hire_no in(select hire_no from hire where hire_email=?)";
		System.out.println(sql);
		ArrayList<apply> myapplylist = new ArrayList<apply>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				do{
				System.out.print("while문 들어옴");
				apply dto = new apply();

				dto.setApply_no(rs.getInt(1));
				dto.setApply_email(rs.getString(2));
				dto.setApply_comment(rs.getString(3));
				dto.setHire_no(rs.getInt(4));
				dto.setAname(rs.getString(5));
				myapplylist.add(dto);
				System.out.println("dao에서 가져온 구인공고 my 리스트=" + myapplylist);
			}while(rs.next());
			}else {
				return null;
			}

		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return myapplylist;
	}
	public ArrayList<apply> getAllApplyList() throws SQLException{
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.apply_no, a.apply_email,a.apply_comment,a.hire_no , m.name from apply a , member m where a.apply_email = m.email";
		System.out.println(sql);
		ArrayList<apply> allapplylist = new ArrayList<apply>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				do{
				System.out.print("while문 들어옴");
				apply dto = new apply();

				dto.setApply_no(rs.getInt(1));
				dto.setApply_email(rs.getString(2));
				dto.setApply_comment(rs.getString(3));
				dto.setHire_no(rs.getInt(4));
				dto.setName(rs.getString(5));
				allapplylist.add(dto);
				System.out.println("dao에서 가져온 구인공고 my 리스트=" + allapplylist);
			}while(rs.next());
			}else {
				return null;
			}

		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return allapplylist;
	}

}
