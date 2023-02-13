<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.kreamv.vo.ProdDetailVO"%>
<%@page import="kr.co.kreamv.vo.SellBidVO"%>
<%@page import="java.util.List"%>
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
	
	.btn btn-default{
		margin-top: 10px;
		margin-right: 100px;
	}
	
	.asdf{
		width : 80%;
		margin-left : 200px;
		height : 500px;
	}

	.navbar-brand{
		padding-left: 30px;
	}
	.detail{
		width : 50%;
		text-align : center;
	}
	.detail-size{
		width : 100%;
		display : flex;
		justify-content: flex-between;

	}
	.prod-size{
		width : 33%;
		height : 50px;
		background-color : white;
		border : none;
		margin : 2px;
	}
	
	.prod1 {		
		width: 250px;
	}
	
	.prod2 {		
		width: 300px;
		text-align : left;
	}
	
	.buybutton{
		width: 80%;
	}
 	.sellbutton{ 
 		width: 50%; 
 		margin-right : 5px;
 	} 
	.radioBtn{
	  accent-color: black;
	}
	.prodTd{
		width : 250px;
	}
	.sellDiv{
		display : flex;
	}
	.sellBtn{
		width : 100%;
	}
	img{
		border-radius: 8px;
	}

</style>

<%
int type = (int)request.getAttribute("type");
List<ProdDetailVO> prodDetailList = (List<ProdDetailVO>)request.getAttribute("prodDetailList"); 
ProdVO prodVo = (ProdVO)request.getAttribute("prodVo");
SampleMemberVO vo =  (SampleMemberVO)session.getAttribute("loginMember");

if(type==0){
// HashMap<String, Integer> BidPrice = (HashMap<String, Integer>)request.getAttribute("sellBidMap"); 	
}else{
// HashMap<String, Integer> BidPrice = (HashMap<String, Integer>)request.getAttribute("buyBidMap"); 		
}
%>

<script>
$(function(){
	$('.prod-size').on('click', function(){
		detail_id=$(this).attr('id');
		<%if(type==0){%>
		  code="<form method='post' action='<%=request.getContextPath()%>/getProdDetail.do?type=0&detail_id=";
		  code+=detail_id;
		  code+=`'><input class="buybutton btn btn-dark" type="submit" value="구매하기">`;
		  code+=`</form>`;
		$('#buyBtn').html(code);			
		<%}else if(type==1){%>
		idx = $(this).attr('id');
		  code='<div class="sellDiv">';
		  code+="<form class='sellbutton' method='post' action='<%=request.getContextPath()%>/getProdDetail.do?type=1&detail_id=";
		  code+=detail_id;
		  code+=`'><input class="sellBtn btn btn-dark" type="submit" value="검수하기"></form>`;
		  code+=`<input class="sellbutton btn btn-dark" type="button" id="sellBtn" value="판매하기">`;
		  code+="</div>";
		$('#buyBtn').html(code);			
		<%}%>
	})
	

	$(document).on('click', '#sellBtn', function(){
		$.ajax({
			url : '/kreamv/getSellableStoreList.do',
			type : 'post',
 			data : {'mem_id' : '<%=vo.getMem_id()%>', 'detail_id' : idx},
			success : function(res){
				codeS ="";
				codeB ="";
				
				if(res==null||res.size==0){	<%--보관 상품이 없다면--%>
					codeS+="보관중인 상품이 없습니다."

				}else{
					codeS+="<h6>보관 상품</h6><hr>";

					codeB+="<h6>입찰 상품</h6><hr>";
					
			$.each(res, function(i,v){
				
				if(v.bid_check==0){	<%--보관 상품(입찰 X)--%>

					codeS+="<table><tr><td class='prodTd'>";
					codeS+=v.store_id;
					codeS+='번</td><td class="prodTd">검수 점수 : '
					codeS+=v.confirm_score;
					codeS+='점<br>보관 날짜 : ';
					codeS+=v.store_date;
					codeS+='~</td><td class="prodTd"></td><td><input class="radioBtn" type="radio" id="';
					codeS+=v.confirm_id;	
					codeS+='" name="type" value="2">';
					codeS+='</td></tr></table><hr>';

				}else {					<%--보관 상품(입찰 O)--%>
					codeB+='<table><tr><td class="prodTd">';
					codeB+=v.store_id;
					codeB+='번</td><td class="prodTd">검수 점수 : '
					codeB+=v.confirm_score;
					codeB+='점<br>입찰 가격 : '
					codeB+=v.sell_bid_price;
					codeB+='원<br>입찰 마감 : ~';
					codeB+=v.sell_bid_fdate;
					codeB+='</td><td class="prodTd"></td><td><input class="radioBtn" type="radio" id="';
					codeB+=v.confirm_id;	
					codeB+='" name="type" value="3">';
					codeB+='</td></tr></table><hr>';
				}

			})
			codeS+="<hr>";
			codeS+=codeB;
			codeS+="<input class='btn btn-dark'	type='button' id='sellGo' value='판매하기'>";
			
				}
				
					$('#storeModal .modal-body').html(codeS);
					$('#storeModal').modal('show');
			},
			error : function(xhr){
				alert(xhr.status);
			},
			dataType : 'json'
			})
			
			$(document).on('change', 'input[type=radio]', function(){
				confirm_id = $(this).attr('id');
				typeVal = $(this).val();
			})
			
			$(document).on('click', '#sellGo', function(){
				link = "<%=request.getContextPath()%>/getProdDetail.do?type="+typeVal+"&confirm_id="+confirm_id+"&detail_id="+detail_id;
				location.href=link;
			})
	})

})
</script>


</head>

<body> 
<jsp:include page="mainheader.jsp"></jsp:include>
 	
 	<nav class="nav">
  <a></a>
  <h3><b>
  <%if(type==0) {%> 구매
  <%}else {%> 판매<%} %>
  하기</b></h3>
<!--   <span><input class="confirmbutton" type="button" value="검수기준"></span> -->
<input type="button"  class="btn btn-outline-light text-dark"
		         data-toggle="modal" data-target="#confirmModal"  value="검수기준">
 	</nav>
<hr>


<div class = "container2">
  <div class = "detail">

   <table>
    <tr>
     <td class="prod1">
  	<img alt="<%=prodVo.getProd_brand() %>" src="<%=request.getContextPath() %>/images/<%=prodVo.getProd_photo1() %>" width="60%" >
  	 </td>
  	 <td class="prod2">
	<a><b><%=prodVo.getProd_id()%></b></a><br>
	<a><%=prodVo.getProd_enm() %></a><br>
	<a><%=prodVo.getProd_knm() %></a>
     </td>
    </tr>
   </table>
	<hr>

  <div class ="detail-size" >
  <%
  int i = 1;
  for(ProdDetailVO prodDetailVo : prodDetailList){
	  String temp = prodDetailVo.getDetail_size();
	  
// 	  if(sellBidMap.containsKey(prodDetailVo.getDetail_id())){
// 		  temp+=sellBidMap.get(prodDetailVo.getDetail_id());
// 	  }
  %>
  	<input type="button" id="<%=prodDetailVo.getDetail_id() %>" class="prod-size btn btn-light" value=<%= prodDetailVo.getDetail_size()%> > 
  <%if(i%3==0) {%><br>
  </div>
  <div class ="detail-size" >
  <%
  }
  	i++;
  }%>
  </div>

	<hr>
  <div id="buyBtn">

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


<!-- 상품 선택 모달 -->
<div class="modal" id="storeModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">보관 상품 목록</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
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