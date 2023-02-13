<%@page import="kr.co.kreamv.vo.LikegramVO"%>
<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@page import="kr.co.kreamv.vo.StyleProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
	
.navbar-brand{
	padding-left: 30px;
}

/* .container {
	display: flex;
	flex-direction: column;
	justify-content: center;
} */

.container{
	margin-top: 10px;
	margin-left: 30%;
	margin-right: 30%; 
}


/* userBox */
.userBox{
	display: flex;
	width: 70%;
}

.userBox .profile{
	width: 50px;
	height: 50px;
	border-radius: 60%;
	margin-bottom: 10px;
}
/* userBox 끝*/



.item .photo{
	width: 70%;
	height: 100%;
}
.photo {
	border-radius: 10px;
}

/* prodBox */
.prodBox{
	display: flex;
	flex-flow: row;
}

.prodBox .prod{
	width: 80px;
	margin : 10px;
}
.prod {
	border-radius: 10px;
}
/* prodBox 끝*/


.imgBtnBox{
	display: flex;
	flex-flow: row;
} 

.imgBtnBox .imgBtn{
	width: 30px;
	height: 30px;
}
/* 이미지 버튼 끝*/

/* 댓글Box */
.replyBox{

}


.replyBox .profile{
 	width: 50px;
	height: 50px;
	border-radius: 60%;
	margin-bottom: 8px;
}


/* 댓글Box끝*/

.modal_photo{
	width: 100%;
	height: 90%;
	border-radius: 10px;
}

/* .modal-body{
	display: flex;
	flex-flow: row;
} */


h7{
	padding-top: 10px;
	margin-left: 10px;
	font-size: 20px;
	font-weight: bold;
}

.gramCont{
	font-size: 20px;
	text-align: left;
	margin-top: 30px;
	margin-bottom:30px;
}

a{
	color: black;
}

a:hover{
	color: black;
	text-decoration: none;
}


.modal-body{
	display: flex;
	flex-flow: row;
	width: 100%;
	height: auto; 
}
#temp{
	display : flex;
	margin-bottom : 5px;
}
#likeBtn{
	margin-left : 10px;
	margin-right : 22px;
}
#replyImg{
	width:40px;
	float:left;
}
.div1{
	width:500px;
}
#replyCont{
	border : none;
	border-bottom : 1px solid gray;
}
</style>



<script>
<%
	List<StyleProdVO> list = (List<StyleProdVO>)request.getAttribute("list");
	 SampleMemberVO vo2 = (SampleMemberVO)request.getAttribute("memberVo");
%>

function newReplace(){  
    $(".replyBox").load(window.location.href + ".replyBox");
}
</script>

<script>
$(function(){
	//해당게시글 번호를 넘겨주고 해당게시글의 댓글 리스트를 받아온다.
	gramNum = $('div[class=item]').attr('id');
	console.log(gramNum);
	
	length = 0;
	
	$.ajax({
		url : '<%=request.getContextPath()%>/GramReplyList.do?gramNum=' + gramNum,
		type : 'get',
		success : function(res){
			modalReply="";
			reply = "<div id='replyDiv'>";
			$.each(res, function(i, v){
				modalReply += "<img class = 'profile' src = '/kreamv/images/profile/" + v.mem_photo + "'>";
				modalReply += v.mem_id + " " + v.greply_cont + "<br>";
				length = i;
				if(i>=2){
					reply+="";
				}else{
				reply += "<img class = 'profile' src = '/kreamv/images/profile/" + v.mem_photo + "'>";
				reply += v.mem_id + " " + v.greply_cont + "<br>";
				}
			})
			reply+="</div>";
			if(length>=2) {reply+='<a data-toggle="modal" href = "#myModal">댓글 더보기</a>';}
			else{reply+='<a data-toggle="modal" href = "#myModal">댓글 달기</a>';}
			$('#replyBox').append(reply);
			$('#modalReplyBox').append(modalReply);
		},
		dataType : 'json'
	})
	
	
	//댓글 작성 후 확인버튼 클릭시 insert이벤트
	$('.replyBtn').on('click', function(){
		var memImg = "<%=vo2.getMem_photo()%>";
		console.log(memImg);
		member = '<%=vo2.getMem_id()%>';
		cnt = $('#replyCnt').text();
			if(member == "null"){
				alert("로그인 필요");		
				location.href="<%=request.getContextPath() %>/view/login.jsp";
			}else{
				gramNum = $(this).attr('id');
				reply = $('#replyCont').val();
				
				$.ajax({
					url : '<%=request.getContextPath() %>/GramReplyInsert.do',
					type : 'get',
					data : { id : member, num : gramNum, replyCont : reply},
					success : function(res){
						code = "<img class = 'profile' src = '/kreamv/images/profile/" + memImg + "'>";
						code += member+ " " + reply + "<br>";
						$('#modalReplyBox').append(code);
						if(length<2){
						length=length+1;
						$('#replyDiv').append(code);
						}
						$('.replyCnt').text(parseInt(cnt)+1);
						$('#replyCont').val("");
// 						$('#myModal').modal('hide');
// 						setTimeout('location.reload()',1000);
						/* $('#replyCont').val("");
						aa = "<img class = 'profile' src = '/kreamv/images/profile/" + memImg +"'>";
						aa += memId + " " + reply + "<br>";
						$('.replyBox').append(aa);
						alert('등록완료');
						setTimeout('location.reload()',5000);  */
					},
					error : function(xhr){
						alert(xhr.status);
					}		
				})
				
				
			}
	})

	
	$('#likeBtn').on('click', function(){
		likeclickBtn = $(this);
		gramNum = $(this).parents('.imgBtnBox').attr('id');

			if("likeBtnIcon"==($(this).val())){
				$.ajax({
					url : '<%=request.getContextPath()%>/StyleGramLike.do',
					data : {"id" : '<%=vo2.getMem_id()%>', "num" : gramNum},
					type : 'post',
					success : function(res){
						if(res == "좋아요 증가 실패"){
							 alert('시스템 에러');
							 location.reload();
						}
//	 					alert(res.likeNum);
						updateLike = res.likeNum;
						$('#likeCntP').text(updateLike);
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
					data : {"id" : "<%=vo2.getMem_id()%>", "num" : gramNum},
					type : 'get',
					success : function(res){
						if(res == "좋아요 감소 실패"){
							 alert('시스템 에러');
							 location.reload();
						}
// 						alert(res.likeNum);

						updateLike = res.likeNum;
						$('#likeCntP').text(updateLike);
					},
					error : function(xhr){
						alert(xhr.status);
					}
				})

				$(this).val("likeBtnIcon");
				$(this).attr('src', '/kreamv/images/style/likeBtnIcon.png');

			}
		
		
	})
})
</script>

<jsp:include page="mainheader.jsp"></jsp:include>
</head>

<body>


<div class="container">
<%
	  	if(list != null){
	    	for(StyleProdVO vo : list){
%>
			<div class = "userBox">
				<img class = "profile" src = "/kreamv/images/profile/<%=vo.getMem_photo() %>">
				<%-- <p><%=vo.getGram_num() %></p> --%>
				<h7><%=vo.getMem_id() %></h7><br>			
			</div>
			
			<div class = "item" id = "<%=vo.getGram_num() %>">
				<img class = "photo" src = "/kreamv/images/style/<%=vo.getGram_photo() %>"><br>
			</div>
			
			<div class = "prodBox">
				<a href='<%=request.getContextPath()%>/getProd.do?prodId=<%=vo.getProd_id() %>'>
					<img class = "prod" src = "/kreamv/images/<%=vo.getProd_photo1() %>">
					<p style = "display: inline;"><%=vo.getProd_knm() %></p>
				</a>
			</div>

			<p></p>
			<div id="contDiv">
			</div>

				<p class = "gramCont"><%=vo.getGram_cont() %></p>	
			
			<div class = 'imgBtnBox' id="<%=vo.getGram_num() %>">
			<%if((int)request.getAttribute("checkLike")==0) {%>
				<input type = 'image'  id="likeBtn" value="likeBtnIcon" class = 'imgBtn' src='/kreamv/images/style/likeBtnIcon.png' style="margin:10px; margin-left:15px; margin-right:20px;">
			<%}else{ %>
				<input type = 'image'  id="likeBtn" value="likeBtnIcon2" class = 'imgBtn' src='/kreamv/images/style/likeBtnIcon2.png'style="margin:10px; margin-left:15px; margin-right:20px;"> 
			<%} %>
				<img class = 'imgBtn' src='/kreamv/images/reply.png'  style="width:45px; height:45px; margin:3px; margin-left:20px;">
			</div>

			
			<div id = "replyBox" class="replyBox">
			<div id="temp">
				좋아요&nbsp;<p id="likeCntP"><%=vo.getGram_like_cnt() %></p>개&nbsp;&nbsp;&nbsp;&nbsp;
				<p>댓글 <a class="replyCnt" id="replyCnt"><%=vo.getGram_reply_cnt() %></a>개</p>
			</div>
			</div>
			
</div>

		<!-- The Modal -->
		
		<div class="modal" id="myModal">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<div class = "div1">
			        <div class = "userBox">
						<img class = "profile" src = "/kreamv/images/profile/<%=vo.getMem_photo() %>">
						<h7><%=vo.getMem_id() %></h7><br>			
					</div>
					<img class = "modal_photo" id="replyPhoto" src = "/kreamv/images/style/<%=vo.getGram_photo() %>">
					
				</div>
				
				<div id = "modalReplyBox" class="replyBox" style = "margin-left: 30px; width : 80%;">
					<div>
						<img class='imgBtn' id="replyImg" src='/kreamv/images/reply.png' style="width : 25px;">
						<p style="margin-top:10px;">&nbsp;댓글 <a class="replyCnt"><%=vo.getGram_reply_cnt() %></a>개</p>
					</div>
						<input id = "replyCont" type = "text" style="width: 80%; margin-bottom : 20px; height:30px;">
						<input class = "btn btn-dark replyBtn" id = "<%=vo.getGram_num() %>" type = "button" value="확인" style = "margin-left: 1%;"><br>
				</div>
		      </div>
			  
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
			
<%
	    	}
	  	}
%>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>