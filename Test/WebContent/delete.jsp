<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "addressbook.service.DeleteMemberService" %>
<%@ page import ="addressbook.dao.MemberDao" %>
<% 	
	request.setCharacterEncoding("utf-8");%>
<%
    String Id = request.getParameter("id");
	DeleteMemberService deleteService = DeleteMemberService.getInstance();
	deleteService.deleteMember(Id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
회원 삭제 하였습니다.
<a href="main.jsp">[메인으로가기]</a>
</body>
</html>