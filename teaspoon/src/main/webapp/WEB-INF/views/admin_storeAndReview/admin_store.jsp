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
    <title>상품관리 | Admin</title>
   
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb; text-align:center;}
        table td{height:50px;text-align:center;}
        #pagingArea a:hover{color:red;}
    </style>
</head>
<body>
   <jsp:include page="../common/admin_sidebar.jsp"/>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1"  style="height:80px;">
                        <div id="c1_1_1_1"><img src="${pageContext.servletContext.contextPath}/resources/images/admin/커피.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>상품관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                        	<button type="button" style="width:255px; margin-bottom:5px;" id="productEnroll">상품등록</button>
                            <input type="text" placeholder="상품명을 입력하세요" style="width:200px; height:28px; font-size:14px; ">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th style="width:70px;">번호</th>
                                    <th style="width:300px;">상품명</th>
                                    <th style="width:100px;">공급가</th>
                                    <th style="width:100px;">가격</th>
                                    <th style="width:70px;">재고</th>
                                    <th style="width:100px;">누적판매수</th>
                                    <th style="width:70px;">상태</th>
                                    <th style="width:100px;"> </th>
                                </tr>
                            </tbody>
							<tfoot>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="8" style="text-align:center;">조회된 리스트가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${ list }" var="p">
											<tr>
											    <td>${ p.productNo }</td>
												<td>${ p.productName }</td>
												<td><fmt:formatNumber value="${ p.supPrice }"/>원</td>
												<td><fmt:formatNumber value="${ p.price }"/>원</td>
												<td>${ p.stock }개</td>
												<td>${ p.totalCount }개</td>
												<td>${ p.status }</td>
												<td>
													<c:choose>
														<c:when test="${ p.status eq 'Y' }">
												    		<button type="button" id="updateProduct">수정</button>
												    	</c:when>
												    	<c:otherwise>
												    		<button type="button" id="detailProduct">보기</button>
												    	</c:otherwise>
											    	</c:choose>
											    </td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tfoot>
                      </table>
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
			                    	<a href="list.st?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="a" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ a eq pi.currentPage }">
			                    		<a href="#">${a}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="list.st?currentPage=${ a }">${a}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="list.st?currentPage=${ pi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
        
        <script>
        	$(function(){
        		$('#productEnroll').click(function(){
        			location.href='enroll.st';
        		});
        	});
        	
        	$(function(){
        		$('#updateProduct').click(function(){
        			var productNo = $(this).parent().siblings().eq(0).text();
        			//console.log(productNo);
        			location.href='updateForm.st?productNo='+productNo;
        		});
        	});
        	
        	$(function(){
        		$('#detailProduct').click(function(){
        			var productNo = $(this).parent().siblings().eq(0).text();
        			location.href='updateForm.st?productNo='+productNo;
        		});
        	});
        	
        	$(function(){
        		$("#searchBtn1").click(function(){
        			var productKeyword = $("#productKeyword").val();
        			location.href='productKeywordList.st?productKeyword='+productKeyword+"&currentPage=1";
        		});
        	});
        	
        </script>
</body>
</html>