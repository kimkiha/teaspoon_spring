<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 | TeaSpoon</title>

<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypage_qnaEnrollForm.css">
<link rel="styleSheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/reset1.css">
<link rel="styleSheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/menubar.css">
<link rel="styleSheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/footer.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap"
	rel="stylesheet">
    <script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
#banner {
	margin-top: 115px;
	height: 170px;
	line-height: 170px;
	background:
		url("resources/img/mypage/pattern.jpg")
		center top repeat-x;
}
.inner{width: 900px;}
        #dragAndDrop{
            background-color: rgb(242, 242, 242);
            width: 100%; height: 150px;
            text-align: center;
            line-height: 150px;
            vertical-align: middle;
            color: gray;
            position: relative;
        }
        #fileList{position: absolute; top:10px; width: 100%;}
        .list{background-color:rgb(230, 230, 230); height: 25px; text-align: left; padding: 0;line-height: 25px; border-bottom: 1px solid lightgray;}
        #filenames{display: inline-block; width: 90%;padding-left: 10px;}
        #close{ display: inline-block; width: 10%; color: red;}
        #close i:hover{cursor: pointer;}
        #dragFoot{
            background-color:rgb(230, 230, 230);
            width: 100%; height: 40px;
            padding: 5px;
        }
        #myfile{opacity: 0;}
        .visually-hidden {
            position: absolute !important;
            height: 1px;
            width: 1px;
            overflow: hidden;
            clip: rect(1px, 1px, 1px, 1px);
        }

        input.visually-hidden:focus + label {
            outline: thin dotted;
        }
        #fileLabel{
            border: 1px solid gray;
            border-radius: 3px;
            padding: 3px;
            margin-left: 10px;
            color: rgb(59, 64, 68);
            background-color: whitesmoke;
        }
</style>

</head>
<body>
	<div id="wrap">
		<jsp:include page="../common/menubar.jsp"/>
		<!-- //header -->
		<div id="banner">
			<div class="contaniner title">마이페이지</div>
		</div>
		<!-- //banner -->
		<div id="content">
			<!-- mypage -->
			<div class="contaniner">
				<div id="mypage">
					<div id="mypage_info">
						<div class="user_info"
							style="width: 95px; border-left: 1px solid #bebbb6">
							<div class="user_photo"
								style="margin-top: 30px; padding-left: 10px; float: left;">
								<img src="#">
							</div>
						</div>
						<div class="user_info" style="width: 450px;">
							<table class="detail_tb" cellpadding="0" cellspacing="0">
								<tr class="d1">
									<td width="60" name="username"></td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade"></td>
								</tr>
								<tr class="d2">
									<td colspan="2"><a
										href="/memberModifyForm.me">회원정보수정</a></td>
								</tr>
							</table>
						</div>
						<div class="detail_info2"
							style="border-left: 1px solid #bebbb6; height: inherit;">
							<p class="info_th">적립포인트</p>
							<a href="mypoint.me?currentPage=1">Point</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">할인쿠폰</p>
							<a href="#">장</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">위시리스트</p>
							<a href="/wishList.me">개</a>
						</div>
					</div>
					<div id="mypage_menu_tab">
						<a href="#" class=" float"> 주문배송조회</a> <a href="#" class=" float">공간대여확인</a>
						<a href="myAdress.me" class=" float">나의배송지</a> <a
							href="myqna.me?currentPage=1"
							class="active float">1:1문의</a> <a
							href="mycart.me" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<div class="mp-qna">
							<div class="mp-qna-title">
								<P>1:1문의 내역</P>
							</div>
							<div class="outer" align="center">
								<form action=""id="QnaEnrollForm" onSubmit="return false" enctype="multipart/form-data">
									<input type="hidden" name="userNo" value="${loginUser.userNo }">
									
									<table align="center" id="mypage_table" class="table">
										<tr>
											<th width="170">상담구분</th>
											<td width="900" id="opt" name="mtmType">
												<span> <input type="radio" id="opt1" name="mtmType" value="10" checked>주문/결제
														<label for="opt1"></label>
												</span>
												<span> <input type="radio" id="opt2" name="mtmType"
														value="20">배송 <label for="opt2"></label>
												</span> 
												<span> <input type="radio" id="opt3" name="mtmType"
														value="30">이벤트/쿠폰 <label for="opt3"></label>
												</span> 
												<span> <input type="radio" id="opt4" name="mtmType"
														value="40">환불/반품/교환 <label for="opt4"></label>
												</span> 
												<span> <input type="radio" id="opt5" name="mtmType"
														value="50">회원/포인트 <label for="opt5"></label>
												</span> 
												<span> <input type="radio" id="opt6" name="mtmType"
														value="60">사이트이용/기타 <label for="opt6"></label>
												</span>
											</td>
										</tr>
									    <tr>
                       						 <th>제목</th>
                       					     <td colspan="5"><input type="text" id="title" name="mtmTitle" class="form-control" required></td>
               						    </tr>
										
                                        <tr>
                                            <td colspan="5">
                                                <textarea class="summernote" id="content" name="content" required></textarea>
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <div id="drageader" align="left">
                                                    <i class="fas fa-paperclip"></i> <span>파일 업로드</span>
                                                </div>
                                                <div id="dragAndDrop">
                                                    이곳에 파일을 드래그하세요.
                                                    <div id="fileList">
                    
                                                    </div>
                                                </div>
                                                <div id="dragFoot" align="left">
                                                    <input type="file" id="fileElem" multiple class="visually-hidden">
                                                    <label for="fileElem" id="fileLabel">파일 첨부</label>
                                                    <!-- <button class="btn btn-default btn-sm" id="fileSelect">파일첨부</button>
                                                    <input type="file" name="file" id="myfile" multiple/>   -->
                                                </div>
                                            </td>
                                        </tr>

									</table>
                                    <div style="float: right;" class="func">
                                        <button type="button"  id="btn-upload-file" class="btn btn-info" style="margin-right: 50px;">등록</button>
                                        <button type="button" onclick="history.back();" class="btn">취소</button>
                                    </div>

								
                                </form>
                                <script>
         
                                    var uploadFiles = [];
                                    var $drop = $("#dragAndDrop");
                                    $drop.on("dragenter", function(e) { 
                                        $(this).addClass('drag-over');
                                    }).on("dragleave", function(e) {
                                        $(this).removeClass('drag-over');
                                    }).on("dragover", function(e) {
                                        e.stopPropagation();
                                        e.preventDefault();
                                    }).on('drop', function(e) { 
                                        e.preventDefault();
                                        $(this).removeClass('drag-over');
                                   
                                        var files = e.originalEvent.dataTransfer.files;
                                        //console.log(files.length);
                                        //console.log(uploadFiles.length);
                                        
                                             if(files.length<6){
                                                 if(uploadFiles.length<5){ 
                                                     if((uploadFiles.length+files.length)<6){
                                                         for(var i = 0; i < files.length; i++) {
                                                              var file = files[i];
                                                              // console.log(file);
                                                              var size = uploadFiles.push(file); 
                                                              preview(file, size - 1); 
                                                          }
                                                     }else{
                                                         alert("최대 5개까지만 첨부가능합니다.");
                                                     }
                                                     
                                                  }else{
                                                     alert("최대 5개까지만 첨부가능합니다.");
                                                  }
                                            
                                             }else{
                                                 alert("최대 5개까지만 첨부가능합니다.");
                                             }
                                        
                                       
                                      
                                        // console.log(uploadFiles);
                                   
                                    });
                        
                                
                                    
                                    $(function(){
                                      
                                        $('input[type="file"]').on('change', function(e){
                                            var files = this.files;
                                            //console.log(files);
                                            
                                              if(files.length<6){
                                                  if(uploadFiles.length<5){ 
                                                          if((uploadFiles.length+files.length)<6){
                                                              
                                                              for(var i = 0; i < files.length; i++) {
                                                                  var file = files[i];
                                                                  // console.log(file);
                                                                  var size = uploadFiles.push(file); 
                                                                  preview(file, size - 1); 
                                                              }
                                                              
                                                          }else{
                                                              alert("한번에 최대 5개까지만 첨부가능합니다.");
                                                          }
                                                   
                                                  }else{
                                                      alert("최대 5개까지만 첨부가능합니다.");
                                              }
                                              }else{
                                                  alert("최대 5개까지만 첨부가능합니다.");
                                              }
                                              //console.log(uploadFiles);     
                                          
                                        });
                                    });
                        
                                  
                                    function preview(file, idx){
                                        var reader  = new FileReader();
                                        reader.onload = (function(f, idx){
                                            return function(e){
                                                var div = '<div class="list"> \
                                                <span id="filenames">'+ f.name +'</span><span id="close" align="center"><i data-idx="'+idx+'" class="far fa-minus-square minus"></i></span></div>'
                        
                                                $("#fileList").append(div);
                        
                                            };  
                                        })(file, idx);
                                        reader.readAsDataURL(file);
                                        
                                    }
                        
                                   $("#fileList").on("click", ".minus", function(e){
                                       var $target = $(e.target);
                                       var idx = $target.attr('data-idx');
                                       //console.log(idx);
                                       //uploadFiles[idx].upload = 'disable';
                                       uploadFiles.splice(idx,1);
                        
                                       $target.parents(".list").remove();
                                   });
                        
                                   $("#btn-upload-file").on("click", function(){
                                        var form = $("#QnaEnrollForm");
                                        var formData = new FormData(form[0]);
                                        $.each(uploadFiles, function(i, file){
                                          
                                            formData.append('uploadFile', file, file.name);
                                            
                                        });
                                        if($('#title').val()== "" && $('#content').val()== ""){
                                            alert("제목과 내용을 입력해주세요.");
                                        }else{
                                              $.ajax({
                                                  url:"insertQNA.me",
                                                  data:formData,
                                                  type:"post",
                                                  contentType:false,
                                                  processData: false,
                                                  success:function(result){
                                                	  console.log(result);
                                                      if(result == "success"){
                                                          alert("게시글 등록 완료");
                                                          location.href="myqna.me?currentPage=1" ;
                                                      }else if(result == "insertFail"){
                                                          alert("게시판 등록에 실패하셨습니다.");
                                                      }else{
                                                          alert("첨부파일 업로드에 실패하셨습니다.");
                                                      }
                                                  },
                                                  error:function(){
                                                      console.log("mtm ajax통신 실패");
                                                  }
                                              });
                                               
                                        }
                                        
                                     
                                        // for (var key of formData.keys()) {
                                        //     console.log(key);
                                        // }
                                        // for (var value of formData.values()) {
                                        //     console.log(value);
                                        // }
                                        //form.submit();
                                   });
                                
                        
                                </script>
								<br>
								<br>
								<div class="ppp">
									<div class="ppp1">
										<div>
											<img src="유의사항.png" alt="" width="160" height="170">
										</div>

									</div>
									<div class="ppp2">
										<ul>
											<li>이메일, 핸드폰 번호를 변경하려면 개인정보수정 페이지에서 변경해주세요.</li>
											<li>한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우 삭제 후 재등록 하셔야
												합니다.</li>
											<li>알림 받기를 설정하시면 1:1 상담 답변완료시 고객님의 메일로도 확인하실 수 있습니다.</li>
											<li>고객상담센터 답변가능시간 : 오전 9시 ~ 오후 6시(토/일/공휴일 제외)</li>
										</ul>
									</div>

								</div>

							</div>

						</div>



					</div>
				</div>
			</div>
        </div>
        <script>
          //  $(document).ready(function() {
            //여기 아래 부분
        //    $('.summernote').summernote({
         //     height: 300,                 // 에디터 높이
         //     minHeight: null,             // 최소 높이
         //     maxHeight: null,             // 최대 높이
        //      focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        //      lang: "ko-KR",					// 한글 설정
       //       placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
        //    });
      //  });
        </script>

		<!-- //content-->
		<jsp:include page="../common/footer.jsp"/>
		<!-- //footer-->
	</div>
	
   
</body>
</html>