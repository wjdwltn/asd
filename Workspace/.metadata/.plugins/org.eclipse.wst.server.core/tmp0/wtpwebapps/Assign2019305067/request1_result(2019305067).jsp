<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<H2>Home>입력 정보 확인</H2>
<hr style="border:solid 1px;">
<table>
	<tr>
		<td>이름 :</td>
		<td><%=request.getParameter("u_name")%></td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td><%=request.getParameter("u_pass")%></td>
	</tr>
	<tr>
		<td>E-mail :</td>
		<td><%=request.getParameter("u_email")%></td>
	</tr>
	<tr>
		<td>연락처 :</td>
		<td><%=request.getParameter("n_kind")%>
			<%=request.getParameter("number1")%>-
			<%=request.getParameter("number2")%>-
			<%=request.getParameter("number3")%>
		</td>
	</tr>
	<tr>
		<td>성별 :</td>
		<td><%=request.getParameter("gender")%></td>
	</tr>
	<tr>
		<td>취미 :</td>
		<td>
			<% 
				String hobby[] = request.getParameterValues("hobby");
				for(String a:hobby){
					out.println(a +' ');
				}
			%>
		</td>
	</tr>
	<tr>
		<td>본인 소개 :</td>
		<td><%=request.getParameter("intro")%></td>
	</tr>
</table>
</body>
</html>