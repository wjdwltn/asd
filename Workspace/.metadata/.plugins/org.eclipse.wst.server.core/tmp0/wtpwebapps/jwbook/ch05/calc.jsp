<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	float n1 = Float.parseFloat(request.getParameter("n1"));
	float n2 = Float.parseFloat(request.getParameter("n2"));
	
	float result = 0;
	
	switch(request.getParameter("op")){
		case "+": result = n1+n2; break;
		case "-": result = n1-n2; break;
		case "/": result = n1/n2; break;
		case "*": result = n1*n2; break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기 jsp</title>
</head>
<body>
	<h2>계산결과-JSP</h2>
	<hr>
	결과:<%=n1%><%=request.getParameter("op")%><%=n2%>=<%=result %>
</body>
</html>