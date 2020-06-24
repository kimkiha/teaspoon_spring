<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/mypage/mypage_payment.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/reset.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/menubar.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/footer.css">

<script type="text/javascript" src="resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
	<jsp:include page="../common/menubar.jsp"/>
	<div id="content" style="width:1200px; height:100%; margin-top:115px;" >
		<div class="contaniner_1 " style="height:500px">
	<h1 style="color:red; align:center;">message</h1>
	</div>
	<jsp:include page="../common/footer.jsp"/>
        <!-- //footer-->
    </div>
</div>
</body>
</html>