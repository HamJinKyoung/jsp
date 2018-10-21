<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>합 구하기</title>
</head>
<body>
	<%
		int sum=0;
		for(int i=1;i<=10;i++) {
			sum=sum+i;
		}
	%>
	1 부터 10 까지의 합은 <%= sum %> 입니다.
	<br>
	<%
		int sum2=0;
		for(int i=11;i<=20;i++) {
			sum2=sum2+i;
		}
	%>
	11 부터 20 까지의 합은 <%= sum2 %> 입니다.
</body>
</html>