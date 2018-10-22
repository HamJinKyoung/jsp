<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시작페이지</title>
</head>
<body>
	<form action="/hjk/processJoining.jsp" method="post">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" size="30"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" size="30"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="30"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" size="30"></td>
			</tr>
			<tr>
				<td colspan="4">
				<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>