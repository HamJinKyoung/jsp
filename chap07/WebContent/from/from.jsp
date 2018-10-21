<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	<jsp:foward> 액션 태그를 실행하면 생성했던 출력 결과는 모드 제거된다.
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>from.jsp의 제목</title>
</head>
<body>
	이 페이지는 from.jsp가 생성한 것입니다.
	
	<jsp:forward page="/to/to.jsp"/>
</body>
</html>