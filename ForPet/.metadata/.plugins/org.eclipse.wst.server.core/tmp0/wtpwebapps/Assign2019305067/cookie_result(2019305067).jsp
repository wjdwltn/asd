<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i = 1; i<cookies.length; i++){
				String name = cookies[i].getName(); // 쿠키 이름
				String value = cookies[i].getValue(); // 쿠키 값
				out.println(name+"은 "+value+" 입니다.");
				out.println("<br/>");
			}	
		}
		else{
			out.println("쿠키가 삭제되었습니다.");
		}
	%>
</body>
</html>