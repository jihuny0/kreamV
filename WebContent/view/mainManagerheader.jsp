<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<%
      SampleMemberVO vo =  (SampleMemberVO)session.getAttribute("loginMember");

	  if(vo == null){
%>
	<ul class="nav justify-content-end">
	  <li class="nav-item">
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/askBoard.jsp">문의사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/adminBoard.jsp">고객관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">관심상품</a>
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
	    <a class="nav-link " href="<%=request.getContextPath()%>/view/adminBoard.jsp">고객관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">관심상품</a>
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
  <a class="navbar-brand" href="<%=request.getContextPath()%>/view/">
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
      <a class="nav-link" href="#">
      <img id="search" src="<%=request.getContextPath()%>/images/돋보기.png" width="30" height="30" class="d-inline-block align-top" alt="">
      </a>
    </li>
  </ul>
</div>
</nav>
</body>
</html>