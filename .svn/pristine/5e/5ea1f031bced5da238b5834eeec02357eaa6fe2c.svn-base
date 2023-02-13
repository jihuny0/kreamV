<%@page import="java.util.List"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>KreamV | 여성 추천 상품</title>
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
	
	.title{
		text-align: center;
	}

	.title2{
		text-align: center;
		color: #8C8C8C;
	}
	
	a {
		color: black;
	}
	
	
	.image{
		margin-bottom: 10px;
		border-radius: 8px;
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
	

</style>

</head>
<body>
<%
	  List<ProdVO> womenRecommendList = (List<ProdVO>)request.getAttribute("womenRecommendList"); 
%>
	<jsp:include page="mainheader.jsp"></jsp:include>
<br><br><h2 class="title"><b>여성 추천 컬렉션</b></h2>
<h5 class="title2">KreamV에서 추천하는 인기 상품</h5><br>

<div  class="productList">

<%
for(ProdVO prodVo : womenRecommendList){ 
%>

<div>
<a href='<%=request.getContextPath()%>/getProd.do?prodId=<%=prodVo.getProd_id()%>'>
	<div class="product">
		<img src="/kreamv/images/<%=prodVo.getProd_photo1()%>" width="200px" height="200px" class="image"><br>
		<a><%=prodVo.getProd_brand()%></a><br>
		<a><%=prodVo.getProd_enm()%></a><br>
		    <a class="pdPrice"><% 
            String amount = String.valueOf(prodVo.getProd_rprice());
            amount = amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
            %></a><br>
	</div>
</a>
</div>
<%	
	} 
%>
</div>



</body>
</html>