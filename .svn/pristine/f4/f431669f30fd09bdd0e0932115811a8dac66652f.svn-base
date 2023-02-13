<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.nav-link {
    list-style: none;
    color: inherit;
}
.nav-link {
    display: block;
    padding: 0.5rem 1rem;
}
a {
    color: black;
}
a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
}
*, ::after, ::before {
    box-sizing: border-box;
}
user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
user agent stylesheet
li {
    text-align: -webkit-match-parent;
}
.nav {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}

user agent stylesheet
ul {
    list-style-type: disc;
}
h3{
	margin-left: 39%;
	margin-top: auto;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#btn').on('click', function() {
			selectName = $('#select').val();
			
			$.ajax({
				url : '',
				
			})
		})
	})
</script>
</head>
<body>
	<jsp:include page="mainheader.jsp"></jsp:include>
	<div id="carouselExampleIndicators" class="carousel slide slideSize" data-ride="carousel"  data-interval="3000">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/images/nike.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/adidas.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/supreme.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>
	<div id="main">
		<div class="Element">
			<select id="select">
				<option value="신발">신발</option>
				<option value="의류">의류</option>
				<option value="잡화">잡화</option>
			</select>
		</div>
		<div class="Element">
			<input type="text" placeholder="검색어를 입력하세요">
		</div>
		<div class="Element">
			<input id="btn" type="button" value="확인">
		</div>
	</div>
	
	<div id="result">
		
	</div>
	
</body>
</html>