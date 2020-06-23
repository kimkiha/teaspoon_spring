<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.member.model.vo.Member"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser"); 
	String msg = (String)session.getAttribute("msg");
	
%>
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
   <link href="<%=contextPath%>/resources/css/admin/admin_common.css" rel="stylesheet">
   
<script>
	$(function(){
			//자바의 변수를 담아올떄는 반드시 ""로 감싸주어야한다.
			var message = "<%=msg%>";
			//자바에서 자바스트립트에 담을 때 null이면 "null"로 담기기떄문에 아래처럼 비교
			if(message != "null"){
			alert(message);				
			}			
			//회원가입 성공시 session의 msg에 계속 메세지가 담겨있음으로 
			//어느창을 가던 menubar.jsp가 실행되면 계속  alert메소드가 실행된다.
			//그러므로 msg를 비워주어야만 1회성으로 실행
			<%session.removeAttribute("msg");%>
	});
</script>
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
	<%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
	<div class="modal" id="myModal">
        <div class="modal-dialog" style="position: relative;">
          <div class="modal-content" style="width:150px; position:absolute; left: 700px; top:50px" >
    
            <!-- Modal footer -->
            <div class="modal-footer" >
              <button type="button" class="btn btn-danger" data-dismiss="modal" style="width:150px" id="logout">로그아웃</button>
              <a href="<%= contextPath %>/logout.me" style="padding-bottom:10px"></a>
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
            <a href="<%=contextPath%>/main.ad">
            <img src="<%=contextPath %>/resources/img/admin/admin_moveHome.png" style="width:50px; height:50px; margin-top:25px; cursor:pointer;"></a>
            	</div>
            <div class="h4">
           
          	  <img class="btn2" onclick='return home();' style="cursor:pointer;" src="<%=contextPath%>/resources/img/admin/홈페이지2.png">
            
            	</div>
            <div class="h3" style="align:right;">
            	<img class="btn1" data-toggle="modal" data-target="#myModal" style="cursor:pointer;" src="<%=contextPath%>/resources/img/admin/admin_logout.png">
            	</div>
        </div>
        <div id="side">
            <ul>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;">회원관리</p>
            <ul class="deep">
                <li><a href="<%=contextPath%>/list.me?currentPage=1">회원현황</a></li>
                <li><a href="<%=contextPath%>/level.me">회원등급관리</a></li>
                <li><a href="<%=contextPath %>/qnalist.me?currentPage=1">1:1문의</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >상품관리</p>
            <ul class="deep">
            <li><a href="<%=contextPath%>/list.st?currentPage=1">상품수정/삭제/등록</a></li>
            <li><a href="<%=contextPath%>/review.st?currentPage=1">상품리뷰</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >주문관리</p>
            <ul class="deep">
            <li><a href="<%=contextPath%>/orderCondition.st?currentPage=1">주문/취소/반품</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >게시판관리</p>
            <ul class="deep">
            <li><a href="<%=contextPath%>/noticeAdminList.bo?currentPage=1">공지사항</a></li>
            <li><a href="<%=contextPath%>/eventAdminList.bo?currentPage=1">이벤트</a></li>
            <li><a href="<%=contextPath%>/magazineAdminList.bo?currentPage=1">매거진</a></li>
            </ul>
            </li>
            <br>
            <li class="c-li"><p class="click" style="margin: 0 0;" >대관관리</p>
            <ul class="deep">
            <li><a href="<%=contextPath%>/Spacelist.sp?currentPage=1">대관현황</a></li>
            </ul>
            </li>
            <br>
            </ul>
        </div>
	<%}else{%> 
   	 접속불가
    <%} %>
    <script>
    $(function(){
	    $("#logout").click(function(){
	    	var result1 = window.confirm("로그아웃 하시겠습니까?");
	    
	        if(result1){
	        	location.href = "<%=contextPath%>/logout.me";
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