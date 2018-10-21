<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" %>
<%@ page errorPage="/error/viewErrorMessage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>버퍼 흘러시 이후 에러 발생 결과</title>
</head>
<body>
	<!-- 1KB를 초과하는 데이터를 출력해서 버퍼가 플러시 되도록 한다. 이 과정에서 200 응답 코드가 전송된다. -->
	<% for(int i=0;i<300;i++) {out.println(i);} %>
	
	<!-- 자바에서는 0으로 나누면 ArithmeticException이 발생한다. -->
	<%= 1/0 %>
</body>
</html>