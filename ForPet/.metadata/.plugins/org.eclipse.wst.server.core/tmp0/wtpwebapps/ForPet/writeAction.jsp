
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "animal.AnimalDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.io.File" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="animal" class="animal.Animal" scope="page"/>
<jsp:setProperty name="animal" property="animalTitle" />
<jsp:setProperty name="animal" property="animalLost" />
<jsp:setProperty name="animal" property="userPhone" />
<jsp:setProperty name="animal" property="animalGender" />
<jsp:setProperty name="animal" property="animalKind" />
<jsp:setProperty name="animal" property="animalPic" />
 
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
 		String fileName = multipartRequest.getOriginalFileName("animalPic");
 		String animalTitle = multipartRequest.getParameter("animalTitle");
 		String animalLost = multipartRequest.getParameter("animalLost");
 		String animalPhone = multipartRequest.getParameter("userPhone");
 		String animalGender = multipartRequest.getParameter("animalGender");
 		String animalKind = multipartRequest.getParameter("animalKind");
 		
 		if(animalTitle==null || animalLost==null|| animalPhone==null||
 				animalGender==null|| animalKind==null){
 			PrintWriter script = response.getWriter();
 			
 			script.println("<script>");
 			script.println("alert('입력이 안 된 사항이 있습니다.')");
 			script.println("history.back()");//로그인 페이지로 돌려보냄.
 			script.println("</script>");
 			
 		}
 		else{
 			AnimalDAO animalDAO = new AnimalDAO();
 	 		int result = animalDAO.insert(animalTitle,animalLost,animalPhone,animalGender,animalKind,fileName);//usebean id의 user
 	 		if(result == -1){
 	 			PrintWriter script = response.getWriter();
 	 			System.out.println(animalTitle);
 	 			System.out.println(animalLost);
 	 			System.out.println(animalPhone);
 	 			System.out.println(animalGender);
 	 			System.out.println(animalKind);
 	 			System.out.println(animalKind);
 	 			script.println("<script>");
 	 			script.println("alert('등록에 실패하였습니다.')");
 	 			script.println("history.back()");//로그인 페이지로 돌려보냄.
 	 			script.println("</script>");
 	 		}else{
 	 			PrintWriter script = response.getWriter();
 	 			System.out.println(animal.getAnimalTitle());
 	 			System.out.println(animal.getAnimalLost());
 	 			System.out.println(animal.getUserPhone());
 	 			System.out.println(animal.getAnimalGender());
 	 			System.out.println(animal.getAnimalKind());
 	 			script.println("<script>");
 	 			script.println("location.href = 'main.jsp'");
 	 			script.println("</script>");
 	 		} 
 		} 
 		
 	%>
 </body>
</html>
