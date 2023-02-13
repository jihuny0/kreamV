<%@page import="kr.co.kreamv.vo.ProdDetailVO"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="kr.co.kreamv.vo.SellBidVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 검수 신청 하기</title>
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
	
.nav{
	display : flex;
	justify-content: space-between
	}
	
.container2{
	margin-left: 40%;
	flex-direction: column;
	width: 500px;
	}
	
.prod1 {		
	width: 150px;
	}
	

.button {
	width: 49%;
}

.button2{
	width: 13%;
	margin: 20px;
}

.button3{
	width: 99%;
	
}

#deadLine{
	border : none;
	border-bottom : 1px solid black;
}

.detailIdBtn{
	display : none;
}

.price{
	border : none;
	margin-left: 45%;
	text-align :left;
	width: 100px;
}	

#qty{
	text-align :left;
	margin-left: 55%;
	width: 70px;
}

.text1{
	color: 	#8C8C8C;
	font-size: 0.8em;
	margin-left: 50%;
}
	

</style>  

<script>
$(function(){
	$('#qty').on("change", function(){
		$('.price').val($(this).val()*3000)
	})
})
</script>

<%
ProdDetailVO prodDetailVo = (ProdDetailVO)request.getAttribute("prodDetailVo");
ProdVO prodVo = (ProdVO)request.getAttribute("prodVo");
%>
</head>
<body>

</head>
<body>
<jsp:include page="mainheader.jsp"></jsp:include>
 	
 	<nav class="nav">
  
<!--  즉시 구매하기 (기본설정) -->
<a></a>
  <h3><b>검수 신청 하기</b></h3>
<!--   <span><input class="confirmbutton" type="button" value="검수기준"></span> -->
   <input type="button"  class="btn btn-outline-light text-dark" 
		         data-toggle="modal" data-target="#confirmModal"  value="검수기준">
 	</nav>
<hr>

<div class="container2"> 
		
		<!-- 상품정보창 -->
		<table>
  	 <tr>
	  <td class="prod1">
  	   <img alt="<%=prodVo.getProd_brand() %>" src="/kreamv/images/<%=prodVo.getProd_photo1() %>" width="100px" height="100px" >
	  </td>
	 <td class="prod2">
	   <a><b><%=prodVo.getProd_id()%></b></a><br>
	   <a><%=prodVo.getProd_enm() %></a><br>
       <a><%=prodVo.getProd_knm() %></a><br>
       <a><b><%=prodDetailVo.getDetail_size() %></b></a><br>
	 </td>   	
  	</tr>
  	</table>
   <hr> 
   <a class="text1">보관을 원하는 상품의 개수를 입력하세요.</a><br>
   <form action="<%=request.getContextPath() %>/confirmTemp.do"  method="get">
   상품 사이즈 <b><%=prodDetailVo.getDetail_size() %></b>
   <input id="qty" name="qty" type="number" value="1" style = "text-align:right;">개
   <hr> 
  
   보증금(3,000원/건)
   <input class="price" type="text" name="price" value="3000" style="text-align:right; font-weight: bold;">원
   <br><br>
   <input class="button3 btn btn-dark" id="confirmGo" type="submit" value="보관 신청 계속">
   
   <!-- 필요한 정보들 -->
   	<input type="text" class="detailIdBtn" name="datail_id" value="<%=prodDetailVo.getDetail_id()%>">
	<input type="text" class="detailIdBtn" name="prod_id" value="<%=prodVo.getProd_id()%>">
   </form>
</div>   
</body>
</html>