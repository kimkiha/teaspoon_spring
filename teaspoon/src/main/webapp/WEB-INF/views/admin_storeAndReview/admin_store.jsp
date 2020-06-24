<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품관리 | Admin</title>
   
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
        table td{height:50px;}
    </style>
</head>
<body>
   <jsp:include page="../common/admin_sidebar.jsp"/>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="resources/img/admin/커피.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>상품관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="상품이름" id="productKeyword">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th style="width:50px;">상품번호</th>
                                    <th style="width:170px;">상품명</th>
                                    <th style="width:60px;">공급가</th>
                                    <th style="width:60px;">가격</th>
                                    <th style="width:50px;">재고</th>
                                    <th style="width:50px;">진열상태</th>
                                    <th style="width:170px;">키워드</th>
                                    <th style="width:50px;">누적판매</th>
                                    <th style="width:50px;">상품종류</th>
                                    <th><button type="button" style="width: 100px;"><a href="enroll.st">상품등록</a></button></th>
                                    </tr>
                            </tbody>
							<tfoot>
								
								<tr>
									<td colspan="10">조회된 리스트가 없습니다.</td>
								</tr>
								
								<tr>
								    <td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>
								    	<button type="button"><a href="productUpdateForm.st?pcode=">수정</a></button>
								        <button type="button" onclick="deleteProduct();">삭제</button>
								    </td>
								</tr>
							</tfoot>
				
                      </table>
                    </div>
				<form id="postForm" method="post" action="delete.st">
					
					<input type="hidden" name="pcode" value="">
					
				</form>
			</div>
                <div id="c1_2">

                </div>
                <div id="c1_3">
                    <a>&lt;</a>
                   <button>1</button>
                   <button>2</button>
                   <button>3</button>
                   <button>4</button>
                   <button>5</button>
                   <a>&gt;</a>
                </div>
            </div>
        </div>
        
        <script>
        	
        	$(function(){
        		$("#searchBtn1").click(function(){
        			var productKeyword = $("#productKeyword").val();
        			location.href='productKeywordList.st?productKeyword='+productKeyword+"&currentPage=1";
        		});
        	})
        	
        	// 삭제버튼 클릭시 실행
        	function deleteProduct(){
				$("#postForm").submit();
			}
        	
        	
        </script>
</body>
</html>