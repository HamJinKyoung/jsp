<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="student.Student"%>
<%@ page import="service.StudentListView"%>
<%@ page import="service.GetStudentListService"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String Id = request.getParameter("id");
	GetStudentListService StudentService = GetStudentListService.getInstance();
	Student viewData = StudentService.getStudentListbyid(Id);
%>
<c:set var="student" value="<%=viewData%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>

<c:if test="${student == null}">
등록된 학생이 없습니다.
</c:if>
<c:if test="${student != null}">

	<h2>학생 정보 수정</h2>
	<br>
	<form action="modify.jsp" method="post">
		<table border="1">
			<tr>
				<td>학번</td>
				<td><input type="text" name="id" value="${student.id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${student.name }"></td>
			</tr>
			<tr>
				<td>학과</td>
				<td><input type="text" name="name" value="${student.department }"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" value="${student.phone }"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="name" value="${student.address }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
	</c:if>
</body>
</html>