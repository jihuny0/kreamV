<%@page import="kr.co.kreamv.vo.LikegramVO"%>
<%@page import="kr.co.kreamv.vo.StyleProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src = "/kreamv/js/jquery.serializejson.min.js"></script>
<meta charset="UTF-8">
<title>Kreamv | STYLE</title>
<style>
/* 메인스타일 */
.nav-link {
	list-style: none;
	color :inherit;
}
	
.shortCut_items{
	display : flex;
		
}

/* ----- */

#menu-bar{
	margin-top: 70px;
	margin-left : 42%;
}


/* 각각의 게시글 게시글 */
.post{
	display: flex;
	flex-flow: column;
	margin-bottom : 30px;
	/* float: left; */
}


/* 게시글 속 사진 */
.post .item{
   width: 266px;
   height: 366px;
   margin: 15px;
   border-radius: 5%;
}


/* 게시글 속 프로필사진 */
.post .profile{
	width: 40px;
	height: 40px;
	border-radius: 60%;
	margin-left: 14px;
	margin-bottom: 10px;
}

/* 게시글 내용 */
.post h7{
	margin-left: 14px;	
}


/* 게시글 속 좋아요/대글 이미지 버튼 */
.img_btn{
	width: 20px;
	height: 20px;
	margin-left: 14px;
	margin-right : 3px;
	
}

.likeBtn{
	border: none;
	background-color: white;
}


/* 게시글 속 상품정보 */ 
.prod{
	width: 50px;
	height: 50px;
}

label{
	width: 150px;
}

span{
	margin-left : 10px;
	font-weight: bold;
}

.modal-content label{
	font-size: 19px;
}


/* a:active, a:visited, a:hover{
	background-color: black;
	color: white;
	text-decoration: none;
} */

.prodBox{
	display: flex;
	margin-left : 20px;
	
}
#btnDiv{
	display : flex;
	margin-top : 10px;
}
.gramProd{
	font-size : 0.9em;
}

.gramListDiv{
	margin-top : 50px;
	display : inline-flex;
	margin-left: 20%;
	margin-right: 15%;
	flex-flow: row wrap;
   justify-content :flex-start;
}

a{
	color: black;
}

a:hover{
	color: black;
	text-decoration: none;
}

#styleProd{
	width: 500px;
	height: auto;
	font-size: 20px;
}



</style>

<script>
//최신 게시물 업데이트
function newReplace(){  
      setTimeout('location.reload()',5000); 
}

/* function newReplace(){  
      $("#newImg").load(window.location.href + "#newImg");
} */
</script>

<%
	int type = (int)request.getAttribute("type");
	List<StyleProdVO> styleList = (List<StyleProdVO>)request.getAttribute("styleList");
	SampleMemberVO vo =  (SampleMemberVO)session.getAttribute("loginMember");
	List<LikegramVO> likeGramList = null;
	if(vo!=null){
		likeGramList = (List<LikegramVO>)request.getAttribute("likeGramList");
	}
%>

<script>
$(function(){
	$('#hitGram').on('click', function(){	// 인기 누르면 type=1로 페이지 새로고침
		location.href="<%=request.getContextPath() %>/styleGramList.do?type=1";
	})
	$('#newGram').on('click', function(){	// 최신 누르면 type=2로 페이지 새로고침
		location.href="<%=request.getContextPath() %>/styleGramList.do?type=2";
	})
	$('#myLikeGram').on('click', function(){	// 최신 누르면 type=2로 페이지 새로고침
		<%if(vo==null){%>
			alert("로그인이 필요합니다.");		
			location.href="<%=request.getContextPath() %>/view/login.jsp";
		<%}else if(vo.getMem_id()=="admin"){%>
			location.href="<%=request.getContextPath() %>/styleGramList.do?type=3";
		<%}else{%>
			location.href="<%=request.getContextPath() %>/styleGramList.do?type=3";
		<%}%>
	})
	
	
	$('.likeBtn').on('click', function(){
		
		likeclickBtn = $(this);
		gramNum = $(this).parents('.post').attr('id');
		<%if(vo == null){%>
			alert("로그인이 필요합니다.");		
			location.href="<%=request.getContextPath() %>/view/login.jsp";
		<%}else{%>
			if("likeBtnIcon"==($(this).val())){
				$.ajax({
					url : '<%=request.getContextPath()%>/StyleGramLike.do',
					data : {"id" : '<%=vo.getMem_id()%>', "num" : gramNum},
					type : 'post',
					success : function(res){
						if(res == "좋아요 증가 실패"){
							 alert('시스템 에러');
							 location.reload();
						}
//	 					alert(res.likeNum);
						updateLike = res.likeNum;
						$(likeclickBtn).parent().find('label').text(updateLike);
					},
					error : function(xhr){
						alert(xhr.status);
					}
				})
						$(this).val("likeBtnIcon2");
						$(this).attr('src', '/kreamv/images/style/likeBtnIcon2.png');
			}else{
				$.ajax({
					url : '<%=request.getContextPath()%>/StyleGramLike.do',
					data : {"id" : "<%=vo.getMem_id()%>", "num" : gramNum},
					type : 'get',
					success : function(res){
						if(res == "좋아요 감소 실패"){
							 alert('시스템 에러');
							 location.reload();
						}
// 						alert(res.likeNum);

					<%if(type==3){%>
						location.href="<%=request.getContextPath() %>/styleGramList.do?type=3";
					<%}else{%>
						updateLike = res.likeNum;
						$(likeclickBtn).parent().find('label').text(updateLike);
					<%}%>
					},
					error : function(xhr){
						alert(xhr.status);
					}
				})
				<%if(type!=3){%>
				$(this).val("likeBtnIcon");
				$(this).attr('src', '/kreamv/images/style/likeBtnIcon.png');
				<%}%>
				
			}
		<%}%>
		
		
	})
	
		//스타일작성 모달창에서 전송버튼 클릭이벤트 	
	$("#wsend").on("click", function(){
		var formData = new FormData();
		formData.append("prod_id", $('#prod option:selected').attr('id'));
		formData.append("styleProd", $('#prod option:selected').text());
		formData.append("writer", $("#content p").text());
		formData.append("content", $("textarea[name=content]").val());
		formData.append("photo", $("input[name=photo]")[0].files[0]);
		
		// 서블릿으로 전송
		$.ajax({
	        url: '<%=request.getContextPath()%>/StyleGramInsert.do',
	        type: 'post',
	        enctype: 'multipart/form-data',
	        processData:false,
	        contentType:false,
	        data: formData,  
	        success: function (res) {
				//숨기기
				$('#myModal').modal("hide");
	        	$('#myModal .txt').val("");
				alert("등록");
				newReplace();
			},
			error : function(xhr){
				alert(xhr.status);
			} 
		})
		
		
	}); // end of wsend
	
	//스타일 작성 버튼 선택 이벤트
	$('#regBtn').on('click', function(){
		//로그인 체크
		member = '<%=session.getAttribute("loginMember") %>'
		if(member == "null"){
			alert("로그인 필요");		
			location.href="<%=request.getContextPath() %>/view/login.jsp";
		}else{
			var memId = '<%=session.getAttribute("loginId") %>'
			var memName = '<%=session.getAttribute("loginName") %>'
			
			//구매한 상품 리스트 받아오고 출력
			$.ajax({
				url : "<%=request.getContextPath() %>/StyleGramRegistration.do?id=" + memId,
				type : "get",
				success : function(jsonList){
					j = "";
					$.each(jsonList, function(i, v){
						//j += `<option id = \${v.prod_id} data-image='../images/\${v.prod_photo1}'> \${v.prod_brand}  \${v.prod_knm} </option><br>`;
						j += `<option class = "selectProd" id = \${v.prod_id} data-image='../images/favicon.ico'> \${v.prod_brand}  \${v.prod_knm} </option><br>`;
					})
					$('#styleProd').html(j);
					$('#writer').val(memId);
				},
				error : function(xhr){
					alert(xhr.status);
				},
				dataType : "json"
			})
		}		
	})
})
</script>

</head>
<body>
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

    <div class="container2" id="totalDiv">
     <!-- 메뉴 -->
        <div id = "menu-bar">      
        	<ul class="nav nav-pills" role="tablist">
            	<li class="nav-item">
            	
                	<a class="btn btn-outline-dark <%if(type==1) {%>active<%} %>" data-toggle="pill" id="hitGram" style = "border: none;">인기</a>
          		</li>
    
          		<li class="nav-item" >
                	<a class="btn btn-outline-dark <%if(type==2) {%>active<%} %>" data-toggle="pill" id="newGram" style = "border: none;">최신</a>
          		</li>
    
          		<li class="nav-item">
                	<a class="btn btn-outline-dark <%if(type==3) {%>active<%} %>" data-toggle="pill" id="myLikeGram" href="#likeImg" style = "border: none;">좋아요</a>
          		</li>

          		<input type= "button"	id = "regBtn" type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal" value = "리뷰작성하기">
        	</ul>
        </div>

     <!-- 게시글 -->
          <!-- 인기 게시글 -->
          
          <div id="hitImg" class="container2 tab-pane active gramListDiv" ><br> 
          <%
          for(StyleProdVO styleVo : styleList){	// 스타일그램 개수만큼 반복
        	%>
          		<div class = 'post' id ='<%=styleVo.getGram_num()%>'>
	          		<div class = 'userBox'>
	          		<%if(vo==null){%>
						<a href = '<%=request.getContextPath() %>/view/login.jsp'>
	          		<%}else{%>
						<a href = '<%=request.getContextPath() %>/StyleGramDetail.do?num=<%=styleVo.getGram_num()%>' style = "color:black;">
	          		<%}%>
							<img class = 'item' alt='<%=styleVo.getGram_photo()%>' src='/kreamv/images/style/<%=styleVo.getGram_photo()%>'><br>
							<img class = 'profile' alt='<%=styleVo.getMem_photo()%>' src='/kreamv/images/profile/<%=styleVo.getMem_photo()%>'>
							<span id ='mem_id'><%=styleVo.getMem_id() %></span><br>
							<h7><%=styleVo.getGram_cont() %></h7>
						</a><br>
						<div id="btnDiv">
							<img class = 'img_btn' src='/kreamv/images/reply.png'><%=styleVo.getGram_reply_cnt() %>
								<%
								String photoValue = "likeBtnIcon";
								if(vo!=null){ 
									for(LikegramVO likeGramVo : likeGramList){
										if(likeGramVo.getGram_num()==styleVo.getGram_num()){
											photoValue = "likeBtnIcon2";
										}
									} 
								}%>
							<input type = 'image' src = '/kreamv/images/style/<%=photoValue %>.png' class = 'img_btn likeBtn' value="<%=photoValue%>" style="width:15px; height:14px; margin-top:3px;">
							<label style="font-weight:normal;"><%=styleVo.getGram_like_cnt() %></label><br>
						</div>
					</div>
				
					<div class = 'prodBox'>
						<a href='<%=request.getContextPath()%>/getProd.do?prodId=<%=styleVo.getProd_id()%>'>
							<table><tr>
								<td>
							        <img class = 'prod' alt='<%=styleVo.getProd_photo1()%>' src='/kreamv/images/<%=styleVo.getProd_photo1()%>'>
								</td>
								<td>
							        <h7 class="gramProd"><%=styleVo.getProd_brand()%>&nbsp;&nbsp;<%=styleVo.getProd_enm()%></h7><br>
							        <h7 class="gramProd"><%=styleVo.getProd_knm()%></h7>
								</td>
							</tr></table>
			        	</a>
			        </div>
		        </div>

        <% }%>
		        
			</div>
		</div>
          
          <!-- 게시글 작성 Modal -->
			<div class="modal" id="myModal">
			  <div class="modal-dialog modal-dialog-centered modal-lg">
			    <div class="modal-content">
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title" style = "margin-left: 19px;">STYLE 리뷰 쓰기</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        <div class="container mt-3" style = "display: flex; flex-flow: row;">
				    	<div><label style = "margin-top: 5px; margin-right: 20px;">구매한 상품 목록</label></div>
			        	<div>
			        	<form id = "prod" action="/action_page.php">
				        	<select id = "styleProd" name="prod" class="custom-select mb-3">
				        	</select>			        	
			        	</form>
			        	</div>
			        </div>
			        
			        <form id = "content">
			        	
				         	<label style = "margin-left: 15px;">작성자</label>
				         	<p style = "display: inline; margin-left: 19px; font-size: 20px;"><%=session.getAttribute("loginId")%></p><br>			        	
			         	
				         	<label style = "margin-left: 15px;"> 내용</label>
				         	<textarea style = "resize: none; margin-left: 19px; font-size: 20px;" rows="10" class="txt" cols="47" name = "content"></textarea> <br>				         	
							
							<div style = "display: flex; flex-flow: row;">
					         	<label style = "margin-left: 15px;">첨부파일</label>
					         	<input type = "file" name = "photo" style = "margin-left: 22px;"><br>													
							</div>
         			</form>
			        
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <input type = "button" class="btn btn-dark" value = "확인" id = "wsend">
			        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- modal div끝 -->	
       </div>
       <!-- 게시글 div끝 -->
   </div>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>