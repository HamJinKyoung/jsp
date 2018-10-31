<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberInfo" class="hjk.MemberInfo"/>
<jsp:setProperty property="*" name="memberInfo"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입</title>
</head>
<body>
	<table width="400" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty name="memberInfo" property="id"/></td>
			</tr>
		<tr>
			<td>비밀번호</td>
			<td><jsp:getProperty name="memberInfo" property="password"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty name="memberInfo" property="name"/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><jsp:getProperty name="memberInfo" property="tel"/></td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><jsp:getProperty name="memberInfo" property="registerDate"/></td>
		</tr>
	</table>
</body>
</html>