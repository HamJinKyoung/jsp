<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>시작페이지</title>
</head>
<body>
	<form action="/hjk/viewParameter.jsp" method="post">
		가능한 외국어를 모두 선택하시오.<br>
		<input type="checkbox" name="language" value="영어">영어
		<input type="checkbox" name="language" value="일본어">일본어
		<input type="checkbox" name="language" value="중국어">중국어
		<input type="checkbox" name="language" value="독일어">독일어
		<br>
		<input type="submit" value="확인">
	</form>
</body>
</html>