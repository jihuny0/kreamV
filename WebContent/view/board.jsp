<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
 <style>
 .nav-link {
	list-style: none;
	color :inherit;
}

.container.customer .snb_area{
   float: left;
   width: 20%;
   margin-right: 40px;
}
.container.customer .main_area{
   float: left;
   width: 70%;
   margin-right: 40px;
}
.container.customer .snb_main_title{
    padding-bottom: 25px;
    font-size: 32px;
    letter-spacing: -.48px;
    color: #000;
    text-transform: uppercase;
}


 </style>
 
 <script>
 $(function(){
	 $('#De').on('click',function(){
		 $.ajax({
			url : '/kreamv/ListDe.do',
			type : 'get',
			data : {"boardDnm" : "배송문의"},
			success : function(res){
				code = `<h3 id="main_title">배송문의</h3>
						<br>
						<div class="panel-group" id="accordion">`
				 $.each(res, function(i,v){ 
					code += `<div class="panel panel-default"> 
							 <div class="panel-heading">   
							 <h4 class="panel-title">  
						 	 <a class="action" name="list" data-toggle="collapse" data-parent="#accordion" href="#collapse\${v.board_num}">
						 	 \${v.board_title}</a>
						 	 </h4>
						 	 </div>
						 	
						 	 <div id="collapse\${v.board_num}" class="panel-collapse collapse">
								 <div class="panel-body">
									<p class="p1">  
										작성자 <span class="sw">\${v.mem_id}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										날짜 <span class="sd">\${v.board_date}</s pan>&nbsp;&nbsp;&nbsp;
									</p>
								 	<p class="p2">\${v.board_cont}</p>
									<p class="p3"> 
										<input id="\${v.mem_id}" type="button" value="수정" class="action"> 
										<input id="\${v.mem_id}" type="button" value="삭제" class="action"> 
									</p> 
									<p class="p4">
									<input id="${v.num}" type="button" value="등록" class="action">
									</p>
							    </div>
					    	</div>
							</div>`
					})
					code += `</div></div>`;
					$('#result').html(code);
					
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
		 })
	 })
 })
 $(function(){
	 $('#Qu').on('click',function(){
		 $.ajax({
			url : '/kreamv/ListQu.do',
			type : 'get',
			data : {"boardDnm" : "상품문의"},
			success : function(res){
				code = `<h3 id="main_title">상품문의</h3>
						<br>
						<div class="panel-group" id="accordion">`
				 $.each(res, function(i,v){ 
					code += `<div class="panel panel-default"> 
							 <div class="panel-heading">   
							 <h4 class="panel-title">  
						 	 <a class="action" name="list" data-toggle="collapse" data-parent="#accordion" href="#collapse\${v.board_num}">
						 	 \${v.board_title}</a>
						 	 </h4>
						 	 </div>
						 	
						 	 <div id="collapse\${v.board_num}" class="panel-collapse collapse">
								 <div class="panel-body">
									<p class="p1">  
										작성자 <span class="sw">\${v.mem_id}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										날짜 <span class="sd">\${v.board_date}</s pan>&nbsp;&nbsp;&nbsp;
									</p>
								 	<p class="p2">\${v.board_cont}</p>
									<p class="p3"> 
										<input id="\${v.mem_id}" type="button" value="수정" class="action"> 
										<input id="\${v.mem_id}" type="button" value="삭제" class="action"> 
									</p> 
									<p class="p4">
									<input id="${v.num}" type="button" value="등록" class="action">
									</p>
							    </div>
					    	</div>
							</div>`
					})
					code += `</div></div>`;
					$('#result').html(code);
					
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
		 })
	 })
 })
 
 
 </script>
 
</head>


<body>
<jsp:include page="/view/mainheader.jsp"/>

<div class="container customer md">
	<div class="snb_area">
		<a class="nuxt-link-exact-active nuxt-link-active" href="/kreamv/view/board.jsp" aria-current="page">
		<h2 class="snb_main_title">문의사항</h2>
		</a>
 	
		<div class="snb_menu">
  		<ul class="nav flex-column">
    		<li><button type="button" id="De">배송 문의</button></li>
    		<li><button type="button" id="Qu">상품 문의</button></li>
  		</ul>
  		</div>	
	</div>
	
	<!-- 리스트 -->
	<div class="main_area" id="result"></div>
	<!-- 게시판 작성-->
	<button type="button" id="Deinsert">게시글 작성</button>
	
	<!-- 상품 게시판 기능 -->
	
	
</div>


</body>
</html>









