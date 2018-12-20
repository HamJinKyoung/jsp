<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ page import="addressbook.model.Member" %>
    <%@ page import="addressbook.dao.MemberDao" %>
    <%@ page import="addressbook.service.ChangeMemberService" %>
    <%@ page import="addressbook.service.MemberListView" %>
    <%@ page import="addressbook.service.GetMemberListService" %>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="addressbook.model.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	ChangeMemberService changeService = ChangeMemberService.getInstance();
    changeService.Change(member);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변경완료</title>
</head>
<body>
회원 정보 수정 하였습니다.
<a href="main.jsp">[메인으로가기]</a>
</body>
</html>