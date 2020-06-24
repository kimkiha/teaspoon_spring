<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--부트스트랩 시작-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!--부트스트랩 끝-->
    <script src=" http://code.jquery.com/jquery-latest.min.js" language="javascript"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
   <link href="${pageContext.servletContext.contextPath}/resources/css/admin/admin_common.css" rel="stylesheet">
   
	<c:if test="${ !empty msg}" >
		<script>
		alert('알림', '${msg}');
		</script>
		<c:remove var="msg" scope="request"/>
	</c:if>
    <script>
        $(function(){
            $(".click").click(function(){
                // $(this).next().slideDown();

                //클릭시 다음요소가 display: none인지
                //display: block 인지 판단해서 slideUp /slideDown 적용 

                var p = $(this).next();
                //console.log(p);
                //css("속성명") : 속성명만 제시하면 해당 요소의 속성값을 리턴한다.
                if(p.css("display") == "none"){
                    //열려 있는 답변이 무었인지 모르니 형제관계p를 전부닫는다.
                $(".deep").slideUp();
                    p.slideDown();                    
                }else{
                    p.slideUp();                    
                }
            });
        });
    </script>


</head>
<body>
	
	<div class="modal" id="myModal">
        <div class="modal-dialog" style="position: relative;">
          <div class="modal-content" style="width:150px; position:absolute; left: 700px; top:50px" >
    
            <!-- Modal footer -->
            <div class="modal-footer" >
              <button type="button" class="btn btn-danger" data-dismiss="modal" style="width:150px" id="logout">로그아웃</button>
              <a href="logout.me" style="padding-bottom:10px"></a>
            </div>
      
          </div>
        </div>
      </div>
    <div id="wrap">
        <div id="header" >
          <div class="h1">
                <p style="margin: 0px; padding-top: 10px; font-size: 25px; color:white;">TeaSpoon</p>
                <p style="margin: 0px; padding-bottom: 10px; font-size: 40px; color:white;">Admin</p>
            </div>
            <div class="h2" style="text-align:left;">
            <a href="/main.ad">
            <img src="${pageContext.servletContext.contextPath}/resources/images/admin/admin_moveHome.png" style="width:50px; height:50px; margin-top:25px; cursor:pointer;"></a>
            	</div>
            <div class="h4">
           
          	  <img class="btn2" onclick='return home();' style="cursor:pointer;" src="${pageContext.servletContext.contextPath}/resources/images/admin/홈페이지2.png">
            
            	</div>
            <div class="h3" style="align:right;">
            	<img class="btn1" data-toggle="modal" data-target="#myModal" style="cursor:pointer;" src="${pageContext.servletContext.contextPath}/resources/images/admin/admin_logout.png">
            	</div>
        </div>
        <div id="side">
            <ul>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;">회원관리</p>
            <ul class="deep">
                <li><a href="list.me?currentPage=1">회원현황</a></li>
                <li><a href="level.me">회원등급관리</a></li>
                <li><a href="qnalist.me?currentPage=1">1:1문의</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >상품관리</p>
            <ul class="deep">
            <li><a href="list.st?currentPage=1">상품수정/삭제/등록</a></li>
            <li><a href="review.st?currentPage=1">상품리뷰</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >주문관리</p>
            <ul class="deep">
            <li><a href="orderCondition.st?currentPage=1">주문/취소/반품</a></li>
            <li><a href="income.st?currentPage=1">정산관리</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >게시판관리</p>
            <ul class="deep">
            <li><a href="noticeAdminList.bo?currentPage=1">공지사항</a></li>
            <li><a href="eventAdminList.bo?currentPage=1">이벤트</a></li>
            <li><a href="magazineAdminList.bo?currentPage=1">매거진</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >대관관리</p>
            <ul class="deep">
            <li><a href="Spacelist.sp?currentPage=1">대관현황</a></li>
            </ul>
            </li>
            <br>
            </ul>
        </div>
	
    <script>
    $(function(){
	    $("#logout").click(function(){
	    	var result1 = window.confirm("로그아웃 하시겠습니까?");
	    
	        if(result1){
	        	location.href = "logout.me";
	        } 
   		});
	});
    </script>
    
    <script>
    	function home(){
    			
    		var home = confirm("사용자홈으로 가시겠습니까?");
    		if(home){
    			location.href="index.jsp";
    		}else{
    			
    		}
    		
    	}
    
    </script>
    
    
    
    
    
    
</body>
</html>