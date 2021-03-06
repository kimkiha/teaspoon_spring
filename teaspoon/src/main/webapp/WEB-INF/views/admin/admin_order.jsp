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
    <title>주문관리  | Admin</title>
  
    <style>
        .dropdown button, #search{background-color: white; color:black; border: 1px solid lightgray; font-size: 15px; width: 100px; height: 40px; border-radius: 5px;}
        .dropdown button:hover, #search:hover{border-color:coral; background-color: lightcoral; color: white;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
        #c1_2 div{float: left;}
        #cancle:hover{background-color: white; border-color: lightgray;}
    </style>
</head>
<body>
   <jsp:include page="../common/admin_sidebar.jsp"/>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="${pageContext.servletContext.contextPath}/resources/images/admin/주문현황.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>주문현황페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="주문자" name="idName">
                            <button type="button" class="searchBtn" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                            <!-- <div>
                                <button style=" width:415px; float:left; height: 50px; border-radius: 0px; font-size: 24px; font-weight: bold;">
                                    주문현황
                                </button>
                            </div>
                            <div>
                                <button id="cancle" disabled style="width:415px; float:left; color: darkgray; height: 50px; border-radius: 0px; font-size: 24px; font-weight: bold;">
                                    취소현황
                                </button>
                            </div> -->
                            
                            <div>
                                <table>
                                <tbody>
                                <tr>
                                <th>주문일자</th>
                                <th>주문번호</th>
                                <th>주문자</th>
                                <th>수령자</th>
                                <th>결제금액</th>
                                <th>배송상태</th>
                                <th>상세내역</th>

                                </tr>
                                </tbody>

                                <tfoot>
                              
                                <tr>
	                                <td></td>
	                                <td></td>
	                                <td></td>
	                                <td></td>
	                                <td></td>
	                                <td></td>
	                                <td>
		                                <button type="button" style="width: 100px;">
		                                    <a href="adminOrderDetailView.html">상세보기</a>
		                                </button>
	                                </td>
                                </tr>
                                
                                </tfoot>
                                </table>
                            </div>
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
        </div>
    </div>
    <!--드롭다운버튼 스크립트-->
    <script>
        $(function(){
            //select의 값이 변경될때마다 작동
            $(".dm1>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
               // console.log(value);
                $(".btn1").text(value);
            });
            $(".dm2>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
                //console.log(value);
                $(".btn2").text(value);
            });
            $(".dm3>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
                //console.log(value);
                $(".btn3").text(value);
            });
        });
    </script>
    <!--드롭다운 버튼 스크립트 끝-->
    
</body>
</html>