package addressbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import addressbook.model.Member;
import jdbc.jdbcUtil;
import addressbook.dao.MemberDao;

public class MemberDao {
	private static MemberDao MemberDao = new MemberDao();
	public static MemberDao getInstance() {
		return MemberDao;
	}
	
	private MemberDao() {}
	
	public int insert(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into member" + 
					"(id, name, tel, regdate) values (?, ?, ?, ?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getTel());
			pstmt.setTimestamp(4, member.getRegdate());
			return pstmt.executeUpdate();
		} finally {
			jdbcUtil.close(pstmt);
		}
	}
	
	public Member select(Connection conn, String memberId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from member where id = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makememberFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
	}

	private Member makememberFromResultSet(ResultSet rs) throws SQLException {
		Member member = new Member();
		member.setId(rs.getString("id"));
		member.setName(rs.getString("name"));
		member.setTel(rs.getString("tel"));
		member.setRegdate(rs.getTimestamp("regdate"));
		return member;
	}
	public int selectCountByName(Connection conn,String name) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql="select count(*) from member where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from member");
			rs.next();
			return rs.getInt(1);
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
	}

	public List<Member> selectList(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from member " + 
					"order by id desc limit ?, ?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<Member> memberList = new ArrayList<Member>();
				do {
					memberList.add(makememberFromResultSet(rs));
				} while (rs.next());
				return memberList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, String memberId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"delete from member where id = ?");
			pstmt.setString(1, memberId);
			return pstmt.executeUpdate();
		} finally {
			jdbcUtil.close(pstmt);
		}
	}
	
	public List<Member> selectByname(Connection conn,int firstRow, int endRow, String name) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from member where name = ? order by id desc limit ?, ?");
			pstmt.setString(1, name);
			pstmt.setInt(2, firstRow - 1);
			pstmt.setInt(3, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<Member> memberlist = new ArrayList<Member>();
				do {
					memberlist.add(makememberFromResultSet(rs));
				}while(rs.next());
				return memberlist;
			} else {
				return null;
			}
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		
	}
	
	public int Change(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"UPDATE member SET " + 
					"name = ?, tel = ? WHERE id = ?");
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getTel());
			pstmt.setString(3, member.getId());
			return pstmt.executeUpdate();
		} finally {
			jdbcUtil.close(pstmt);
		}
	}

}
