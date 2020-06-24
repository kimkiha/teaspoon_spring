<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1대1문의 | Admin</title>
<!--부트스트랩 시작-->

<style>
table * {
	padding: 10px;
	font-size: 18px;
}

table th {
	text-align: center;
}

.btns a {
	text-decoration: none;
	color: black;
}

.outer p {
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: bold;
}

table * {
	padding: 5px;
	margin: auto;
}

table th {
	width: 100px;
}

table tr:first-child {
	border-top: 1px solid lightgray;
}

table tr {
	border-bottom: 1px solid lightgray;
}
</style>
</head>
<body>
	 <jsp:include page="../common/admin_sidebar.jsp"/>
	<div id="contents">
		<div id="c1">
			<div class="outer">
				<p>1:1문의 답변</p>
				<form method="post" action="QnaDetail.me" id="qnaForm">
				<table>
						<input type="hidden" name="mtmNo" value="">
					<tr>
						<th width="100px">문의번호</th>
						<td></td>
						<th>상담유형</th>
						<td></td>
					</tr>
					<tr>
						<th>제목</th>
						<td></td>
						<th>상담신청일</th>
						<td></td>
					</tr>
					<tr>
						<th>회원명</th>
						<td></td>
						<th>회원아이디</th>
						<td></td>
					</tr>
					<tr>
						<th>고객 내용</th>
						<td colspan="3"><textarea cols="60" rows="5"
								style="resize: none" required></textarea></td>
					</tr>
					<tr>
						<th>답변내용</th>
						<td colspan="3"><textarea cols="60" rows="5"style="resize: none" required name="reComment">
								
					</textarea></td>
					</tr>
				
							<div>첨부파일 :
								 <a href=""></a>
							</div>
							
					
						<div class="btns">
						<button type="button" style="width: 100px;">
							<a href="qnalist.me?currentPage=1">목록으로</a>
						</button>
						<button type="submit" style="width: 100px;">답변달기</button>
						</div>
				</table>
				</form>
				<br>

			</div>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>