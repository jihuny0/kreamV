
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: none;
}
.btn-wrap, .lists, .main {
    display: block;
}
.main {
    max-width: 640px;
    margin: 0 auto;
    padding: 50px;
}
.lists {
    margin-bottom: 4rem;
}
.lists__item {
    padding: 20px;
    background: #EEE;
}
.lists__item:nth-child(2n) {
    background: #59b1eb;
    color: #fff;
}
.btn-wrap {
    text-align: center;
}

	
</style>
</head>
<body>
<ul class="nav justify-content-end">
	  <li class="nav-item">
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/managerBoard.jsp">게시판&고객관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<%=request.getContextPath()%>/view/updateProd.jsp">상품등록</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<%=request.getContextPath()%>/examinationManager.do">검수관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href ="<%=request.getContextPath()%>/Memberlogout.do">로그아웃</a>
	  </li>
	</ul>


 	<hr>
 	<nav class="nav">
  <a class="navbar-brand" href="<%=request.getContextPath()%>/view/manager.jsp">
    <img src="/kreamv/images/kreamv_logo.png" width="180" height="40" class="d-inline-block align-top" alt="">
  </a>
 	
  <div class="container">
  <ul class="nav justify-content-end">
 <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath() %>/styleGramList.do?type=1">STYLE</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/allProdList.do">SHOP</a>
      
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">ABOUT</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/view/shopPage.jsp">
      <img src="/kreamv/images/돋보기.png" width="30" height="30" class="d-inline-block align-top" alt="">
      </a>
    </li>
  </ul>
</div>
</nav>
<%-- <div id="carouselExampleIndicators" class="carousel slide slideSize" data-ride="carousel"  data-interval="3000">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/images/nike.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/adidas.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/supreme.jpg" class="d-block w-100" alt="...">
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
</div> --%>
</body>
</html>