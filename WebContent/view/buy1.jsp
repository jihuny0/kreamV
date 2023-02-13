<%@page import="kr.co.kreamv.vo.ProdDetailVO"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="kr.co.kreamv.vo.SellBidVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 구매하기</title>
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
   flex-direction: column;
   width: 38%;
   margin-left: 31%; 
   }
   
.prod1 {      
   width: 150px;
   }
   
.prod2 {      
   width: 300px;
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

#orders{
   display : none;
}

.divContent{ 
   margin-left: 10px;
}

</style>  
  
<% 
ProdDetailVO prodDetailVo = (ProdDetailVO)request.getAttribute("prodDetailVo");
SellBidVO sellBidVo = (SellBidVO)request.getAttribute("sellBidVo");
ProdVO prodVo = (ProdVO)request.getAttribute("prodVo");
%>

<script>
   today = new Date();

$(function(){
   $('.date').on('click', function(){
      var date = $(this).attr("name");
      fdate = new Date(today.setDate(today.getDate()+parseInt(date)));
      
      month = fdate.getMonth()+1;
      if(month<0){
         month = '0'+month;
      }
      
      $('#deadLine').val(fdate.getFullYear()+""+month+""+fdate.getDate());
   })

   <%if(sellBidVo==null){%>   // 즉시 구매가가 없을 경우 즉시구매 버튼 비활성화
      $('#orderBtn').attr('disabled', 'disabled');
   <%}%>
   
      $('#orderBtn').on('click', function(){   // 구매입찰 버튼 클릭 -> 구매입찰 form 출력, 즉시구매 form 숨기기
         $('#bid').hide();
         $('#orders').show();
      })
      $('#bidBtn').on('click', function(){   // 즉시구매 버튼 클릭 -> 구매입찰 form 숨기기, 즉시구매 form 출력
         $('#bid').show();
         $('#orders').hide();
      })
})

</script>
  
  
</head>
<body>
<jsp:include page="mainheader.jsp"></jsp:include>
 
<!--  즉시 구매하기 (기본설정) -->
   <nav class="nav">
   <a></a>
  <h3><b>즉시 구매하기</b></h3>
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
       <a><b><%=prodDetailVo.getDetail_size() %></b></a>
    </td>      
     </tr>
     </table>
   <hr>
   
   <input class="button btn btn-dark" id="bidBtn" type="submit" value="구매 입찰">   
   <input class="button btn btn-dark" id="orderBtn" type="submit" value="즉시 구매">   <br>
    
   <hr>
   <%if(sellBidVo!=null) {%>
   <form id="orders" action="<%=request.getContextPath()%>/buyOrdersTemp.do">
   <a><b>즉시 구매가</b></a>
   <a><b><%=sellBidVo.getSell_bid_price() %></b></a>
   <hr>
      <div>
   <input type="text" class="detailIdBtn" name="datail_id" value="<%=prodDetailVo.getDetail_id()%>">
   <input type="text" class="detailIdBtn" name="prod_id" value="<%=prodVo.getProd_id()%>">
   <input type="text" class="detailIdBtn" name="sell_bid_id" value="<%=sellBidVo.getSell_bid_id()%>">
   <input type="text" class="detailIdBtn" name="sell_bid_price" value="<%=sellBidVo.getSell_bid_price()%>">
      <input class="button3 btn btn-dark" id="buyGo" type="submit" value="즉시 구매 계속">
   </div>
   <hr>
   </form>
   <%} %>
   
   


<!--  입찰 (기본설정) -->
<!-- 구매입찰 form태그 -->

<form id="bid" action="<%=request.getContextPath() %>/buyBidTemp.do" method="get">
<a><b>구매 희망가</b></a>
   <input type="text" class="detailIdBtn" name="datail_id" value="<%=prodDetailVo.getDetail_id()%>">
   <input type="text" class="detailIdBtn" name="prod_id" value="<%=prodVo.getProd_id()%>">
   <input type="text"  name="buy_bid_price" placeholder="희망가입력" style="text-align:right;">원
   
   <div>
   <hr>
   <a><b>입찰 마감 기한</b></a>
   <input id="deadLine" type="text" name="buy_bid_fdate" style = "text-align:right;">
   <br>
      <div class="divContent">
      <input class="button2 btn btn-outline-secondary date" type="button" name="1" value="1일">
      <input class="button2 btn btn-outline-secondary date" type="button" name="3" value="3일">
      <input class="button2 btn btn-outline-secondary date" type="button" name="7" value="7일">
      <input class="button2 btn btn-outline-secondary date" type="button" name="30" value="30일">
      <input class="button2 btn btn-outline-secondary date" type="button" name="60" value="60일">
      </div>
   </div>
   
   <div>
   <input class="button3 btn btn-dark" type="submit" value="구매 입찰 계속">
   </div>
   
   <hr>
</form>
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


</body>
</html>