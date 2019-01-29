package com.busk.dao;

import java.lang.reflect.Array;
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

import com.busk.dto.board;
import com.busk.dto.member;

public class BoardDao {

	private static BoardDao instance;

	// 커넥션 풀 DB이용
	DataSource datasource = null;

	public BoardDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

	}

	public static BoardDao getInstance() throws NamingException {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}

	// 시퀀스 가져오기
	public int getSeq() throws SQLException {
		int result = 1;

		Connection conn = datasource.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {

			// 시퀀스 값을 가져온다. (DUAL: 시퀀스 값을 가져오기 위한 임시 테이블)
			StringBuffer sql = new StringBuffer();
			sql.append("select seq_board.nextval from dual");

			pstmt = conn.prepareStatement(sql.toString());

			// 쿼리 실행
			rs = pstmt.executeQuery();

			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			rs.close();
			pstmt.close();
			conn.close(); // 반환하기
		}
		return result;
	}
	// END getSeq

	// READ: 게시판 글 전부 가져오기
	public ArrayList<Map<String, Object>> getBoardList() throws SQLException {
		// 연결 객체 얻기
		Connection conn = datasource.getConnection();

		ArrayList<Map<String, Object>> boardlist = new ArrayList<Map<String, Object>>();

		PreparedStatement pstmt = null;
		String sql = "select b.board_email, b.board_no, b.board_title ,b.board_content, b.board_pageview, b.board_regdate, b.board_file,"
				+ "m.name from board b, member m where m.email=b.board_email";

		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_email", rs.getString("board_email"));
			map.put("board_no", rs.getInt("board_no"));
			map.put("board_title", rs.getString("board_title"));
			map.put("board_content", rs.getString("board_content"));
			map.put("board_pageview", rs.getInt("board_pageview"));
			map.put("board_regdate", rs.getString("board_regdate"));
			map.put("board_file", rs.getString("board_file"));
			map.put("name", rs.getString("name"));

			boardlist.add(map);
		}

		rs.close();
		pstmt.close();
		conn.close(); // 반환하기
		return boardlist;

	}

	// 게시글 등록하기

	public boolean boardInsert(board board) throws SQLException {

		boolean result = false;
		PreparedStatement pstmt = null;
		Connection conn = null;

		try {
			conn = datasource.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("insert into board ");
			sql.append("(board_no, board_email, board_title, board_content, ");
			sql.append("board_pageview, board_regdate, board_file) ");
			sql.append(" values(?,?,?,?,?,sysdate,?)");

			int num = board.getBoard_no();

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoard_email());
			pstmt.setString(3, board.getBoard_title());
			pstmt.setString(4, board.getBoard_content());
			pstmt.setInt(5, 0);
			pstmt.setString(6, board.getBoard_file());

			int flag = pstmt.executeUpdate();

			if (flag > 0) {
				result = true;
				conn.commit();
			}

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			pstmt.close();
			conn.close();
		}
		return result;
	}
	// END boardInsert();

	// 게시글 클릭시 게시글 보기
	public ArrayList<Map<String, Object>> getDetail(int board_no) throws SQLException {
		
		ArrayList<Map<String, Object>> boarddetail = new ArrayList<Map<String, Object>>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;

		try {
			conn = datasource.getConnection();
			StringBuffer sql = new StringBuffer();

			sql.append(
					"select b.board_email, b.board_no, b.board_title ,b.board_content, b.board_pageview, b.board_regdate, b.board_file,"
							+ "m.name from board b inner join member m on m.email=b.board_email where b.board_no=?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("board_email", rs.getString("board_email"));
				map.put("board_no", rs.getInt("board_no"));
				map.put("board_title", rs.getString("board_title"));
				map.put("board_content", rs.getString("board_content"));
				map.put("board_pageview", rs.getInt("board_pageview"));
				map.put("board_regdate", rs.getString("board_regdate"));
				map.put("board_file", rs.getString("board_file"));
				map.put("name", rs.getString("name"));
				boarddetail.add(map);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			pstmt.close();
			conn.close();
			rs.close();
		}

		return boarddetail;
	}

	// END getDetail();

	// 조회수 증가
	public boolean updateCount(int board_no) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connection conn = null;

		try {
			conn = datasource.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update board set board_pageview = board_pageview+1");
			sql.append("where board_no=?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board_no);
			
			int flag = pstmt.executeUpdate();
			if(flag > 0) {
				result = true;
				conn.commit(); //완료시 커밋
			}
		} catch(Exception e) {
			try {
				conn.rollback(); //오류시 롤백
			} catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		}
		pstmt.close();
		conn.close();
		return result;
	} //END updateCount();
	
	public boolean boardUpdate(board board) throws SQLException {

		boolean result = false;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			
			System.out.println("다오체크1");
			conn = datasource.getConnection();
			
			String sql = "update board set board_title=?, board_content=?, "
					+ "board_regdate=sysdate,board_file=? where board_no=?";
			
			System.out.println("sql문: " +sql);
			
			String email = board.getBoard_email();
			System.out.println("다오체크2 board: " + board );
			int num = board.getBoard_no();
		
			
			pstmt = conn.prepareStatement(sql);
			
		
			pstmt.setString(1, board.getBoard_title());
			pstmt.setString(2, board.getBoard_content());
			
			pstmt.setString(3, board.getBoard_file());
			pstmt.setInt(4,num);

			System.out.println("글번호 : " + num);
			int flag = pstmt.executeUpdate();

			if (flag > 0) {
				result = true;
				conn.commit();
			}

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			pstmt.close();
			conn.close();
		}
		return result;
	}
	
	
	
	public boolean boardDelete(int board_no) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connection conn = null;

		try {
			conn = datasource.getConnection();
			conn.setAutoCommit(false);	//자동 커밋을 false로 한다
			
			StringBuffer sql = new StringBuffer();
			sql.append("delete from board where board_no=?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board_no);
			
			int flag = pstmt.executeUpdate();
			if(flag > 0) {
				result = true;
				conn.commit(); //완료시 커밋
			}
		} catch(Exception e) {
			try {
				conn.rollback(); //오류시 롤백
			} catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		}
		pstmt.close();
		conn.close();
		return result;
	} //END updateCount();
	
}