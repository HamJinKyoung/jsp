<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Calendar 클래스 사용</title>
</head>
<body>
	<%
		java.util.Calendar cal = java.util.Calendar.getInstance();
	%>
	오늘은
		<%= cal.get(java.util.Calendar.YEAR) %>년
		<%= cal.get(java.util.Calendar.MONTH)+1 %>월
		<%= cal.get(java.util.Calendar.DATE) %>일
	입니다.

</body>
</html>