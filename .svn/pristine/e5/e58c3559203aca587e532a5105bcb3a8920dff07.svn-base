<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 로그인</title>
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
	
	.container2{
		display : flex;
		justify-content: center;
	}
	
	h3{
		text-align: center;
	}
	
	.title{
		width: 70px;
		font-weight: bold;
	}
	
	.content{
		margin-top: 20px;
		 color: black;	
		 font-size: 0.8em;
	}
	
	.button1{
		margin-left: 50px;		
	}
	
/* 	.title{ */
/* 		width: 100px; */
/* 	} */

</style>
</head>
<body>
	<jsp:include page="mainheader.jsp"></jsp:include>
		
		
		<h3><b>로그인</b></h3>
			
			
	<div class="container2">
		<div>
		<hr>
	<form action="<%=request.getContextPath()%>/memberLogin.do" method ="POST" id = "loginForm">
			<div>
			<label class="title">아이디</label>
			<input type="text" id="id" name="id"><br>
			</div>

			<div>
			<label class="title">비밀번호</label>
			<input type="password" id="pass" name="pass">
			</div>
			<br> 
			<div class="button1">
			<input type="submit" value="로그인" class="btn btn-dark">
			<input type="button" id="pass" value="회원가입" class="btn btn-dark" onclick="location.href='/kreamv/view/join.jsp'"><br>
			</div> 
	</form>
		</div>
	</div>
		<div class="container2">
		
		<div class= "content">
		<a  href="/kreamv/view/idFind.jsp">아이디 찾기</a>
		<a   href="/kreamv/view/passsFind.jsp">비밀번호 찾기</a>
		</div>
		</div>
		<hr>
			
	
</body>
</html>