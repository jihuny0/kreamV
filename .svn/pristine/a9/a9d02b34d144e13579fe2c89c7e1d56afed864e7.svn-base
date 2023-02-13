<%@page import="kr.co.kreamv.vo.SelectConfirmVO"%>
<%@page import="kr.co.kreamv.prod.controller.Prod"%>
<%@page import="kr.co.kreamv.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>

.nav-link {
    list-style: none;
    color: inherit;
}
.nav-link {
    display: block;
    padding: 0.5rem 1rem;
}
a {
    color: black;
}
a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
}
*, ::after, ::before {
    box-sizing: border-box;
}
user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
user agent stylesheet
li {
    text-align: -webkit-match-parent;
}
.nav {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}

user agent stylesheet
ul {
    list-style-type: disc;
}
h4{
	margin-left: 39%;
	margin-top: auto;
}



</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">



$(function(){
	$('input[value="확인"]').on('click', function(){
		
		confirmId = $(this).parent().find('input[type="radio"]').attr('name');
		
//		alert(confirmId);
		
		value = $(this).parent().find('input[name="'+confirmId+'"]:checked').val();
		
		if(value == null || value == "" || value == 'undefined'){
			swal("작업를 선택해 주세요");
			return false;
		}
		
// 		alert(value);
		$.ajax({
			url : '<%=request.getContextPath()%>/examinationManager.do',
			type : 'post',
			data : {"confirmId" : confirmId, "value" : value},
			success : function(res) {
				if(res =="반송되었습니다"){
					//swal("반송 되었습니다");
					alert("반송 되었습니다");					
					location.href = "<%=request.getContextPath()%>/examinationManager.do";
				}else if(res == "반송이 실패하였습니다"){
// 					swal("반송이 실패하였습니다");
					alert("반송이 실패하였습니다");
					location.href = "<%=request.getContextPath()%>/examinationManager.do";
				}else if(res == "보관되었습니다"){
// 					swal("보관되었습니다");
					alert("보관되었습니다");
					location.href = "<%=request.getContextPath()%>/examinationManager.do";
				}else if(res == "보관이 실패 되었습니다"){
// 					swal("보관이 실패 되었습니다");
					alert("보관이 실패 되었습니다");
					location.href = "<%=request.getContextPath()%>/examinationManager.do";
				}
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
		})
	})
})

  $(window).on('load', function () {
       load('#js-load', '4');
       $("#js-btn-wrap .button").on("click", function () {
           load('#js-load', '4', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}


</script>
</head>
<body>
	<jsp:include page="managerHeader.jsp"></jsp:include>
	<%
 		List<SelectConfirmVO> prodList = (List<SelectConfirmVO>)request.getAttribute("prodList");
		if(prodList == null || prodList.size() == 0){
	%>
		<br><br>
		<h4><b>검수 상품이 존재하지 않습니다.</b></h4>
	
	<% 
		}
	%>
	<div id="contents">
  <div id="js-load" class="main">
    <ul class="lists">

	<%
		for(SelectConfirmVO prod : prodList){
	%>
		      <li class="lists__item js-load" style="background-color: white">
		 	     <a><b>회원 아이디</b></a> : <%=prod.getMem_id() %><br>
			  	<a><b>상품 브랜드</b></a> : <%=prod.getProd_brand() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보관 : <input type="radio"  name="<%=prod.getConfirm_id() %>" value="store">&nbsp;&nbsp;&nbsp;반송 : <input type="radio"  name="<%=prod.getConfirm_id() %>" value="sendback"><br>
			  	<a><b>상품 모델명</b></a> : <%=prod.getProd_id() %><br>
			  	<a><b>영문 상품명</b></a> : <%=prod.getProd_enm() %><br>	
			  	<a><b>한글 상품명</b></a> : <%=prod.getProd_knm() %><br>
		      	<a><b>검수번호</b></a> : <%=prod.getConfirm_id() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      	
			  	<input type="button" value="확인" class="btn btn-dark">
		      </li>
			 <hr >
	<% 	
		}
	%>
	
	 </ul>
    <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
  	</div>
  </div>

<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td>상품리스트</td> -->
<!-- 			<td>보관</td> -->
<!-- 			<td>반송</td> -->
<!-- 		</tr> -->
	
	
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->

	
<!-- 	</table> -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>