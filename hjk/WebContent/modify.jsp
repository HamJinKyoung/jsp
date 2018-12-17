<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="student.Student" %>
<%@ page import="student.StudentDao" %>
<%@ page import="service.ModifyStudentService" %>
<%@ page import="service.StudentListView" %>
<%@ page import="service.GetStudentListService" %>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="student" class="student.Student">
	<jsp:setProperty name="student" property="*" />
</jsp:useBean>
<%
	ModifyStudentService modifyService = ModifyStudentService.getInstance();
	modifyService.Change(student);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정완료</title>
</head>
<body>
학생 정보를 수정하였습니다.
<a href="main.jsp">[메인으로가기]</a>
</body>
</html>