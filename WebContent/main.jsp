<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Kreamv | 안전한 중고 거래</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.nav-link {
		list-style: none;
		color :inherit;
	}
	
	.shortCut_items{
		display : flex;
		
	}
	
	.navbar-brand{
		padding-left: 30px;
	}
	

	
</style>
</head>

<body> 
<ul class="nav justify-content-end">
  <li class="nav-item">
    <a class="nav-link " href="#">문의게시판</a>
  </li>
  <li class="nav-item">
    <a class="nav-link " href="#">고객관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">관심상품</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">마이페이지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href ="#">로그인</a>
  </li>
</ul>
 	<hr>
 	<nav class="nav">
  <a class="navbar-brand" href="#">
    <img src="images/kreamv_logo.png" width="180" height="40" class="d-inline-block align-top" alt="">
  </a>
 	
  <div class="container">
  <ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link" href="#">STYLE</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">SHOP</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">ABOUT</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">
      <img src="images/돋보기.png" width="30" height="30" class="d-inline-block align-top" alt="">
      </a>
    </li>
  </ul>
</div>
</nav>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/나이키 x 오프화이트.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/수페르가 x 반스.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/스코노 x 무민.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>

<div class = "shortCut_items">
	 <div class = "shortCut_item">
	 		<div class = "shortCut_item_img">
	 		<a href = "#">
	 			<img src ="images/남성이미지.png">
	 		</a>
	 		</div>
	 		<div class = "shortCut_item_title">남성추천</div>
	 </div>
	 <div class = "shortCut_item">
	 		<div class = "shortCut_item_img">
	 		<a href = "#">
	 			<img src ="images/여성이미지.png">
	 		</a>
	 		</div>
	 		<div class = "shortCut_item_title">여성추천</div>
	 </div>
	 <div class = "shortCut_item">
	 		<div class = "shortCut_item_img">
	 		<a href = "#">
	 			<img src = "images/정가아래 이미지.png">
	 		</a>
	 		</div>
	 		<div class = "shortCut_item_title">시세보다 낮은 상품</div>
	 </div>
</div>
<div class = "justDropped">
	<hr>
	<h3>발매상품</h3>
</div>
<div class = "mostPopular">
	<hr>
	<h3>인기상품</h3>
</div>
<div class = "newIn">
	<hr>
	<h3>신규등록 상품</h3>
</div>

</body>
</html>