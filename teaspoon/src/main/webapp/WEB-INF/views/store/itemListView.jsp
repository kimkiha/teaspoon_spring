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
											<div class="product_img">
												<input type="hidden" class="productNo${status.index}" name="productNo" value=${ p.productNo }> 
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

//페이지로딩시 로그인한 유저의 위시리스트 목록조회
$(function() {
	selectWishList();
	
});

function selectWishList() {

	var icon = $('.like_icon');
	var loginUser = '${loginUser}';
	
	if(loginUser != null) {
		$.ajax({
			url : "selectWish.st",	
			type : "post",
			success : function(list) {	// list == 로그인한 유저의 위시리스트 목록
				//console.log(list);
				for (var i = 0; i < 12; i++) {	// 페이지에 있는 최대12개의 상품번호와 위시리스트에 있는 상품번호를 비교
					var p = '.productNo' + i;
					for (var j = 0; j < list.length; j++) {
						if ($(p).val()==list[j].productNo) {
							var heart = $(p).parent().siblings().eq(1).children();
							heart.removeClass("empty");
							heart.addClass("full");
							heart.attr("src","${pageContext.servletContext.contextPath}/resources/images/store/heart_full.png");
						}
					}
				}
			},error:function() {
				console.log("사용자 위시리스트 조회용 ajax실패")
			}
		});
	}
}


// 위시리스트 등록 ajax
$(function() {
	$('.like_icon').click(function() {
		var productNo1 = $(this).parent().siblings([ ".product_img" ]).children().eq(0).val();
		//console.log(productNo1);
		var icon = $(this);
		if (icon.attr("class") == "like_icon empty") { // 빈 하트일 경우 --> 위시리스트 등록
			$.ajax({
				url : "insertWish.me",
				data : {productNo : productNo1},
				success : function(result) {
					if (result > 0) {
						icon.removeClass("empty");
						icon.addClass("full");
						icon.attr("src","${pageContext.servletContext.contextPath}/resources/images/store/heart_full.png");
						var bool = window.confirm("위시리스로 등록되었습니다. 위시리스트로 이동하시겠습니까?");
						if (bool) {
							//location.href = "wishList.me";
						}
					} else if (result < 0) {
						$("#deleteProductNo").val(productNo1);
						$("#duplicateDeletePcode").submit();
					} else if (result == 0) {
						window.alert("로그인이 필요한 서비스입니다.");
					}
				},error : function() {
					console.log("통신에러1");
				}
			});
		} else { // 채워진 하트일 경우 --> 위시리스트 삭제
			$.ajax({
				url : "deleteWish.me",
				data : {productNo : productNo1},
				success : function(result) {
					if (result > 0) {
						icon.removeClass("full");
						icon.addClass("empty");
						icon.attr("src","${pageContext.servletContext.contextPath}/resources/images/store/heart_emtpy.png");
						window.alert("위시리스트에서 삭제되었습니다.")
					} else {
						
					}
				},error : function() {
					console.log("통신에러2");
				}
			});
		}
	});
});
</script>
<!-- //content-->

<jsp:include page="../common/footer.jsp"/>
<!-- //footer-->
</div>
</body>
</html>