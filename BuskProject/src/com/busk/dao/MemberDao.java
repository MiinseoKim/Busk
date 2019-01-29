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
import com.busk.dto.member;

public class MemberDao {

	DataSource datasource = null;

	public MemberDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

	}

	// buskers 불러오기
	public ArrayList<member> getBuskersList() throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select email, name, location, picture, "
				+ "(select count(fan_email) from fan where fan_b_email = member.email) as \"fan_count\", "
				+ "(select count(gallery_file) from gallery where gallery_email=member.email) as \"gallery_count\"  "
				+ "from member where member_type_code=2";
		ArrayList<member> buskerslist = new ArrayList<member>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member dto = new member();
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));

				if (rs.getString("picture") != null) {
					dto.setPicture(rs.getString("picture"));
				} else {
					dto.setPicture("\\SeaTurtle1.jpg");
				}
				dto.setFan_count(rs.getString("fan_count"));
				dto.setGallery_count(rs.getString("gallery_count"));

				buskerslist.add(dto);

			}

		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return buskerslist;
	}

	public ArrayList<member> getBuskerSearchList(String name) throws SQLException {
		Connection conn = datasource.getConnection();
		System.out.println("다오 입력한 값 : " + name);
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select email, name, location, descript, picture, facebook, instagram, youtube, "
				+ "(select count(gallery_file) from gallery where gallery_email=member.email) \"gallery_count\", "
				+ "(select count(fan_b_email) from fan where fan_b_email =member.email) \"fan_count\" "
				+ " from member where name like ? and member_type_code=2";
		System.out.println(sql);
		ArrayList<member> buskerSearchlist = new ArrayList<member>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member dto = new member();
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setDescript(rs.getString("descript"));
				dto.setPicture(rs.getString("picture"));
				dto.setFacebook(rs.getString("facebook"));
				dto.setInstagram(rs.getString("instagram"));
				dto.setYoutube(rs.getString("youtube"));

				if (rs.getString("picture") != null) {
					dto.setPicture(rs.getString("picture"));
				} else {
					dto.setPicture("\\SeaTurtle1.jpg");
				}
				dto.setGallery_count(rs.getString("gallery_count"));
				dto.setFan_count(rs.getString("fan_count"));

				buskerSearchlist.add(dto);

			}
			System.out.println("다오 꺼내온 값 : " + buskerSearchlist);
		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}

		return buskerSearchlist;
	}

	public ArrayList<member> getBuskerPageList(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select email, name, location, descript, picture, facebook, instagram, youtube, "
				+ "(select count(gallery_file) from gallery where gallery_email=member.email) \"gallery_count\", "
				+ "(select count(fan_b_email) from fan where fan_b_email =member.email) \"fan_count\" "
				+ " from member where email = ?";
		ArrayList<member> buskerslist = new ArrayList<member>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member dto = new member();

				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setDescript(rs.getString("descript"));
				dto.setPicture(rs.getString("picture"));
				dto.setFacebook(rs.getString("facebook"));
				dto.setInstagram(rs.getString("instagram"));
				dto.setYoutube(rs.getString("youtube"));

				if (rs.getString("picture") != null) {
					dto.setPicture(rs.getString("picture"));
				} else {
					dto.setPicture("\\SeaTurtle1.jpg");
				}
				dto.setGallery_count(rs.getString("gallery_count"));
				dto.setFan_count(rs.getString("fan_count"));

				buskerslist.add(dto);

			}

		} catch (Exception e) {
			System.out.println("buskers :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

		return buskerslist;
	}

	// 마이 페이지-프로필
	// 회원정보 수정 위해 1명 회원정보 가져오기
	public ArrayList<member> getMemberByEmail(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String realpath = "\\upload";
		ArrayList<member> memberinfo = new ArrayList<member>();
		String sql = "select email,name,pwd,location,descript,picture,"
				+ "facebook,instagram,youtube from member where email=?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member m = new member();
				m.setEmail(rs.getString("email"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setLocation(rs.getString("location"));
				m.setDescript(rs.getString("descript"));
				String path = realpath + rs.getString("picture");
				m.setPicture(path);
				m.setFacebook(rs.getString("facebook"));
				m.setInstagram(rs.getString("instagram"));
				m.setYoutube(rs.getString("youtube"));
				memberinfo.add(m);
			}

		} catch (Exception e) {
			System.out.println("update :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}
		return memberinfo;
	}

	public int updateMember(String email, String name, String pwd, String descript, String location, String facebook,
			String instagram, String youtube,String picture) throws SQLException {
		int resultrow = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql="";
		if(!picture.equals("\\null")){
			 sql = "update member set name=?, pwd=?, location=?,descript=?, picture=?,facebook=?,instagram=?,youtube=?"
					+ " where email=?";
			 try {			
					conn = datasource.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, pwd);
					pstmt.setString(3, location);
					pstmt.setString(4, descript);
					pstmt.setString(5, picture);
					pstmt.setString(6, facebook);
					pstmt.setString(7, instagram);
					pstmt.setString(8, youtube);
					pstmt.setString(9, email);
					
					resultrow = pstmt.executeUpdate();
				} catch (Exception e) {
					System.out.println("Update :" + e.getMessage());
					e.printStackTrace();
				} finally {
					pstmt.close();
					conn.close();
				}
		}else {
			sql = "update member set name=?, pwd=?, location=?,descript=?, facebook=?,instagram=?,youtube=?"
					+ " where email=?";
			try {			
				conn = datasource.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, pwd);
				pstmt.setString(3, location);
				pstmt.setString(4, descript);
				pstmt.setString(5, facebook);
				pstmt.setString(6, instagram);
				pstmt.setString(7, youtube);
				pstmt.setString(8, email);
				
				resultrow = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("Update :" + e.getMessage());
				e.printStackTrace();
			} finally {
				pstmt.close();
				conn.close();
			}
		}		

		return resultrow;
	}

	// pw check
	public String UpdatePwdCheck(String email, String oldpwd) throws SQLException {
		String pwd = null;
		String pwdCheck = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {

			String sql = "select pwd from member where email=?";
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member m = new member();
				m.setPwd(rs.getString("pwd"));
				pwd = rs.getString("pwd");

				if (m.getPwd().equals(oldpwd)) {
					pwdCheck = "y";
				} else {
					pwdCheck = "n";
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

		return pwdCheck;
	}

	// 로그인 회원가입
	public int faninsert(String email, String pwd, String name) throws SQLException {
		Connection conn = datasource.getConnection();
		int resultrow = 0;
		PreparedStatement pstmt = null;
		try {
			String code = "3";
			String sql = "insert into member(email,pwd,name,member_type_code) values(?,?,?,?)";
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, code);
			resultrow = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			pstmt.close();
			conn.close();
		}

		return resultrow;
	}

	// 버스커 회원가입
	public int buskerinsert(String email, String pwd, String name, String video) throws SQLException {
		Connection conn = datasource.getConnection();
		int resultrow = 0;
		PreparedStatement pstmt = null;
		try {
			String code = "2";
			String sql = "insert into busker_auth(auth_email,auth_pwd,auth_name,auth_video,member_type_code) values(?,?,?,?,?)";
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, video);
			pstmt.setString(5, code);
			resultrow = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			pstmt.close();
			conn.close();
		}

		return resultrow;
	}

	// 이메일 중복체크
	public boolean confirmId(String email) throws SQLException {

		Connection conn = datasource.getConnection();
		boolean result = true;
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "select name from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return result;
	}

	// 버스커인증 테이블 이메일 중복체크
	public boolean confirmIdAuth(String email) throws SQLException {

		Connection conn = datasource.getConnection();
		boolean result = true;
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "select auth_name from busker_auth where auth_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return result;
	}

	// 로그인시 비밀번호 체크
	public ArrayList<member> login(String email, String pwd) throws SQLException {
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select email, pwd, member_type_code from member where email=?";
		ArrayList<member> loginlist = new ArrayList<member>();
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (!rs.getString("pwd").equals(pwd)) {
					System.out.println("입력값과 DB값이 다름");
				} else {
					member m = new member();
					m.setEmail(rs.getString("email"));
					m.setPwd(rs.getString("pwd"));
					m.setMember_type_code(rs.getString("member_type_code"));
					loginlist.add(m);
					System.out.println("로그인 성공");
				}
			}
		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return loginlist;
	}

	// 팬타입 체크
	public String codetype(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String code = "";
		String sql = "select member_type_code from member where email=?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member m = new member();
				m.setMember_type_code(rs.getString("member_type_code"));
				code = m.getMember_type_code();
				System.out.println("DAO에서 코드채킹" + code);
			}

		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return code;
	}

	// 회원 탈퇴
	public int leave(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from member where email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Insert :" + e.getMessage());
		} finally {
			pstmt.close();
			conn.close();
		}
		return result;
	}

	public ArrayList<member> getAllMemberList() throws SQLException {
		Connection conn = datasource.getConnection();
		// 연결 객체 얻기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String realpath = "\\upload";
		ArrayList<member> allmemberlist = new ArrayList<member>();
		String sql = "select email,pwd,name,location,descript,picture,"
				+ "member_type_code,facebook,instagram,youtube from member";
		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					member m = new member();
					m.setEmail(rs.getString("email"));
					m.setMember_type_code(rs.getString("member_type_code"));
					m.setPwd(rs.getString("pwd"));
					m.setName(rs.getString("name"));
					m.setLocation(rs.getString("location"));
					m.setDescript(rs.getString("descript"));
					String path = realpath + rs.getString("picture");
					m.setPicture(path);
					m.setFacebook(rs.getString("facebook"));
					m.setInstagram(rs.getString("instagram"));
					m.setYoutube(rs.getString("youtube"));
					allmemberlist.add(m);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("update :" + e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}
		return allmemberlist;
	}

	public boolean deleteMemberList(String email) throws SQLException {
		Connection conn = datasource.getConnection();
		PreparedStatement pstmt = null;
		System.out.println("delete Dao 에 들어온 파라미터 =" + email);
		System.out.println("delete Dao 들어옴");
		String sql = "delete from member where email=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
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

}
