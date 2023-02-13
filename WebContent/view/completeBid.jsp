<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kreamv | 안전한 중고 거래</title>
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
	
	h3{
		text-align: center;
	}
	
	.container2{
		display : flex;
		justify-content: center;
	}
	
	.title{
		width: 100px;
		font-weight: bold;
	}
	
	.prod1, .prod2{
		padding: 30px;
	}
	
	.button{
		margin-left: 35%;
	
	}
	
		.image{
		border-radius: 8px;
	}
	
	
	
</style>


</head>

<body> 
<jsp:include page="mainheader.jsp"></jsp:include>
<%
ProdVO prodVo = (ProdVO)request.getAttribute("prodVo");
int completeType = (int)request.getAttribute("completeType");
%>
<br>
<h3><b>
<%if(completeType==1){  		//검수 완료%>	
상품 검수</b></h3>
<div class="container2">
	<div>
	<hr><br>
	<h3><b>검수 신청이 완료되었습니다.</b></h3><br>
<%}else if(completeType==2){	// 결제 완료%>
상품 구매</b></h3>
<div class="container2">
	<div>
	<hr><br>
	<h3><b>상품 구입이 완료되었습니다.</b></h3><br>
<%}else if(completeType==3){ 	// 입찰 완료%>
상품 입찰</b></h3>
<div class="container2">
	<div>
	<hr><br>
	<h3><b>상품 입찰이 완료되었습니다.</b></h3><br>
<%}else{ 						// 구매자 결제 대기 중%>
상품 판매</b></h3>
<div class="container2">
	<div>
	<hr><br>
	<h3><b>구매자 결제 대기 중 입니다.</b></h3><br>
<%} %>

	
	
	<table>
    <tr>
     <td class="prod1">
  	<img class="image" alt="<%=prodVo.getProd_brand() %>" src="<%=request.getContextPath() %>/images/<%=prodVo.getProd_photo1() %>" width="150" height="150" >
  	 </td>
  	 <td class="prod2">
	<a><b><%=prodVo.getProd_id()%></b></a><br>
	<a><%=prodVo.getProd_enm() %></a><br>
	<a><%=prodVo.getProd_knm() %></a>
     </td>
    </tr>
   </table>
   <hr>
	<div class="button">
	<input type="button" class="btn btn-dark" value="main" onclick="location.href='<%=request.getContextPath()%>/view/main.jsp'">
	<input type="button" class="btn btn-dark" value="shop" onclick="location.href='<%=request.getContextPath()%>/allProdList.do'">
	</div>
	</div>
</div>

</body>
</html>