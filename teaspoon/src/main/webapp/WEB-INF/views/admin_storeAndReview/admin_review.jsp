<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

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
   <jsp:include page="../common/admin_sidebar.jsp"/>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="resources/img/admin/리뷰.png" width="50px"></div>
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
                             
								<tr>
									<td colspan="6">조회된 리스트가 없습니다.</td>
								</tr>
								
                                  <tr>
                                      <td></td>
                                      <td></td>
                                      <td></td>
                                      <td></td>
                                      <td></td>
                                      <td>
                                          <button type="button" style="width: 100px;"><a href="reviewDetail.re?reviewNo=">상세보기</a></button>
                                      </td>
                                      <td>
                                      	<button type="button" style="width: 100px;" onclick="deleteReview();">삭제</button>
                                      </td>
                                  </tr>
                              </tfoot>
                            
                      </table>
                    </div>
                </div>
			<form id="postForm" method="post" action="delete.re">
			
				<input type="hidden" name="reviewNo" value="">
		
			</form>
			<div id="c1_2" >
                  
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