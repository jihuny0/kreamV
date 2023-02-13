<%@page import="java.util.List"%>
<%@page import="kr.co.kreamv.vo.BoardVO"%>
<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kreamv | 관리페이지</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- 스타일 -->
<style>
/* 전역 */

.nav-link {
	list-style: none;
	color :inherit;
}
li, ol, ul {
    list-style: none;
}
div {
    display: block;
}
a, a:active, a:focus, a:hover {
    text-decoration: none;
    color: inherit;
}
.title {
    font-size: 24px;
    letter-spacing: -.36px;
}

/* container */
.container.customer {
    max-width: 1280px;
    margin: 0 auto;
    padding: 40px 40px 160px;
}
/* snb_area  */
.container.customer .snb_area {
    float: left;
    width: 160px;
    margin-right: 40px;
}

/* contean_area */
.container.customer .content_area {
    overflow: hidden;
}
.content_title {
    display: flex;
    padding: 5px 0 6px;
}
.content_title.border1 {
    padding-bottom: 0px;
    border-bottom: 3px solid #222;
}
ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.menu_link {
    line-height: 18px;
    font-size: 15px;
    letter-spacing: -.15px;
    color: rgba(34,34,34,.5);
}
.menu_item.menu_on .menu_link {
    color: #222;
    font-weight: 700;
}
.menu_item+.menu_item {
    margin-top: 12px;
}

h3 {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
</style>


<!-- script -->
<script>
/*
관리자 
	문의 사항
	게시글에 답글 작성, 수정 삭제,

고객센터 관리
	게시글 
	작성, 수정 , 삭제
*/

// 관리자가 게시판관리.jsp 접속시 선택 메뉴 1. 문의사항 관리, 2. 고객 센터 관리
// 페이지 실행
/* $(function(){
	$.ajax({
	      url : "/kreamv/boardList.do",
	      type : "get",
	      data : {"boardDnm" : "공지사항"},
	      // success
	      success : function(res){
	          codev = ""; 
	    	  codev += '<h3>\공지사항</h3>'
	    	  $('.contentTitle').html(codev);
	    	 
	         
	    	 code = " ";
	         code += `<div class="panel-group" id="accordion">`
	         $.each(res, function(i, v){
	           code += `<div class="panel panel-default">
	        	   			
	           				<div class = "title" id = "' + v.mem_id + '" name="divTitle")>
	        	   				<div class="panel-heading">
		         					 <div class="panel-title">
							               <a class="action" name="list" data-toggle="collapse" data-parent="#accordion" href="#collapse\${v.board_num}">
							                 \${v.board_title}
							               </a>
						             </div>
						         </div>
					        </div>
			             
			             <div id="collapse\${v.board_num}" class="panel-collapse collapse">
			             	<div class="panel-body">
			             	   <p class="p2">
				                 \${v.board_cont}
				               </p>
			               </div>
			             </div>
			             
			           </div>`
	         });
	         code += `</div>`
	         $('.content_list').html(code);   
	      },
	      // error
	      error : function(xhr){
	         alert(xhr.status);
	      },
	      dataType : "json"
	   })// ajax
	}) 
}) */

$(function(){
	// 버튼 클릭시 리스트 조회
	$(document).on("click", "button[name='listQu1']", function(){
		var boardNm = $(this).attr('value');
	});
	
});

</script>


<body>
<!-- managerHeader.jsp header -->
<jsp:include page="managerHeader.jsp"></jsp:include>

<!-- 메인 container -->
<div class="container">
	
	<!-- 메뉴 리스트 기능 선택 
	1. 문의사항 관리(게시글에 답글 작성, 수정 삭제), 
	2. 고객센터 관리(게시글 작성, 수정 , 삭제) -->
	<div>
		  <h2 class="snb_main_title">문의사항&고객센터 관리</h2>
		  <br>
		  
		  <div class="btn-group">
		  	<h3>문의사항 관리</h3>
		    <button type="button" class="btn btn-primary"  value="문의사항">문의사항 조회</button>
		    <button type="button" class="btn btn-primary">답글작성</button>
		    <button type="button" class="btn btn-primary">수정하기</button>
		    <button type="button" class="btn btn-primary">삭제하기</button>
		  </div>
		  
		  <div class="btn-group">
		  	<h3>고객 센터 관리</h3>
		    <button type="button" class="btn btn-primary"  value="고객센터">고객센터 조회</button>
		    <button type="button" class="btn btn-primary">작성하기</button>
		    <button type="button" class="btn btn-primary">수정하기</button>
		    <button type="button" class="btn btn-primary">삭제하기</button>
		  </div>
		  
		  
	</div>
	<!-- 게시글 조회 -->
	<div class="boardListResult">
	
	</div>

	
	
			
         
         
     
	

</div><!-- // container -->

<!-- 메인container 아래 container -->
<div class="down_area">
	
</div>	




<!-- footer 추가  -->
<jsp:include page="footer.jsp"></jsp:include> 
 
  
</body>
</html>

























