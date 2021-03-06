<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세 | TeaSpoon</title>
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/store/coffeeDetailView.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/reset.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/menubar.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/footer1.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    #content1 {width:100%; min-height:100%; background: #ffffff; }
    #productArea{min-height:100%}
</style>
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<jsp:include page="../common/menubar.jsp" />

		<div style="height: 115px"></div>
		<!-- //header -->
		<div id="banner">
			<div class="contaniner">
				<div style="margin: 100px 0px;">
					<p id="head_title">${ p.productName }</p>
				</div>
				<div
					style="border: 1px solid #bebebe; width: 200px; margin: 0px auto;">
				</div>
			</div>
		</div>
		<!-- //banner -->
		<div id="content">
			<!-- product -->
			<div id="content1">
				<div class="contaniner">
					<div id="productArea">
						<div id="productList">
							<div id="productList1">
								<div class="pList1">
									<div class="thumbnail">
										<img style="width: 500px; height: 400px;"
											src="${pageContext.servletContext.contextPath}/resources/uploadFiles/${p.productChange}">
									</div>
									<div class="move_review">
										<!-- <a href="#review"><p>REVIEW &gt;&gt;</p></a> -->
									</div>
								</div>
								<div class="pList2">
									<!--상품명, 상품설명요약 -->
									<div class="p_explain1">
										<h3>${ p.productName }</h3>
									</div>

									<!--원두 그람수 옵션(셋중에 하나만 가능)-->
									<div class="p_explain2">
										<hr>
										<p>
											<b>&gt; 얼마나 담아드릴까요?</b>
										</p>
										<form id="amountForm">
											<input type="radio" id="small" class="amount" name="amount"	value="18000" checked> 
											<label for="small">200g	(￦18,000) 주말에 한두잔 가벼운 커피타임</label><br> 
											<input type="radio"	id="medium" class="amount" name="amount" value="30000">
											<label for="medium">400g (￦30,000) 하루 한 잔의 커피</label><br>
											<input type="radio" id="large" class="amount" name="amount"	value="42000"> 
											<label for="large">600g	(￦42,000) 소중한 사람과 함께 즐기는 커피</label>
										</form>
									</div>

									<!--원두 굵기조절 옵션(select된 하나만 가능)-->
									<div class="p_explain3">
										<hr>
										<p>
											<b>&gt; 갈아드릴까요?</b>
										</p>
										<form action="">
											<select name="grind" id="bean"
												style="width: 100%; height: 40px; font-size: medium;">
												<option value="홀빈(갈지않음)" selected>홀빈(갈지않음)</option>
												<option value="핸드드립/클래버용">핸드드립/클레버용</option>
												<option value="커피메이커용">커피메이커용</option>
												<option value="프렌치프레스용">프렌치프레스용</option>
												<option value="모카포트/에어로프레스용">모카포트/에어로프레스용</option>
												<option value="에스프레스머신용">에스프레소머신용</option>
												<option value="더치/콜드브루용">더치/콜드브루용</option>
											</select>
										</form>
									</div>

									<!-- 구매수량 변경 옵션 -->
									<div class="p_explain4">
										<div class="num">
											<p>구매수량</p>
										</div>
										<div class="number">
											<a href="#" id="decreaseQuantity"> <img
												src="${pageContext.servletContext.contextPath}/resources/images/store/minus.png"
												width="20px" height="20px">
											</a> <b><span id="numberUpDown"
												style="padding-left: 20px; padding-right: 20px;">1</span></b> <a
												href="#" id="increaseQuantity"> <img
												src="${pageContext.servletContext.contextPath}/resources/images/store/plus.png"
												width="20px" height="20px">
											</a>
										</div>
									</div>

									<!--상품금액 합계, 정기배송버튼, 장바구니버튼, 바로구매버튼 -->
									<div class="p_explain5">
										<span style="padding: 30px;">상품금액합계</span> <span
											id="totalPrice">${ p.price }원</span>
										<button id="basket">장바구니 담기</button>
										<button id="buyNow">바로 구매하기</button>
									</div>
								</div>

								<!--제품상세버튼, 고객리뷰버튼-->
								<div class="pList3" style="border-bottom: 1px solid #bebebe;">
									<p class="">제품상세</p>
									<a href="#review"><p>고객리뷰</p></a>
								</div>

								<!--상품상세페이지-->
								<div class="pList4"
									style="height: inherit; margin-bottom: 50px;">
									<div
										style="text-align: both; padding: 30px 50px; font-size: 20px;">
										${ p.productContents }</div>
								</div>
								<div class="pList5_1">
									<p style="font-weight: bold; margin-top: 150px;">고객리뷰</p>
								</div>

								<!-- 리뷰작성Area -->
								<c:if test="${ empty loginUser }">
									<div id="reviewList">
										<form id="reviewForm" action="insert.re" method="post">
											<table id="writeReview" cellpadding="0" cellspacing="0"
												style="margin-top: 80px">
												<tr>
													<td colspan="6"
														style="text-align: center; border-top: 1px solid #ddd; border-bottom: 0px">
														<p
															style="padding: 10px; font-size: 22px; font-weight: bold;">리뷰쓰기</p>
													</td>
												</tr>
												<tr>
													<td
														style="width: 130px; text-align: right; font-size: 18px; padding-right: 30px; border-top: 1px solid #ddd;">내용</td>
													<td colspan="3" style="border-top: 1px solid #ddd;"><textarea
															name="content" id="reviewContent" rows="10"
															style="resize: none; border-radius: 4px; width: 750px; height: 100px; border-color: #ddd; margin-top: 10px;"
															placeholder="내용을 입력해주세요" required></textarea></td>
													<td style="width: 100px; border-top: 1px solid #ddd;"></td>
												</tr>
												<tr style="height: 50px;">
													<td colspan="2"><input type="file" name="file"></td>
													<td width="100px">
														<button id="resetReview" class="btn" type="reset">취소</button>
													</td>
													<td width="100px">
														<button id="subReview" class="btn" type="submit">작성완료</button>
													</td>
													<td></td>
												</tr>
											</table>
										</form>
									</div>
								</c:if>
								<!--//리뷰리뷰작성Area-->

								<div id="review" class="pList5">
									<br>
									<br>
									<div class="pList5_2">
									</div>

									<!--사용자 후기모음(상단과 앵커걸림)-->
									<div class="pList5_3">


										<div id="data"></div>

										<!--더보기 할때 글 3개씩 밑으로-->
										<button id="load">더보기</button>
										<br>
										<br>
										<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //content-->
		
		<jsp:include page="../common/footer.jsp" />
		<!-- //footer-->

		<form id="insertCart" action="insertCart.st" method="post">
			<input type="hidden" id="cartPcode" name="cartPcode"> 
			<input type="hidden" id="optionGram" name="optionGram"> 
			<input type="hidden" id="optionGrind" name="optionGrind"> 
			<input type="hidden" id="pCount" name="pCount"> 
			<input type="hidden" id="totalPrice" name="totalPrice">
		</form>
	</div>

	<script>	
		// 구매수량 변경 옵션
		$(function() {

			var amount;
			var num1;

			$('#decreaseQuantity').click(function(e) {
				e.preventDefault();
				var stat = $('#numberUpDown').text();
				var num = parseInt(stat, 10);
				num--;
				if (num <= 0) {
					alert('더이상 줄일수 없습니다.');
					num = 1;
				}
				$('#numberUpDown').text(num);
				totalSum();
			});

			$('#increaseQuantity').click(function(e) {
				e.preventDefault();
				var stat = $('#numberUpDown').text();
				var num = parseInt(stat, 10);
				num++;

				if (num > 5) {
					alert('더이상 늘릴수 없습니다.');
					num = 5;
				}
				$('#numberUpDown').text(num);
				totalSum();

			});

			// 상품금액 합계
			$('.amount').click(function() {
				totalSum();
			});

			// 상품금액 합계 출력
			function totalSum() {
				amount = $("#amountForm > input:checked").val();
				num1 = $('#numberUpDown').text();
				total = amount * num1;
				$("#totalPrice").text(total + "원");

			}
		});
		
		// 장바구니로 이동
		$(function(){
			$("#basket").click(function(){
				var cartPcode= ${ p.productNo };
				var optionGram;
				var pCount = $("#numberUpDown").text();
				var gram = $("input[class='amount']:checked").val();
				var optionGrind = $("#bean").val();
				
				if(gram==18000){
					optionGram='200g';
				}else if(gram==30000){
					optionGram='400g';
				}else if(gram==42000){
					optionGram='600g';
				}
				
				$("#cartPcode").val(cartPcode); 	// 장바구니에 담을 상품
				$("#optionGram").val(optionGram);	// 장바구니에 담길 옵션1
				$("#pCount").val(pCount);			// 장바구니에 담길 상품갯수
				$("#optionGrind").val(optionGrind);	// 장바구니에 담길 옵션2
				
				$("#insertCart").submit();
			});
		});
	
		
		// 리뷰Area
		$(function() {
			//문서가 다 로딩되면 자동으로 실행하고 주기적으로 실행
			selectReplyList();
			
			$('#subReview').click(function(){
				// 댓글 내용
				var content = $('#reviewContent').val();
				
				$.ajax({
					url:"insert.re",
					type:"post",
					data:{content:content, productNo:productNo},
					success:function(result){
						if(result>0){	// 리뷰작성 성공시 
							selectReplyList();	// 갱신된데이터를 불러오도록 리뷰작성 메소드 호출
							$('#reviewContent').val("");
						}
					},error:function(){
						console.log("댓글작성용 ajax 통신 실패!");
					}
				})
			});
		});

		//ajax이용 : 게시글에 딸려있는 댓글 리스트 조회용 함수
		function selectReplyList() {
			$.ajax({
				url : "list.re",
				//현재 페이지의 제품코드 보내서 해당 제품을 참조하고있는 댓글들 조회
				data : {productNo:productNo},
				type : "get",
				success : function(list) {
					//console.log(list);
					var value = "";
					for (var i = 0; i < list.length; i++) {
						value += "<table cellpadding='0' cellspacing='0'>"
									+ "<tr><td id='createDate' width='200px' style='border-top:1px solid #ddd; padding:10px;'>"+ list[i].createDate	+ "</td>"
									+ "<td id='user' width='600px' style='border-top:1px solid #ddd; padding:10px;'>"+ list[i].userName
									+ "("+ list[i].userId + ")" + "</td></tr>"
									+ "<tr><td style='border-bottom:1px solid #ddd; padding:10px;'></td>"
									+ "<td id='rcontent' style='border-bottom:1px solid #ddd; padding:10px;'><p>"+ list[i].content	+ "</p></td></tr>"
								+ "</table>";
					}
					$("#data").html(value);
				},error:function() {
					console.log("댓글리스트조회용 ajax 통신 실패!");
				}

			});
		}

		$(function() {
			var addReview = 6;
			$("#load").click(function() {
				$.ajax({
					url : "listAdd.re",
					//현재 페이지의 제품코드 보내서 해당 제품을 참조하고있는 댓글들 조회
					data : {productNo:productNo,
							addReview : addReview},
					type : "get",
					success : function(list) {
						var value = "";
						for (var i = 0; i < list.length; i++) {
							value += "<table cellpadding='0' cellspacing='0'>"
										+ "<tr><td id='createDate' width='200px' style='border-top:1px solid #ddd; padding:10px;'>" + list[i].createDate + "</td>"
										+ "<td id='user' width='600px' style='border-top:1px solid #ddd; padding:10px;'>" + list[i].userName	
										+ "("+ list[i].userId + ")"	+ "</td></tr>"
										+ "<tr><td style='border-bottom:1px solid #ddd; padding:10px;'></td>"
										+ "<td id='rcontent' style='border-bottom:1px solid #ddd; padding:10px;'><p>"+ list[i].content + "</p></td></tr>"
									+ "</table>";
						}
						$("#data").html(value);
					},error:function() {
						console.log("댓글리스트조회용 ajax 통신 실패!");
					}
				});
				addReview = addReview + 3;
				//console.log(addReview);
			});
		});
	</script>


</body>
</html>