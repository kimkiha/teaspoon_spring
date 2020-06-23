<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.teaspoon.member.model.vo.*,com.teaspoon.common.*"%>
<%
	
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
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
								<img src="<%=contextPath%>/resources/img/admin/user.png">
							</div>
						</div>
						<div class="user_info" style="width: 450px;">
							<table class="detail_tb" cellpadding="0" cellspacing="0">
								<tr class="d1">
									<td width="60" name="username"><%=loginUser.getUserName() %></td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade"><%=loginUser.getGradeName()%></td>
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
						<a href="#" class=" float"> 주문배송조회</a> <a href="#" class=" float">공간대여확인</a>
						<a href="<%=contextPath %>/myAdress.me" class=" float">나의배송지</a> <a
							href="<%=contextPath %>/myqna.me?currentPage=1"
							class="active float">1:1문의</a> <a
							href="<%=contextPath %>/mycart.me" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<div class="mp-qna">
							<div class="mp-qna-title">
								<P>1:1문의 내역</P>
							</div>
							<div class="mp-qna-title1">
								<div class="mp-qna-title2">
									총<span><%=pi.getListCount() %></span>건의 상담내역이 있습니다
								</div>
								<div class="mp-qna-title3">
									<button
										onclick="location.href='<%=contextPath%>/myqnaUpdate.me';">상담신청</button>
								</div>
							</div>
						</div>
					</div>
					<table id="mypage_table" cellspacing="0">
						<thead>
							<tr>
								<th>
								<th>
								<th id="category">상담유형</th>
								<th colspan="2" id="title">제목</th>
								<th id="qna-date">상담신청일</th>
								<th id="status">상태</th>
								<th id="t">선택</th>
							</tr>
						</thead>
						<tbody>
							<%if(list.isEmpty()){ %>
							<tr>
								<td colspan="8">1:1 상담내역이 없습니다.</td>
							</tr>
							<%}else{ %>
								<% for(Member m : list){ %>
								<tr>
									<td style="dispaly: none"><%= m.getMtm_no() %>
									<td>
									<td><%= m.getMtm_name() %></td>
									<td colspan="2" class="qna-t"><%= m.getMtm_title() %></td>
									<td><%=m.getCreate_date() %></td>
	
									<%if(m.getAnswer().equals("N") ){ %>
									<td>답변대기중</td>
									<% }else{%>
									<td>답변완료</td>
									<%} %>
									<td><input type="checkbox" name="mno"
										value="<%=m.getMtm_no()%>">
									</th>
								</tr>
								<%} %>
							
							
							<%} %>
						</tbody>

					</table>
					<div id="delete">
						<button onclick="deleteAction();" class="delete">선택삭제</button>
					</div>
					<br>
					<br>
					<%if(list.isEmpty()){ %>
						
					<%}else{ %>	
					<div class="pagingarea">
						<div id="paging" class="pagingbar">
							<%if(currentPage != 1){%>
							<!-- 현재 페이지가 1페이지가 아닐경우 -->
							<!-- 맨 처음으로(<<) -->
							<button onclick="location.href='myqna.me?currentPage=1'">&lt;&lt;</button>
							<!-- 이전페이지로(<) -->
							<button
								onclick="location.href='myqna.me?currentPage=<%=currentPage-1%>'">&lt;</button>
							<%} %>

							<%for(int p=startPage; p<=endPage; p++){%>
							<%if(currentPage != p) {%>
							<button onclick="location.href='myqna.me?currentPage=<%=p%>'"><%=p%></button>
							<%}else{ %>
							<button dispabled><%=p %></button>
							<%} %>
							<%} %>

							<%if(currentPage != maxPage){ %>
							<!-- 다음페이지로(<) -->
							<button
								onclick="location.href='myqna.me?currentPage=<%=currentPage+1%>'">&gt;</button>
							<!-- 맨 마지막으로(>>) -->
							<button
								onclick="location.href='myqna.me?currentPage=<%=maxPage %>'">&gt;&gt;</button>
							<%} %>
						</div>
					</div>
					<%} %>
					
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
    			
    			location.href="<%=contextPath%>/myqnadetail.me?mno=" + mno;
    			
    		});
    	});
    	$(function(){
    		$(".delete").click(function(){
    			alert("정말 삭제하시겠습니까?");
    			var mno= $('input[name="mno"]:checked').val();
    			location.href="<%=contextPath%>/myqnadelete.me?mno=" + mno;
    		});
    	});
    </script>
</body>
</html>