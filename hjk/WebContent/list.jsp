<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "student.Student" %>
<%@ page import = "service.GetStudentListService" %>
<%@ page import = "service.StudentListView" %>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	GetStudentListService studentListService = 
		GetStudentListService.getInstance();
	StudentListView viewData = 
		studentListService.getStudentList(pageNumber);
%>
<c:set var="viewData" value="<%= viewData %>"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 학생 조회</title>
</head>
<body>
<h2>학생 목록</h2>
<table border="1" width="100%">
<tr>
	<td>학번</td>
	<td>이름</td>
	<td>학과</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>수정여부</td>
	<td>삭제여부</td>
</tr>
<c:forEach var="student" items="${viewData.studentList}">
<tr>
	<td>${student.id}</td>
	<td>${student.name}</td>
	<td>${student.department}</td>
	<td>${student.phone}</td>
	<td>${student.address}</td>
	<td><a href="modifyStudent.jsp?id=${student.id}">수정하기</a></td>
	<td><a href="deleteStudent.jsp?id=${student.id}">삭제하기</a></td>
</tr>
</c:forEach>
</table>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a>
</c:forEach>
<a href="main.jsp">[메인으로 가기]</a> 
</body>
</html>