<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.member.model.vo.Member, com.teaspoon.board.model.vo.*"%>
<%
	Board notice = (Board)session.getAttribute("b"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
<div id="content7">
        <div class="contaniner">
            <div id="notice">
                <table class="replyArea">
                    <tr>
                        <td width="213">공지사항</td>
                        <td width="670" id="ajax_notice">
                        </td>
                        <td width="230" style="text-align: right;"><a href="<%=contextPath%>/noticeList.bo?currentPage=1">+더보기</a></td>
                    </tr>
                </table>
            </div>
        </div>
</div>
    <!-- //content-->
    <div id="footer">
    <div class="contaniner">
        <div id="foot">
            <div class="ft_logo"> 
                <img src="<%=contextPath%>/resources/img/main/foot_logo.png">
            </div>
            <div class="ft_content">
                <ul>
                    <li style="padding-left: 0"><a href="<%=contextPath%>/about.bo">브랜드소개</a></li>
                    <li><a href="<%=contextPath%>/userNotice.ad">서비스 이용약관</a></li>
                    <li><a href="<%=contextPath%>/personalInfo.ad">개인정보 처리방침</a></li>
                    <li><a href="<%=contextPath%>/pictureInfo.ad">영상정보 처리방침</a></li>
                </ul>
                <br>
                <p>(주)TEA SPOON<br>
                                             서울특별시 강남구 테헤란로 14길 6 남도빌딩 | 사업자등록번호 : 111 - 22 - 33333<br>
                    (주)ooo 구매안전서비스 고객님의 안전거래를 위해 현금 거래에 대해 ooo 에스크로 서비스를 이용하실 수 있습니다.
                    <br><br>
                    TEA SPOON. All rights reserved.
                </p>
            </div>
            <div class="ft_quick">
                <a href="<%=contextPath%>/maps.sp"><img src="<%=contextPath%>/resources/img/main/loca.png"></a>
                <a href="<%=contextPath%>/instagram.bo"><img src="<%=contextPath%>/resources/img/main/insta.png"></a>
                <a href="<%=contextPath%>/myqna.me?currentPage=1"><img src="<%=contextPath%>/resources/img/main/chat.png"></a>
            </div>
        </div>
    </div>
</div>
<script>
	$(function(){
		$.ajax({
			url:"noticeMain.bo",
			type:"post",
			success:function(b){
				var value="";
				if(b != null){
				value += "<a href='<%=contextPath%>/noticeDetail.bo?bno=" + b.boardNo + "' class='notice_title'>" +
            			 b.boardTitle + "</a>";
				}
				$("#ajax_notice").html(value);
			},error:function(){
				console.log("ajax 통신실패!");
			}
		})
	});
	
</script>
    <!-- //footer-->
</body>
</html>