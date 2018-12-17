package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import student.StudentDao;
import jdbc.JdbcUtil;
import student.Student;

public class GetStudentListService {
	private static GetStudentListService instance = new GetStudentListService();

	public static GetStudentListService getInstance() {
		return instance;
	}

	private GetStudentListService() {
	}

	private static final int Student_COUNT_PER_PAGE = 5;

	public StudentListView getStudentList(int pageNumber) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			StudentDao studentDao = StudentDao.getInstance();

			int StudentTotalCount = studentDao.selectCount(conn);

			List<Student> StudentList = null;
			int firstRow = 0;
			int endRow = 0;
			if (StudentTotalCount > 0) {
				firstRow =
						(pageNumber - 1) * Student_COUNT_PER_PAGE + 1;
				endRow = firstRow + Student_COUNT_PER_PAGE - 1;
				StudentList =
						studentDao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				StudentList = Collections.emptyList();
			}
			return new StudentListView(StudentList,
					StudentTotalCount, currentPageNumber,
					Student_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public Student getStudentListbyid(String id) {
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			StudentDao studentDao = StudentDao.getInstance();

			Student student = studentDao.select(conn, id);
			return  student;

		} catch (SQLException e) {
			throw new ServiceException("학생 찾기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
