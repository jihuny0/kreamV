<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="kr.co.kreamv.vo.ProdDetailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 약관 동의</title>
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
		display: flex;
		justify-content: center;
	}
	
	.check{
		width: 25px;
		height: 25px;
		float: right;
		accent-color: black;
	}

	.buyGo{
		width: 100%;
		height: 50px;
	}

	.prod1 {		
		width: 150px;
	}
	
	.prod2 {		
		width: 300px;
	}
	
	.data{
		display : none;
	}
	
	h2{
		text-align: center;
	
	}

</style> 
<%
	int type = (int)request.getAttribute("type");
	ProdDetailVO prodDetailVo = (ProdDetailVO)request.getAttribute("prodDetailVo");
	ProdVO prodVo = (ProdVO)request.getAttribute("prodVo");
%>

<script>
$(function(){
	
	$('input[type="submit"]').on('click', function() {

		checkbox = $('.check')
		checkboxIterator = $('.check').length;
	

		for(i=0;i<checkboxIterator;i++){
			if(!checkbox.eq(i).is(':checked')){
				alert('모든 이용약관을 체크해주세요');
				return false;
			}
		}
		
	})
	
})
</script>

</head>
<body>
<jsp:include page="mainheader.jsp"></jsp:include>
 	
 	<nav class="nav">
  <a></a>
  <h3><b>
  	<%if(type==0) {%>
	구매 동의
	<%}else if(type==1){ %>
	보관 신청 동의
	<%} else {%>
	판매 동의
	<%} %>
  </b></h3>
   <input type="button"  class="btn btn-default" 
		         data-toggle="modal" data-target="#confirmModal"  value="검수기준">
 	</nav>
<hr>

<div class="container2">
	<div class="detail">
	<h2><b>
	<%if(type==0) {%>
	구매하시기 전에 꼭 확인하세요.
	<%}else if(type==1){ %>
	보관신청하시기 전에 꼭 확인하세요.
	<%} else{%>
	판매하시기 전에 꼭 확인하세요.
	<%} %>
	</b></h2>
	<hr>
	  	<table>
  	 <tr>
	  <td class="prod1">
  	   <img alt="<%=prodVo.getProd_brand() %>>" src="./images/<%=prodVo.getProd_photo1() %>" width="100px" height="100px" >
	  </td>
	 <td class="prod2">
	   <a><b><%=prodDetailVo.getProd_id()%></b></a><br>
	   <a><%=prodVo.getProd_enm() %></a><br>
       <a><%=prodVo.getProd_knm() %></a><br>
       <a><b><%=prodDetailVo.getDetail_size() %></b></a>
	 </td>   	
  	</tr>
  	</table>
  	<hr>
	  	<%if(type==0) {%>
	<form method="post" action='<%=request.getContextPath()%>/sellBidInfo.do?detail_id=<%=prodDetailVo.getDetail_id()%>'>
		<table>
		<tr>구매하려는 상품이 맞습니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>국내/해외에서 발매한 정품 · 새상품입니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.&nbsp;&nbsp; <input class="check" type="checkbox"></tr>
		<hr>
		<tr>패키지(포장) 개봉 검수에 대한 주의사항을 확인합니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>KREAMV의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다. <input class="check" type="checkbox"></tr>
		<hr>

		</table>
				
		<input class="buyGo btn btn-dark" type="submit" value="구매 계속" >
	</form>
	<%}else if(type==1){ %>
	<form method="post" action='<%=request.getContextPath()%>/confirmInfo.do?detail_id=<%=prodDetailVo.getDetail_id()%>'>
		<table>
		<tr>보관 신청하려는 상품이 맞습니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>국내/해외에서 발매한 정품 · 새상품입니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.&nbsp;&nbsp; <input class="check" type="checkbox"></tr>
		<hr>
		<tr>이중 포장하여 선불 발송합니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>KREAMV의 최신 이용정책을 모두 확인하였으며, 판매를 계속합니다. <input class="check" type="checkbox"></tr>
		<hr>

		</table>
				
		<input class="buyGo btn btn-dark" type="submit" value="보관 계속" >
	</form>
	<%} else{%>
	<form method="post" action='<%=request.getContextPath()%>/buyBidInfo.do?'>
		<table>
		<tr>판매하려는 상품이 맞습니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>국내/해외에서 발매한 정품 · 새상품입니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.&nbsp;&nbsp; <input class="check" type="checkbox"></tr>
		<hr>
		<tr>패키지(포장) 개봉 검수에 대한 주의사항을 확인합니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>KREAMV의 최신 이용정책을 모두 확인하였으며, 판매를 계속합니다. <input class="check" type="checkbox"></tr>
		<hr>

		</table>
		<input class="data" type="text" name="type" value="<%=request.getAttribute("type")%>">
		<input class="data" type="text" name="confirm_id" value="<%=request.getAttribute("confirm_id")%>">
		<input class="data" type="text" name="detail_id" value="<%=prodDetailVo.getDetail_id()%>">
		<input id="sellGo" class="buyGo btn btn-dark" type="submit" value="판매 계속" >
	</form>
	<%} %>
	</div>
<br>
</div>

<!-- The Modal -->
<div class="modal" id="confirmModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">검수 기준</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <div>
		KREAMV의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로 업데이트 되고 있습니다.<br> 
		거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br>
		회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br>
  
 		 </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>