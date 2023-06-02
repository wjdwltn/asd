
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "community.CommunityDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.io.File" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="community" class="community.Community" scope="page"/>
<jsp:setProperty name="community" property="c_title" />
<jsp:setProperty name="community" property="c_content" />
<jsp:setProperty name="community" property="c_pic" />
 
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
</head>
 <body>
 	<%
 		String directory = application.getRealPath("/upload/");
 		int maxSize = 1024 *1024 *100;
 		String encoding = "UTF-8";
 		
 		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
 		String fileName = multipartRequest.getOriginalFileName("c_pic");
 		String c_title= multipartRequest.getParameter("c_title");
 		String c_content = multipartRequest.getParameter("c_content");
 		
 		String userID = null;
 		if(session.getAttribute("userID") != null){
 			userID = (String) session.getAttribute("userID");
 			System.out.println(userID);
 		}
 		if(userID==null){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('로그인을 하세요.')");
 			script.println("location.href = 'login.jsp'");
 			script.println("</script>");
 		}else{
 			if(c_title==null || c_content==null){
 	 			PrintWriter script = response.getWriter();
 	 			
 	 			script.println("<script>");
 	 			script.println("alert('입력이 안 된 사항이 있습니다.')");
 	 			script.println("history.back()");//로그인 페이지로 돌려보냄.
 	 			script.println("</script>");
 	 			
 	 		}
 	 		else{
 	 			CommunityDAO communityDAO = new CommunityDAO();
 	 	 		int result = communityDAO.insert(userID,c_title,c_content,fileName);//usebean id의 user
 	 	 		if(result == -1){
 	 	 			PrintWriter script = response.getWriter();
 	 	 			System.out.println(userID);
 	 	 			System.out.println(c_title);
 	 	 			System.out.println(c_content);
 	 	 			System.out.println(fileName);
 	 	 			script.println("<script>");
 	 	 			script.println("alert('등록에 실패하였습니다.')");
 	 	 			script.println("history.back()");//로그인 페이지로 돌려보냄.
 	 	 			script.println("</script>");
 	 	 		}else{
 	 	 			PrintWriter script = response.getWriter();
 	 	 			System.out.println(userID);
 	 	 			System.out.println(c_title);
 	 	 			System.out.println(c_content);
 	 	 			script.println("<script>");
 	 	 			script.println("location.href = 'community.jsp'");
 	 	 			script.println("</script>");
 	 	 		} 
 	 		} 	
 		}
 		
 		
 	%>
 </body>
</html>
