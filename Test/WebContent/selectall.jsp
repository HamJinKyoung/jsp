<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="addressbook.service.GetMemberListService" %>
<%@ page import="addressbook.service.MemberListView" %>
    
<%
 	request.setCharacterEncoding("utf-8");
%>

<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	GetMemberListService memberListService = 
	GetMemberListService.getInstance();
	MemberListView viewData = 
	memberListService.getMemberList(pageNumber);
%>
<c:set var="viewData" value="<%= viewData %>"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체회원조회</title>
</head>
<body>
<h2>회원 명단</h2>
<table border="1" width="100%">
<tr>
	<td>ID</td><td>이름</td>
	<td>전화번호</td>
	<td>가입일</td>
	<td>변경여부</td>
	<td>삭제여부</td>
</tr>
<c:forEach var="member" items="${viewData.memberList}">
<tr>
	<td>${member.id}</td>
	<td>${member.name}</td>
	<td>${member.tel}</td>
	<td>${member.regdate}</td>
	<td><a href="change.jsp?id=${member.id}">변경</a></td>
	<td><a href="delete.jsp?id=${member.id}">삭제</a></td>
</tr>
</c:forEach>
</table>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="selectall.jsp?page=${pageNum}">[${pageNum}]</a>
</c:forEach>
<a href="main.jsp">[메인으로 가기]</a> 
</body>
</html>