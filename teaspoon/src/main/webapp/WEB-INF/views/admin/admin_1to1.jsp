<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1대1문의 | Admin</title>
  
   

    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #c1_1_2 button{font-size: 15px; width: 100px; height: 30px;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
    </style>


</head>
<body>
 <jsp:include page="../common/admin_sidebar.jsp" />
    <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1" style="height: 150px;">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="${pageContext.servletContext.contextPath}/resources/images/admin/1대1문의.png" width="50px" height="50px"></div>
                        <div id="c1_1_1_2"><p>1대1문의페이지입니다.</p></div>
                        <div id="c1_1_1_3"></div>
                    </div>
                    <div id="c1_1_2" style="height: 100px; margin: auto;">
                        <div>
                            <p style="font-size: 24px; font-weight: bold; padding-top: 25px; width: 200px; text-align: right;">
                                상담구분
                            </p>
                        </div>
                        <div id="oneToOneKinds" style="text-align: left; padding-top: 20px;">
                            <input type="radio" name="advice" value="전체" checked>전체
                            <input type="radio" name="advice" value="주문/결제" >주문/결제
                            <input type="radio" name="advice" value="이벤트/쿠폰">이벤트/쿠폰
                            <br>
                            <input type="radio" name="advice" value="환불/반품/교환">환불/반품/교환
                            <input type="radio" name="advice" value="배송">배송
                            <input type="radio" name="advice" value="회원포인트">회원포인트
                            <input type="radio" name="advice" value="기타">기타
                        </div>
                        <div style="padding-top: 20px;">
                            <button type="button" style="height: 50px;" id="searchBtn">조회</button>
                        </div>
                    </div>
                </div>
                <div id="c1_2" style="height: 370px;">
                    <table class="listArea">
                        <tbody>
                            <tr>
                                <th>상담번호</th>
                                <th>상담유형</th>
                                <th>제목</th>
                                <th>상담신청일</th>
                                <th>상태보기</th>
                                <th>답변여부</th>
                                
                            </tr>
                        </tbody>
                       
                          <tfoot>
					
                              <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                	<button type="submit" style="width: 100px;"class="answer">
                                	
                                		답변달기
                                	</button>
                                </td>
                              </tr>
                          
                          </tfoot>
                       
                  </table>
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
	$('#searchBtn').click(function(){
		var mtmName = $('input[name="advice"]:checked').val();
		if(mtmName=='전체'){
			location.href="qnalist.me?currentPage=1";
		}else{
			location.href="qnalisttype.me?mtmName=" + mtmName+'&currentPage=1';
		}
			});
	});
	$(function(){
		$(".listArea>tfoot>tr").click(function(){
			var mtmNo = $(this).children().eq(0).text();
			location.href="QnaAnswer.me?mtmNo=" + mtmNo;
		});
	});
	
</script>     
</body>
</html>