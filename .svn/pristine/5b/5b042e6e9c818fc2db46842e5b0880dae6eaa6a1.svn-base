<%@page import="kr.co.kreamv.vo.ProdDetailVO"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 배송/결제</title>
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
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
	
	.confirmbutton{
	margin-top: 10px;
	margin-right: 50px;
	
	}
	
	.shortCut_items{
		display : flex;
	}
	
	.container2{
		display: flex;
		justify-content: center;
	}
	
	.detail{
		justify-content: center;
	}
	
	.prod1 {		
		width: 150px;
	}
	
	.prod2 {		
		width: 300px;
	}
	
	.check{
		width: 25px;
		height: 25px;
		float: right;
		accent-color: black;
	}
	
	.data{
 		display : none; 
	}
	
	.buyButton{
		margin-left: 45%;
	}
	.totalPrice,  .totalPrice:hover{
		float: right;
		color : #ED0000;
		font-size: 1.3em;	
		font-weight : bold;
		text-decoration: underline;
	}
	
	.priceContent{
		color : #A6A6A6;
		font-size: 0.8em;
		width: 100px;
	}
	
	.priceContent2, .priceContent2:hover{
		color: black;
		text-decoration: none;
	}

</style>


<%
int sellType = (int)request.getAttribute("sellType");
int price = sellType==1? (int)request.getAttribute("buy_bid_price"):(int)request.getAttribute("sell_bid_price");
ProdVO prodVo = (ProdVO)request.getAttribute("prodVo");
ProdDetailVO prodDetailVo = (ProdDetailVO)request.getAttribute("prodDetailVo");
 %>

</head>
<body>
<jsp:include page="mainheader.jsp"></jsp:include>
 	
 	<nav class="nav">
  <a></a>
  	
   <h3><b>판매 확인</b></h3>
<!--   <span><input class="confirmbutton" type="button" value="검수기준"></span> -->
   <input type="button"  class="btn btn-outline-light text-dark"
		         data-toggle="modal" data-target="#confirmModal"  value="검수기준" >
 	</nav>
<hr>

<div class="container2">
  <div class = "detail">
  	<table>
  	 <tr>
	  <td class="prod1">
  	   <img alt="<%=prodVo.getProd_brand() %>" src="<%=request.getContextPath() %>/images/<%=prodVo.getProd_photo1() %>" width="100px" height="100px" >
	  </td>
	 <td class="prod2">
	   <a><b><%=prodVo.getProd_id()%></b></a><br>
	   <a><%=prodVo.getProd_enm() %></a><br>
       <a><%=prodVo.getProd_knm() %></a><br>
       <a><b><%=prodDetailVo.getDetail_size() %></b></a>
	 </td>   	
  	</tr>
  	</table>
  	
  	<hr>
		<div>
		<div>
	   <h4>최종 주문 정보</h4>
	   <a ><b>총 결제 금액</b></a><a class="totalPrice">0원</a>
	   <hr>
	   </div>
	   <%if(sellType==0) {%>	   
	   <label class="priceContent">희망 판매가</label>
	   	<%} else {%>
	   <label class="priceContent">즉시 판매가</label>
	   	<%} %>
	   		<% 
	      String amount = String.valueOf(price);
	      amount = amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	    	 %>
	   	<a class="priceContent2"><%=amount%>원</a><br>
	   <hr>
	   <%if(sellType==0) {%>
	   <label class="priceContent">입찰 마감 기한</label> <a>~<%=request.getAttribute("sell_bid_fdate") %>까지</a>
	   <%} %>
		</div>
	<hr>
	<table>
	 <tr><td>
	 <h4>판매 확인</h4>
	 </td></tr>
	</table>
			<table>
		<tr>구매자의 구매거부, 결제지연  등의 사유가 발생할 경우, 거래가 취소될 수 있습니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>국내/해외에서 발매한 정품 · 새상품입니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>창고 보관을 선택한 경우, 구매자에게 배송되지 않고 KREAM 창고에 보관됩니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr>‘바로 결제하기’ 를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 취소가 불가능합니다. <input class="check" type="checkbox"></tr>
		<hr>
		<tr><b>구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</b> <input class="check" type="checkbox"></tr>
		<hr>
		</table><br>
		<a><b>총 결제금액</b></a> <a ><b class="totalPrice">0원</b></a>
  	<%if(sellType==0) {%>	<!-- 판매 입찰 등록일 경우 -->
	  <form action="<%=request.getContextPath() %>/insertSellBid.do" method="get">
      	<input type="text" class="data" name="sell_bid_fdate" value="<%=request.getAttribute("sell_bid_fdate")%>">
		<input type="text" class="data" name="detail_id" value="<%=prodDetailVo.getDetail_id()%>">
	<%} else {%>		<!-- 즉시 판매일 경우 -->
	  <form action="<%=request.getContextPath() %>/insertOrders.do" method="get">
      	<input type="text" class="data" name="type" value="sell">
      	<input type="text" class="data" name="buy_bid_id" value="<%=request.getAttribute("buy_bid_id")%>">
	<%} %>
		<input type="text" class="data" name="prod_id" value="<%=prodVo.getProd_id()%>">
	  	<input type="text" class="data" name="storeType" value="<%=request.getAttribute("storeType")%>">
      	<input type="text" class="data" name="price" value="<%=price%>">
		<input type="text" class="data" name="confirm_id" value="<%=request.getAttribute("confirm_id")%>">
		<br><br><br><input class="buyButton btn btn-dark" type="submit" value="결제하기">
      </form>
	</div><br><br>
	
</div>


 <!--  검수 기준 모달창 -->
<div class="modal" id="confirmModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">검수 기준</h4>
        <button type="button" class="close" data-dismiss="modal"></button>
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