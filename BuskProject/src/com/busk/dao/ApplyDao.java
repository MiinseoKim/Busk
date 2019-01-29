package com.busk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.busk.dto.apply;

public class ApplyDao {
	DataSource datasource = null;
	public java.sql.Timestamp ts;
	public ApplyDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
	}
	
	public int insertApply( String apply_email, String apply_comment, int hire_no) throws SQLException {
		int resultrow = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = "insert into apply values( seq_apply.nextval, ?, ? ,?)";
		try {			
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, apply_email);
			pstmt.setString(2, apply_comment);
			pstmt.setInt(3, hire_no);
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
	//내가 지원한
		public ArrayList<apply> getApplyList(String email) throws SQLException{
			Connection conn= datasource.getConnection();
			//연결 객체 얻기	
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			String sql ="select apply_no, apply_email, apply_comment,hire_no, (select name from member where email=apply_email) as name from apply where apply_email=?";	
			ArrayList<apply> applylist = new ArrayList<apply>();	
				try {
				pstmt = conn.prepareStatement(sql);		
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					apply a = new apply();
					a.setApply_no(rs.getInt(1));
					a.setApply_email(rs.getString(2));
					a.setApply_comment(rs.getString(3));
					a.setHire_no(rs.getInt(4));
					a.setName(rs.getString(5));
					applylist.add(a);
				}
			}catch(Exception e) {
				System.out.println("select :" + e.getMessage());
			}finally {
				rs.close();
				pstmt.close();
				conn.close(); //반환하기
			}
			return applylist;
		}
		public boolean deleteApplyList(int hire_no) throws SQLException{
			Connection conn = datasource.getConnection();
			PreparedStatement pstmt = null;
			System.out.println("delete Dao 에 들어온 파라미터 =" +  hire_no);
			System.out.println("delete Dao 들어옴");
			String sql = "delete from apply where hire_no=?";
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
}
