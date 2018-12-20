<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" java.sql.Timestamp"%>
<%@ page import="addressbook.model.Member"%>
<%@ page import="addressbook.service.GetMemberListService"%>
<%@ page import="addressbook.service.MemberListView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="addressbook.model.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	String pageNumberStr = request.getParameter("page");
	String name = request.getParameter("name");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);

	}

	GetMemberListService MemberListService = GetMemberListService.getInstance();
	MemberListView viewData = MemberListService.getMemberListbyname(pageNumber, name);

	System.out.print(viewData.getmemberTotalCount());
%>  

<c:set var="viewData" value="<%=viewData%>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원명단</title>
</head> 
<body>

	<c:if test="${viewData.isEmpty()}">
	등록된 회원이 없습니다.
	</c:if>

	<c:if test="${!viewData.isEmpty()}">
		<h2>회원 명단</h2>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>이름</td>
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
					<td><a href="change.jsp?memberId=${member.id}">변경</a></td>
					<td><a href="delete.jsp?memberId=${member.id}">삭제</a></td>
				</tr>
			</c:forEach>

		</table>
		<c:set var="member" value="<%=viewData.getmemberList().get(0) %>"/>
		<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
				<a href="selectone_ex.jsp?page=${pageNum}&name=${member.name}">[${pageNum}]</a>
			</c:forEach>
			<a href="main.jsp">[메인으로 가기]</a>
	</c:if>
</body> 
</html>