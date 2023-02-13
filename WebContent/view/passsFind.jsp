<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 비밀번호 찾기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.nav-link {
		list-style: none;
		color :inherit;
	}
	
	.shortCut_items{
		display : flex;
		
	}
	
	h3{
		text-align: center;
	}
	
	.container2{
		display : flex;
		justify-content: center;
	}
	
	.title{
		width: 100px;
		font-weight: bold;
	}
	
	.btn{
		margin-left: 30%;
	}

</style>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('input[type="button"]').on('click', function() {
			$.ajax({
				url : '<%=request.getContextPath()%>/passFind.do',
				data : {"id" : $('#id').val().trim(), "hp" : $('#hp').val().trim()},
				type : 'post',
				success : function(res) {
					if(res == "정보가 일치하지 않습니다"){
						alert("정보가 일치하지 않습니다");
					}else if(res == "해당 이매일로 비밀번호가 발송되었습니다"){
						alert("해당 이매일로 비밀번호가 발송되었습니다");
					}
				},
				error : function(xhr) {
					alert('상태 : ' + xhr.status);
				},
				dataType : 'json'
			});
		});
	});
</script>
</head>
<body>

	<jsp:include page="mainheader.jsp"></jsp:include>

<h3><b>비밀번호 찾기</b></h3><br>
	<div class="container2">
		<div><hr>
			<div>
			
				<label class="title">아이디</label><input type="text" id="id" name="id">
			</div>
			
			<div>
				<label class="title">휴대폰번호</label><input type="text" id="hp" name="hp">
			</div>
			<br>
			<div>
				<input type="button" value="비밀번호 찾기" class="btn btn-dark join">
			</div>
			<hr>
		</div>
	</div>
</body>
</html>