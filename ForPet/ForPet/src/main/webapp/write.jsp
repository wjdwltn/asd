
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
<main class="form-signin w-25" style="margin:150px auto!important;">

  <form method="post" action="writeAction.jsp" enctype="multipart/form-data"><!-- enctype="multipart/form-data" -->
    <h1 class="h3 mb-3 fw-normal text-center">등록하기</h1>
	
    <div class="form-group">
     <label class="fw-bolder">* 글제목 </label>
      <input type="text" class="form-control"  name="animalTitle">
    </div>
    <div>
      <label class="fw-bolder">* 잃어버린 장소 </label>
     <select name="animalLost" class="form-control input-sm">                                            
	        <option  name="animalLost" value="ALLS">지역선택</option>
	        <option  name="animalLost" value="서울시">서울시</option>
	        <option  name="animalLost" value="인천시" >인천시</option>
	        <option  name="animalLost" value="대전시" >대전시</option>
	        <option  name="animalLost" value="광주시" >광주시</option>
	        <option  name="animalLost" value="대구시" >대구시</option>
	        <option  name="animalLost" value="울산시" >울산시</option>
	        <option  name="animalLost" value="부산시" >부산시</option>
	        <option  name="animalLost" value="경기도" >경기도</option>
	        <option  name="animalLost" value="강원도" >강원도</option>
	        <option  name="animalLost" value="세종시" >세종시</option>
	        <option  name="animalLost" value="충청남도" >충청남도</option>
	        <option  name="animalLost" value="충청북도" >충청북도</option>
	        <option  name="animalLost" value="전라남도" >전라남도</option>
	        <option  name="animalLost" value="전라북도" >전라북도</option>
	        <option  name="animalLost" value="경상남도" >경상남도</option>
	        <option  name="animalLost" value="경상북도" >경상북도</option>
	        <option  name="animalLost" value="제주도" >제주도</option>
	   </select>
    </div>
    <!-- <div class="form-group">
     <label class="fw-bolder">* 잃어버린 날짜 </label>
      <input type="date" class="form-control"  name="animalLdate">
    </div> -->
    <div class="form-group">
     <label class="fw-bolder">* 연락처 </label>
      <input type="text" class="form-control"  name="userPhone">
    </div>
    <div class="form-group">
     <label class="fw-bolder">* 종류 </label>
     <label class="radio-inline">
         <input type="radio" name=animalKind value="강아지" />강아지
     </label>
     <label class="radio-inline">
         <input type="radio" name="animalKind" value="고양이" />고양이
     </label>
    </div>
     <div class="form-group">
     <label class="fw-bolder">* 성별 </label>
     <label class="radio-inline">
         <input type="radio" name="animalGender" value="숫컷" />수컷
     </label>
     <label class="radio-inline">
         <input type="radio" name="animalGender" value="암컷" />암컷
     </label>
    </div>
    <div class="form-group">
     <label class="fw-bolder">* 사진 업로드 </label>
      <input type="file" class="form-control"  name="animalPic">
    </div>

    
    <button class="w-100 btn btn-lg btn-primary" style="margin-top:20px;" type="submit">등록하기</button>
    <p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2023</p>
  </form>
</main>


    
  </body>
</html>
