<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="text-align:center;">쿠키 테스트</h1>
	<%
		request.setCharacterEncoding("utf-8");
		response.addCookie(new Cookie("name","JungJiSOO"));
		response.addCookie(new Cookie("mail","jlsowltn2000@naver.com"));
	%>
	<br>
	<h2 style="text-align:center;">쿠키 설정이 완료되었습니다.</h2>
	<div style="text-align:center;">
		<a href="cookie_result(2019305067).jsp">쿠키보기</a>
		<a href="cookie_delete(2019305067).jsp">쿠키삭제</a>
	</div>
</body>
</html>