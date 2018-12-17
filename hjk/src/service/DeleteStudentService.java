package service;

import java.sql.Connection;


import java.sql.Connection;
import java.sql.SQLException;
import jdbc.JdbcUtil;
import jdbc.ConnectionProvider;

import student.StudentDao;
import student.Student;

public class DeleteStudentService {
private static DeleteStudentService instance = new DeleteStudentService();
	
	public static DeleteStudentService getInstance() {
		return instance;
	}

	private DeleteStudentService() {
	}
	
	public void deleteStudent(String studentId) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			StudentDao studentDao = StudentDao.getInstance();
			studentDao.delete(conn, studentId);

			conn.commit();
		} catch (SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 실패:" + ex.getMessage(), ex);
		}
		finally {
			JdbcUtil.close(conn);
		}
	}
}
