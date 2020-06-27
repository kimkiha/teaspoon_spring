<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 | TeaSpoon</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/mypage/mypage_myqna.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap"
	rel="stylesheet">

<script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#banner {
	margin-top: 115px;
	height: 170px;
	line-height: 170px;
	background:
		url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg")
		center top repeat-x;
}

#mypage_table>tbody>tr:hover {
	cursor: pointer;
}

#paging button {
	border: 0px;
	background: white;
	color: #4e4f53;
	font-weight: bold;
	margin: 10px;
}

#paging button:hover {
	cursor: pointer;
	color: #d6ae71;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/menubar.jsp"%>
		<!-- //header -->
		<div id="banner">
			<div class="contaniner title">마이페이지</div>
		</div>
		<!-- //banner -->
		<div id="content">
			<!-- mypage -->
			<div class="contaniner">
				<div id="mypage">
					<div id="mypage_info">
						<div class="user_info"
							style="width: 95px; border-left: 1px solid #bebbb6">
							<div class="user_photo"
								style="margin-top: 30px; padding-left: 10px; float: left;">
								<img src="#">
							</div>
						</div>
						<div class="user_info" style="width: 450px;">
							<table class="detail_tb" cellpadding="0" cellspacing="0">
								<tr class="d1">
									<td width="60" name="username">${m.userName }</td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade">${m.gradeName }</td>
								</tr>
								<tr class="d2">
									<td colspan="2"><a
										href="#">회원정보수정</a></td>
								</tr>
							</table>
						</div>
						<div class="detail_info2"
							style="border-left: 1px solid #bebbb6; height: inherit;">
							<p class="info_th">적립포인트</p>
							<a href="#">${m.pointSum }Point</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">할인쿠폰</p>
							<a href="#">${m.couponCount }장</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">위시리스트</p>
							<a href="#">${m.wishlistCount }개</a>
						</div>
					</div>
					<div id="mypage_menu_tab">
						<a href="#" class=" float"> 주문배송조회</a> <a href="#" class=" float">공간대여확인</a>
						<a href="#" class=" float">나의배송지</a> <a
							href="#"
							class="active float">1:1문의</a> <a
							href="#" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<div class="mp-qna">
							<div class="mp-qna-title">
								<P>1:1문의 내역</P>
							</div>
							<div class="mp-qna-title1">
								<div class="mp-qna-title2">
									총<span></span>건의 상담내역이 있습니다
								</div>
								<div class="mp-qna-title3">
									<button
										onclick="location.href='#';">상담신청</button>
								</div>
							</div>
						</div>
					</div>
					<table id="mypage_table" cellspacing="0">
						<thead>
							<tr>
								
								<th id="category">상담유형</th>
								<th colspan="2" id="title">제목</th>
								<th id="qna-date">상담신청일</th>
								<th id="status">상태</th>
								<th id="t">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty  list }">
									<tr>
										<td colspan="8">1:1 상담내역이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="mtm" items="${ list }">
										<tr>
											<td style="dispaly: none">${mtm.mtmType }</td>
											<td colspan="2">${mtm.mtmTitle }</td>
											<td>${mtm.createDate }</td>
											<td  class="qna-t">${mtm.answer }</td>
										
											<td><input type="checkbox" name="mno"
												value="">
											</td>
										</tr>
									</c:forEach>
								
								</c:otherwise>
							</c:choose>
						</tbody>

					</table>
					<div id="delete">
						<button onclick="deleteAction();" class="delete">선택삭제</button>
					</div>
					<br>
					<br>
				
					
					</div>
					<c:if test="${ !empty list }">
	                    <div id="pagingArea">
	                       <c:choose>
			                	<c:when test="${ pi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="myqna.me?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="a" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ a eq pi.currentPage }">
			                    		<a href="#">${a}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="myqna.me?currentPage=${ a }">${a}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="myqna.me?currentPage=${ pi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </div>
                    </c:if>
					
				</div>
			</div>
		</div>
	</div>

	<!-- //content-->
	<%@ include file="../common/footer.jsp"%>
	<!-- //footer-->
	</div>
	<script>
    	$(function(){
    		$(".qna-t").click(function(){
    			var mno= $(this).siblings().eq(0).text();
    			
    			location.href="/myqnadetail.me?mno=" + mno;
    			
    		});
    	});
    	$(function(){
    		$(".delete").click(function(){
    			alert("정말 삭제하시겠습니까?");
    			var mno= $('input[name="mno"]:checked').val();
    			location.href="/myqnadelete.me?mno=" + mno;
    		});
    	});
    </script>
</body>
</html>