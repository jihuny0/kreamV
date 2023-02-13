<%@page import="kr.co.kreamv.vo.OrdersVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Kreamv | 상품 상세 정보 </title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<style>


.nav-link {
   list-style: none;
   color :inherit;
}

.container2 {
   display: flex;
   justify-content: center;
}

  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  
  .image{
      border-radius: 8px;
   }
  
  .info{
  margin-left : 100px;
  margin-right : 100px;
  margin-top : 50px;
  }
  
  table {
  border-spacing: 10px;
  border-collapse: separate;
  }

	.buttonsize{
	   width: 49%;
	   height: 40px;
	}

#wishbutton{
   width: 100%;
   height: 40px;
}

#trindex{
   font-size: 0.8em;
   color: #8C8C8C;
}

#trcontent{
   font-size: 0.9em;
}

   .pdTitle{
   text-decoration: underline;
   font-weight: bold;
   }
   
   .pdPrice{
   font-weight: 300;
   }
   
   a:hover { 
   color : black;
   }
   
   #jjimImg{
   width:15px;
   }
   .btnSize{
   }
   .mk{
   margin : 0px;
   padding : 0px;
   border-spacing: 0px;
   }
   #mkText{
   width : 100px;
   }
   #mkPrice{
   width : 220px;
   text-align : right;
   }
.td{
   margin : 20px;
   padding-right: 40px;
}

.table2{
	margin-left: 40px;

}
</style>
<% 
   ProdVO prodVo = (ProdVO)request.getAttribute("prodVO"); 
   int wishCheck = (int)request.getAttribute("wishCheck");
   int wishCount = (int)request.getAttribute("wishCount");
   SampleMemberVO vo =  (SampleMemberVO)session.getAttribute("loginMember");
   List<OrdersVO> ordersList = (List<OrdersVO>)request.getAttribute("ordersList");
%>


<script>
$(function(){

   $('#btn-danger').on('click', function(){
	   <%if(vo == null){%>
	   location.href="<%=request.getContextPath()%>/memberLogin.do";
	   <%}else{%>
      link = '<%=request.getContextPath()%>/buyProdDetailList.do?prodId=';
      link+=$('#modelNM').html();
      location.href = link;
	   <%}%>
   })
   
   $('#btn-info').on('click', function(){
	   <%if(vo == null){%>
	   location.href="<%=request.getContextPath()%>/memberLogin.do";
	   <%}else{%>
      link='<%=request.getContextPath()%>/sellProdDetailList.do?prodId=';
      link+=$('#modelNM').html();
      location.href = link;
	   <%}%>
   })
   
   $('#wishbutton').on('click', function(){
	   <%if(vo == null){%>
	   location.href="<%=request.getContextPath()%>/memberLogin.do";
	   <%}else{%>
	   <%if(wishCheck>0){%>
	   	$.ajax({
	         url : '/kreamv/wishCancelProd.do',
	         type : 'post',
	         data : {'prod_id' : '<%=prodVo.getProd_id()%>'},
	         success : function(res){
	            alert("관심상품에서 해제되었습니다.");
	            location.href="<%=request.getContextPath()%>/getProd.do?prodId=<%=prodVo.getProd_id()%>";
	         },
	         error : function(xhr){
	            alert(xhr.status);
	         },
	         dataType : 'json'
	         })
         <%}else{%>
	      $.ajax({
	         url : '/kreamv/insertWish.do',
	         type : 'post',
	         data : {'prod_id' : '<%=prodVo.getProd_id()%>'},
	         success : function(res){
	            alert("관심상품에 등록되었습니다.");
	            
	            location.href="<%=request.getContextPath()%>/getProd.do?prodId=<%=prodVo.getProd_id()%>";
	            
	         },
	         error : function(xhr){
	            alert(xhr.status);
	         },
	         dataType : 'json'
	         })
         <%}%>
  	   <%}%>
   })
})



 function drawChart() {
    <%if(ordersList==null||ordersList.size()==0){%>  
		var stars = [0,0,0,0,0,0,0];
	<%}else{

	%>
      	var stars=[
		<%	for(int i = 6; i >= 0; i--){
				if(i>ordersList.size()-1){%>
					0
				<%}else{%>
					<%=ordersList.get(i).getOrder_price()%>
				<%}
					if(i>0){%>
						,
					<%}
	 			}%>
					]
	<%}%>
      var frameworks = ['', '', '','', '', '',''];
      new Chart('myChart', {
        type: 'line',
        data: {
          labels: frameworks,
          datasets: [{
            label: '최근 시세가',
            data: stars
          }]
        },
      });
    }
</script>

</head>
<body onload="drawChart()">

<%	
	
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


<div class="container2">
	<div><div>
    <div>
        <img src="<%=request.getContextPath() %>/images/<%=prodVo.getProd_photo1()%>" alt="<%=prodVo.getProd_photo1()%>" style="width: 465px; height: 465px; border-radius: 8px; margin-top: 50px;">
      </div></div>
   
    </div>
       <div class="item info">
   <h4 class="pdTitle"><%=prodVo.getProd_brand()%></h4>
   <h4><%=prodVo.getProd_enm()%></h4>
   <a><%=prodVo.getProd_knm()%></a><br>
   <hr>
   <table class="mk"><tr class="mk">
   <td class="mk" id="mkText"><b>최근 거래가</b></td>
   		    <% 
            String amount = String.valueOf(prodVo.getProd_mkprice());
            amount = amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
            %>
   <td class="mk" id="mkPrice"><%=amount%>원</td>
   </tr></table><hr><br>
   
   <input class="btn btn-danger btnSize buttonsize" id="btn-danger" type="button" value="구매" >
   <input class="btn btn-info btnSize buttonsize" id="btn-info" type="button" value="판매" ><br><br>
	<button type="button" class="btn btn-light btnSize"  id="wishbutton">
   <%if(wishCheck>0){ %>
	<img id="jjimImg" alt="찜목록" src="<%=request.getContextPath() %>/images/style/jjim2.png">
   <%}else {%>
	<img id="jjimImg" alt="찜목록" src="<%=request.getContextPath() %>/images/style/jjim.png">
   <%}%>
	&nbsp;&nbsp;관심상품&nbsp;&nbsp;<%=wishCount%></button><br><br>
   
	   
   <h5><b>상품 정보</b></h5>
   <form>
     <table  class="table2">
      <tr id="trindex">
      <td class="td">모델번호</td>
      <td class="td">출시일</td>
      <td class="td">발매가</td>
      </tr>
      <tr id="trcontent">
      <td  class="td" id="modelNM"><%=prodVo.getProd_id()%></td>
      <td  class="td"><%=prodVo.getProd_rdate()%></td>
      <td class="td"> <% 
            amount = String.valueOf(prodVo.getProd_rprice());
            amount = amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
            %>
      <%=amount%>원</td>
      </tr>
     </table>
   </form>
   
   <br>

   		<h3><b>상품 시세</b></h3>
       <canvas id="myChart" width="30px" height="20px"></canvas>


      </div>

   </div>



<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>