<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*, com.teaspoon.board.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	//System.out.print(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트 | TeaSpoon</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_wish.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/menubar.jsp" %>
		
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
									<td width="60" name="username"><%= loginUser.getUserName() %></td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade"><%=loginUser.getGradeName() %></td>
								</tr>
								<tr class="d2">
									<td colspan="2"><a href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a></td>
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
							<a href="<%=contextPath %>/wishList.me"><%=loginUser.getWishCount()%>개</a>
						</div>
					</div>
					<div id="mypage_menu_tab">
						<a href="#" class="float"> 주문배송조회</a> 
						<a href="#"class="float">공간대여확인</a> 
						<a href="<%=contextPath %>/myAdress.me" class="float">나의배송지</a> 
						<a href="#" class="float">1:1문의</a> 
						<a href="<%=contextPath %>/mycart.me" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<p>위시리스트</p>
						<table id="mypage_table" cellspacing="0">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll"id="th_checkAll" onclick="checkAll();">전체선택</th>
									<th colspan="2">상품명</th>
									<th></td>
									<th>상품가격</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%if(list.isEmpty()){ %>
								<tr>
									<td colspan="7" height="150">위시리스트에 선택된 상품이 없습니다</td>
								</tr>
								<%} else{ %>
									<%for(int i=0; i<list.size(); i++){ %>
								<tr>
									<td><input type="checkbox" name="checkRow"
										value="${content.IDX}"></td>
									<td style="text-align: left;"><img src="<%=contextPath%>/resources/thumbnail_upfiles/<%=list.get(i).getTitleImg() %>"
										width="130px" height="130px"></td>
									<td style="text-align: left;" class="t-title"><%=list.get(i).getPname()%></td>
									<td></td>
									<td><p><%=list.get(i).getPrice() %>원</p></td>
									<td class="btn-group-cart">
										<button>장바구니</button>
										<br>
										<br>
										<button>바로구매</button>
									</td>
								</tr>
									<%} %>
								<%} %>
							</tbody>
						</table>
						<div class="t-func">
							<div class="t-func1">
								<button onclick="deleteAction();" class="delete">선택삭제</button>
							</div>
							<div class="t-func3">
								<span>위시리스트에 보관된 상품은 30일뒤에 삭제됩니다</span>
							</div>
						</div>

						<div class="func">
							<div class="func-group">
								<button type="submit">선택상품 주문</button>
								<button type="submit" id="btn-func">전체상품 주문</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //content-->
		 <%@ include file="../common/footer.jsp" %>
		<!-- //footer-->
	</div>
	<script>
        /* 전체 선택 삭제 */
        function checkAll(){
            if( $("#th_checkAll").is(':checked') ){
                $("input[name=checkRow]").prop("checked", true);
            }else{
                $("input[name=checkRow]").prop("checked", false);
            }
        }
        /* 상품선택시 상세페이지 가기*/
     



    </script>
</body>
</html>