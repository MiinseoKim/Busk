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

import com.busk.dto.gallery;

public class GalleryDao {
	DataSource datasource = null;
	public GalleryDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}
	//마이 프로필에서 사용
	public int insert(String email, String file) throws SQLException{
		PreparedStatement pstmt = null;		
		Connection conn = null;
		int resultrow=0;
		
		try {
			String sql = "insert into gallery(gallery_no,gallery_email, gallery_file) values(seq_gallery.nextval,?,?) ";
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);			
			pstmt.setString(2, file);
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
	public ArrayList<gallery> getGallery(String email) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String realpath="\\upload";
		Connection conn = null;
		ArrayList<gallery> gallery=new ArrayList<gallery>();
		
		try {
			String sql = "select gallery_no, gallery_email, gallery_file from gallery where  gallery_email=?";
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);			
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				gallery dto=new gallery();
				dto.setGallery_no(rs.getInt(1));
				dto.setGallery_email(rs.getString(2));
				String path=realpath+rs.getString(3);
				dto.setGallery_file(path);
				gallery.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmt.close();
			conn.close();
		}

		return gallery;
		
	}
	public int delete(int no) throws SQLException{
		PreparedStatement pstmt = null;		
		Connection conn = null;
		int resultrow=0;		
		try {
			String sql = "delete from gallery where gallery_no=?";
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);	
			
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
	
	public int getGalleryno(String email,String file) throws SQLException {
		PreparedStatement pstmt = null;		
		Connection conn = null;
		ResultSet rs=null;
		int no=0;		
		try {
			String sql = "select gallery_no from gallery where gallery_email=? and gallery_file=?";
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, file);			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				no=rs.getInt("gallery_no");
			}
			
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();			
			conn.close();
		}

		return no;
	}
	
	public ArrayList<gallery> getGalleryList(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select gallery_file from gallery where gallery_email = ? ";
		ArrayList<gallery> gallerylist = new ArrayList<gallery>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				gallery dto = new gallery();
				dto.setGallery_file(rs.getString("gallery_file"));

				gallerylist.add(dto);

			}

		} catch (Exception e) {
			System.out.println("gallery :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return gallerylist;
	}
	
	
}
