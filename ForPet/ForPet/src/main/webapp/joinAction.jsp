
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPhone" />
<jsp:setProperty name="user" property="userDate" />

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
		if(userID!=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
 		if(user.getUserID()==null || user.getUserPW()==null|| user.getUserName()==null||
 				user.getUserPhone()==null|| user.getUserDate()==null){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('입력이 안 된 사항이 있습니다.')");
 			script.println("history.back()");//로그인 페이지로 돌려보냄.
 			script.println("</script>");
 			
 		}
 		else{
 			UserDAO userDAO = new UserDAO();
 	 		int result = userDAO.join(user);//usebean id의 user 
 	 		if(result == -1){
 	 			PrintWriter script = response.getWriter();
 	 			script.println("<script>");
 	 			script.println("alert('이미 존재하는 아이디입니다.')");
 	 			script.println("history.back()");//로그인 페이지로 돌려보냄.
 	 			script.println("</script>");
 	 		}else{
 	 			session.setAttribute("userID",user.getUserID());
 	 			PrintWriter script = response.getWriter();
 	 			script.println("<script>");
 	 			script.println("location.href = 'main.jsp'");
 	 			script.println("</script>");
 	 		}
 		}
 		
 	%>
 </body>
</html>
