package service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import student.StudentDao;
import jdbc.JdbcUtil;
import student.Student;

public class RegisterStudentService {
	private static RegisterStudentService instance = new RegisterStudentService();

	public static RegisterStudentService getInstance() {
		return instance;
	}

	private RegisterStudentService() {
	}

	public void register(Student student) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			StudentDao studentDao = StudentDao.getInstance();
			studentDao.insert(conn, student);
		} catch (SQLException e) {
			throw new ServiceException(
					"�л� ��� ����: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
