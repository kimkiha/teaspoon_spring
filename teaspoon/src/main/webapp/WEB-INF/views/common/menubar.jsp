<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>menu</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/menubar.css">
<script type="text/javascript" src="resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>

	<!-- 반응 메세지 출력 -->
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>

        <div id="header">
            <div id="header_wrap">
                <div id="header_1">
                    <a href="main.jsp"><img id="home-logo" src= "resources/images/main/logo.png"></a>
                </div>
                <div id="header_2">
                    <ul id="navi">
                        <li><a class="list store" href="coffee.st?currentPage=1">스토어</a>
                            <ul class="ul">
                                <li><a href="coffee.st?currentPage=1">커피</a></li>
                                <li><a href="storeBest.st">금주의 베스트</a></li>
                                <li><a href="item.st?currentPage=1">컵 & 아이템</a></li>
                            </ul>
                        </li>
                        <li><a class="list recommend" href="selectitem.st">맞춤추천</a>
                        <li><a class="list event" href="eventList.bo?currentPage=1">이벤트</a>
                            <ul class="ul ">
                                <li><a href="eventList.bo?currentPage=1">이벤트</a></li>
                                <li><a href="instagram.bo">인스타그램</a></li>
                            </ul>
                        </li>
                        <li><a class="list about" href="about.bo">어바웃티스푼</a>
                            <ul class="ul">
                                <li><a href="about.bo">브랜드스토리</a></li>
                                <li><a href="magazineList.bo?currentPage=1">매거진</a></li>
                            </ul>
                        </li>
                        <li><a class="list rent" href="rental.sp">공간대여</a>
                            <ul class="ul">
                                <li><a href="rental.sp">예약하기</a></li>
                                <li><a href="maps.sp">찾아오는길</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div id="header_3">
                    <img id="search_icon" src="resources/images/main/search.png">
                    <div id="search_wrap" style="display:none">
	                    <div id="search">
		                    <form id="search_item" action="searchItem.st" method="post">
		                    <input type='hidden' name='currentPage' value='1'>
		                        <div class="search_form">
		                        	<input type="text" name="keyword" class="search">
		                        	<button type="submit" class="search_btn">검색</button>
		                        </div>
		                    </form>
	                    </div>
	                </div>
                    <img id="myPage_icon" src="resources/images/main/mypage.png">
                    <a href="mycart.me" id="basket_icon"><img src="resources/images/main/cart.png"></a>
                    <div class="header_mypage" >
                        <ul>
                        	<c:choose>
                        		<c:when test="${ empty loginUser }">
	                            	<li id="login_li"><button id="login">로그인</button></li>
	                            </c:when>
	                            <c:when test="${ loginUser.userKind eq 1 }">
	                            	<li style="padding:20px 0">
	                            		<b>${ loginUser.userName }</b>님  환영합니다.<br>
	                            		<a href="main.ad" style="curcor:pointer">관리자홈</a>
	                            	</li>
	                            </c:when>
	                            <c:otherwise>
		                            <li style="padding:20px 0">
			                            <b>${ loginUser.userName }</b>님  환영합니다.<br>
			                            <a id="logout" style="curcor:pointer">로그아웃</a>
			                            <a href="logout.me" style="padding-bottom:10px;"></a>
		                            </li>
		                            <li><a href="mymain.me">마이티스푼</a></li>
		                            <li><a>나의 배송 조회</a></li>
		                            <li><a href="mypoint.me?currentPage=1">적립포인트</a></li>
		                            <li><a>할인쿠폰</a></li>
		                            <li><a href="wishList.me">위시리스트</a></li>
		                            <li style="border-bottom: none;"><a href="myqna.me?currentPage=1">1:1문의</a></li>
	                            </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
       </div>
        <!-- //header -->
    
    <script>
        $(function(){
            $("#login").click(function(){
            	var result = window.confirm("로그인하시겠습니까?");
            
	            if(result){
	            	location.href = "loginPage.me";
	            }
            });  
            
            $("#navi li").hover(function(){
                $(".ul", this).slideDown(250);
            },function(){
                $(".ul", this).slideUp(250);
            });
            
            $("#myPage_icon").click(function(){
                var p = $(this).next().next(); //해당 p요소 
                if(p.css("display") == "none"){ //css("속성명")속성명만 작성시 속성값 리턴
                    p.slideDown("fast"); 
                }else{
                	p.slideUp("slow");
                }
                
             });
            
           $("#logout").click(function(){
            	var result1 = window.confirm("로그아웃 하시겠습니까?");
            
                if(result1){
                	location.href = "logout.me";
                } 
           	});
           
           $("#search_icon").click(function(){
               var p = $(this).next(); //해당 p요소 
               if(p.css("display") == "none"){ //css("속성명")속성명만 작성시 속성값 리턴
                   p.slideDown("slow"); 
               }else{
               	p.slideUp("slow");
               }
            });
           
           
        });

    </script>
</body>
</html>