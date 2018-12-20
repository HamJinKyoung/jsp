<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="addressbook.model.Member" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="addressbook.service.WriteMemberService" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="addressbook.model.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
    WriteMemberService writeService = WriteMemberService.getInstance();
    member.setRegdate(new Timestamp(System.currentTimeMillis()));
   	writeService.write(member);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원 등록 하였습니다.
<a href="main.jsp">[메인으로 가기]</a>

</body>
</html>