<%-- pageEncoding 속성에 지정한 인코딩과 contentType 속성에 지정한 인코딩이 서로 다를 수도 있다. --%>
<%-- JSP 파일은 UTF-8로 작성하고 응답 결과는 EUC-KR로 생성하고 싶은 경우  --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현재 시간</title>
</head>
<body>
	<%	
		Date now = new Date();
	%>
	현재 시각:
	<%= now %>
</body>
</html>