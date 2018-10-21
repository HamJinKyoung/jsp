<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- page 디렉티브에서 버퍼 설정하기 --%>
<%-- autoFlash 속성
	 	true: 버퍼가 다 차면 버퍼를 플러시하고 계속해서 작업을 진행한다.
		false: 버퍼가 다 차면 익셉션을 발생시키고 작업을 중지한다. --%>
<%@ page buffer="1kb" autoFlash="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>autoFlash 속성값 false 예제</title>
</head>
<body>
	<%
		for(int i=0;i<1000;i++) {
	%>
			1234
	<%
		}
	%>
</body>
</html>