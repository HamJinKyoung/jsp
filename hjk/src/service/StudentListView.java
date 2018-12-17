package service;

import java.util.List;
import student.Student;

public class StudentListView {

	private int studentTotalCount;
	private int currentPageNumber;
	private List<Student> studentList;
	private int pageTotalCount;
	private int studentCountPerPage;
	private int firstRow;
	private int endRow;

	public StudentListView(List<Student> StudentList, int StudentTotalCount, 
			int currentPageNumber, int StudentCountPerPage, 
			int startRow, int endRow) {
		this.studentList = StudentList;
		this.studentTotalCount = StudentTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.studentCountPerPage = StudentCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;

		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (studentTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = studentTotalCount / studentCountPerPage;
			if (studentTotalCount % studentCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getStudentTotalCount() {
		return studentTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Student> getStudentList() {
		return studentList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getStudentCountPerPage() {
		return studentCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return studentTotalCount == 0;
	}
}
