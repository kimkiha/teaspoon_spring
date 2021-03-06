<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | TeaSpoon</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/notice.css">
<link rel="styleSheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/reset1.css">
<link rel="styleSheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/footer.css">
<style>
#banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
#paging button:hover{cursor:pointer;color:#d6ae71;}
</style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/menubar.jsp"/>
        <div id="banner">
            <div class="contaniner title">공지사항</div>
        </div>
        <!-- //banner -->
          <div id="content" style="width:1200px; height:100%" >
            <!-- mypage -->
                <div class="contaniner_1 " style="height:100%">
	                <div class="notice" align="center">
	                <div class="notice_tt">티스푼 뉴스</div>
						<table class="listArea" cellspacing="0">
							<thead>
								<tr>
									<th width="700" style="text-align:left; padding-left:50px"></th>
									<th width="150"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2">
										
									</td>
								</tr>
							</tbody>
						</table>
						<div style="width:90%">
							<button id="notice_btn" type="button">
								<a href="${ pageContext.servletContext.contextPath }/noticeList.bo?currentPage=1"  style="color:white;" >목록으로</a>
							</button>
						</div>
					</div>	
                </div>
                
                </div>
            <!-- //contaniner-->
  		<jsp:include page="../common/footer.jsp"/>
        <!-- //footer-->
    </div>
    <!--//wrap-->
</body>
</html>