<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/mypage/mypage_coupon.css">
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
	#banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
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
								<img src="<%=contextPath%>/resources/img/admin/user.png">
							</div>
						</div>
						<div class="user_info" style="width: 450px;">
							<table class="detail_tb" cellpadding="0" cellspacing="0">
								<tr class="d1">
									<td width="60" name="username">홍길동</td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade">골드등급</td>
								</tr>
								<tr class="d2">
									<td colspan="2"><a
										href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a></td>
								</tr>
							</table>
						</div>
						<div class="detail_info2"
							style="border-left: 1px solid #bebbb6; height: inherit;">
							<p class="info_th">적립포인트</p>
							<a href="<%=contextPath%>/mypoint.me?currentPage=1"><%= loginUser.getPoint() %>Point</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">할인쿠폰</p>
							<a href="#"><%= loginUser.getCouponCount() %>장</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">위시리스트</p>
							<a href="<%=contextPath %>/wishList.me"><%=loginUser.getWishCount() %>개</a>
						</div>
					</div>
					<div id="mypage_menu_tab">
						<a href="#" class=" float"> 주문배송조회</a>
						<a href="#" class=" float">공간대여확인</a>
						<a href="<%=contextPath %>/myAdress.me" class=" float">나의배송지</a>
						<a href="<%=contextPath %>/myqna.me?currentPage=1" class="float">1:1문의</a>
						<a href="<%=contextPath %>/mycart.me" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<div class="mp-coupon-outer">
							<div class="mp-coupon-title">
								<P>마이 쿠폰함</P>
							</div>
							<div class="cpcp"></div>
							<div class="coupon-outer">
								<div class="coupon-tab">
									<a href="#" class="active selectcoupon ">사용 가능 쿠폰</a> <a
										href="#" class="selectcoupon">사용/만료 쿠폰</a>
								</div>
								<div class="coupon-list">
									<div class="couponlist">
										<div class="list">


											<div class="coupon">
												<div class="coupon-cell">
													<img src="<%=contextPath %>/resources/img/admin/쿠폰.png"
														alt="" width="220" height="155">
												</div>
												<div class="coupon-title">
													<p>티스푼3천원 할인 쿠폰</p>
												</div>
												<div class="coupon-info">
													<span class="label">유효기간 </span> <span class="date">|2020.12.31까지</span><br>
													<span class="noti">(200일 남음)</span>
												</div>

											</div>

											<div class="coupon">
												<div class="coupon-cell">
													<img src="<%=contextPath %>/resources/img/admin/쿠폰.png"
														alt="" width="220" height="155">
												</div>
												<div class="coupon-title">
													<p>티스푼3천원 할인 쿠폰</p>
												</div>
												<div class="coupon-info">
													<span class="label">유효기간 </span> <span class="date">|2020.12.31까지</span><br>
													<span class="noti">(200일 남음)</span>
												</div>

											</div>


											<div class="coupon">
												<div class="coupon-cell">
													<img src="<%=contextPath %>/resources/img/admin/쿠폰.png"
														alt="" width="220" height="155">
												</div>
												<div class="coupon-title">
													<p>티스푼3천원 할인 쿠폰</p>
												</div>
												<div class="coupon-info">
													<span class="label">유효기간 </span> <span class="date">|2020.12.31까지</span><br>
													<span class="noti">(200일 남음)</span>
												</div>

											</div>


											<div class="coupon">
												<div class="coupon-cell">
													<img src="<%=contextPath %>/resources/img/admin/쿠폰.png"
														alt="" width="220" height="155">
												</div>
												<div class="coupon-title">
													<p>티스푼3천원 할인 쿠폰</p>
												</div>
												<div class="coupon-info">
													<span class="label">유효기간 </span> <span class="date">|2020.12.31까지</span><br>
													<span class="noti">(200일 남음)</span>
												</div>

											</div>


											<div class="coupon">
												<div class="coupon-cell">
													<img src="<%=contextPath %>/resources/img/admin/쿠폰.png"
														alt="" width="220" height="155">
												</div>
												<div class="coupon-title">
													<p>티스푼3천원 할인 쿠폰</p>
												</div>
												<div class="coupon-info">
													<span class="label">유효기간 </span> <span class="date">|2020.12.31까지</span><br>
													<span class="noti">(200일 남음)</span>
												</div>

											</div>


											<div class="coupon">
												<div class="coupon-cell">
													<img src="<%=contextPath %>/resources/img/admin/쿠폰.png"
														alt="" width="220" height="155">
												</div>
												<div class="coupon-title">
													<p>티스푼3천원 할인 쿠폰</p>
												</div>
												<div class="coupon-info">
													<span class="label">유효기간 </span> <span class="date">|2020.12.31까지</span><br>
													<span class="noti">(200일 남음)</span>
												</div>

											</div>



										</div>
									</div>
								</div>
							</div>
						</div>

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