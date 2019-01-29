package com.busk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.busk.dto.fan;
import com.busk.dto.member;

public class FanDao {
	DataSource datasource = null;

	public FanDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	// 08.26민지시작
	public ArrayList<fan> getFanList() throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<fan> fanlist = new ArrayList<fan>();
		String sql = ("select fan_no, fan_email, fan_b_email,(select name from member where email=fan_b_email)as bname,(select name from member where email=fan_email)as fname from fan");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					fan f = new fan();
					f.setFan_no(rs.getInt(1));
					f.setFan_email(rs.getString(2));
					f.setFan_b_email(rs.getString(3));
					f.setBname(rs.getString(4));
					f.setFname(rs.getString(5));
					fanlist.add(f);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}
		return fanlist;
	}

	public boolean deleteFanList(int fan_no) throws SQLException {
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		System.out.println("delete Dao 에 들어온 파라미터 =" + fan_no);
		System.out.println("delete Dao 들어옴");
		String sql = "delete from fan where fan_no=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fan_no);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;
			return true;
		} catch (Exception ex) {
			System.out.println("fansDelete :" + ex.getMessage());
		} finally {
			pstmt.close();
			conn.close(); // 반환하기
		}
		return false;
	}

	// 08.26민지끝
	public ArrayList<fan> getMyBuskerList(String fan_email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<fan> fanlist = new ArrayList<fan>();
		String sql = "select fan_no, fan_email, fan_b_email,(select name from member where email=fan_b_email)as bname,(select name from member where email=fan_email)as fname, (select picture from member where email = fan_b_email) from fan where fan_email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fan_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					fan f = new fan();
					f.setFan_no(rs.getInt(1));
					f.setFan_email(rs.getString(2));
					f.setFan_b_email(rs.getString(3));
					f.setBname(rs.getString(4));
					f.setFname(rs.getString(5));
					f.setPicture(rs.getString(6));
					fanlist.add(f);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}
		return fanlist;
	}

	public ArrayList<fan> getMyFanList(String busker_email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<fan> buskerlist = new ArrayList<fan>();
		String sql = "select fan_no, fan_email, fan_b_email,(select name from member where email=fan_b_email)as bname,(select name from member where email=fan_email)as fname, (select picture from member where email = fan_email) from fan where fan_b_email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, busker_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					fan f = new fan();
					f.setFan_no(rs.getInt(1));
					f.setFan_email(rs.getString(2));
					f.setFan_b_email(rs.getString(3));
					f.setBname(rs.getString(4));
					f.setFname(rs.getString(5));
					f.setPicture(rs.getString(6));
					buskerlist.add(f);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}
		return buskerlist;
	}

	@SuppressWarnings("resource")
	public int getFanCount(String myEmail, String fanEmail) throws SQLException {
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int fanCount = 0;
		String sql1 = "insert into fan values (seq_fan.nextval,?,?)";
		String sql2 = "select fan_email, fan_b_email from fan where fan_b_email = ? and fan_email = ?";
		String sql3 = "delete from fan where fan_email=? and fan_b_email=?";
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, fanEmail);
			pstmt.setString(2, myEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, myEmail);
				pstmt.setString(2, fanEmail);
				fanCount = pstmt.executeUpdate();
				fanCount = 0;
			} else {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, myEmail);
				pstmt.setString(2, fanEmail);
				fanCount = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("FanCount : " + e.getMessage());
		} finally {
			pstmt.close();
			conn.close();
		}
		return fanCount;
	}

	public ArrayList<Map<String, Object>> getIngiWang() throws SQLException {

		// 연결 객체 얻기
		Connection conn = datasource.getConnection();

		ArrayList<Map<String, Object>> ingiwang = new ArrayList<Map<String, Object>>();

		PreparedStatement pstmt = null;

		String sql = "SELECT FAN.fan_b_email , FAN.T_COUNT , MEMBER.EMAIL, MEMBER.NAME, MEMBER.LOCATION, MEMBER.DESCRIPT, MEMBER.PICTURE, "
				+ "MEMBER.FACEBOOK, MEMBER.INSTAGRAM, MEMBER.YOUTUBE "
				+ "FROM (SELECT fan_b_email, COUNT(*) AS T_COUNT  FROM fan GROUP BY fan_b_email "
				+ "ORDER BY COUNT(*) DESC ) FAN JOIN MEMBER ON FAN.fan_b_email = MEMBER.EMAIL WHERE ROWNUM=1";

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

			ingiwang.add(map);
		}

		rs.close();
		pstmt.close();
		conn.close();
		return ingiwang; // 반환하기

	}
}
