<%@page import="oracle.net.aso.p"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의포인트 | TeaSpoon</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/mypage/mypage_point.css">
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
									<td width="60" name="username">유저네임</td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade">유저등급</td>
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
							<a href="#">Point</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">할인쿠폰</p>
							<a href="#">장</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">위시리스트</p>
							<a href="#">개</a>
						</div>
					</div>
					<div id="mypage_menu_tab">
						<a href="#" class=" float"> 주문내역확인</a>
						<a href="#" class=" float">나의배송지</a> <a
							href="#" class=" float">1:1문의</a>
						<a href="#" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<div class="mp-point">
							<div class="mp-point-title">
								<P>포인트 적립 및 사용내역</P>
							</div>

						</div>
					</div>
					<table id="mypage_table" cellspacing="0">
						<thead>
							<tr>
								<th>일자</th>
								<th>구분</th>
								<th colspan="2">내용</th>
								<th>적립/사용</th>

							</tr>
						</thead>
						<tbody>
							
							<tr>
								<td colspan="6" style="height: 150px;">포인트 적립 및 사용내역이 없습니다</td>
							</tr>
							
							<tr>
								<td class="in"></td>
								
								<td class="in">적립</td>
							
								<td class="in">사용</td>
								

								<td colspan="2" class="t-title"></td>
						
								<td class="in">+</td>
								
								<td class="in">-</td>
								
								

							</tr>
						
						</tbody>
					</table>

					<br>
					<br>
					
					
				</div>
			</div>
		</div>
	</div>

	<!-- //content-->

	<%@ include file="../common/footer.jsp"%>
	<!-- //footer-->
	</div>
	<script>
     

    </script>
</body>
</html>