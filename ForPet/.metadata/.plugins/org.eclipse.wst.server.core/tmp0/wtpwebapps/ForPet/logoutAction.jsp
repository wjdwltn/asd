
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
</head>
 <body>
 	<%
 		session.invalidate();
 	%>
 	<script>
 		location.href="main.jsp";
 	</script>
 </body>
</html>
