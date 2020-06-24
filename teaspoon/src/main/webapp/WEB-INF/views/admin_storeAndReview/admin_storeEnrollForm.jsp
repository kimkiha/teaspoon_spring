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
<title>상품등록 | Admin</title>

<style>
.b{
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: bold;
}
table .a{font-size:18px; font-weight:bold; float:right; margin-right:50px; margin-bottom:25px;}
table .inputBox{width:320px; height:30px; border:1px solid #dbdbdb; border-radius:4px; margin-left:10px;}
</style>
</head>
<body>
	<jsp:include page="../common/admin_sidebar.jsp" />
	<div id="contents">
		<div id="c1" style="margin-top: 20px;">
			<div class="outer">
				<p class="b">상품 등록</p>
				<hr>

				<form id="productInsertForm" action="insert.st" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td style="width:370px; padding:10px;">
								<img style="width:350px; height:250px; border-radius:4px; border:1px solid #dbdbdb" id="titleImg">
								<div id="fileArea">
									<input type="file" name="thumb" id="thumb" onchange="loadImg(this,1);" required>
								</div>
							</td>
							<td>
								<p class="a" style="margin-top:20px;">상품명  <input class="inputBox" type="text" name="productName" value="" required></p>
								<p class="a">공급가  <input class="inputBox" type="number" name="supPrice" value="" required></p>
								<p class="a">판매가  <input class="inputBox" type="number" name="price" value="" required></p>
								<p class="a">재고    <input class="inputBox" type="number" name="stock" value="" required></p>
							</td>
						</tr>
						<tr style="border-bottom:0px;">
							<th style="padding:15px 0px; font-size:18px;">상품설명을 입력해주세요.</th>
							<td></td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea id="summernote" name="productContents"></textarea>
							</td>
						</tr>

					</table>
					<div class="btns">
						<button type="submit" style="width: 120px;">등록하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#titleImg").click(function(){
				$("#thumb").click();
			});
			
		});

		function loadImg(inputFile, num) {
			if(inputFile.files.length==1){
	      			// 파일을 읽어들일 FileReader 객체생성
	      			var reader = new FileReader();

	      			// 파일을 읽어주는 메소드 : 파일을 읽어들이는 순간 고유한 url부여
	      			reader.readAsDataURL(inputFile.files[0]);
	      			
	      			//파일 읽기가 완료 되었을때 실행할 메소드
					// e : 현재 이벤트가 발생한 이벤트객체
	      			reader.onload = function(e){
					$("#titleImg").attr("src", e.target.result); 
				};
			}
		}
	</script>
	
	<script>
	$(function(){

               // 1. 단순히 에디터 폼만 보이게 하는거
               //$("#summernote").summernote();

               // 2. 추가적인 속성들 부여 가능
               // 간단하게 사이즈 조정(width, height) / 미리보기 값(placeholder)
               $('#summernote').summernote({
               //placeholder:" ",
               tabsize: 2,
                   height: 100,
                   width:800/*
                   toolbar: [
                       [groupName, [list of button]]
                       ['Font Style', ['fontname']],
                       ['style', ['bold', 'italic', 'underline']],
                       ['font', ['strikethrough']],
                       ['fontsize', ['fontsize']],
                       ['color', ['color']],
                       ['para', ['paragraph']],
                       ['height', ['height']],
                       ['Insert', ['picture']]
                   ] 
                   */
           	});

		});
	
</script>
	
	
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- summernote -->
</body>
</html>