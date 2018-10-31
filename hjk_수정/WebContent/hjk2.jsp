<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시작페이지</title>
</head>
<body>
	사칙연산
	<form action ="/hjk/view.jsp" method="post">
		<input type="text" name="a" size="10">
		
		<select name="operator">
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>
		</select>
		
		<input type="text" name="b" size="10">
		
		<input type="submit" value="=">
	</form>
</body>
</html>