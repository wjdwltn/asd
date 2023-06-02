
<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO" %>
<%@ page import="community.Community" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<html lang="en" data-bs-theme="auto">
<head><script src="/docs/5.3/assets/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.111.3">
<title>Headers · Bootstrap v5.3</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">

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
    </style>
 
 <!-- Custom styles for this template -->
<link href="headers.css" rel="stylesheet">
</head>
 <body>
   
  <%@include file="../MainBanner.jsp" %> 
  <%
  	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
  	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
  %>
  <div>
  	 <h2 class="fw-bolder"style="text-align:center; color:;">커뮤니티</h2>
  </div>
  <div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="text-end">
        <button type="button" class="btn btn-warning" onClick="location.href='comu_write.jsp?userID=<%=userID%>'">등록하기</button>
      </div>
       <table width="100%" class="table table-striped table-bordered table-hover" style="table-layout:fixed;">
            <thead style="background:#DDE6ED">
                <tr style="text-align:center;">
                    <th width="6%">No</th>
                    <th width="9%">사진</th>
                    <th width="40%">제목</th>
                    <th>작성인</th>
                    <th width="20%">날짜</th>
                    <th>조회</th>
                </tr>
            </thead>
            <%
		      	CommunityDAO communityDAO = new CommunityDAO();
	      		ArrayList<Community> list = communityDAO.getList(pageNumber);
		      	for(int i = 0; i<list.size(); i++){
	   		%>
	            <thead style="margin-left:auto; margin-right:auto; cursor:pointer;" onclick="location.href='comu_view.jsp?idx=<%=list.get(i).getIdx()%>'">
	                <tr style="word-break:break-all">
	                    <!--이미지 경로를 못찾으면 server.js에서 경로 설정해주어야함 !-->
	                    <td style="text-align:center; padding-bottom: 20px;"><%=list.size()-i %></td>
	                    <td ><img src="upload/<%=list.get(i).getC_pic()%>" width="100px;" height="50px"/></td>
	                    <td style="text-align:center; padding-bottom: 20px;  "><%=list.get(i).getC_title() %></td>
	                    <td style="text-align:center; padding-bottom: 20px;"><%=list.get(i).getUserID() %></td>
	                    <td style="text-align:center; padding-bottom: 20px;"><%=list.get(i).getC_date() %></td>
	                    <td style="text-align:center; padding-bottom: 20px;"><%=list.get(i).getC_count() %></td>
	                </tr>
	            </thead>
            <%
	      		}
	    	%>
        </table>
      <%-- 	<%
      		if(pageNumber != 1){
      	%>
      		<a href="main.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
      		<div>dsfjslfjksdlfl</div>
      	<% 		
      		}if(animalDAO.nextPage(pageNumber + 1)){
      	%>
      		<a href="main.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
      		<div>dsfsjljsdlkfj</div>
   		<% 		
      		}
      	%>	 --%>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>	

      
  </body>
</html>
