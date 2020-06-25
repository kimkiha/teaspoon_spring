<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item | TeaSpoon</title>
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/store/itemListView.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/reset.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/menubar.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	#content1 {width:100%; height:inherit; background:#ffffff;}
	#banner {height: 270px; line-height: 270px; background:url("${pageContext.servletContext.contextPath}/resources/images/store/storetop_item.jpg") center top no-repeat;}
	#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
	#paging button:hover{cursor:pointer;color:#d6ae71;}
</style>
</head>
<body>
	<div id="wrap">
        <!-- header -->
        <jsp:include page="../common/menubar.jsp"/>
        <!-- //header -->
       <div style="height:115px"></div>
        <div id="banner">
            <div class="contaniner">
                <b><p style="font-size:40px;">CUP & ITEM</p></b>
            </div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="productArea">
                        <div id="productList">
                        
                        	<!-- listArea -->
							<c:choose>
								<c:when test="${ !empty list }">
									<c:forEach items="${ list }" var="p">
										<div class="product" style="margin-top: 50px; margin-right: 30px;">
											<div class="product_img" id="ppp" >
												<input type="hidden" name="productNo" value=${ p.productNo }> 
												<img src="${pageContext.servletContext.contextPath}/resources/uploadFiles/${ p.productChange }"
													style="float: left; width: 300px; height: inherit">
											</div>
											<div class="product_detail" style="width: 300px; height: 60px; padding: 0px">
												<p style="padding-top: 20px; padding-left: 15px;">${ p.productName }</p>
											</div>
											<div class="like">
												<img class="like_icon empty" src="${pageContext.servletContext.contextPath}/resources/images/store/heart_emtpy.png">
											</div>
											<div class="basket">
												<img id="open" class="basket_icon" src="${pageContext.servletContext.contextPath}/resources/images/store/cart.png">
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<br><br>
									<p style="height:500px;">등록된 상품이 없습니다</p>
									<br><br>
								</c:otherwise>
							</c:choose>
							<!-- //listArea -->
							
                        </div>
                        <div id="paging" class="pagination">
                            <c:if test="${ !empty list }">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<a href="#">&lt;</a>
									</c:when>
									<c:otherwise>
										<a href="item.st?currentPage=${ pi.currentPage -1 }">&lt;</a>
									</c:otherwise>
								</c:choose>

								<c:forEach var="a" begin="${ pi.startPage }"
									end="${ pi.endPage }">
									<c:choose>
										<c:when test="${ a eq pi.currentPage }">
											<a href="#">${a}</a>
										</c:when>
										<c:otherwise>
											<a class="page-link" href="item.st?currentPage=${ a }">${a}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<a>&gt;</a>
									</c:when>
									<c:otherwise>
										<a href="item.st?currentPage=${ pi.currentPage +1 }">&gt;</a>
									</c:otherwise>
								</c:choose>
							</c:if>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
<!--product-->
<script>
// 개별 상품의 상세 페이지로 이동
$(function(){
	$('.product_img').click(function(){
		var productNo = $(this).children().eq(0).val();
		location.href="itemDetail.st?productNo="+productNo;
	});
});
</script>
<!-- //content-->

<jsp:include page="../common/footer.jsp"/>
<!-- //footer-->
</div>
</body>
</html>