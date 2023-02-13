<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@page import="kr.co.kreamv.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kreamv | 문의사항</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>



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

<script>
  
  
$(function(){

	$.ajax({
		url : "/kreamv/boardList.do",
		type : "get",
		data : {"boardDnm" : "상품문의"},
		success : function(res){
			code = "";
			code += '<div class="panel-group" id="accordion">';
			$.each(res,function(i,v){
				code += 	  '<div class="panel panel-default">'
				                                                                                                                                             
				code +=			'<div class = "title" id = "' + v.mem_id + '" name="divTitle">'
				code +=	' 			<div class="panel-heading" >                                                                                              '
				code +=	' 				<h4 class="panel-title">                                                                                              '
				code += '			 		<a class="action" name="list" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.board_num + '" onclick="UpdateTitle(this)">'
				code += 						v.board_title + '</a>'
				code += '	 			</h4>'
				code += '	 		</div>                                                                                                                '
				code += '	 	</div>                                                                                                                    '
				code += '	                                                                                                                                  '
				code += '	 		<div id="collapse' + v.board_num + '" class="panel-collapse collapse">                                                        '
					code +=	'	 		<div class="panel-body">                                                                                                  '
					code +=	'				<p class="p1">                                                                                                        '
					code +=	'					작성자 <span class="sw">' + v.mem_id + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                   '
					code +=	'					날짜 <span class="sd">' + v.board_date + '</span>&nbsp;&nbsp;&nbsp;                                                  '
					code +=	'				</p>                                                                                                                  '
					code +=	'				                                                                                                                      '
					code +=	'	 			<p class="p2" id="updateCont">' + v.board_cont + '</p>'
					code += 			   '<input type = "button" class = "acTion' + v.mem_id + '" value = "수정" style = "display : none" id="updateButton" data-toggle="modal" data-target="#updateModal">'
					code += 			   '<input type = "button" class = "acTion' + v.mem_id + '" value = "삭제" style = "display : none" id="deleteButton">'
					code +=				'</div>'
			    code +=				'</div>'
			    
				code +=			'</div>'
			}) //each   
			code += '</div>'
			$('.dropdown_list').html(code);                                                                                                                   
		},
		error : function(xhr){
			alert(xhr.status)
		},
		dataType : "json"
	})// ajax
})

// 게시글 제목을 눌렀을때
$(document).on("click", ".title", function(){
  	  	 var uid = '<%=(String)session.getAttribute("loginId")%>';
  	  	 memId = $(this).attr('id');

  	  	 // 비회원 기본 스타일 style = "display : none"
	 if(uid != memId){
		
		
	 // 해당회원 작성한 글만 수정, 삭제
	 } else if(memId == uid){
		className = $(this).parent().find(':button').attr('class');
			$("."+ className +":button").show();
				
	 // 관리자 		
	 } else if(admin == uid){
		 alert("수정가능");
		$(":button").show();
	 }
	
})

// 글쓰기 수정 이벤트

function UpdateTitle(ths){
	var updateTi = $(ths).text();
	$('#titleUpdate').val(updateTi);
	
	var updateCont = $('#updateCont').text();
	$('#contUpdate').val(updateCont);
	
	// 수정 모달 저장이벤트
	$('#wsendUpdate').on('click', function(){
		$.ajax({
			url : "/kreamv/BoardUpdate.do",
			type: "get",
			data : {
				"memId": $('#updateId').val(),
				"board_title": $('#titleUpdate').val(),
				"board_cont": $('#contUpdate').val() 
			},
			success : function(res){
				if(res == "1"){
					alet("수정완료");
				} else {
					alet("수정실패");
				}
				/* console.log(res)
				$('#updateModal').modal("hide");
				$("#updateClose").trigger("click");
	        	$('#updateModal :text').val(""); */
			},
			error : function(xhr){
				alert(xhr.status);
			}, 
			dataType : "json"
		})
	}) //수정
	
	
}

// 삭제버튼 이벤트
$(document).on("click", "#deleteButton", function(){
	alert("정말 삭제하시갰습니까?");
		$.ajax({
			url : "/kreamv/BoardDelete.do",
			type : "get",
			data : {
				"memId" :  $('#updateId').val()
			},
			success : function(result){
				
				alet("수정완료");
				
			},
			error : function(xhr){
				alert(xhr.status);
			}, 
			dataType : "json"
		})
})


 





$(function(){
	// 글쓰기 버튼 이벤트
	$('#writebtn').on('click', function(){
			// 로그인 체크
			check = '<%=session.getAttribute("loginMember") %>'
			if(check == "null"){
				location.href="<%=request.getContextPath()%>/view/login.jsp";
			}else{
				var mem_id = '<%=session.getAttribute("loginId") %>'
			}	
	})
})


$(function(){
	// 글쓰기 저장버튼 이벤트
	$('#wsend').on('click', function(){ 
		let formData = new FormData();
		formData.append("mem_id", $('#wloginId').val());
		formData.append("board_title", $('#title').val());
		formData.append("board_cont", $('#cont').val());
		console.log("id", $('#wloginId').val());
		console.log("title", $('#title').val());
		console.log("cont", $('#cont').val());
		$.ajax({
			url : "/kreamv/BoardInsert.do",
			type : 'get',
			data : {
				"mem_id": $('#wloginId').val(),
				"board_title": $('#title').val(),
				"board_cont": $('#cont').val()
			},
			success : function(res){
				console.log(res)
				$('#wModal').modal("hide");
				$("#modalCloseBtn").trigger("click");
	        	$('#wModal :text').val("");
			},
			error : function(xhr){
				alert(xhr.status);
			}, 
			dataType : "json"
		})

	})
}) 



</script>

</head>
<!-- body시작 -->
<body>
<jsp:include page="/view/mainheader.jsp"/>

<div class="container customer md">
    <div>
        <div class="snb_area" >
        	<a href="/kreamv/view/askBoard.jsp" class="nuxt-link-exact-active nuxt-link-active" aria-current="page">
                <h2 class="snb_main_title">문의사항</h2>
            </a>
            <nav class="snb">
                <div class="snb_list">
                    <ul class="snb_menu">
                        <li class="menu_item" >
                        	<a href="/kreamv/view/askBoard.jsp" class="menu_link">배송 문의</a>
                        </li>
                        <li class="menu_item menu_on" >
                        	<a href="/kreamv/view/askBoard1.jsp" class="menu_link nuxt-link-exact-active nuxt-link-active" aria-current="page">상품 문의</a>
                        </li>
                      
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    
    <div class="content_area">
        <div class="customer_content my_notice">
            
            <div class="content_title border1">
                <div>
                    <h3>상품 문의</h3>
                </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="dropdown_list"></div>
			
			  <!-- 게시글 작성 -->
            <button type="button" class="btn btn-dark" id="writebtn" data-toggle="modal" data-target="#wModal">글쓰기</button>
            
            
               <!-- The Modal -->
			<div class="modal" id="wModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">문의 하기</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        <form id="wform">
			        		<input type="hidden" id="wloginId" value="<%=session.getAttribute("loginId") %>">
						   <label>ID :</label><p><%=session.getAttribute("loginId") %></p><br>
						   
			               <label>제목 </label>
			               <input type="text" id="title"><br>
			               
			               <label>내용 </label><br>
			               <textarea rows="10"  id="cont" cols="50"></textarea>
			               <br>
			               <input type="submit" value="저장하기" id="wsend">
			          </form> 
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" id="modalCloseBtn" class="btn btn-dark" data-dismiss="modal">Close</button>
			      </div>
			
			    </div>
			  </div>
			</div>
			
			
			
			
			<!-- The Modal 수정 -->
			<div class="modal" id="updateModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">수정 하기</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        <form id="wform">
			        		<input type="hidden" id="updateId" value="<%=session.getAttribute("loginId") %>">
						   <label>ID :</label><p><%=session.getAttribute("loginId") %></p><br>
						   
			               <label>제목 </label>
			               <input type="text" id="titleUpdate"> <br>
			               
			               <label>내용 </label><br>
			               <textarea rows="10"  id="contUpdate" cols="50"></textarea>
			               <br>
			               <input type="submit" value="저장하기" id="wsendUpdate">
			          </form> 
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" id="updateClose" class="btn btn-dark" data-dismiss="modal">Close</button>
			      </div>
			
			    </div>
			  </div>
			</div>
			
			
			
        </div>
    </div>
</div>
</body>
</html>