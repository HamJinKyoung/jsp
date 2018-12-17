package student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import student.StudentDao;
import jdbc.JdbcUtil;
import student.Student;

public class StudentDao {
	private static StudentDao studentDao = new StudentDao();
	public static StudentDao getInstance() {
		return studentDao;
	}
	
	private StudentDao() {}
	
	public int insert(Connection conn, Student student) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into student" + 
					"(id, name, department, phone, address) values (?, ?, ?, ?, ?)");
			pstmt.setString(1, student.getId());
			pstmt.setString(2, student.getName());
			pstmt.setString(3, student.getDepartment());
			pstmt.setString(4, student.getPhone());
			pstmt.setString(5, student.getAddress());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public Student select(Connection conn, String studentId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from student where id = ?");
			pstmt.setString(1, studentId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makestudentFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Student makestudentFromResultSet(ResultSet rs) throws SQLException {
		Student student = new Student();
		student.setId(rs.getString("id"));
		student.setName(rs.getString("name"));
		student.setDepartment(rs.getString("department"));
		student.setPhone(rs.getString("phone"));
		student.setAddress(rs.getString("address"));
		return student;
	}
	public int selectCountByName(Connection conn,String name) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql="select count(*) from student where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from student");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Student> selectList(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from student " + 
					"order by id desc limit ?, ?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<Student> studentList = new ArrayList<Student>();
				do {
					studentList.add(makestudentFromResultSet(rs));
				} while (rs.next());
				return studentList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, String studentId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"delete from student where id = ?");
			pstmt.setString(1, studentId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<Student> selectByname(Connection conn,int firstRow, int endRow, String name) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from student where name = ? order by id desc limit ?, ?");
			pstmt.setString(1, name);
			pstmt.setInt(2, firstRow - 1);
			pstmt.setInt(3, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<Student> studentlist = new ArrayList<Student>();
				do {
					studentlist.add(makestudentFromResultSet(rs));
				}while(rs.next());
				return studentlist;
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	public int Change(Connection conn, Student student) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"UPDATE student SET " + 
					"name = ?, department = ?, phone = ?, address = ? WHERE id = ?");
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getDepartment());
			pstmt.setString(3, student.getPhone());
			pstmt.setString(4, student.getAddress());
			pstmt.setString(5, student.getId());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

}
