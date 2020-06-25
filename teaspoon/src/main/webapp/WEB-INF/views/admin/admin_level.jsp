<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원등급</title>
   
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
         #levelInsertForm,#levelUpdateForm{
        	display:none;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/admin_sidebar.jsp"/>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1" style="height: 420px;">
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="${pageContext.servletContext.contextPath}/resources/images/admin/회원등급.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>회원등급관리페이지입니다.</p></div>
                        <div id="c1_1_1_3"></div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th>등급번호</th>
                                    <th>등급명</th>
                                    <th>최소달성금액</th>
                                    <th>등급별할인률</th>
                                    <th>
                                        <button id="btnInsertForm" type="button" style="width: 100px;" >등급추가</button>
                                    </th>
                                </tr>
                            </tbody>

                            <tfoot>
                    <c:if test="${empty gList }">
						<tr>
							<td colspan="5">조회된 리스트가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="g" items="${gList }" varStatus="status" >
						<tr class="gradeList">
							<td>${g.gradeNo }</td>
							<td>${g.gradeName }</td>
							<td>${g.minAcount}</td>
							<td>${g.gradeRate}</td>
							<c:choose>
							<c:when test="${status.index eq 0 }">
								<td>
									기본 등급 수정불가
								</td>
							</c:when>
							<c:otherwise>
								<td>
								<button type="button" class="btnUpdateForm">수정</button>
								<button type="button" class="deleteButton">삭제</button>
								</td>
							</c:otherwise>
							</c:choose>
						</tr>
						</c:forEach>
					
                               
                               
                               
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div id="c1_2" style="height: 120px;">
                	<form id="levelInsertForm" action="insertGrade.me" method="post">
                	 <table>
                        <tbody>
                            <tr>
                                <th>등급번호</th>
                                <th>등급명</th>
                                <th>등급달성금액</th>
                                <th>등급별할인률</th>
                                <th></th>
                            </tr>
                        </tbody>
                       
                          <tfoot>
                              <tr>
                                  <td><input type="text" value="자동생성" disabled></td>
                                  <td><input type="text" id="gradeName" name="gradeName" placeholder="추가할등급명" required></td>
                                  <td><input type="number" id="minMoney" name="minAcount" placeholder="최소달성금액" required></td>
                                  <td><input type="number" id="discountRate" name="gradeRate" placeholder="추가할할인률" required></td>
                                  <td>
                                   <button type="submit"  style="width: 70px;" id="enroll" onclick="return enrollGrade();" >등록</button>
                                   <button type="reset"  style="width: 70px;">취소</button>
                                   </td>
                              </tr>
                          </tfoot>
                         
                  </table>
                	</form>
                   <form  id="levelUpdateForm" action="gradeUpdate.me" method="post">
                     <table>
                        <tbody>
                            <tr>
                                <th>등급번호</th>
                                <th>등급명</th>
                                <th>등급달성금액</th>
                                <th>등급별할인률</th>
                                <th></th>
                                
                                </tr>
                        </tbody>
                       
                          <tfoot>
                              <tr>
                                  <td><input type="text" id="gNo" name="gNo" disabled="disabled"></td>
                                  <td><input type="text" id="updateGradeName" name="updateGradeName" placeholder="수정할등급명" required></td>
                                  <td><input type="number" id="updateMinMoney" name="updateMinMoney" placeholder="수정할최소금액" required></td>
                                  <td><input type="number" id="updateDiscountRate" name="updateDiscountRate" placeholder="수정할할인률" required></td>
                                  <td>
                                      <button type="submit" id="btnUpdate" style="width: 70px;" onclick="return updateGrade();">수정</button>
                                      <button type="reset"  style="width: 70px;">취소</button>
                                   </td>
                                  </tr>

                          </tfoot>
                	 </table>
                   </form>
                 
                </div>

            </div>
        </div>
     
    
    
    <form id="deleteGrade" action="deleteGrade.me" method="post">
		<input type="hidden" id="deleteGradeCode" name="deleteGradeCode">
	</form>
	
	  <form id="maxGradeForm" action="maxGradeInsert.me" method="post">
		<input type="hidden" id="maxGradeName" name="maxGradeName">
		<input type="hidden" id="maxMinMoney" name="maxMinMoney">
		<input type="hidden" id="maxDiscountRate" name="maxDiscountRate">
	</form>
	
	
    <script>
    	$(function(){
    		$("#btnInsertForm").click(function(){
    			$("#levelInsertForm").css("display","block");
    			$("#levelUpdateForm").css("display","none");
    		})
    		$(".btnUpdateForm").click(function(){
    			$("#levelUpdateForm").css("display","block");
    			$("#levelInsertForm").css("display","none");
    			
    			var gNo = $(this).parent().parent().children().eq(0).text();
                var updateGradeName =$(this).parent().parent().children().eq(1).text();
                var updateMinMoney =$(this).parent().parent().children().eq(2).text();
                var updateDiscountRate =$(this).parent().parent().children().eq(3).text();
    			$("#gNo").val(gNo);
    			$("#gno").val(gNo);
    			$("#updateGradeName").val(updateGradeName);
    			$("#updateMinMoney").val(updateMinMoney);
    			$("#updateDiscountRate").val(updateDiscountRate);
    			
    			
    		})
    		
    	});
    	
    	function enrollGrade(){
			var gradeCount = "${fn:length(gList)}";
			
			var addMinMoney = $("#minMoney").val();
			var addDiscountRate = $("#discountRate").val();
			var checked = true;
			
			$(".gradeList").each(function() { 
					    var gListMinmoney = $(this).children().eq(2).text();
					    var gListDiscountRate = $(this).children().eq(3).text();
					    
					    if(addMinMoney == gListMinmoney){
					    	alert("같은 금액에 등급이 존재합니다.");
					    	checked = false;
					    	return;
					    }else if(addDiscountRate == gListDiscountRate){
					    	alert("같은 할인률에 등급이 존재합니다.");
					    	checked = false;
					    	return;
					    }else if((addMinMoney > gListMinmoney) && (addDiscountRate < gListDiscountRate)){
					    	alert("상위 등급에 할인률이 더 작을수 없습니다.");
					    	checked = false;
					    	return;
					    }else if((addMinMoney < gListMinmoney) && (addDiscountRate > gListDiscountRate)){
					    	alert("하위 등급에 할인률이 더 클수 없습니다.");
					    	checked = false;
					    	return;
					    }
					});
		
			
			if(gradeCount == 10){
				alert("10개  등급 이상은 추가가 불가능합니다.");
				return false;
			}
			
			if(checked == false){
				return false;
			}
			
			return true;
    	}
    	
    		
    
    </script>  
    
    <script>
    	$(".deleteButton").click(function(){
    		var deleteCode = $(this).parent().parent().children().eq(0).text();
    		console.log(deleteCode);
    		$("#deleteGradeCode").val(deleteCode);
    		$("#deleteGrade").submit();
    	});
    </script>
    
    <script>
    function updateGrade(){
    			var gNo = $("#gNo").val();
    			var updateMinMoney = $('#updateMinMoney').val();
    			var updateDiscountRate =$("#updateDiscountRate").val();
    			
    			var nextGno= '.grade'+(gNo+10);
    			var nextGradeMinMoney = $('.grade'+(Number(gNo)+10)).children().eq(2).text();
    			var nextGradeDiscountGrade = $('.grade'+(Number(gNo)+10)).children().eq(3).text();
    			
    			var prevGradeMinMoney = $('.grade'+(Number(gNo)-10)).children().eq(2).text();
    			var prevGradeDiscountGrade = $('.grade'+(Number(gNo)-10)).children().eq(3).text();
    			
    			
    			//console.log(updateDiscountRate);
    			//console.log(nextGradeDiscountGrade);
    			console.log(prevGradeMinMoney);
    			console.log(prevGradeDiscountGrade);
    		
    			console.log(nextGradeMinMoney);
    			console.log(nextGradeDiscountGrade);
    			
    			
    			if((nextGradeDiscountGrade+100000)==100000){
    				if(Number(updateMinMoney) <= Number(prevGradeMinMoney)){
        				alert("하위 등급보다 달성금액이 작거나 같을 수 없습니다.");
        				return false;
        			}else if(Number(updateDiscountRate)<= Number(prevGradeDiscountGrade)){
        				alert("하위 등급보다 할인률이 작거나 같을 수 없습니다.");
        				return false;
        			}else{
        				$("#maxGradeCheck").val(1);
        				return true;
        			} 
    			}else{
    				if(Number(updateMinMoney) >=Number(nextGradeMinMoney)){
        				alert("상위 등급보다 달성금액이 크거나 같을 수 없습니다.");
        				return false;
        			}else if(Number(updateMinMoney) <=Number(prevGradeMinMoney)){
        				alert("하위 등급보다 달성금액이 작거나 같을 수 없습니다.");
        				return false;
        			}else if(Number(updateDiscountRate)<= Number(prevGradeDiscountGrade)){
        				alert("하쉬 등급보다 할인률이 작거나 같을 수 없습니다.");
        				return false;
        			}else if(Number(updateDiscountRate)>= Number(nextGradeDiscountGrade)){
        				alert("상위 등급보다 할인률이 크거나 같을 수 없습니다.");
        				return false;
        			}else{
        				 $("#maxGradeCheck").val(2);
         				return true;
        			}
    			}

    		}
    </script>
    
    
 
  
</body>
</html>