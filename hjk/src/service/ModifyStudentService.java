package service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import student.Student;
import student.StudentDao;
import service.ServiceException;

public class ModifyStudentService {
	private static ModifyStudentService instance = new ModifyStudentService();

	public static ModifyStudentService getInstance() {
		return instance;
	}

	private ModifyStudentService() {
	}

	public void Change(Student student) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			StudentDao studentDao = StudentDao.getInstance();
			studentDao.Change(conn, student);
		} catch (SQLException e) {
			throw new ServiceException(
					"수정 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
}
