<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
include 부분<br>
<jsp:include page="footer.jsp">
<jsp:param name='name1' value="홍길동"/>
</jsp:include>
</body>
</html>