package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class CommentDAO {

	private static CommentDAO instance;

	private CommentDAO() {

	}

	public static CommentDAO getInstance() {
		if (instance == null)
			instance = new CommentDAO();
		return instance;
	}

	public ArrayList<CommentDTO> getCommentList(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from comment where bnum=?";
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO comment = new CommentDTO();
				comment.setCNum(rs.getInt("cnum"));
				comment.setBNum(rs.getInt("bnum"));
				comment.setId(rs.getString("id"));
				comment.setName(rs.getString("name"));
				comment.setContent(rs.getString("content"));
				list.add(comment);
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getCommentList() 에러 : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}

	public void insertComment(CommentDTO comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "insert into comment values(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getCNum());
			pstmt.setString(2, comment.getId());
			pstmt.setString(3, comment.getName());
			pstmt.setString(4, comment.getContent());
			pstmt.setInt(5, comment.getBNum());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertComment() 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

	// 선택된 댓글 삭제하기
	public void deleteComment(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from comment where cnum=?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteComment() 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
}