<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | SHOP</title>
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

.productList{
	display:inline-flex;
	flex-flow: row wrap;
	justify-content :flex-start;
	margin-right: 20%;
	margin-left: 20%;
}

.product{
	width: 200px;
	margin : 40px;
}

.subject{
	display:flex;
	justify-content :space-between;
	margin-left: 23%;
	margin-right: 25.5%;
}
.subject{
	display:flex;
	justify-content :space-between;
	margin-left: 22%;
	margin-right: 23%;
}

.title{
	text-align: center;
}

a {
	color: black;
}

.image{
	margin-bottom: 10px;
	border-radius: 8px;
}


input{
	width: 100px;
}

.button{
	display:inline-flex;
	justify-content : space-between;
}

.priceTitle{
	text-align: right;
}

h6{
	font-size: 0.8em;
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
	
	#search{
	margin-left: 67.5%;
	margin-bottom: 10px;
	}
	
	
	
/* 	.search2{ */
/* 	width: 50px; */
/* 	height: 30px; */
/* 	font-size: 0.7em; */
	
/* 	} */
	

</style>

<script>
$(function(){
	$(".lowPrice").on("click", function(){
		
	  $.ajax({
		url : "/kreamv/lowPriceList.do",
		type: "get",
		success: function(res){
			
			rcode = "";
			$.each(res, function(i,v){
					rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
					rcode += v.prod_id;
					rcode += "'><div class='product'>";
					rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
					rcode += '<a  class="pdTitle">'+ v.prod_brand +'</a><br>';
					rcode += '<a>'+ v.prod_enm+'</a><br>';
					var rprice = v.prod_rprice;
	 				rcode += '<a class="pdPrice">'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';
					rcode += '</div></a></div>';
					$('.productList').html(rcode);
			}) // each
			
		}, 
		error : function(xhr){
			alert("상태 : " + xhr. status)
		},
		dataType: "json"
	  })//ajax
	

	})
	
	
	$(".highPrice").on("click", function(){
		
	  $.ajax({
		url : "/kreamv/highPriceList.do",
		type: "get",
		success: function(res){
			
			rcode = "";
			$.each(res, function(i,v){
					rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
					rcode += v.prod_id;
					rcode += "'><div class='product'>";
					rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
					rcode += '<a class="pdTitle">'+ v.prod_brand +'</a><br>';
					rcode += '<a>'+ v.prod_enm+'</a><br>';
					var rprice = v.prod_rprice;
	 				rcode += '<a  class="pdPrice">'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';
					rcode += '</div></a></div>';
					$('.productList').html(rcode);
			}) // each
			
		}, 
		error : function(xhr){
			alert("상태 : " + xhr. status)
		},
		dataType: "json"
	  })//ajax
	

	})
	
	
		$(".brandNm").on("click", function(){
	  $.ajax({
		url : "/kreamv/brandProdList.do?brand_nm="+$(this).val(),
		type: "get",
		success: function(res){
			
			rcode = "";
			$.each(res, function(i,v){
					rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
					rcode += v.prod_id;
					rcode += "'><div class='product'>";
					rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
					rcode += '<a class="pdTitle">'+ v.prod_brand +'</a><br>';
					rcode += '<a>'+ v.prod_enm+'</a><br>';
					var rprice = v.prod_rprice;
	 				rcode += '<a  class="pdPrice">'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';
					rcode += '</div></a></div>';
					$('.productList').html(rcode);
			}) // each
			
		}, 
		error : function(xhr){
			alert("상태 : " + xhr. status)
		},
		dataType: "json"
	  })//ajax
	

	})
	  //검색
		$("#searchBtn").on("click",function(){
			var searchProd = $("#searchProd2").val();
			$.ajax({
				url : "/kreamv/searchProdList.do?search="+searchProd,
				success : function(res){
					rcode = "";
					$(".productList").empty();
					$.each(res, function(i,v){
							rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
							rcode += v.prod_id;
							rcode += "'><div class='product'>";
							rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
							rcode += '<a class="pdTitle">'+ v.prod_brand +'</a><br>';
							rcode += '<a>'+ v.prod_enm+'</a><br>';
							var rprice = v.prod_rprice;
			 				rcode += '<a  class="pdPrice">'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';
							rcode += '</div></a></div>';
					}) // each
					console.log(rcode);
					$('.productList').html(rcode);
				},
				
					
			}); // end of ajax
			
	 <%--  $.ajax({
		url : "/kreamv/searchProdList.do?search="+$(this).val(),
		type: "get",
		success: function(res){
			
			rcode = "";
			$.each(res, function(i,v){
					rcode += "<div><a href='<%=request.getContextPath()%>/getProd.do?prodId=";
					rcode += v.prod_id;
					rcode += "'><div class='product'>";
					rcode += '<img src="/kreamv/images/'+v.prod_photo1+'" alt="'+v.prod_photo1+'" width="200px" height="200px" class="image"><br>';
					rcode += '<a class="pdTitle">'+ v.prod_brand +'</a><br>';
					rcode += '<a>'+ v.prod_enm+'</a><br>';
					var rprice = v.prod_rprice;
	 				rcode += '<a  class="pdPrice">'+ rprice.toLocaleString( 'ko-KR' ) +'원</a>';
					rcode += '</div></a></div>';
					$('.productList').html(rcode);
			}) // each
			
		}, 
		error : function(xhr){
			alert("상태 : " + xhr. status)
		},
		dataType: "json"
	  })//ajax
	 --%>

	})
	
	
	
	
	})
	


</script>

<%
List<ProdVO> allProdList = (List<ProdVO>)request.getAttribute("allProdList"); 
List<ProdVO> brandProdList = (List<ProdVO>)request.getAttribute("brandProdList"); 
List<ProdVO> highProdList = (List<ProdVO>)request.getAttribute("highProdList"); 
List<ProdVO> lowProdList = (List<ProdVO>)request.getAttribute("lowProdList"); 
List<ProdVO> searchProdList = (List<ProdVO>)request.getAttribute("searchProdList"); 
%>

</head>
<body>
<%	
	SampleMemberVO vo =  (SampleMemberVO)session.getAttribute("loginMember");
	if(vo!=null&&vo.getMem_id().equals("admin")){
%>
	<jsp:include page="managerHeader.jsp"></jsp:include>
<%	
	}else{
%>
	<jsp:include page="mainheader.jsp"></jsp:include>	
<%
	}
%>

<br><h2 class="title"><b>SHOP</b></h2><br><br>
	

	<div class="subject">
     <h6><b>브랜드명</b></h6><h6 class="priceTitle"><b>가격</b></h6>
   </div>
      
      
	<div class="subject">
      
      <div>
      <input class="brandNm btn btn-dark" type="button" value="nike">
      <input class="brandNm btn btn-dark" type="button" value="adidas">
      <input class="brandNm btn btn-dark" type="button" value="Supreme">
      </div>
      
      
      	 <div id ="search2"> 
      	 <input type="text" id="searchProd2" style="border-width: 0 0 2px 0; border-style: solid; width: 150px;">
         <input type = "button" class="btn btn-dark search2" id = "searchBtn" value = "검색" style="width: 55px; font-size: 0.8em; bor">
        </div>
      
		<div>
      <img src="<%=request.getContextPath()%>/images/low.png" alt="낮은 가격" width="40px" height="40px" class="lowPrice"  style="cursor: pointer">
      <img src="<%=request.getContextPath()%>/images/high.png" alt="높은 가격" width="40px" height="40px" class="highPrice"  style="cursor: pointer" >
		</div>      
	
     </div>
      
   
<div class="productList">

<%
for(ProdVO prodVo : allProdList){ 
%>

<div>
<a href='<%=request.getContextPath()%>/getProd.do?prodId=<%=prodVo.getProd_id()%>'>
	<div class="product">
		<img src="/kreamv/images/<%=prodVo.getProd_photo1()%>" width="200px" height="200px" class="image"><br>
		<a class="pdTitle"><%=prodVo.getProd_brand()%></a><br>
		<a><%=prodVo.getProd_enm()%></a><br>
		    <% 
            String amount = String.valueOf(prodVo.getProd_rprice());
            amount = amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
            %>
		<a class="pdPrice"><%=amount%>원</a><br>
	</div>
</a>
</div>
<%	
	} 
%>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>