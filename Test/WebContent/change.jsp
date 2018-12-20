<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="addressbook.model.Member"%>
<%@ page import="addressbook.service.MemberListView"%>
<%@ page import="addressbook.service.GetMemberListService"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String Id = request.getParameter("id");
	GetMemberListService memberService = GetMemberListService.getInstance();
	Member viewData = memberService.getMemberListbyid(Id);
%>
<c:set var="member" value="<%=viewData%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변경</title>
</head>
<body>

<c:if test="${member == null}">
등록된 회원이 없습니다.
</c:if>
<c:if test="${member != null}">


	<h2>회원 정보변경</h2>
	<br>
	<form action="change_ex.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${member.id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${member.name }"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" value="${member.tel }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="변경"></td>
			</tr>
		</table>
	</form>
	</c:if>
</body>
</html>