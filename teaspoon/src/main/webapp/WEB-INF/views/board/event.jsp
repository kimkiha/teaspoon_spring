<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 | TeaSpoon</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/board/event.css">
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/footer.css">
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/reset.css">
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner {margin-top:88px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
    	#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
		#paging button:hover{cursor:pointer;color:#d6ae71;}
		.goEvent{
			cursor:pointer;
		}
    </style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/menubar.jsp"/>
        <!-- //header -->
        <div></div>
        <div id="banner">
            <div class="contaniner title">이벤트</div>
        </div>
        <!-- //banner -->
          <div id="content" style="height:2000px">
            <!-- product -->
            <div id="content1" style="height:100%">
                <div class="contaniner" style="hegith:100%">
                    <div id="event">
                        <%--<div class="status">
                            <ul>
                                <li style="margin-left:350px;"><a href="#"><b>진행중이벤트</b></a></li>
                                <li>&nbsp;/&nbsp;</li>
                                <li><a href="#">종료된이벤트</a></li>
                            </ul>
                        </div> --%>
                            <div id="event_content" style="margin-top:120px">
                               
                	</div> 
                            </div>
                            
                        </div>
                    </div>
                     
                </div>
            </div>
      
        <!-- //content-->
       <jsp:include page="../common/footer.jsp"/>
        <!-- //footer-->
  </div>
    <!-- //wrap-->
 
 </body>
</html>