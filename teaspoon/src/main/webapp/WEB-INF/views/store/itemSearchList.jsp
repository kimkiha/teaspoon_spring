<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee | TeaSpoon</title>
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/reset.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/store/coffeeListView.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/menubar.css">
<link rel="styleSheet" href="${pageContext.servletContext.contextPath}/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    #content1 {width:100%; height:inherit; background: #ffffff; }
	#banner{height: 270px; line-height: 270px; background:url("${pageContext.servletContext.contextPath}/resources/images/store/storetop_coffee.jpg") center top no-repeat;}
	#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
	#paging button:hover{cursor:pointer;color:#d6ae71;}
</style>
</head>
<body>
<div id="wrap">
	<!-- header -->
   <jsp:include page="../common/menubar.jsp"/>
   <!-- //header -->
        <div style="height:115px"></div>
        
        <div id="banner">
            <div class="contaniner">
                <b><p style="font-size:40px;">STORE</p></b>
            </div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="productArea">
                        <div id="productList">
                        
                        	<!-- listArea -->
                            <div class="product" style="margin-top:50px; margin-right:30px;" >
                                <div class="product_img">
                                	<input type="hidden" class="pcode" name="pcode" value=${ p.productNo }>
                                    <img src="${pageContext.servletContext.contextPath}/resources/thumbnail_upfiles/${ p.productChange }" style="float:left; width:300px; height:inherit">
                                </div>
                                <div class="product_detail" style="width:300px; height:60px; padding:0px">
                                   <p style="padding-top:20px;padding-left:15px;">${ p.productName }</p>
                                </div>
                                <div class="like">
                                    <img class="like_icon empty" src="${pageContext.servletContext.contextPath}/resources/images/store/heart_emtpy.png">
                                </div>
                                
                                <div class="basket">
                                    <img id="open" class="basket_icon" src="${pageContext.servletContext.contextPath}/resources/images/store/cart.png">
                                </div>
                            </div>
                        </div>
                        <div id="paging" class="pagination">
                            







                        </div>
                    </div> 
                </div>
            </div>
        </div>

		<!-- <form id="duplicateDeletePcode" action="deleteWish.me" method="post">
			<input type="hidden" name="pcode" id="dPcode">
		</form> -->
		
		
        <!--product-->
        <script>
        	// 개별 상품의 상세 페이지로 이동
        	$(function(){
        		$('.product_img').click(function(){
        			var pcode = $(this).children().eq(0).val();
        			location.href="detail.co?pcode="+pcode;
        		});
        	});
        

    		// 페이지로딩시 로그인한 유저의 위시리스트 목록조회
    		$(function(){
    			selectWishList();
    		});
    		
    		function selectWishList(){
    			
    			var icon = $('.like_icon');
    			var loginUser = "${ loginUser }";
    			if(loginUser != null){
    				$.ajax({
    					url:"selectWish.st",
    					type:"post",
    					success:function(list){
							for(var i=0; i<12; i++){
								var p = '.pcode'+i;	
								for(var j=0; j<list.length; j++){
									if($(p).val()==list[j].pcode){
										var heart =$(p).parent().siblings().eq(1).children();
										heart.removeClass("empty");
										heart.addClass("full");
										heart.attr("src","${pageContext.servletContext.contextPath}/resources/images/store/heart_full.png");
									}
								}
							}
    					},error:function(){
    						//console.log("사용자 위시리스트 조회용 ajax실패")
    					}
    				})
    			}
    		}
    		
    		

        	// 위시리스트 등록 ajax
        	$(function(){
        		$('.like_icon').click(function(){
        			var pcode1 = $(this).parent().siblings([".product_img"]).children().eq(0).val();
        			//console.log(pcode1);
        			
					var icon = $(this);
					
					if(icon.attr("class") == "like_icon empty"){ // 빈 하트일 경우 --> 위시리스트 등록
	        			$.ajax({
	        				url:"insertWish.me",
	        				data:{pcode:pcode1},
	        				success:function(result){
	        					if(result > 0){
				        			 icon.removeClass("empty");
				        			 icon.addClass("full");
				        			 icon.attr("src","${pageContext.servletContext.contextPath}/resources/images/store/heart_full.png");
				        			 var bool = window.confirm("위시리스로 등록되었습니다. 위시리스트로 이동하시겠습니까?");
				        			 if(bool){
				        				 location.href="wishList.me";
				        			 }
	        					} else if(result<0){
	        						$("#dPcode").val(pcode1);
	        						$("#duplicateDeletePcode").submit();
	        						
	        					} else if(result == 0){
	        						window.alert("로그인이 필요한 서비스입니다.");
	        					}
	        				}, error:function(){
	        					window.alert("통신에러1");
	        				}
        				});
        			
					}else{ // 채워진 하트일 경우 --> 위시리스트 삭제
						
						$.ajax({
							url:"deleteWish.me", 
							data:{pcode:pcode1},
							success:function(result){
								if(result > 0){
				        			 icon.removeClass("full");
				        			 icon.addClass("empty");
									 icon.attr("src","${pageContext.servletContext.contextPath}/resources/images/store/heart_emtpy.png");
									 window.alert("위시리스트에서 삭제되었습니다.")
								}else{
									
								}
							},error:function(){
								window.alert("통신에러2");
							}
						})
					}
        		 });
        	});
        	

            // 장바구니 이동
            /*$(function(){
            	$('.basket_icon').click(function(){
            		$.ajax({
            			url:,
            			type:"post",
            			data:{pcode:pcode},
            			
            		})
            	})
            })*/
            

   
        </script>
        


        <!-- //content-->
       <jsp:include page="../common/footer.jsp"/>
        <!-- //footer-->
    </div>
</body>
</html>