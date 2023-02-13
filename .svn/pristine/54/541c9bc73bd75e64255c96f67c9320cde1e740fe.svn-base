<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 회원가입</title>
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
	
	.gen{
		margin-left: 40px;
	 	accent-color: black;
	}
	
	.join{
		margin-left: 35%;
	}
	
	
</style>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	function addrsearch() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('addr1').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("addr1").value += roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("addr1").value += jibunAddr;
	            }
	        }
	    }).open();
	}
	
	$(function() {
		
		toggle = false; // 중복검사 없이 회원가입 불가
		
		$('input[type="submit"]').on('click', function() {
			if(toggle == false){
				alert('중복검사를 선행해 주세요');
				return false;
			}
			
			if($('#id').val().length == 0 || ''){
				alert('아이디 항목이 누락되었습니다');
				return false;
			}
			if($('#pass').val().length == 0 || ''){
				alert('비밀번호 항목이 누락되었습니다');
				return false;
			}
			if($('#name').val().length == 0 || ''){
				alert('이름 항목이 누락되었습니다');
				return false;
			}
			if($('.gen').val().length == 0 || ''){
				alert('성별 항목이 누락되었습니다');
				return false;
			}
			if($('#bir').val().length == 0 || ''){
				alert('생년월일 항목이 누락되었습니다');
				return false;
			}
			if($('#email').val().length == 0 || ''){
				alert('이메일 항목이 누락되었습니다');
				return false;
			}
			if($('#hp').val().length == 0 || ''){
				alert('핸드폰 번호 항목이 누락되었습니다');
				return false;
			}
			if($('#addr1').val().length == 0 || ''){
				alert('주소 항목이 누락되었습니다');
				return false;
			}
			if($('#addr2').val().length == 0 || ''){
				alert('상세 주소 항목이 누락되었습니다');
				return false;
			}
			if($('#size').val().length == 0 || ''){
				alert('신발 사이즈 항목이 누락되었습니다');
				return false;
			}
			
			
			
			return true;
			
		})
		
		$('#id').on('keyup', function() {
			if($('#id').val().trim().length >= 4){
				
				idcheck = $('#id').val().trim();
				
				$.ajax({
					url : "<%= request.getContextPath()%>/Join.do",
					type : 'get',
					data : {"idcheck" : idcheck},
					success : function(res) {
						if(res == "사용불가"){
							$('#idcheck').text('존재하는 아이디 입니다');
						}else if(res == "사용가능"){
							$('#idcheck').text('사용 가능한 아이디 입니다');
							toggle = true;
						}
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
				})
			}
				
		}) // keyup이벤트
		
		
	}) // function
	
		function autoinput() {
			$('#id').attr('value', "kreamv");
			$('#pass').attr('value', "1234");
			$('#name').attr('value', "최중호");
			$('#email').attr('value', "ho2755@naver.com");
			$('#hp').attr('value', "010-2369-2755");
			$('#addr2').attr('value', "232-18");
			$('#size').attr('value', "270");
			//alert('aaa')
		}
</script>
</head>
<body>
	<jsp:include page="mainheader.jsp"></jsp:include>
		
		
		<h3><b>회원가입</b></h3>

	<div class="container2">
		<div>
		<form action="<%=request.getContextPath()%>/Join.do" method="post" >
		<input type="button" value="autoinput" onclick="autoinput()">
		<hr>
			<div>
			<label class="title">아이디</label>
				<input type="text" id="id" name="id">
					<span id="idcheck"></span>
			</div>
			<div>
			<label class="title">비밀번호</label>
				<input type="password" id="pass" name="pass" autocomplete="true">
			</div>
			
			<div>
			
			<label  class="title">이름</label>
				<input type="text" id="name" name="name" >
			</div>
			
			<div>
			<label  class="title">성별</label>
				 <input type="radio" class="gen" name="gen" value="male"> 남
				      <input type="radio" class="gen" name="gen" value="fmale"> 여
			</div>
			
			<div>
			<label class="title">생년월일</label>
				<input type="date" id="bir" name="bir" autocomplete="bday">
			</div>
			
			<div>
			<label class="title">이메일</label>
				<input type="text" id="email" name="email">	
			</div>
			
			<div>
			<label class="title">핸드폰번호</label>
				<input type="text" id="hp" name="hp" >
			</div>
			
			<div>
			<label class="title">주소</label>
				<input type="text" id="addr1" name="addr1">
					<input type="button" value="주소 검색" onclick="addrsearch()" class="btn btn-light">	
			</div>
			
			<div>
			<label class="title">상세주소</label>
				<input type="text" id="addr2" name="addr2" >	
			</div>
			
			<div>
			<label class="title">신발사이즈</label>
				<input type="text" id="size" name="size"><br>
			</div>
			<hr>
				<input type="submit" value="가입하기" class="btn btn-dark join">
		</form>
		</div>
	</div>
</body>
</html>