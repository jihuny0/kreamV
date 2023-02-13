<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
header{
position: fixed;
  top: 0;
  width: 100%;
  background-color: white;
}
body {
  padding-top: 130px;
  /* 생략 */
}

a{
	color: black;
}

a:hover{
	color: black;
	text-decoration: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/cesiumjs/1.78/Build/Cesium/Cesium.js"></script>
<script type="text/javascript">
$(function() {
	$('#search').on('click', function() {
		location.href = '<%=request.getContextPath()%>/Search.do';
	})
})
</script>
</head>
<body>
<header>
<%
      SampleMemberVO vo =  (SampleMemberVO)session.getAttribute("loginMember");

	  if(vo == null){
%>
	<ul class="nav justify-content-end">
	  <li class="nav-item">
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/askBoard.jsp">문의사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/adminBoard.jsp">고객센터</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<%=request.getContextPath()%>/memberLogin.do">마이페이지</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href ="<%=request.getContextPath()%>/view/login.jsp">로그인</a>
	     
	  </li>
	</ul>
<%
	  }else {
		  
%>	
	<ul class="nav justify-content-end">
	  <li class="nav-item">
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/askBoard.jsp">문의사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/adminBoard.jsp">고객센터</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<%=request.getContextPath()%>/Mypage.do">마이페이지</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href ="<%=request.getContextPath()%>/Memberlogout.do">로그아웃</a>
	  </li>
	</ul>
<%
	  }
%>
	<hr>
 	<nav class="nav">
  <a class="navbar-brand" href="<%=request.getContextPath()%>/view/main.jsp">
    <img src="<%=request.getContextPath()%>/images/kreamv_logo.png" width="180" height="40" class="d-inline-block align-top" alt="">
  </a>
  <div class="container">
  <ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath() %>/styleGramList.do?type=1">STYLE</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/allProdList.do">SHOP</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">ABOUT</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/allProdList.do">
      <img id="search" src="<%=request.getContextPath()%>/images/돋보기.png" width="30" height="30" class="d-inline-block align-top" alt="">
      </a>
    </li>
  </ul>
</div>
</nav>
</header>
</body>
</html>