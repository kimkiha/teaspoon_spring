<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대관관리  | Admin</title>

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
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="resources/img/admin/대관.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>대관예약관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="" name="idName">
                            <button type="button" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <thead>
                                <tr>
                                    <th>예약번호</th>
                                    <th>날짜</th>
                                    <th>시간</th>
                                    <!--예약은 로그인한 회원만 가능하며 예약자명과 연락처는 회원번호로 불러옴-->
                                    <th>예약자</th>
                                    <th>연락처</th>
                                    <th>인원수</th>
                                    <th>사용목적</th>
                                    <th width="100px">비품요청</th>
                                    <th>결제금액</th>
                                    <th>승인여부</th>
                                    <th>승인결제</th>
                                </tr>
                            </thead>
                            <tbody>
                  			
								<tr>
									<td colspan="11">조회된 리스트가 없습니다.</td>
								</tr>
							
                          
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <!--예약은 로그인한 회원만 가능하며 예약자명과 연락처는 회원번호로 불러옴-->
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <button class="deny">거절</button>
                                        <button class="accept">승인</button>
                                    </td>
                                </tr>
                             
                            </tbody>
                             
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

</body>

 <script>
 


 
	 	$(function(){
	 		$(".deny").click(function(){
	 			var reservNo = $(this).parent().parent().children().eq(0).text();
	 			var deny = $(this).parent().parent().children().eq(9);
	 			$.ajax({
	 				url:"reservationDeny.re",
	 				type:"post",
	 				data:{reservNo:reservNo},
	 				success:function(list){
	 					deny.text('N');
	 				
	 				},
	 				error:function(){
	 					console.log("ajax 통신 실패!!");
	 				}
	 				
	 			});
	 		});
	 	});
	 	
	 	
	 	$(function(){
	 		$(".accept").click(function(){
	 			var reservNo = $(this).parent().parent().children().eq(0).text();
	 			var deny = $(this).parent().parent().children().eq(9);
	 			$.ajax({
	 				url:"reservationAccept.re",
	 				type:"post",
	 				data:{reservNo:reservNo},
	 				success:function(list){
	 					deny.text('Y');
	 				
	 				},
	 				error:function(){
	 					console.log("ajax 통신 실패!!");
	 				}
	 				
	 			});
	 		});
	 	});
	 </script>
</html>