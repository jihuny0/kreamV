<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kreamv | 관리페이지</title>
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
		justify-content: center;
		text-align: center;
	}
	
	.productList{
	display:inline-flex;
	flex-flow: row wrap;
	justify-content :flex-start;
	margin-right: 20%;
	margin-left: 20%;
	}
	
	.product1, .product2, .product3{
	width: 200px;
	margin : 40px;
	display:none;
	}
	
	.titleName, h4 {
		margin-left: 415px;
	}
	
	.titleName{
		font-size: 0.9em;
		color: #A6A6A6;
	
	}
	
	a {
		color: black;
	}

	.image{
		margin-bottom: 10px;
		border-radius: 8px;
	}
	
	.newButton, .bestButton, .droppedButton{
		margin-left: 47%;
	}
	
	.pdTitle{
	text-decoration: underline;
	font-size: 1.2em;
	font-weight: bold;
	}
	
	.pdPrice{
	font-size: 1.01em;
	font-weight: 300;
	}
	
	a:hover { 
	color : black;
	}
	
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

<script>
$(function(){
	
 
	
		
  $.ajax({
	url : "/kreamv/getProdList.do",
	type: "get",
	success: function(res){
		
		rcode = "";
		$.each(res, function(i,v){
				rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
				rcode += v.prod_id;
				rcode += "'><div class='product1'>";
				rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
				rcode += '<a class="pdTitle">'+ v.prod_brand +'</a><br>';
				rcode += '<a>'+ v.prod_enm+'</a><br>';
				var rprice = v.prod_rprice;
 				rcode += '<a class="pdPrice">'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';
				rcode += '</div></a></div>';
				$('.justDropped').html(rcode);
		}) // each
		
		 $(".product1").slice(0, 4).show();
		  $(".droppedButton").click(function(e){ 
			  e.preventDefault();
			  $(".product1:hidden").slice(0, 4).show();
			  if($(".product1:hidden").length == 0){
				  alert("더이상 표시할 상품이 없습니다.");
				 }
			  });
		
	}, 
	error : function(xhr){
		alert("상태 : " + xhr. status)
	},
	dataType: "json"
  })//ajax

})


$(function(){
	  
	
  $.ajax({
	url : "/kreamv/popularProdList.do",
	type: "get",
	success: function(res){
		
		rcode = "";
		$.each(res, function(i,v){
				rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
				rcode += v.prod_id;
				rcode += "'><div class='product2'>";
				rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
				rcode += '<a class="pdTitle">'+ v.prod_brand +'</a><br>';
				rcode += '<a>'+ v.prod_enm+'</a><br>';
				var rprice = v.prod_rprice;
 				rcode += '<a>'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';
				rcode += '</div></a></div>';
				$('.mostPopular').html(rcode);
		}) // each

		$(".product2").slice(0, 4).show();
	  $(".bestButton").click(function(e){ 
		  e.preventDefault();
		  $(".product2:hidden").slice(0, 4).show();
		  if($(".product2:hidden").length == 0){
			  alert("더이상 표시할 상품이 없습니다.");
			 }
		  });
		
	}, 
	error : function(xhr){
		alert("상태 : " + xhr. status)
	},
	dataType: "json"
  })//ajax

})


$(function(){
	
		
  $.ajax({
	url : "/kreamv/newProdList.do",
	type: "get",
	success: function(res){
		
		rcode = "";
		$.each(res, function(i,v){
				rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
				rcode += v.prod_id;
				rcode += "'><div class='product3'>";
				rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
				rcode += '<a class="pdTitle">'+ v.prod_brand +'</a><br>';
				rcode += '<a>'+ v.prod_enm+'</a><br>';
				
				var rprice = v.prod_rprice;
 				rcode += '<a>'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';

				rcode += '</div></a></div>';
				$('.newIn').html(rcode);
		}) // each
		  $(".product3").slice(0, 4).show();
		  $(".newButton").click(function(e){ 
			  e.preventDefault();
			  $(".product3:hidden").slice(0, 4).show();
			  if($(".product3:hidden").length == 0){
				  alert("더이상 표시할 상품이 없습니다.");
				 }
			  });
		
	}, 
	error : function(xhr){
		alert("상태 : " + xhr. status)
	},
	dataType: "json"
  })//ajax

})


</script>


</head>

<body> 

<%
      SampleMemberVO vo =  (SampleMemberVO)session.getAttribute("loginMember");

%>
<jsp:include page="managerHeader.jsp"></jsp:include>
<!-- 	<ul class="nav justify-content-end"> -->
<!-- 	  <li class="nav-item"> -->
<%-- 	    <a class="nav-link " href="<%=request.getContextPath()%>/view/managerBoard.jsp">게시판&고객관리</a> --%>
<!-- 	  </li> -->
<!-- 	  <li class="nav-item"> -->
<%-- 	    <a class="nav-link" href="<%=request.getContextPath()%>/view/updateProd.jsp">상품등록</a> --%>
<!-- 	  </li> -->
<!-- 	  <li class="nav-item"> -->
<%-- 	    <a class="nav-link" href="<%=request.getContextPath()%>/examinationManager.do">검수관리</a> --%>
<!-- 	  </li> -->
<!-- 	  <li class="nav-item"> -->
<%-- 	    <a class="nav-link" href ="<%=request.getContextPath()%>/Memberlogout.do">로그아웃</a> --%>
<!-- 	  </li> -->
	</ul>


 	<hr>
 	<nav class="nav">
<!--   <a class="navbar-brand" href="#"> -->
<!--     <img src="../images/kreamv_logo.png" width="180" height="40" class="d-inline-block align-top" alt=""> -->
<!--   </a> -->
 	
  <div class="container">
  
<!--   <ul class="nav justify-content-end"> -->
<!--  <li class="nav-item"> -->
<%--       <a class="nav-link" href="<%=request.getContextPath() %>/styleGramList.do?type=1">STYLE</a> --%>
<!--     </li> -->
<!--     <li class="nav-item"> -->
<%--       <a class="nav-link" href="<%=request.getContextPath()%>/allProdList.do">SHOP</a> --%>
<!--     </li> -->
<!--     <li class="nav-item"> -->
<!--       <a class="nav-link" href="#">ABOUT</a> -->
<!--     </li> -->
<!--     <li class="nav-item"> -->
<!--       <a class="nav-link" href="#"> -->
<!--       <img src="../images/돋보기.png" width="30" height="30" class="d-inline-block align-top" alt=""> -->
<!--       </a> -->
<!--     </li> -->
<!--   </ul> -->
</div>
</nav>

<div id="carouselExampleIndicators" class="carousel slide slideSize" data-ride="carousel"  data-interval="3000">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/images/나이키 X 루이비통.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/바시티.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/나이키 X 빌리아일리시.jpg" class="d-block w-100" alt="...">
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
<!--  <div class = "shortCut_items">
	 <div class = "shortCut_item">
	 		<div class = "shortCut_item_img">
	 		<a href = "<%=request.getContextPath()%>/menRecommendList.do">
	 			<img src ="/kreamv/images/남성추천.PNG" width="40%">
	 		</a>
	 		</div>
	 		<div class = "shortCut_item_title">남성추천</div>
	 </div>
	 <div class = "shortCut_item">
	 		<div class = "shortCut_item_img">
	 		<a href = "<%=request.getContextPath()%>/womenRecommendList.do">
	 			<img src ="/kreamv/images/여성추천.PNG" width="40%">
	 		</a>
	 		</div>
	 		<div class = "shortCut_item_title">여성추천</div>
	 </div>
<!-- 	 <div class = "shortCut_item"> -->
<!-- 	 		<div class = "shortCut_item_img"> -->
<!-- 	 		<a href = "#"> -->
<!-- 	 			<img src = "../images/정가아래 이미지.png" width="40%"> -->
<!-- 	 		</a> -->
<!-- 	 		</div> -->
<!-- 	 		<div class = "shortCut_item_title">시세보다 낮은 상품</div> -->
<!-- 	 </div> -->
<!--  </div>-->

	<br><hr>
	<h4>Just Dropped</h4>
	<a class="titleName">발매 상품</a>
<div class = "justDropped productList">

</div>
<input type="button" value="more" class="btn btn-outline-light text-dark droppedButton">

	<br><hr>
	<h4>BEST</h4>
	<a class="titleName">인기 상품</a>
<div class = "mostPopular productList">

</div>

<input type="button" value="more" class="btn btn-outline-light text-dark bestButton">

	<br><hr>
	<h4>New Product</h4>
	<a class="titleName">신규 등록 상품</a>
<div class = "newIn productList">
	<hr>
</div>
<input type="button" value="more" class="btn btn-outline-light text-dark newButton">

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>