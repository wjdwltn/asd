<%@ page language="java" contentType="text/html; charset=UTF-8" import="Assign.PersonBean"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="assign" class="Assign.PersonBean"/>
<jsp:setProperty name="assign" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Home > 데이터 형식의 유효성 검사 후 출력</h2>
<hr style="border:solid 1px;">
<table>
		<tr>
			<td>작성자 :</td>
			<td><%=assign.getUsername() %></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=assign.getEmail() %></td>
		</tr>
	</table>
</body>
</html>