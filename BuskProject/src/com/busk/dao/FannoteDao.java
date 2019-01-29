package com.busk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.busk.dto.fannote;
import com.busk.dto.member;

public class FannoteDao {
	DataSource datasource = null;
	
	public FannoteDao()  throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

	}
	
	public int fannoteInsert(String fannote_b_email, String fannote_email, String content) throws SQLException {
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into fannote values(seq_fannote.nextval, ?, ?, ?, sysdate)";
		int insertLow = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fannote_b_email);
			pstmt.setString(2, fannote_email);
			pstmt.setString(3, content);
			insertLow = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertLow;
		
	}
	
	public int fannoteDelete(int fannote_no, String login_email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기

		PreparedStatement pstmt = null;

		String sql = "delete from fannote where fannote_no = ?";
		String sql1 = "select fannote_email from fannote where fannote_no = ?";
		int insertLow = 0;
		ResultSet rs;
		
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, fannote_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String inputEmail = rs.getString("fannote_email");
				if (inputEmail.equals(login_email)) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, fannote_no);
					
					insertLow = pstmt.executeUpdate();
				} else {
					insertLow = 3;
				}
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertLow;
		
	}
	
	public ArrayList<fannote> getFannoteList(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select fannote_email, (select name from member where member.email=fannote.fannote_email) as \"fannote_name\", "
				+ " fannote_content, fannote_regdate, fannote_no from fannote where fannote_b_email = ? "
				+ "order by fannote_no desc, fannote_regdate desc";
		ArrayList<fannote> fannotelist = new ArrayList<fannote>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				fannote dto = new fannote();
				dto.setFannote_email(rs.getString("fannote_email"));
				dto.setFannote_name(rs.getString("fannote_name"));
				dto.setFannote_content(rs.getString("fannote_content"));
				dto.setFannote_regdate(rs.getDate("fannote_regdate"));
				dto.setFannote_no(rs.getInt("fannote_no"));

				fannotelist.add(dto);

			}

		} catch (Exception e) {
			System.out.println("fannote :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return fannotelist;
	}
}
