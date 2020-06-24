<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 | Admin</title>
  
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
                        <div id="c1_1_1_1"><img src="resources/img/admin/이벤트.png" width="50px" width="50px"></div>
                        <div id="c1_1_1_2"><p>이벤트관리 페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                             <input type="text" placeholder="이벤트제목" id="eventKeyword">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table class="listArea" >
                            <thead>
                                <tr>
                                    <th width="100">글번호</th>
                                    <th width="300">제목</th>
                                    <th width="100">작성일</th>
                                    <th width="100">수정일</th>
                                    <th width="50">상태</th>
                                    <th >
                                        <button><a href="eventInsertForm.bo">추가</a></button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                             
								<tr>
									<td colspan="8">조회된 리스트가 없습니다.</td>
								</tr>
								
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="status"></td>
		                                    <td>
	                                        <button><a href="eventUpdateForm.bo?bno=">수정</a></button>
	                                        <button><a href="eventDelete.bo?bno=">삭제</a></button>
                                   			</td>
										</tr>
									
								
                      </table>
                    </div>
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
    			var eventKeyword = $("#eventKeyword").val();
    			location.href='eventKeywordList.bo?eventKeyword='+eventKeyword+"&currentPage=1";
    		});
    	})
   	 	</script>     
</body>
</html>