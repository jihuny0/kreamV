

myBuyList = function(buyNo){	// 입찰 중인 상품들 조회
	$.ajax({
		url : '/kreamv/myBuyList.do',
		type : 'post',
		data : {"buyNo" : buyNo},
		success : function(res){
			code="";
				code+=`<h3><b>구매내역</b></h3>
				<hr>
				<input class="button btn btn-dark" id="myBuyBidList" type="button" value="입찰 중">	
				<input class="button btn btn-dark" id="myBuyStayList" type="button" value="결제 대기">
				<input class="button btn btn-dark" id="myBuyOrderList" type="button" value="결제 완료"><br><br>`;
				
			code+=	
				`<table>
			    	<tr>
			     	  <td class="prod12"></td>
					  <td class="prod3"><a>가격</a></td>`;
			if(buyNo==1){	// 입찰 중
			code+=	 `<td class="prod4"><a>입찰 마감 날짜</a></td>`;
			}else if(buyNo==2){	// 결제 대기
			code+=	 `<td class="prod4"><a></a></td>`;
			}else{	// 결제 완료
			code+=	 `<td class="prod4"><a>주문 날짜</a></td>`;
			}
			code+=  `</tr>
			   </table>
				<hr>`;
				
				$.each(res, function(i, v){
					
			code+=
				`<table>
			    	<tr>
			     	  <td class="prod1"><img id="prodImage" alt="${v.prod_photo1}" src="/kreamv/images/${v.prod_photo1}" width="60%" ></td>
			  	 	  <td class="prod2"><b>${v.prod_knm}</b><br>
										${v.detail_size}</td>
					  <td class="prod3">${v.order_price}원</td>
					  <td class="prod4">`;
				if(buyNo==1){ code+=`~ ${v.order_date}`;}	// 입찰 중
				else if(buyNo==2){
			code+= `<form action="/kreamv/payOrdersTemp.do" method="post">
						<input class="data" type="text" name="order_id" value="${v.primary_key}">
						<input class="btn btn-dark payBtn" type="submit" value="결제하기">
					</form>`;
							}	// 결제 대기(primary_key=order_id)
				else if(buyNo==3){ code+=`${v.order_date}`;}	// 결제 완료
			code+=`</a></td></tr>
			   </table>
				<hr>`;
				})

			$('#result').html(code);
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
}

mySellList = function(sellNo){
	$.ajax({
			url : '/kreamv/mySellList.do',
			type : 'post',
			data : {"sellNo" : sellNo},
			success : function(res){
				code="";
				code+=`<h3><b>판매내역</b></h3>
				<hr>
				<input class="button btn btn-dark" id="mySellBidList" type="button" value="입찰 중">	
				<input class="button btn btn-dark" id="mySellStayList" type="button" value="결제 대기">
				<input class="button btn btn-dark" id="mySellOrderList" type="button" value="결제 완료"><br><br>`;
				
			code+=	
				`<table>
			    	<tr>
			     	  <td class="prod12"></td>
					  <td class="prod3"><a>가격</a></td>`;
			if(sellNo==1){	// 입찰 중
			code+=	 `<td class="prod4"><a>입찰 마감 날짜</a></td>`;
			}else if(sellNo==2){	// 결제 대기
			code+=	 `<td class="prod4"><a></a></td>`;
			}else{	// 결제 완료
			code+=	 `<td class="prod4"><a>주문 날짜</a></td>`;
			}
			code+=  `</tr>
			   </table>
				<hr>`;
				
				$.each(res, function(i, v){
					
			code+=
				`<table>
			    	<tr>
			     	  <td class="prod1"><img id="prodImage" alt="${v.prod_photo1}" src="/kreamv/images/${v.prod_photo1}" width="60%" ></td>
			  	 	  <td class="prod2"><b>${v.prod_knm}</b><br>
										${v.detail_size}</td>
					  <td class="prod3">${v.order_price}원</td>
					  <td class="prod4">`;
				if(sellNo==1){ code+=`~ ${v.order_date}`;}	// 입찰 중
				else if(sellNo==2){
			code+= `<form action="" method="post">
						<input class="data" type="text" name="order_id" value="${v.primary_key}">
						<input class="btn btn-dark payBtn" type="submit" value="취소하기">
					</form>`;
							}	// 결제 대기(primary_key=order_id)
				else if(sellNo==3){ code+=`${v.order_date}`;}	// 결제 완료
			code+=`</a></td></tr>
			   </table>
				<hr>`;
				})
				
			$('#result').html(code);
			},
			error : function(xhr){
				alert(xhr.status);
			},
			dataType : 'json'
		})
}

myStoreList = function(storeNo){
		$.ajax({
			url : '/kreamv/myStoreList.do',
			type : 'post',
			data : {"storeNo" : storeNo},
			success : function(res){
				code="";
				code+=`<h3><b>보관내역</b></h3>
				<hr>
				<input class="button btn btn-dark" id="myConfirmList" type="button" value="검수 중">	
				<input class="button btn btn-dark" id="myStoreList" type="button" value="보관 중">
				<input class="button btn btn-dark" id="mySendBackList" type="button" value="반송"><br><br>`;
				
			code+=	
				`<table>
			    	<tr>
			     	  <td class="prod12"></td>
					  <td class="prod3"></td>`;
			code+=	 `<td class="prod4"></td>`;
			code+=  `</tr>
			   </table>
				<hr>`;
				
				$.each(res, function(i, v){
				code+=
				`<table>
			    	<tr>
			     	  <td class="prod1"><img id="prodImage" alt="${v.prod_photo1}" src="/kreamv/images/${v.prod_photo1}" width="60%" ></td>
			  	 	  <td class="prod2"><b>${v.prod_knm}</b><br>
										${v.detail_size}</td>
					  <td class="prod3"></td>
					  <td class="prod4"><form action="/kreamv/getProd.do" method="post">
						<input class="data" type="text" name="prodId" value="${v.prod_id}">
						<input class="btn btn-dark payBtn" type="submit" value="상품보기"><br>
					</form></td></tr>
			   </table>
				<hr>`;
			})
			$('#result').html(code);
			},
			error : function(xhr){
				alert(xhr.status);
			},
			dataType : 'json'
	})
}

myWishList = function(){
	$.ajax({
		url : '/kreamv/wishList.do',
		type : 'post',
		success : function(res){
			code="";
				code+=`<h3><b>관심상품</b></h3>
				<hr><br>`;
			$.each(res, function(i,v){
			code+=
				`<table>
			    	<tr>
			     	  <td class="prod1"><img id="prodImage" alt="${v.prod_photo1}" src="/kreamv/images/${v.prod_photo1}" width="60%" ></td>
			  	 	  <td class="prod2"><b>${v.prod_knm}</b><br>
										${v.prod_enm}</td>
					  <td class="prod3"></td>
					  <td class="prod4"><form action="/kreamv/getProd.do" method="post">
						<input class="data" type="text" name="prodId" value="${v.prod_id}">
						<input class="btn btn-dark payBtn" type="submit" value="구매하기"><br>
						<div class="wishCancle" id="${v.prod_id}"><a style="color: #8C8C8C; font-size: 0.9em; cursor: pointer;">삭제</a></div>
					</form></td></tr>
			   </table>
				<hr>`;
			})
			$('#result').html(code);
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
}

wishCancle = function(prod_id){
	$.ajax({
		url : '/kreamv/wishCancelProd.do',
		type : 'post',
		data : {"prod_id" : prod_id},
		success : function(res){
			alert("관심상품에서 해제되었습니다.");
			myWishList();
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
}