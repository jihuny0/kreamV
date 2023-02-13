<%@page import="kr.co.kreamv.vo.SampleMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KreamV | 상품관리</title>
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src = "../js/updateProd.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
  <script src="/kreamv/js/jquery-3.6.1.min.js"></script>
<style>
	.nav-link {
		list-style: none;
		color :inherit;
	}
	
	.shortCut_items{
		display : flex;
		
	}
	.nav2{
		display : flex;
		flex-direction: column;
	}
	
	#item1 {
		flex-basis: 20%;
		margin-top: 50px;
	
	}
	.container2 {
		display : flex;
		justify-content: space-between;
	}
	
	.item2{
		flex-basis: 60%;
		margin-top : 50px;
		margin-right: 200px;
	}
	
	label{
		width: 120px;
		font-weight: bold;
	}
	
	.prod{
	display:inline-flex;
	flex-flow: row wrap;
	justify-content :flex-start;
	margin-right: 5%;
		
	}

	.prod2{
	width: 300px;
	height: 700px;
	
	}
	
	#deleteprod {
	margin-left: 5%;
	}
	
	#modifyprod, .modifiy1{
		margin-left: 23%;
	}

	.prodInfo, .modifiy2{
		margin-left: 5%;
	}
	
	.productNm{
		width: 100px;	
	}
	
</style>
<%
String msg = request.getParameter("msg");
%>
<script>
	<%
	if(msg!=null){
	%>
		setTimeout(function() {
		}, 3000)
			alert("<%=msg%>");
	<%		
	}
	%>
	
	$(window).on('load', function () {
    	load('#js-load', '4');
    	$("#js-btn-wrap .button").on("click", function () {
        	load('#js-load', '4', '#js-btn-wrap');
    })
});

function canCell() {
	location.href = '<%=request.getContextPath()%>/view/updateProd.jsp';
}
	
	
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

function proc(input) {
//	img = $(input).parent().find('img').attr('src');
// 	alert(img);
//	imgInput = $(input).parent().find('input').eq(0).attr('id');
	
// 	alert(imgInput);
// 	newForm = $(input).parent().find('#newUploadForm');
	newImage = $(input).parent().find('input').eq(0);
	newNum = $(input).parent().find('input').eq(1).val();
	newKnm = $(input).parent().find('input').eq(2).val();
	newEnm = $(input).parent().find('input').eq(3).val();
	
	if(newImage.length == 0){
		swal('파일 하나를 등록해 주세요');
		return false;
		 
	}else{
		formData = new FormData();
		 
		 formData.append("newImage", newImage[0].files[0]);
		 formData.append('newNum', newNum);
		 formData.append("newKnm", newKnm);
		 formData.append("newEnm", newEnm);
		 
		 $.ajax({
			    url: "<%=request.getContextPath()%>/ProdModify.do",
			    type:"POST",
			    processData: false,
			    contentType: false,
			    data: formData,
			    success: function(res){
					if(res == "업데이트 완료"){
						setTimeout(function() {
							swal('수정되었습니다');
							}, 3000);
						location.href = '<%=request.getContextPath()%>/view/updateProd.jsp';
					}else if(res == "업데이트 실패"){
						
						setTimeout(function() {
							swal('수정에 실패했습니다');
						}, 3000);
						
						location.href = '<%=request.getContextPath()%>/view/updateProd.jsp';
					}
			    },
			    error : function(xhr){
			      alert("상태 : " + xhr.status);
			    },
			    dataType : 'json'
			  })
	}
	
// 	console.log(newImage);
	
// 	alert(newImage)
// 	alert(newNum)
// 	alert(newKnm)
// 	alert(newEnm)
	
	
	 
	 
	
// 	alert(inputTag1)
// 	alert(inputTag2)

	
	
}



	$(function(){
		
// 		$(document).on('click', '#modifyprodValidation', function() {
// // 			alert('aa');
// 		formTag = $(this).parent();
// // 		 aa= $(formTag).prop('tagName');
// // 		 alert(aa);
		
// 		formTag.method = "post";
<%-- 		formTag.action = "<%=request.getContextPath()%>/ProdModify.do"; --%>
// 		formTag.submit();
		
// 		})
		
		
// 		// 해당 상품 수정버튼 누를때
		$(document).on('click', '#modifyprod', function(){ // ---------------
			 
			parent = $(this).parent();
			target1 = $(parent).attr('name');
			target2 = $(parent).prop('tagName');
// 			alert(typeof(target1));
// 			alert(target2)
//			parent = $(this).parent();
// 			$(this).parent().attr('name');
			modifyCode = '';
// 			alert($(parent).html());
// 			alert($(parent).find('span').eq(0).text());
			
			prodImgSrc = $(parent).find('img').attr('src');
			prodNum = $(parent).find('span').eq(0).text();
			prodBrand = $(parent).find('span').eq(1).text();
			prodKnm = $(parent).find('span').eq(2).text();
			prodEnm = $(parent).find('span').eq(3).text();
			prodPrice = $(parent).find('span').eq(4).text();
			
// 			alert(prodNum);
		 
			$(parent).empty();

// 			$(this).parent().find('#deleteprod').hide();
// 			$(this).parent().find('#modifyprod').val('확인');
			
// 			alert(result[0].prod_id);
// 						<img src = "../images/\${v.prod_photo1}">
// 								  	<p>제품번호 : 	\${v.prod_id}</p>
// 								  	<p>제품브랜드 :  \${v.prod_brand} </p>
// 								  	<p>제품한글이름 : \${v.prod_knm} </p>
// 								  	<p>제품영어이름 : \${v.prod_enm} </p>
// 								  	<p>제품 가격 : \${v.prod_enm} </p>
			
			
			modifyCode += '<img src = "'+prodImgSrc+'" width="300px" height="300px" style="border-radius: 8px;">';
			modifyCode += '<form id="newUploadForm" enctype="multipart/form-data"><input id="imageInput" type="file" ><br>';
			modifyCode +=	'<label class="productNm">제품번호</label> <input readonly="readonly" name ="newNum" value="'+prodNum+'"><br>';
			modifyCode +=	'<label class="productNm">제품브랜드</label> <span name = "newBrand">'+prodBrand+'</span><br>';
			modifyCode +=   '<label class="productNm">제품한글이름</label> <input type="text" name="newKnm" value="'+prodKnm+'"><br>';
			modifyCode +=	'<label class="productNm">제품영어이름</label> <input type="text" name="newEnm" value="'+prodEnm+'"><br>';
			modifyCode += '<label class="productNm">제품 가격</label> : <span name="newPrice">'+prodPrice+'</span><br>';
			modifyCode += ' <input type = "button" class="btn btn-dark modifiy1" onclick="proc(this)" id = "modifyprodValidation" name = "newProdphoto" value = "확인">';
			modifyCode += '<input type = "button" class="btn btn-dark modifiy2" onclick="canCell()" value="취소">'
			modifyCode += '</form>';
// 			$.each(result, function(i) {
// 				modifyCode += '<input type="file" multiple="multiple"><br>';
// 				modifyCode +=	'<p>제품번호 : '+result[i].prod_id+'</p>';
// 				modifyCode +=	'<p>제품브랜드 : '+result[i].prod_brand+'</p>';
// 				modifyCode +=   ' 제품한글이름 : <input type="text" value="'+result[i].prod_knm+'"><br>';
// 				modifyCode +=	'제품영어이름 : <input type="text" value="'+result[i].prod_enm+'"><br>';
// 				modifyCode += '<p>제품 가격 : '+result[i].prod_mkprice_+'</p>';
// 				modifyCode += ' <input type = "button" id = "modifyprodValidation" name = "modifyprodValidation" value = "확인"><br>';
// 			})
			
// 			alert(modifyCode);
 			$(parent).html(modifyCode);		
 			
		})// ------------------
		
		// 해당 상품 삭제버튼 누를때
		$(document).on('click', '.prod input[value = "삭제"]', function() {
			//	deleteProdId = $(this).parent().attr('name');
		//		alert($(this).parent().attr('name'));
			select = confirm('삭제하시겠습니까?');
			
			if(select == true){
				parent = $(this).parent();
				prodDleteId = $(parent).find('span').eq(0).text();
				
				$.ajax({
					url: "<%=request.getContextPath()%>/ProdModify.do",
					type : 'get',
					data : {"prodDleteId" : prodDleteId},
					success : function(res) {
						if(res == "삭제 되었습니다"){
							setTimeout(function() {
								swal('삭제 되었습니다');
								}, 3000);
							location.href = '<%=request.getContextPath()%>/view/updateProd.jsp';
						}else if(res == "삭제를 실패했습니다"){
							setTimeout(function() {
								swal('삭제를 실패했습니다');
								}, 3000);
							location.href = '<%=request.getContextPath()%>/view/updateProd.jsp';
						}
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
					
				})
				
			}else{
				location.href = '<%=request.getContextPath()%>/view/updateProd.jsp';
			}
		
		})
		
		
		//페이지 입장시 처음에는 상품등록 부분을 비동기로 보여준다
		showProdInsert();
		
		// 상품등록 버튼 누를때 
		$("#prodInsert").on("click", function(){
			showProdInsert();
		});
		
		// 상품등록 전송부분버튼 누를 때 onsubmit 시작 하여  동기방식으로 보낸다   	
		$("#insertprod").on("click", function(){
			var form = document.getElementById("insertprodform");
			form.method = "POST";
			form.action = "<%=request.getContextPath()%>/updateProd.do";
			form.submit();
			
		});
		
		
		//카테고리 등록 버튼 누를때 		
		$("#prodCategoryList").on("click", function(){
			showProdCategory();
		});
		
		//상품 조회 누를 때 버튼 - 등록되어있는 전체 상품을 볼 수 있다.
		$("#prodSearch").on("click",function(){
			
			
			
			$.ajax({
				url : "<%=request.getContextPath()%>/getProdList.do",
				type : "get",
				dataType : 'json',
				success: function(res){ 
					result = res;
// 					alert(result[0].prod_id);
					/*  서블릿
					list(prodvo) list
					gSON gson = enw 
					
					String prodlistjson = gson.tojosn(list)
					out.prtint(prodllistjson0)
					ouf.flush
					
					[{prod_id : NIKE}DDDD]
					
					$,EACH(RES, FUNCTION(I,V ){
						RES[I] => V
						CODE = "";
						CODE += "<LDIV> "+V.PROD_ID+" <IVIEC
					})
					
					$('CONTAINER').EMPTY()
					$('CONTAINER').HTML;(CID)
					*/
					code = "";
					$.each(res, function(i, v){
						
						   
						code +=  `<div name = "\${v.prod_id}" class = "prod" id = "contents">`
							code +=	`<div class="prod2"><img src = "../images/\${v.prod_photo1}" width="300px" height="300px" style="border-radius: 8px;"><br><br>`
									 code += `<div class="prodInfo"><label>제품번호</label> <span>\${v.prod_id}</span><br>`
									 code += `<label>제품브랜드</label> <span>\${v.prod_brand} </span><br>`
									 code += `<label>제품한글이름</label> <span>\${v.prod_knm} </span><br>`
									 code += `<label>제품영어이름</label> <span>\${v.prod_enm} </span><br>`
									 code += `<label>제품 가격</label> <span>\${v.prod_rprice}원 </span></div><br>`
									 code += `<input type = "button" id = "modifyprod" name = "modifyprod" value = "수정" class="btn btn-dark join">`
									 code += `<input type = "button" value = "삭제" id = "deleteprod" name = "deleteprod" class="btn btn-dark join"><br></div>`
						 code +=`</div>`
								
					});
					
					$("#result").empty();
					$("#result").html(code);
				},
				error : function(xhr){
					alert("상태 :" + xhr.status);
				},
				dataType : "json" // servlet 쪽에서 보낸 데이터를 json 
			});
			
			/* // 비동기로 생성된 버튼들은 이런방식으로 한다.
			$(DOCUMET).ON('CLICK', '#PRODDETAIL' ,FUNCION){
				
			} */
		});

	});
</script>
</head>
<body>
<jsp:include page="managerHeader.jsp"></jsp:include>
		<h3 style="text-align: center;"><b>상품관리</b></h3>

<div class = "container2">
	<div class = "nav2" id = "item1" > 
		<input type="button" class="1 btn btn-outline-light text-dark" name="1" id = "prodInsert" value = "상품등록">
		<input type="button" class="1 btn btn-outline-light text-dark" name="2" id = "prodSearch" value = "상품조회">
	<!-- 	<input type="button" class="1" name="3" id = "prodCategoryList" value = "상품카테고리등록">
		<input type="button" class="1" name="4" id = "prodCategoryInsert" value = "상품카테고리 조회"> -->
	
	</div>
	
 <div id = "result" class = "item2">
  
 </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>