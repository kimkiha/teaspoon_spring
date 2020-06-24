<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*, com.teaspoon.common.*"%>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String reviewKeyword = String.valueOf(request.getAttribute("reviewKeyword"));
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
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
        table th{background-color: #dbdbdb;}
    </style>
</head>
<body>
   <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/리뷰.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>리뷰관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="작성자아이디" id="reviewKeyword">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th style="width:45px;">리뷰번호</th>
                                    <th style="width:150px;">상품명</th>
                                    <th style="width:70px;">작성자ID</th>
                                    <th style="width:100px;">작성일자</th>
                                    <th colspan="3" style="width:250px;">내용</th>
                                </tr>
                            </tbody>
                           
                              <tfoot>
                              <%if(list.isEmpty()){%>
								<tr>
									<td colspan="6">조회된 리스트가 없습니다.</td>
								</tr>
								<%}else{%>
                              	  <% for (Review r : list) {%>
                                  <tr>
                                      <td><%=r.getReviewNo() %></td>
                                      <td><%=r.getPname() %></td>
                                      <td><%=r.getUserId() %></td>
                                      <td><%=r.getCreateDate() %></td>
                                      <td><%=r.getContent() %></td>
                                      <td>
                                          <button type="button" style="width: 100px;"><a href="<%=contextPath%>/reviewDetail.re?reviewNo=<%=r.getReviewNo()%>">상세보기</a></button>
                                      </td>
                                      <td>
                                      	<button type="button" style="width: 100px;" onclick="deleteReview();">삭제</button>
                                      </td>
                                  </tr>
                              </tfoot>
                              <%} %>
                            <%} %>
                      </table>
                    </div>
                </div>
			<form id="postForm" method="post" action="<%=contextPath%>/delete.re">
			<% for (Review r : list) {%>
				<input type="hidden" name="reviewNo" value="<%=r.getReviewNo()%>">
			<%} %>
			</form>
			<div id="c1_2" >
                  
                </div>
                <div id="c1_3">
                <%if(!reviewKeyword.equals("null")){ %>
                	<!-- 현재 페이지에 보여질 페이징바 -->
					<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
					<!-- 맨 처음으로(<<) -->
					<button onclick="location.href='reviewKeywordList.st?currentPage=1&reviewKeyword=<%=reviewKeyword %>'">&lt;&lt;</button>
					<!-- 이전페이지로(<) -->
					<button onclick="location.href='reviewKeywordList.st?currentPage=<%=currentPage-1%>&reviewKeyword=<%=reviewKeyword %>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='reviewKeywordList.st?currentPage=<%=p%>&reviewKeyword=<%=reviewKeyword %>'"><%=p%></button>
						<%}else{ %>
						<button dispabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
					<!-- 다음페이지로(<) -->
					<button onclick="location.href='reviewKeywordList.st?currentPage=<%=currentPage+1%>&reviewKeyword=<%=reviewKeyword %>'">&gt;</button>
					<!-- 맨 마지막으로(>>) -->
					<button onclick="location.href='reviewKeywordList.st?currentPage=<%=maxPage %>&reviewKeyword=<%=reviewKeyword %>'">&gt;&gt;</button>
					<%} %>
                
                <%} else { %>
	                <!-- 현재 페이지에 보여질 페이징바 -->
					<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
					<!-- 맨 처음으로(<<) -->
					<button onclick="location.href='review.st?currentPage=1'">&lt;&lt;</button>
					<!-- 이전페이지로(<) -->
					<button onclick="location.href='review.st?currentPage=<%=currentPage-1%>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='review.st?currentPage=<%=p%>'"><%=p%></button>
						<%}else{ %>
						<button dispabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
					<!-- 다음페이지로(<) -->
					<button onclick="location.href='review.st?currentPage=<%=currentPage+1%>'">&gt;</button>
					<!-- 맨 마지막으로(>>) -->
					<button onclick="location.href='review.st?currentPage=<%=maxPage %>'">&gt;&gt;</button>
					<%} %>
				<%} %>
                </div>
            </div>
        </div>
        
        <script>
	        $(function(){
	    		$("#searchBtn1").click(function(){
	    			var reviewKeyword = $("#reviewKeyword").val();
	    			location.href='reviewKeywordList.st?reviewKeyword='+reviewKeyword+"&currentPage=1";
	    		});
	    	})
    	
        	//삭제버튼 클릭시 실행
        	function deleteReview(){
        		$("#postForm").submit();
        	}
        
        </script>
</body>
</html>