<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 | TeaSpoon</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_photo.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">

<style>
#banner {height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
#paging button:hover{cursor:pointer;color:#d6ae71;}
#content1{height:100%}
</style>
</head>

<body>
<div id="wrap">
        <jsp:include page="../common/menubar.jsp"/>
        <!-- //header -->
        <br clear="both">
        <div id="banner" style="float:left; width:100%; margin-top:88px;">
            <div class="contaniner title">매거진</div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- contaniner -->
                <div class="contaniner" >
                <!-- magazine 내용 -->
                    <div id="magazine" style="border:1px solid red">
                        <div id="line_one">
                        	<c:forEach items="${list }" var="r">
                        		<div class="first_mz">
                                    <div class="effect-wrap">
                                        <figure class="effect7">
                                            <img style="width:100%;height:100%;"src="${ pageContext.servletContext.contextPath }/resources/img/board/${r.changeName}" alt="" > 
                                            <figcaption>
                                                <h3>KNOW THAT EAT</h3>
                                                <p>${r.smallTitle}</p>
                                                <p>${r.boardTitle }</p>
                                                 <a href="${ pageContext.servletContext.contextPath }/magazineDetail.bo?bno=${r.boardNo}" class="read">매거진 보기+</a>
                                            </figcaption>
                                        </figure>
                                    </div>
                                </div>
                        	</c:forEach>
                        </div>
                    </div>
            <!-- //매거진 -->
                </div>
                
            <!-- //contaniner -->
          </div>
            <jsp:include page="../common/footer.jsp"/>
        <!-- //footer-->
    </div>
    <!-- //wrap-->
</body>
</html>