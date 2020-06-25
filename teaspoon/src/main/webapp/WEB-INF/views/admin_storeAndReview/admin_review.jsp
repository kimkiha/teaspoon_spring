<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰관리 | Admin</title>
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb; text-align:center}
    </style>
</head>
<body>
	<jsp:include page="../common/admin_sidebar.jsp"/>
	<div id="contents">
		<div id="c1" style="margin-top: 20px;">
			<div id="c1_1">
				<div id="c1_1_1">
					<div id="c1_1_1_1">
						<img
							src="${pageContext.servletContext.contextPath}/resources/images/admin/리뷰.png"
							width="50px">
					</div>
					<div id="c1_1_1_2">
						<p>리뷰관리페이지입니다.</p>
					</div>
					<div id="c1_1_1_3">
						<input type="text" placeholder="작성자명/작성자ID"
							style="width: 200px; height: 28px; font-size: 14px;">
						<button type="button" class="searchBtn" id="searchBtn1">검색</button>
					</div>
				</div>
				<div id="c1_1_2">
					<form id="deleteForm" method="post" action="">
						<table>
							<tbody>
								<tr>
									<th style="width: 30px;"><input type="checkbox"></th>
									<th style="width: 50px;">번호</th>
									<th style="width: 150px;">상품명</th>
									<th style="width: 250px;">내용</th>
									<th style="width: 70px;">만족도</th>
									<th style="width: 150px;">작성자명(작성자ID)</th>
									<th style="width: 100px;">작성일자</th>
									<th style="width: 100px;"></th>
								</tr>
							</tbody>
							<tfoot>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="8" style="text-align: center;">조회된 리스트가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${ list }" var="r">
											<tr>
												<td><input type="checkbox" class="" value="${ r.reviewNo }"></td>
												<td>${ r.reviewNo }</td>
												<td>${ r.productName }</td>
												<td>${ r.content }</td>
												<td>${ r.rating }</td>
												<td>${ r.userName }(${ r.userId })</td>
												<td>${ r.createDate }</td>
												<td>
													<button type="button" id="detailBtn" style="width: 100px;">보기</button>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tfoot>
						</table>

						<button type="button"
							style="width: 100px; float: left; margin-top: 10px;"
							onclick="deleteReview();">삭제</button>

					</form>
					
					<script>
						// 다중삭제
						function deleteReview(){
							confirm("삭제하시겠습니까?");
							$("#deleteForm").attr("action", "delete.re");
							$("#deleteForm").submit();
						};
						
						$(function(){
							$("#detailBtn").click(function(){
								var reviewNo = $(this).parent().siblings().eq(1).text();
								location.href="detail.re?reviewNo="+reviewNo;
							});
						});
					</script>	
						
						
				</div>
			</div>

			<div id="c1_2"></div>
			<div id="c1_3">
				<c:if test="${ !empty list }">
					<div id="pagingArea">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<a href="#">&lt;</a>
							</c:when>
							<c:otherwise>
								<a href="list.re?currentPage=${ pi.currentPage -1 }">&lt;</a>
							</c:otherwise>
						</c:choose>

						<c:forEach var="a" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ a eq pi.currentPage }">
									<a href="#">${a}</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="list.re?currentPage=${ a }">${a}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<a>&gt;</a>
							</c:when>
							<c:otherwise>
								<a href="list.re?currentPage=${ pi.currentPage +1 }">&gt;</a>
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
			</div>
		</div>
	</div>


</body>
</html>