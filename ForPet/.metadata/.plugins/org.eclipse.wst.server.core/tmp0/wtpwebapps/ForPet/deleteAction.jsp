
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="animal.Animal"%>
<%@ page import="animal.AnimalDAO"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
</head>
 <body>
 	<%
	 	String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href ='login.jsp'");
			script.println("</script>");
		}
		int animalID =0;
		if(request.getParameter("animalID") != null){
			animalID = Integer.parseInt(request.getParameter("animalID"));
		}
		if(animalID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href ='animal.jsp'");
			script.println("</script>");
		}
		else{
			
 			AnimalDAO animalDAO = new AnimalDAO();
 	 		int result = animalDAO.delete(animalID);//usebean id의 user
 	 		if(result == -1){
 	 			PrintWriter script = response.getWriter();
 	 			script.println("<script>");
 	 			script.println("alert('글 삭제에 실패하였습니다.')");
 	 			script.println("history.back()");//로그인 페이지로 돌려보냄.
 	 			script.println("</script>");
 	 		}else{
 	 			PrintWriter script = response.getWriter();
 	 			script.println("<script>");
 	 			script.println("alert('글이 삭제되었습니다.')");
 	 			script.println("location.href = 'main.jsp'");
 	 			script.println("</script>");
 	 		}
		}
 		
 	%>
 </body>
</html>
