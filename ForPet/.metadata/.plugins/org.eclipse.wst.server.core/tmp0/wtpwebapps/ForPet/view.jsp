
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="animal.Animal"%>
<%@ page import="animal.AnimalDAO"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
    <title>Signin Template · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


 <style>
   .bd-placeholder-img {
     font-size: 1.125rem;
     text-anchor: middle;
     -webkit-user-select: none;
     -moz-user-select: none;
     user-select: none;
   }

   @media (min-width: 768px) {
     .bd-placeholder-img-lg {
       font-size: 3.5rem;
     }
   }

   .b-example-divider {
     width: 100%;
     height: 3rem;
     background-color: rgba(0, 0, 0, .1);
     border: solid rgba(0, 0, 0, .15);
     border-width: 1px 0;
     box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
   }

   .b-example-vr {
     flex-shrink: 0;
     width: 1.5rem;
     height: 100vh;
   }

   .bi {
     vertical-align: -.125em;
     fill: currentColor;
   }

   .nav-scroller {
     position: relative;
     z-index: 2;
     height: 2.75rem;
     overflow-y: hidden;
   }

   .nav-scroller .nav {
     display: flex;
     flex-wrap: nowrap;
     padding-bottom: 1rem;
     margin-top: -1px;
     overflow-x: auto;
     text-align: center;
     white-space: nowrap;
     -webkit-overflow-scrolling: touch;
   }

   .btn-bd-primary {
     --bd-violet-bg: #712cf9;
     --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

     --bs-btn-font-weight: 600;
     --bs-btn-color: var(--bs-white);
     --bs-btn-bg: var(--bd-violet-bg);
     --bs-btn-border-color: var(--bd-violet-bg);
     --bs-btn-hover-color: var(--bs-white);
     --bs-btn-hover-bg: #6528e0;
     --bs-btn-hover-border-color: #6528e0;
     --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
     --bs-btn-active-color: var(--bs-btn-hover-color);
     --bs-btn-active-bg: #5a23c8;
     --bs-btn-active-border-color: #5a23c8;
   }
   .bd-mode-toggle {
     z-index: 1500;
   }
   .form-control2{
  	display: inline-block;
  width: 80%;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: var(--bs-body-color);
  background-color: var(--bs-body-bg);
  background-clip: padding-box;
  border: var(--bs-border-width) solid var(--bs-border-color);
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border-radius: var(--bs-border-radius);
  transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
   }
 </style>

 <!-- Custom styles for this template -->
<link href="sign-in.css" rel="stylesheet">
</head>
<body>
  
	<%@include file="../MainBanner.jsp" %> 
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
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
		Animal animal = new AnimalDAO().getAnimal(animalID);
	%>
 	
  <div class="album py-5 bg-body-tertiary">
    <div class="container">
     <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 g-5" >
	  <div class="col" style="padding-left:50px; margin:auto;">
	     <div class="card shadow-sm">
            <img src="upload/<%=animal.getAnimalPic() %>" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
	       <div class="card-body">
	         <p class="card-text fw-bolder"><%=animal.getAnimalTitle() %></p>
	          <p class="card-text"><%=animal.getAnimalLost() %></p>
	           <p class="card-text"><%=animal.getAnimalGender() %></p>
	           <p class="card-text fw-semibold" style="color:red;"><%=animal.getUserPhone() %></p>
	         <div class="d-flex justify-content-between align-items-center"> 
	           <small class="text-body-secondary">9 mins</small>
	         </div>
	       </div>
	     </div>
	   </div>
   	 </div>
    </div>
  </div>
  <div style="text-align:center;" >
    <a href="main.jsp" class="btn btn-primary" style=" display: inline-block;">목록</a>
    <a href="update.jsp?animalID=<%=animalID%>" class="btn btn-warning" style=" display: inline-block;">수정</a>
    <a onclick="return confirm('정말로 삭제하시겠습니까?')"href="deleteAction.jsp?animalID=<%=animalID%>" class="btn btn-danger" style=" display: inline-block;">삭제</a>
    <%-- <%
    	if(userID != null && userID.equals(user.getUserID())){
    %>
    		<a href="update.jsp?animalID=<%=animalID%>" class="btn btn-primary>">삭제</a>
    		<a href="deleteAction.jsp?animalID=<%=animalID%>" class="btn btn-primary>">삭제</a>
    <%
    	}
    %> --%>
  </div>


    
  </body>
</html>
