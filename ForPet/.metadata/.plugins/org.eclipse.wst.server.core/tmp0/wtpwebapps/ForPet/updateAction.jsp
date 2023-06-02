
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
			if(request.getParameter("animalTitle")==null || request.getParameter("animalLost")==null|| request.getParameter("userPhone")==null||
					request.getParameter("animalGender")==null|| request.getParameter("animalKind")==null){
	 			PrintWriter script = response.getWriter();
	 			script.println("<script>");
	 			script.println("alert('입력이 안 된 사항이 있습니다.')");
	 			script.println("history.back()");//로그인 페이지로 돌려보냄.
	 			script.println("</script>");
	 			
	 		}
	 		else{
	 			AnimalDAO animalDAO = new AnimalDAO();
	 	 		int result = animalDAO.update(animalID,request.getParameter("animalTitle"),request.getParameter("animalLost"),request.getParameter("userPhone")
	 	 				,request.getParameter("animalGender"),request.getParameter("animalKind"));//usebean id의 user
	 	 		if(result == -1){
	 	 			PrintWriter script = response.getWriter();
	 	 			script.println("<script>");
	 	 			script.println("alert('등록에 실패하였습니다.')");
	 	 			script.println("history.back()");//로그인 페이지로 돌려보냄.
	 	 			script.println("</script>");
	 	 		}else{
	 	 			PrintWriter script = response.getWriter();
	 	 			script.println("<script>");
	 	 			script.println("alert('수정 완료되었습니다.')");
	 	 			script.println("location.href = 'main.jsp'");
	 	 			script.println("</script>");
	 	 		}
	 		}
		}
 		
 	%>
 </body>
</html>
