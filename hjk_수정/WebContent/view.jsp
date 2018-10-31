<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public float add(float a, float b) {
		float c = a+b;
		return c;
	}
	public float subtract(float a, float b) {
		float c = a-b;
		return c;
	}
	public float multiply(float a, float b) {
		float c = a*b;
		return c;
	}
	public float divide(float a, float b) {
		float c = a/b;
		return c;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실행페이지</title>
</head>
<body>
<%
	String operator = request.getParameter("operator");
	String a = request.getParameter("a");
	String b = request.getParameter("b");
	
	float fA = Float.parseFloat(a);
	float fB = Float.parseFloat(b);
// a와 b를 float형으로 바꿔줘야 계산 가능
	float result = 0;

	if(operator.equals("+")) {
		result = add(fA,fB);
	} else if(operator.equals("-")) {
		result = subtract(fA,fB);
	} else if(operator.equals("*")) {
		result = multiply(fA,fB);
	} else if(operator.equals("/")) {
		result = divide(fA,fB);
	}

%>
	연산 결과
	<%= fA %> <%=operator %> <%= fB %> = <%= result %>
	
</body>
</html>