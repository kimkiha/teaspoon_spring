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
    <title>회원현황 | Admin</title>
   
    <style>
        .searchBtn:hover, #detailViewBtn:hover{border-color:#ac8b5a; background-color: #d6ae71; color: white;} 
        .dropdown button, #search{background-color: white; color:black; border: 1px solid lightgray; font-size: 15px; width: 140px; height: 40px; border-radius: 5px;}
        .dropdown button:hover, #search:hover{border-color:coral; background-color: lightcoral; color: white;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
        #c1_2 div{float: left;}
    </style>
    
</head>
<body>
  
   <jsp:include page="../common/admin_sidebar.jsp"/>
   
		<div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="${pageContext.servletContext.contextPath}/resources/images/admin/회원현황아이콘.png" width="50px" ></div>
                        <div id="c1_1_1_2"><p>현재활동중인회원입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="아이디" id="idName">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th>회원번호</th>
                                    <th>아이디</th>
                                    <th>회원명</th>
                                    <th>연락처</th>
                                    <th>생년월일</th>
                                    <th>회원등급</th>
                                    <th>가입일</th>
                                    <th>회원상태</th>
                                    </tr>
                            </tbody>
                           
                              <tfoot>
                                
				<tr>
					<td colspan="8">조회된 리스트가 없습니다.</td>
				</tr>
				
						<tr>
							<td></td>
							<td style="text-transform:lowercase"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					
				
                              </tfoot>
                             
                      </table>
                    </div>
                </div>
                <div id="c1_2">
                    <div class="dropdown"style="padding-right:10px">
                        <button type="button1" class="btn btn-primary dropdown-toggle btnStatus" data-toggle="dropdown">회원상태별분류</button>
                        <div class="dropdown-menu dm1">
                          <a class="dropdown-item" href="#">전체회원</a>
                          <a class="dropdown-item" href="#">활동중인회원</a>
                          <a class="dropdown-item" href="#">휴면회원</a>
                          <a class="dropdown-item" href="#">블랙리스트</a>
                          <a class="dropdown-item" href="#">탈퇴회원</a>
                        </div>
                      </div>
                      <div class="dropdown" style="padding-right:10px">
                        <button type="button2" class="btn btn-primary dropdown-toggle btnLevel" data-toggle="dropdown">회원등급별분류</button>
                        <div class="dropdown-menu dm2">
                          <a class="dropdown-item" href="#">전체등급</a>
                      		
							  <a class="dropdown-item" href="#"></a>
						
                         
                        </div>
                      </div>
                      <div class="search">
                        <button type="button" id="searchBtn2" >검색</button>
                      </div>
                     
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

    <script>
        $(function(){
            //select의 값이 변경될때마다 작동
            $(".dm1>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
                
                $(".btnStatus").text(value);
                //console.log($(".btnStatus").text());
               
            });
            $(".dm2>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
               
                $(".btnLevel").text(value);
                //console.log($(".btnLevel").text());
            });
        });
    </script>
    
    <script>
    	$(function(){
    		$("#searchBtn1").click(function(){
    			var searchId = $("#idName").val();
    			location.href='idList.me?searchId='+searchId+"&currentPage=1";
    		});
    	})
    </script>
    
    <script>
    	$(function(){
    		$("#searchBtn2").click(function(){
    			if( $(".btnStatus").text() == '회원상태별분류' || $(".btnLevel").text() =='회원등급별분류' ){
    				alert("상태와 등급을 선택해주세요.");
    			}else if( $(".btnStatus").text() == '전체회원' && $(".btnLevel").text() =='전체등급'){	
    				location.href='list.me?currentPage=1';
    			}else if($(".btnStatus").text() == '전체회원'){
    				var searchKeyword2 =  $(".btnLevel").text();
    				location.href='AllStatusList.me?searchKeyword2='+searchKeyword2+"&currentPage=1";
    			}else if($(".btnLevel").text() == '전체등급'){
    				var searchKeyword1 =  $(".btnStatus").text();
    				location.href='AllGradeList.me?searchKeyword1='+searchKeyword1+"&currentPage=1";
    			}else{
    				var searchKeyword1 =  $(".btnStatus").text();
        			var searchKeyword2 =  $(".btnLevel").text();
        			
        			location.href='keywordList.me?searchKeyword1='+searchKeyword1+"&searchKeyword2="+searchKeyword2+"&currentPage=1";
    			}
    			});
    	})
    </script>
</body>
</html>