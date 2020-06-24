<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 | TeaSpoon</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_view.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_view_photo.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
    
    <script type="text/javascript" src="resources/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner{height: 170px; line-height: 170px; background:rgb(222, 219, 210); margin-top:64px;}
    </style>
</head>

<body>
<div id="wrap">
        <jsp:include page="../common/menubar.jsp"/>
        <!-- //header -->
        <br clear="both">
        <div id="banner" >
            <div class="title">매거진</div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- product -->
                <div id="maga" >
                    <div id="magazine">
                        <div id="title">
                            <div id="title_detail">
                                <div id="con_tt"><p></p></div>
                                <br><br>
                                <div id="con_wr">
                                    <ul>
                                        <li>Editor's letter &nbsp;|</li>
                                        <li>&nbsp;</li>
                                    </ul>
                                </div>
                            </div>
                            <div id="sns">
                                <ul>
                                    <li><a href="#"><img src="${ pageContext.servletContext.contextPath }/resources/img/board/twitter.png" alt="트위터공유하기"></a></li>
                                    <li><a href="#"><img src="${ pageContext.servletContext.contextPath }/resources/img/board/facebook.png" alt="페이스북 공유하기"></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="maga_con">
                            
                        </div>
                    	<div id="pre_next">
	                        <div id="pre">
	                        </div>
                    	</div>
                	</div>
                    <!-- //magazine -->
                <!-- //maga -->
         </div>
         <jsp:include page="../common/footer.jsp"/>
        <!-- //footer-->
        
        </div>
        <!-- //content -->
</div>
    <!-- //wrap-->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/magazine_view.js"></script>
    
</body>
</html>