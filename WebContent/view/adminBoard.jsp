<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@page import="kr.co.kreamv.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kreamv | 고객관리</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>





<script>
// 페이지 열리면 리스트 출력
// 페이지 타이틀 마다 링크
// 타이틀 눌러서 상세보기, 관리자 수정, 삭제 


$(function(){
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


// 서브 리스트 클릭 이벤트
function showNotice(ths){
   var boardDnm = $(ths).text();
   
      $.ajax({
         url : "/kreamv/boardList.do",
         type : "get",
         data : {"boardDnm" : boardDnm},
         // success
         //contentType: ""
         success : function(res){
	          //서브 타이틀
        	  codev = ""; 
		      codev += '<h3> ' + res[0].board_dnm + ' </h3>';
       	  	  $('.contentTitle').html(codev);
        	// 리스트 출력 
     
        	code = "";
            code += `<div class="panel-group" id="accordion">`
            	$.each(res, function(i, v){
                    code += `<div class="panel panel-default">
                 	   			
                    				<div class = "title" id = "' + v.mem_id + '" name="divTitle")>
                 	   				<div class="panel-heading">
         	         					 <div class="panel-title">
         						               <a class="action" data-toggle="collapse" data-parent="#accordion" href="#collapse\${v.board_num}">
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
      })
      
   }

</script>
  
<style type="text/css">
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
</head>


<body>
<!-- hearder 추가 -->
<jsp:include page="/view/mainheader.jsp"/>


<!-- 전체 container -->
<div class="container customer md">
	<div>   
	   <!-- sub area -->
	   <div class= "snb_area">
	        <a href="/kreamv/view/adminBoard.jsp" class="nuxt-link-exact-active nuxt-link-active" aria-current="page">
	           <h2 class="snb_main_title">고객센터</h2>
	        </a>   
	         <!-- sub list -->
	            <nav class="snb">  
	              <div class="snb_list">
	                 <ul class="snb_menu">
	                   <li class="menu_item">
	                       <a id ="notice" href= "#" onclick = "showNotice(this)" class="menu_link">공지사항</a>
	                   </li>
	                   
	                   <li class="menu_item">
	                        <a id="qna" href= "#" onclick = "showNotice(this)" class="menu_link">자주묻는질문</a>
	                   </li>
	             
	                   <li class="menu_item">
	                        <a id="standard" href= "#" onclick = "showNotice(this)" class="menu_link">검수기준</a>
	                   </li>
	                 </ul>
	              </div>
	           </nav>
	   </div>
    </div> 
  
   <!-- content_area-->
   <div class="content_area">
     
      <!-- sub title -->
      <div class="content_title border1">
       		<div class="contentTitle"></div>
      </div>
      
      
       <!-- 게시글 목록, 상세보기  -->
       <div class="content_list"></div>
       <!-- 관리자면 게시글 수정 삭제 가능 -->
      

      
   </div><!-- content_area 끝 -->
   
</div><!-- 전체 container -->     
 
 <!-- footer 추가  -->
 <jsp:include page="footer.jsp"></jsp:include>  
</body>
</html>







