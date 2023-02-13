<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kreamv | 마이페이지</title>
   <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 
 <script src="/kreamv/js/hsy.js"></script>
 
  <script>
  		var uid = '<%=(String)session.getAttribute("loginId")%>'; // 로그인한 회원의  아이디 세션
  		
  	function showMyProfile(){
  		 $.ajax({
				url : '<%=request.getContextPath()%>/Mypage.do',
				data : {"loginId" : uid},
				type : "post",
				success : function(res){
					code = "";
					code +=`<div class="profileDiv">
						<h3><b>내 프로필</b></h3><hr> 
				 		<table><tr><td>
				 		<div class="myInfo2"><p><img src="<%=request.getContextPath()%>/images/profile/\${res.mem_photo}" width="205px" height="205px"></p>
				 		<input type = "button" id = "changeprofileImg" name = "changeprofileImg" class="btn btn-light" value = "이미지변경" data-toggle="modal" data-target="#myModal">
				 		<input type = "button" id = "deleteprofileImg" name = "deleteprofileImg" class="btn btn-light" value = "이미지삭제"></div>
				 		</td>
				 		
				 		<td class="myInfo">
				 		</td>
				 		<td class="myInfo">
				 		<h4><b>내 정보</b></h4>
				 		<label class="labelTitle"><b>아이디</b></label>
				 		<label class="labelContent"> \${res.mem_id}</label><br>
				 		
				 		<label class="labelTitle"><b>이름</b></label>
				 		<label class="labelContent">\${res.mem_nm}</label><br>

				 		<label class="labelTitle"><b>이메일</b></label>
				 		<label class="labelContent"><input type ='text' id = 'idmail' class="change" value ='\${res.mem_mail}' readonly></label>				 		
				 		<input type = "button" id = "changeMail" name = "changeMail" class="btn btn-light bt2" value = "변경" style = "display : flex-block">
				 		<input type = "button" id = "changeMailok" name = "changeMailok" class="btn btn-light bt2" value = "확인" style ="display :none"><br>
				 		
				 		<label class="labelTitle"><b>비밀번호</b></label>
				 		<label class="labelContent"><input type ='password'id = 'passtag' class="change" value =\${res.mem_pass} readonly></label>
				 		<input type = "button" id = "changePass" name = "changePass" class="btn btn-light bt2" value = "변경"style = "display : flex-block">
				 		<input type = "button" id = "changePassok" name = "changePassok" class="btn btn-light bt2" value = "확인" style ="display :none"><br>
				 		
				 		<label class="labelTitle"><b>핸드폰번호</b></label>
				 		<label class="labelContent"><input type ='text'id = 'hptag' class="change" value =\${res.mem_hp} readonly></label>
				 		<input type = "button" id = "changehp" name = "changehp" class="btn btn-light bt2" value = "변경"style = "display : flex-block">
				 		<input type = "button" id = "changehpok" name = "changehpok" class="btn btn-light bt2" value = "확인" style ="display :none"><br>
				 		
				 		<label class="labelTitle"><b>신발사이즈</b></label>
				 		<label class="labelContent"><input type ='text'id = 'sizetag' class="change" value =\${res.mem_shoes} readonly></label>
				 		<input type = "button" id = "changesize" name = "changesize" class="btn btn-light bt2" value = "변경"style = "display : flex-block">
				 		<input type = "button" id = "changesizeok" name = "changesizeok" class="btn btn-light bt2" value = "확인" style ="display :none"><br>
				 		</td>
				 		</tr>
				 		</table>
				 		<hr>
				 		</div>`;
					$("#result").empty();
				 	$("#result").html(code);
				},
				
				dataType : 'json'
				 
			 });
  		}
  		
  //-------------------------------------- 지형---		
  		//이미지 변경 버튼 누를 시 띄워진 모달창에 사진을 비동기 처리로 보낸다
  		$(document).on("click","#changeImgBtn",function(){
  			//모달창에 있는 파일을 만든다
  			var formdata = new FormData();
  			updateImg = $('#updateImg')[0].files[0];
  			
  			    formdata.append("updateImg", updateImg);
  			  	formdata.append("uid", uid);
  			$.ajax({
  				url :'<%=request.getContextPath()%>/MyimageUpdate.do',
  				type :'POST',
  				data : formdata,
  				enctype :'multipart/form-data',
  				processData:false,
  		        contentType:false,
  				success : function(res){
   					if(res == "imgUpdateSuccess"){
   						$('#myModal').hide();
   							alert("수정 되었습니다");
   						setTimeout(function(){
   							location.href = '<%=request.getContextPath()%>/Mypage.do';
   						}, 3000);
   					}else if(res == "imgUpdateError"){
   						$('#myModal').hide();
   							alert("수정에 실패했습니다");
   						setTimeout(function(){
   							location.href = '<%=request.getContextPath()%>/Mypage.do';
   						}, 3000);
   					}
  				},
  				error : function(xhr) {
					alert("상태  : " + xhr.status);
				},
				dataType : 'json'
  			});
  		})
  		

  		
  		
  		
  		//이미지 삭제 버튼을 누르면 해당 회원의 image 파일을 기본파일로 바꾼다.
  		$(document).on("click","#deleteprofileImg",function(){
  		
  			 if(confirm("정말 삭제하시겠습니까?") == true){ 
	  			$.ajax({
	  				url :'<%=request.getContextPath()%>/MyimageDelete.do',
	  				type :'get',
	  				data : {"uid" : uid},
	  				
	  				success : function(res){
	  						if(res = "success"){
	  							swal("삭제되었습니다");
	  							setTimeout(function(){
	  	   							location.href = '<%=request.getContextPath()%>/Mypage.do';
	  	   						}, 3000);
	  						}else{
	  							swal("삭제하지 못하였습니다");
	  							setTimeout(function(){
	  	   							location.href = '<%=request.getContextPath()%>/Mypage.do';
	  	   						}, 3000);
	  						}
	  				},
	  			});
  				
  				  }    
  				else{
  					    return ;  
					 }
  			
  		})
  	
  	
  			
  			
  		
  		
  		
  		
  // ----------------------------------------------------------	
  	// 이름수정버튼 클릭시
  	$(document).on("click", "#changename", function() {
//   		alert("hello");
  		//   js                        . jquery
  		//document.getElementById("nametag").prop('readonly', false);
  		
  		$('#nametag').prop('readonly', false); // 입력가능
  		
  		// 수정 버튼 보여주고
  		$("#changenameok").css('display', 'inline-block');
  		// 변경버튼 숨김 
  		$('#changename').css('display','none');
  		
		
  		
  		// 값 바꾸고 확인 버튼 누르면 
  		// ajax로  해당 회원의 회원 테이블가서 수정후 
  		// alert 창 띄우고 수정 완료 
  		// 해당 태그  readonly로 바꾸고 
  		
//   		console.log(a);
  		

  	});
  	
	// 이름 확인 버튼 클릭
  	$(document).on("click", "#changenameok", function() {
  		$('#nametag').prop('readonly', true);
  		$('#changenameok').css('display','none');
  		$("#changename").css('display', 'inline-block');
  		
		updateName = $('#nametag').val();
 
//  		alert(updateName);
  		$.ajax({
  			url : '<%=request.getContextPath()%>/MypageUpdate.do',
  			type : 'get',
  			data : {"updateName":updateName},
  			success : function(res) {
				if(res == "이름 수정이 완료 되었습니다"){
					swal('이름 수정이 완료 되었습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}else if(res == "이름 수정에 실패했습니다"){
					swal('이름 수정이 완료 되었습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
  		
  		})
  		
  	})
  	
  	
  	// 비밀번호 수정 버튼 클릭시
  	$(document).on("click", "#changePass", function() {
  		
  		$('#passtag').prop('readonly', false); // 입력가능
  		
  		// 수정 버튼 보여주고
  		$("#changePassok").css('display', 'inline-block');
  		
  		// 변경버튼 숨김 
  		$('#changePass').css('display','none');
  		
  	});
  	
 // 비밀번호 확인 버튼 클릭
  	$(document).on("click", "#changePassok", function() {
  		$('#passtag').prop('readonly', true); // 입력불가
  		$('#changePassok').css('display','none');
  		$("#changePass").css('display', 'inline-block');
  		
		updatePass = $('#passtag').val();
  
// 		alert(updatePass);
  		$.ajax({
  			url : '<%=request.getContextPath()%>/MypageUpdate.do',
  			type : 'post',
  			data : {"updatePass":updatePass},
  			success : function(res) {
				if(res == "비밀번호 수정이 완료 되었습니다"){
					swal('비밀번호 수정이 완료 되었습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}else if(res == "비밀번호 수정에 실패 하었습니다"){
					swal('비밀번호 수정에 실패 하었습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
  		
  		})
  		
  	})
  
 // ===================================================	
  	
	 	// 핸드폰 수정 버튼 클릭시
  	$(document).on("click", "#changehp", function() {
  		
  		$('#hptag').prop('readonly', false); // 입력가능
  		
  		// 수정 버튼 보여주고
  		$("#changehpok").css('display', 'inline-block');
  		
  		// 변경버튼 숨김 
  		$('#changehp').css('display','none');
  		
  	});
  	
 // 핸드폰 확인 버튼 클릭
  	$(document).on("click", "#changehpok", function() {
  		$('#hptag').prop('readonly', true); // 입력불가
  		$('#changehpok').css('display','none');
  		$("#changehp").css('display', 'inline-block');
  		
		updateHp = $('#hptag').val();
  
//  		alert(updateHp);
  		$.ajax({
  			url : '<%=request.getContextPath()%>/MypageUpdate2.do',
  			type : 'post',
  			data : {"updateHp":updateHp},
  			success : function(res) {
				if(res == "핸드폰 번호 수정이 완료 되었습니다"){
					swal('핸드폰 번호 수정이 완료 되었습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}else if(res == "핸드폰 번호 수정에 실패 하었습니다"){
					swal('핸드폰 번호 수정에 실패 하었습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
  		
  		})
  		
  	})
  //=================================================================
	
   	 	// 사이즈 수정 버튼 클릭시
  	$(document).on("click", "#changesize", function() {
  		
  		$('#sizetag').prop('readonly', false); // 입력가능
  		
  		// 수정 버튼 보여주고
  		$("#changesizeok").css('display', 'inline-block');
  		
  		// 변경버튼 숨김 
  		$('#changesize').css('display','none');
  		
  	});
  	
 // 사이즈 확인 버튼 클릭
  	$(document).on("click", "#changesizeok", function() {
  		$('#sizetag').prop('readonly', true); // 입력불가
  		$('#changesizeok').css('display','none');
  		$("#changesize").css('display', 'inline-block');
  		
		updateSize = $('#sizetag').val();
  
 // 		alert(updateSize);
  		$.ajax({
  			url : '<%=request.getContextPath()%>/MypageUpdate2.do',
  			type : 'get',
  			data : {"updateSize":updateSize},
  			success : function(res) {
				if(res == "신발 사이즈 수정이 완료 되었습니다"){
					swal('신발 사이즈 수정이 완료 되었습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}else if(res == "신발 사이즈 수정에 실패했습니다"){
					swal('신발 사이즈 수정에 실패했습니다');
					location.herf = '<%=request.getContextPath()%>/Mypage.do';
				}
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
  		
  		})
  		
  	})	  
	 
  	 $(function(){
  			 
  		 showMyProfile();
  	
  		 $("#showProfile").on("click",function(){
  	  		 showMyProfile();
  				 
  		 });//endofshowProfile
  		
  		 
  	 });
  	

//   	 허소영
  	 $(function(){
  		 $('.showProfile').on('click', function(){
  			 idValue = $(this).attr('id');
  			 if(idValue=='buy'){
  				myBuyList(1);
  			 }else if(idValue=='sell'){
  				mySellList(1);
  			 }else if(idValue=='store'){
  				myStoreList(1);
  			 }else if(idValue=='wish'){
  				myWishList();
  			 }else if(idValue=='profile'){
  			 }else if(idValue=='payment'){
  			 }else if(idValue=='account'){
  				 
  			 }
  		 })
  		 
  		 $(document).on('click', '#myBuyBidList', function(){	// 1번
  			myBuyList(1); 			 
  		 })
  		 $(document).on('click', '#myBuyStayList', function(){	// 2번
  			myBuyList(2); 			 
  		 })
  		 $(document).on('click', '#myBuyOrderList', function(){	// 3번
  			myBuyList(3); 			 
  		 })
  		 $(document).on('click', '#mySellBidList', function(){	// 1번
  			mySellList(1); 			 
  		 })
  		 $(document).on('click', '#mySellStayList', function(){	// 2번
  			mySellList(2); 			 
  		 })
  		 $(document).on('click', '#mySellOrderList', function(){	// 3번
  			mySellList(3); 			 
  		 })
  		 $(document).on('click', '#myConfirmList', function(){	// 1번
  			myStoreList(1); 			 
  		 })
  		 $(document).on('click', '#myStoreList', function(){	// 2번
  			myStoreList(2); 			 
  		 })
  		 $(document).on('click', '#mySendBackList', function(){	// 3번
  			myStoreList(3); 			 
  		 })
  		 $(document).on('click', '.wishCancle', function(){	// 3번
  			wishCancle($(this).attr('id'));
  		 })
  		 
  		 
  	 })

  </script>

	<style>
		.nav-link{
		list-style: none;
		color :inherit;
	}
	
		.btn-light{
		width: 100px;
		height: 30px;
		font-size: 0.7em;
		margin-right: 3px;
	}
	.bt2{
		width: 50px;
	}
	
	.labelTitle{
		margin-left : 20px;
		width: 100px;
		font-size: 1.1em;
	}
	
	.labelContent{
		width: 300px;
	}
	
	  td {
        padding: 5px;
      }
     
/*       허소영 */
    .button {
	width: 33%;
	}
	.prod12 {
		width : 640px;
	}
	.prod1 {		
		padding-left : 10px;
		width: 200x;
	}
	.prod2 {	
		width: 520px;
		padding-left : 20px;	
		text-align : left;
	}
	.prod3 { 
		width : 150px;
		text-align : right;
	}
	.prod4 { 
		width : 150px;
		text-align : right;
	}
	#prodImage{
		width : 100px;
	}
	.data{
		display : none;
	}
	#contain2{
		display : flex;
		align-items: row;
	}
	
	
	/* 지현 */
	.container2{
		display: flex;
	}
	
	.side_nav{
		margin-left: 10%;
		margin-right: 10%;
	}
	
	.textLink, .textLink:hover {
		color:black;
		text-decoration: none;
	}
	
	.container3{
		text-align: right;
	}
	
	.myInfo {
		margin-top: 40px;
		padding-right: 100px;
	}
	
	.myInfo2{
		padding-right: 50px;
		margin-left: 30px;
		margin-bottom: 30px;
	}
	
	.profileDiv{
		padding: 50px;
		width: 100%;
		}

		
	#prodImage {
	border-radius: 8px;
	}	
	.showProfile{
		font-size : 1.15em;
		margin : 5px;
	}
	
	$totalProfDiv{
		display : flex;
	}
	.change{
		border : none;
		border_bottom : 1px solid black;
	}

	a:active{
		font-weight: bold;
	}
	
	a:hover {
		font-weight: bold;
	}
	
	
</style>
	<script >
	
	<%
		SampleMemberVO vo = (SampleMemberVO)session.getAttribute("memberlogin");
	%>
		
	$(function(){
	
		showProfile();
		
	});
	
	function showProfile(){
		
		
	}

	</script>

</head>
<body>
	

	<jsp:include page="mainheader.jsp"></jsp:include>
	
	
	<div class = "container2" >
		 <div class = "side_nav" id = "side_nav">

		<br>
		 	<h3><a class="textLink" href = "<%=request.getContextPath()%>/Mypage.do"><b>마이페이지</b></a></h3>
		 
			<div class="container3">
			<br>
			 	<h4><b>쇼핑 정보</b></h4>
	
				<div class = "showProfile" style="cursor: pointer;" id="buy" ><a>구매 내역</a></div>
				<div class = "showProfile" style="cursor: pointer;" id="sell"><a>판매 내역</a></div>
				<div class = "showProfile" style="cursor: pointer;" id="store"><a>보관 판매</a></div>
				<div class = "showProfile" style="cursor: pointer;" id="wish"><a>관심 상품</a></div>
				<br>
	
			 	<h4><b>내 정보</b></h4>
	
				<div class = "showProfile" style="cursor: pointer" id = showProfile>프로필정보</div>
				</div>
		 </div>
		 
		 <!--비동기 처리될 부분  -->
		 <div id = "result"  class = "result">
		 
		</div>
	</div>
		 
		<!-- 모달 창 -->
		
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">이미지 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
     <div class="modal-body">
     	<h4>변경할 이미지를 넣어주세요</h4> <br>
     	 
  		<form id = "content"  >
			    
		  	<label>첨부파일</label>
			<input type = "file" id="updateImg" name="photo"><br>
      	</form>
		 
	</div>
      <!-- Modal footer -->
      <div class="modal-footer">
      	<input type ="button" class="btn btn-dark" id = "changeImgBtn" value = "등록">
        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>