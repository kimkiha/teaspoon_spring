<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매거진 | Admin</title>
   
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table td{text-align:center}
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
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="${pageContext.servletContext.contextPath}/resources/images/admin/매거진.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>매거진관리 페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                           <input type="text" placeholder="매거진제목" id="magazineKeyword">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table class="listArea" >
                            <thead>
                                <tr>
                                    <th width="100">글번호</th>
                                    <th width="300">제목</th>
                                    <th width="100">소제목</th>
                                    <th width="100">작성일</th>
                                    <th width="50">상태</th>
                                    <th >
                                        <button><a href="magazineInsertForm.bo">추가</a></button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                            	<c:when test="${empty list }">
									<tr>
										<td colspan="8">조회된 리스트가 없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${!empty list }">
									<c:forEach var="r" items="${list }">
										<tr>
											<td>${r.boardNo }</td>
											<td>${r.boardTitle }</td>
											<td>${r.smallTitle }</td>
											<td>${r.createDate }</td>
											<td class="status">${r.status }</td>
		                                    <td>
		                                       <button><a href="magazineUpdateForm.bo?boardNo=${r.boardNo }">수정</a></button>
		                                       <button><a href="magazineDelete.bo?boardNo=">삭제</a></button>
		                           			</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>	
							</tbody>
                      </table>
                    </div>
                </div>
                 <c:if test="${ !empty pi }">
	                    <div id="pagingArea" style="margin-top: 22px;">
	                       <c:choose>
			                	<c:when test="${ pi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="reviewList.re?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ p eq pi.currentPage }">
			                    		<a href="#">${p}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="reviewList.re?currentPage=${ p }">${p}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="reviewList.re?currentPage=${ pi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </div>
                    </c:if>
            </div>
        </div>
        
        <script>
    	$(function(){
    		$("#searchBtn1").click(function(){
    			var magazineKeyword = $("#magazineKeyword").val();
    			location.href='magazineKeywordList.bo?magazineKeyword='+magazineKeyword+"&currentPage=1";
    		});
    	})
   		</script>
    
    
        <!--
    <script>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var bno = $(this).children().eq(0).text();
				location.href="MagazineUpdateForm.bo?bno=" + bno;
			});
		});
	</script> 
	  -->
</body>
</html>