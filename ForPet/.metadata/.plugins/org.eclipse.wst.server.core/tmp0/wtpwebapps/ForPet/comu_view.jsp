
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO" %>
<%@ page import="community.Community" %>
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
		int idx =0;
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if(idx == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href ='animal.jsp'");
			script.println("</script>");
		}
		Community community = new CommunityDAO().getCommunity(idx);
	%>
  <div>
 	<h2 class="fw-bolder"style="text-align:center; color:;">커뮤니티</h2>
  </div>
  <div class="album py-5 bg-body-tertiary">
	  <main class="form-signin w-25" style="margin-left:390px; margin-top:30px; backgroungco">
		<form style="width:680px;"  method="post" action="comu_writeAction.jsp" enctype="multipart/form-data">
		 <br>
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label fw-bolder"><span style="color:red;">*</span> 등록인</label>
		    <!-- <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputEmail3">
		    </div> -->
		     <div class="col-sm-10">
		      <span style="color:red;">    |</span>  <%=community.getUserID() %>
		    </div>
		  </div>
		  <hr style="border-style:dotted;">
		  <div class="row mb-3">
		    <label for="inputPassword3" class="col-sm-2 col-form-label fw-bolder"><span style="color:red;">*</span> 제목</label>
		    <div class="col-sm-10">
		      <span style="color:red;">    |</span>  <%=community.getC_title() %>
		    </div>
		  </div>
		  <hr style="border-style:dotted;">
		  <div class="row mb-3">
		    <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label fw-bolder"><span style="color:red;">*</span> 상세설명</label>
		    <div class="col-sm-10">
		      <span style="color:red;">    |</span>  <%=community.getC_content() %>
		    </div>
		  </div>
		  <hr style="border-style:dotted;">
		  <div class="row mb-3">
		    <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label fw-bolder"><span style="color:red;">*</span> 사진</label>
		    <div class="col-sm-10">
		      <img src="upload/<%=community.getC_pic()%>" width="550px;" height="300px"/>
		    </div>
		  </div>
		 <hr style="border-style:dotted;">
		</form>
		<form style="width:680px;"  method="post" action="comu_writeAction.jsp" enctype="multipart/form-data">
			<div class="card mb-2">
				<div class="card-header bg-light">
				        <i class="fa fa-comment fa"></i> 댓글
				</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
					    <li class="list-group-item">
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="1" ></textarea>
						<button type="button" class="mt-1" style="background-color:#9DB2BF; border:none;" onClick="javascript:addReply();" >댓글달기</button>
					    </li>
					</ul>
				</div>
				<table>
					<tr height="40">
						<td width="50">&nbsp;</td>
						<td width="500">
							<b><front>정지수</front></b>
							&nbsp;2023-04-24 22:34:20 
							<img src="upload/btn_comment_del.gif" width="15" height="15">
							<br>축하드립니다!!
						</td>
						<td width="27">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3">
							<hr width="600px;" style="margin: 6px auto;">
						</td>
					</tr>
					<tr height="40">
						<td width="50">&nbsp;</td>
						<td width="500">
							<b><front>정지수</front></b>
							&nbsp;2023-04-24 22:35:41
							<img src="upload/btn_comment_del.gif" width="15" height="15">
							<br>너무 다행이네요~!
						</td>
						<td width="27">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3">
							<br>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</main>
	</div>
  <div style="text-align:center;" >
    <a href="community.jsp" class="btn btn-primary" style=" display: inline-block;">목록</a>
    <a href="comu_update.jsp?idx=<%=idx%>" class="btn btn-warning" style=" display: inline-block;">수정</a>
    <a onclick="return confirm('정말로 삭제하시겠습니까?')"href="comu_deleteAction.jsp?idx=<%=idx%>" class="btn btn-danger" style=" display: inline-block;">삭제</a>
   <%--  <%
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
