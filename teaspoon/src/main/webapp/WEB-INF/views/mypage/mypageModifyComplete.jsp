<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정 | TeaSpoon</title>
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypage_modify.css">
	<link rel="styleSheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/reset.css">
	<link rel="styleSheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/footer.css">

<body>
	<div id="wrap">
		<jsp:include page="../common/menubar.jsp"/>
		<!-- //header -->

		<!-- product -->
		<div class="contaniner">
			<center style="padding: 35px;">
				<p style="margin-top:150px;"></p>
				<p style="font-size:30px;">회원정보수정</h4>
				<p style="font-size:15px; color:rgb(85, 83, 83); text-align:center; margin-top:5px; margin-bottom: 30px;">회원님의 회원정보를 수정하실 수 있습니다.</h6>
			</center>

			<div id="정보수정" class="tabcontent">
				<form id="enrollmodify">
					<fieldset style="list-style-type: disc; padding: 40px; padding-left:190px; padding-right:190px;  height:260px; width:600px;" id=ul>
						<ul style="border: 0.3 solid lightgrey; height:260px; width:600px"> <br>
							<center style="padding: 35px;">
								<img src="${ pageContext.servletContext.contextPath }/resources/img/mypage/spoon.png" width="74px;" height="74px;">
								<h1>정보수정완료!</h1>
								<h4 style="color: gray">3초뒤 메인페이지로 이동합니다.</h4>
							</center>
					</fieldset>
				</form>
				</ul>
				<br>
				</form>
			</div>

			<!-- //content-->
			<jsp:include page="../common/footer.jsp"/>
			<!-- //footer-->
		</div>
</body>
</html>