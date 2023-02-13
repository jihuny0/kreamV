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

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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
	
		.data{
 		display : none; 
	}
	
	.buyButton{
		margin-left: 45%;
	}
	
	.totalPrice, .totalPrice:hover{
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
	#addrDetail{
		color : #A6A6A6;
		font-size: 0.8em;
		width: 70px;
	}
	
	.payImg{
		margin-left: 30%;
	}

</style>



<%
SampleMemberVO vo =  (SampleMemberVO)request.getAttribute("memberVo");
ProdVO prodVo = (ProdVO)request.getAttribute("prodVo");
ProdDetailVO prodDetailVo = (ProdDetailVO)request.getAttribute("prodDetailVo");
int price = Integer.parseInt(request.getParameter("price"));
%>
 
 <script>
$(function(){
	$('#pointWrite').on('change', function(){
		$('#pointInsert').text($(this).val());
		$('.totalPrice').text(<%=price%>-$(this).val());
	})
	
	$('.buyButton').on('click', function(){
		const rand1 = Math.random()*1000;
		const rand2 = Math.random()*1000;
		const rand3 = Math.random()*1000;
		dataTemp = Math.floor(rand1)+""+Math.floor(rand2)+""+Math.floor(rand3);
		payment();
	})
}) 

	function payment(){
		  IMP.init('imp64756853');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
		    IMP.request_pay({// param
		        pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
		        pay_method: "card", //지불 방법
		        merchant_uid: "iamport_test_id11"+dataTemp, //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
		        name: "<%=prodDetailVo.getDetail_id()%><%=prodDetailVo.getDetail_size()%>", //결제창에 노출될 상품명
		        amount: $('#payPrice').text(), //금액
		        buyer_email : '<%=vo.getMem_mail()%>', 
		        buyer_name : '<%=vo.getMem_nm()%>',
		        buyer_tel : '<%=vo.getMem_hp()%>'
		    }, function (rsp) { // callback
		        if (rsp.success) {
		            alert("결제가 완료되었습니다.");
		            //location.href="<%=request.getContextPath() %>/insertBuyBid.do";
		            //$("#payForm").trigger("submit");
		            $("#payForm").get(0).submit();
		            
		        } else 
		        {
		            alert("결제 실패!");
		        }
		    })
	}
 </script> 

</head>
<body>
<jsp:include page="mainheader.jsp"></jsp:include>
 	
 	<nav class="nav">
  <a>
  </a>
  	
   <h3><b>배송 / 결제</b></h3>
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
  	<h4>반송 주소</h4>
<!--   	 <input type="button" value="배송지 추가" onclick="addsearch()"><br> -->
  	  <label id="addrDetail">받는 분</label><a><%=vo.getMem_nm() %></a><br>
  	 <label id="addrDetail">연락처</label><a><%=vo.getMem_hp() %></a><br>
  	 <label id="addrDetail">배송 주소</label><a><%=vo.getMem_addr1() %> <%=vo.getMem_addr2() %></a>
  	</div>
  	
  	<hr>
  	<div>
  	<h4>포인트</h4>
  	  <a class="priceContent">보유 포인트 <%=vo.getMem_point() %></a><br>
  	  <a><input type="number" id="pointWrite" style = "text-align:right;"> point</a>
  	</div>
	<hr>
	
		<div>
	   <h4>최종 주문 정보</h4>
	   <a><b>총 결제 금액</b></a>
		<% 
	      String amount = String.valueOf(price);
	      amount = amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	    %>
	   <a class="totalPrice"><%=amount %>원</a>
	   </div>
	   
	   <hr>
	   
	   <div>
	   <label class="priceContent">상품 수</label>  <a><%=request.getParameter("qty") %>개</a><br>
	   <label class="priceContent">보증금</label>  <a><%=request.getParameter("price") %>원</a><br>
	   <label class="priceContent">포인트</label>  <a id="pointInsert">0</a>point<br>
		</div>	
	<hr>
	<div>
	 <h4>결제 방법</h4>
	 	 <a class="payImg"><img src="<%=request.getContextPath() %>/images/kakao.png" width="35%"></a>
	</div>
	<hr>
	<div>
		<a><b>총 결제금액</b></a> <a id="payPrice" class="totalPrice"><%=price %>원</a>
	  <form id="payForm" action="<%=request.getContextPath() %>/insertConfirm.do" method="get">
		<input type="text" class="data" name="prod_id" value="<%=prodVo.getProd_id()%>">
      	<input type="text" class="data" name="qty" value="<%=request.getAttribute("qty")%>">
      	<input type="text" class="data" name="detail_id" value="<%=prodDetailVo.getDetail_id()%>">
      	<input type="text" class="data" name="mem_id" value="<%=vo.getMem_id()%>">
		<br><input class="buyButton btn btn-dark" type="button" value="결제하기">
      </form>
	</div>
	</div>
	
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