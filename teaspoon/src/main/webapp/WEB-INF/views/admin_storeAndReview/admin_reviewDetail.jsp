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
    <title>리뷰관리  | Admin</title>
    <style>
        .outer p{margin-top: 30px; margin-bottom: 30px; font-size: 30px; font-weight: bold;}        
        table *{padding: 5px; margin: auto; font-size: 18px;}
        table tr:first-child{border-top: 1px solid lightgray ;}
        table tr{border-bottom: 1px solid lightgray ;}
        table th{text-align:center}
    </style>
</head>
<body>
  <jsp:include page="../common/admin_sidebar.jsp"/>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div class="outer">
                    <p>리뷰 상세보기</p>
	                	<form id="updateReviewForm" action="" method="post">
	                		<input type="hidden" name="reviewNo" value="${ r.reviewNo }">
		                    <table>
		                        <tr>
		                        	<th width="300px;">작성자명(작성자ID)</th>
		                        	<td width="200px;">${ r.userName } (${ r.userId })</td>
		                        	<th width="100px;">작성일자</th>
		                        	<td width="100px;">${ r.createDate }</td>
		                        </tr>
		                        <tr>
		                        	<th>상품명</th>
		                        	<td>${ r.productName }</td>
		                        	<th>만족도</th>
		                        	<td>${ r.rating }</td>
		                        </tr>
		                        <tr>
		                        	<td colspan="2">
		                        		<img style="width:300px; height:200px; margin-bottom:10px;" 
		                        			 src="${pageContext.request.contextPath}/resources/uploadFiles/${ r.reviewChange }">
		                        	</td>
		                        	<td>
		                        		<textarea style="width:500px; height:200px; border:0px;resize:none; margin-top:8px;" >${ r.content }</textarea>
		                        	</td>
		                        </tr>
		                    </table>
		                    <br>
		                    <div class="btns">
		                        <button type="button" onclick="javascript:history.go(-1);" style="width:100px;">목록으로</button>
		                        <button type="button" id="delBtn" onclick="updateReview();" style="width:100px;">삭제하기</button>
		                    </div>
		                </form>
	                </div>
            </div>
        </div>
    </div>
    
    <script>
    	function updateReview(num){
			$("#updateReviewForm").attr("action", "delete.re");
			$("#updateReviewForm").submit();
    	}
    </script>
    
    
</body>
</html>