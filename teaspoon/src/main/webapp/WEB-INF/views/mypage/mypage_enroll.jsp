<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String randomKey = (String)request.getAttribute("randomKey");
%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | TeaSpoon</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_enroll.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
</head>
<body>
<div id="wrap" >
       <%@ include file="../common/menubar.jsp" %>
	
        <!-- //header -->
       
       <!-- 	<form id="enrollForm" action="<%= contextPath %>/insert.me" method="post"> -->
       		<div id="content" style="margin:0 auto">
        

            <!-- product -->

                <!-- 1. 약관동의 페이지-->
                <div class="contaniner" style=" width:100%; height:100%">
                    
                        <h3 style="margin-top: 100px; margin-bottom: 10px; padding-top:100px; font-size:36px;">티스푼 회원가입</h3>
                        <h6 style="font-size:18px; color:rgb(70, 69, 69);">티스푼 공식 쇼핑몰에 가입하시면 온/오프 매장에서 상품을 구매 할 때마다<br>
                            현금처럼 사용할 수 있는 포인트 적립과 사용 등 다양한 혜택을 받으실 수 있습니다.<br>
                        </h6> <br>
                        
                    
                        <div class="tab1" style="margin-bottom:45px; margin-top:45px; align:center;">
                            <button class="tablinks" onclick="openCity(event, '약관동의')" id="defaultOpen">약관동의</button>
                            <button class="tablinks" onclick="openCity(event, '정보입력')" id="defaultOpen2" disabled>정보입력</button>
                            <button class="tablinks" onclick="openCity(event, '이메일인증')" id="defaultOpen3" disabled>이메일인증</button>
                            <button class="tablinks" onclick="openCity(event, '가입완료')" id="defaultOpen4" disabled>가입완료</button>
                        </div> 
                                <div id="약관동의" class="tabcontent"> 
                                
                                    <form id="agreeForm">
                                    
                                        <textarea class="form-control2" rows="50" id="comment" width=70%;">
제 1 장 총 칙
                            
                             
                            
제 1 조 (목적)
이 약관은 {COMPANY_NAME}(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인   사항을 규정함을 목적으로 합니다.
                                          
                                           
                                          
제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
                                          
                                           
                                          
제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말      합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.
                                          
                                           
                                          
제 2 장 서비스 이용계약
                                          
                                           
                                          
제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.
                                          
                                           
                                          
제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보   호  를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.
                                          
                                           
                                          
제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우
                                          
                                           
                                          
제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.
                                          
                                           
                                          
제 3 장 계약 당사자의 의무
                                          
                                           
                                          
제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.
                                          
                                           
제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
 바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.
                                          
                                           
                                          
제 4 장 서비스 제공 및 이용
                                          
                                           
                                          
제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.
                                          
                                           
                                          
제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.
                                          
                                           
                                          
제5장 계약사항의 변경, 해지
                                          
                                           
                                          
제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.
                                          
                                           
                                          
제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.
                                          
                                           
                                          
제6장 손해배상
                                          
                                           
                                          
제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.
                                          
                                           
                                          
제 15 조 (관할법원)
                                          
                                           
                                          
서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.
                                          
                                           
                                          
[부칙]
                                          
                                           
                                          
(시행일) 이 약관은 2020년 01월부터 시행합니다.
                                </textarea>
                                </form>
                                <div class="checks">
                                    <input type="checkbox" id="ex_rd" name="ex_rds"> 
                                    <label for="ex_rd">동의합니다.</label> 
                                </div><br>
                                <form>
                                    <label for="약관동의1"></label>
                                    <textarea class="form-control2" rows="50" id="comment">
제 1 장 총 칙
                            
                             
                            
이 약관은 {COMPANY_NAME}(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인   사항을 규정함을 목적으로 합니다.
                                                                                  
                                                                                   
제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
                                                                                  
                                                                                   
                                                                                  
제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말      합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.
                                                                                  
                                                                                   
                                                                                  
제 2 장 서비스 이용계약
                                                                                  
                                                                                   
                                                                                  
제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.
                                                                                  
                                                                                   
                                                                                  
제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보   호  를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.
                                                                                  
                                                                                   
                                                                                  
제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우
                                                                                  
                                                                                   
                                                                                  
제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.
                                                                                  
                                                                                   
                                                                                  
제 3 장 계약 당사자의 의무
                                                                                  
                                                                                   
                                                                                  
제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.
                                                                                  
                                                                                   
제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.
                                                                                  
                                                                                   
                                                                                  
제 4 장 서비스 제공 및 이용
                                                                                  
                                                                                   
                                                                                  
제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.
                                                                                  
                                                                                   
                                                                                  
제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.
                                                                                  
                                                                                   
                                                                                  
제5장 계약사항의 변경, 해지
                                                                                  
                                                                                   
                                                                                  
제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.
                                                                                  
                                                                                   
                                                                                  
제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.
                                                                                  
                                                                                   
                                                                                  
제6장 손해배상
                                                                                  
                                                                                   
                                                                                  
제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.
                                                                                  
                                                                                   
                                                                                  
제 15 조 (관할법원)
                                                                                  
                                                                                   
                                                                                  
서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.
                                                                                  
                                                                                   
                                                                                  
[부칙]
                                                                                  
                                                                                   
                                                                                  
(시행일) 이 약관은 2020년 01월부터 시행합니다.
					</textarea>
                     </form>
                      <div class="checks">
                         <input type="checkbox" id="ex_rd2" name="ex_rds"> 
                         <label for="ex_rd2" >동의합니다.</label> 
                      </div><br>
                     
                        
                        <!-- 1_1. 약관동의 버튼-->
                        <button type="button" class="btnenroll" id="first_agree_btn" onclick="next();"  style="margin-bottom:140px; margin-top:20px;">모두동의</button>
                          </div>
                          </div>
                        </div>
						
						
						
                        <!-- 2. 정보입력 페이지-->
                        <div class="contaniner">
                          <div id="정보입력" class="tabcontent" >
                          	
                          	<form id ="informationForm" method="get">  
                            
                            <table id="table1" style="align:center; ">
                                    <tr>
                                        <td style="font-size:20px; width: 300px;"><li>성 명</li></td>
                                        <td style= "text-align:left;"><input type="text" id="userName" name="username" placeholder="이름(실명으로 입력해주세요)."></td>
                                        <td style= "font-size:16px; width: 150px;"></td>           
                                    </tr>
                                    <tr>
                                        <td style= "font-size:20px;"><li>생 년 월 일</li></td>
                                        <td style= "text-align:left;" colspan="2">
                                        	<input type="number" id="birthday"  name="birthday" placeholder="생년월일8자리(ex)19940610">
 											<input type="radio"  name="gender" value="1" checked>남자
                                            <input type="radio"  name="gender" value="2">여자
                                        </td>
                                                     
                                    </tr>
                                    <tr>
                                        <td style= "font-size:20px;"><li>전 화 번 호</li></td>
                                        <td style= "text-align:left;" colspan="1">
                                            <select name="firstnumber" id="firstnumber" style="width:120px; height:55px;">
                                            <option value="010" selected>010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="019">019</option>
                                            </select>
                                            <input type="number" id="verification" name="phonenum" type="verification" placeholder="전화번호">
                                        <td></td>
                                       
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="font-size: 12px; text-align:left"> * 아이디 미입력시 휴대폰번호로 가입되며<br> 
                                           												 가입완료후 변경 불가합니다.</td>
                                        <td></td>
                                    </tr>   
                                    <tr>
                                        <td style= "font-size:20px;"><li>아 이 디</li></td>
                                        <td style= "text-align:left;"><input type="text" id="userId" name="UserId" placeholder="아이디(4 ~ 12자 영문 대,소문자)"></td>
                                        <td><button type="button" id="idCheck">아이디중복확인</button></td>
                                    </tr>
                                    <tr>
                                        <td style= "font-size:20px;"><li>비 밀 번 호</li></td>
                                        <td style= "text-align:left;"><input type="password" id="userPwd1" name="UserPwd1" placeholder="영문자 또는 숫자 포함 총 8자~15자"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style= "font-size:20px;"><li>비밀번호확인</li></td>
                                        <td style= "text-align:left;"><input type="password" id="userPwd2" name="UserPwd2" placeholder="비밀번호 확인"></td>
                                        <td></td>
                                    </tr>

                            	</table>
                            
                                 <!-- 2_1. (정보입력)본인인증 및 회원가입 버튼-->
                                <button type="button" class="btnenroll2" id="seconde_agree_btn" disabled>본인인증 및 회원가입</button>
                            </div> 
                            
                            </form>	<!--  -->
                            
                          </div> 
                           

                          <!-- 3. 이메일인증 페이지-->
                          <div id="이메일인증" class="tabcontent" style=" width:100%; height:100%">
                            <!-- <form id="email_certify" name="emailcertform" style="align:center"; action="email.e" method="post"> -->
                                <table style="list-style-type: disc; align:center; padding:30px; border:1px solid lightgrey;" id="ul">
                                    	<tr>
                                    		<td style="font-size:20px; width:400px; padding-right:20px;"><li>이메일</li></td>
                                    		<td style="text-align:left;"><input type="text" id="email" name="Email" placeholder="이메일" style="width:300px"> </td>
                                    		<td style="width: 230px;"><button type="submit" id="email_send" >인증번호 발송</button></td>
                                    	</tr>	
                                    	<tr> 
                                        	<td style="font-size:20px; width:400px; padding-right:20px;"><li>인증번호확인</li></td>
                                       	 	<td style="text-align:left;"><input type="text" id="identify" placeholder="인증번호" style="width:300px"></td>
                                       	 	<td style="width: 230px;"></td> 
                                        </tr>				
                                  	<br><br>
                                </table>
                                
                         		<!-- 3_1. 본인인증 및 회원가입 버튼-->
                         		    <form id="enroll_final" action="<%=contextPath%>/insert.me" method="post">
										<input type="hidden" id="userName2" name="username">
										<input type="hidden" id="birthday2" name="birthday">
										<input type="hidden" id="gender2" name="gender">
										<input type="hidden" id="firstnumber2" name="firstnumber">
										<input type="hidden" id="verification2" name="phonenum">
										<input type="hidden" id="userId2" name="UserId">
										<input type="hidden" id="userPwd12" name="UserPwd1">
										<input type="hidden" id="email2" name="Email">
		                        	<input type="button" class="btnenroll3" id="ModifyandEnroll2" value="인증완료" onclick="check();"></input> <!-- onclick="return check(); -->
		                           </div>
		                           </form>
		                           
		                           
	                          <!--  </form> -->
                        	 	
                                     
                        <!-- 4. 회원가입완료 페이지-->
                         <div id="가입완료" class="tabcontent">
                            <form >
                                <fieldset style="list-style-type:disc; border:1px solid lightgrey; margin-left:410px; margin-right:200px; margin-bottom:150px;" id=ul2>
                                    <ul style="border:0.3 solid lightgrey;"><br>
		                                    <p style="padding:35px;">
		                                    <p style="align:center;"><img src="<%=contextPath %>/resources/img/mypage/spoon.png" width="74px;" height="74px;"></p>
		                                    <p style="margin:5px; font-size:24px; color:black; font-weight: bold; text-align:center;">회원가입완료!</p>
		                                    <p style="margin-bottom:10px; text-align:center">티스푼의 가족이 되신걸 환영합니다!</p>
		                                    <h6 style="color:gray; text-align:center;">3초뒤 메인페이지로 이동합니다.</h6>
		                                    </p>
                                		</ul>
                                	</fieldset>
                          		</div>
                           </form>
                         </div>
                        </form>
                         
                        
         <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
            <script>
                function openCity(evt, cityName) {
                  var i, tabcontent, tablinks;
                  tabcontent = document.getElementsByClassName("tabcontent");
                  for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                  }
                  tablinks = document.getElementsByClassName("tablinks");
                  for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace("active", "");
                  }
                  document.getElementById(cityName).style.display = "block";
                  evt.currentTarget.className += "active";
                }
                
                // Get the element with id="defaultOpen" and click on it
                document.getElementById("defaultOpen").click();
                
                </script>

    <script>
    /*
        $(function(){
						$("#first_agree_btn").click(function(){
							$("#defaultOpen2").click();
						});

                        $("#ModifyandEnroll").click(function(){
							$("#defaultOpen3").click();
						});

                        $("#ModifyandEnroll2").click(function(){
							$("#defaultOpen4").click();
						});
        });*/
    </script>
      
    <script> /*본인인증 및 회원가입버튼 클릭시*/
    	function next(){
            if($("input:checkbox[id='ex_rd']").is(":checked") == true && $("input:checkbox[id='ex_rd2']").is(":checked") == true) { // 둘다 체크 되었을 경우
            	//$("#first_agree_btn").click(function(){ // '모두동의'버튼 클릭시
					$("#defaultOpen2").click();	// 다음페이지로 이동
				//});
            }else{// 둘중 하나라도 체크 안되었을 경우
                alert("모두 동의하셔야합니다.");
            }
        }
    </script>
    
    
    
    
    <script>
    $("#seconde_agree_btn").click(function(){
            // 유효성 검사할 각각의 "input 요소"들 변수에 받아두기
            var id = document.getElementById("userId");
            var pwd1 = document.getElementById("userPwd1");
            var pwd2 = document.getElementById("userPwd2");
            var name = document.getElementById("userName");
            var birth = document.getElementById("birthday"); 			// 생년월일
            var veri  = document.getElementById("verification"); 		// 전화번호

            // 1) 이름 검사
            //    한글로만 2글자 이상
            regExp = /^[가-힣]{2,}$/; 
            if(!regExp.test(name.value)){
                alert("유효한 이름을 입력하세요");
                name.value = "";
                name.focus();
                return false;               
            }
            
            // 2) 생년월일검사
            //    숫자!!로만 8글자 이상, 8글자 이하
            regExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
            if(!regExp.test(birth.value)){
                alert("유효한 생년월일을 입력하세요");
                birth.value = "";
                birth.focus();
                return false;               
            }
           
            
            // 3) 전화번호검사
            //    숫자!!로만 7글자 이상, 8글자 이하
            regExp = /^[0-9]{7,8}$/; 
            if(!regExp.test(veri.value)){
                alert("유효한 전화번호를 입력하세요");
                veri.value = "";
                veri.focus();
                return false;               
            }

            // 4) 아이디 검사
            // 영문자 또는 숫자 포함해서 총 4~12자로 입력 (단, 첫글자는 반드시 영문자로)
            var regExp = /^[a-z][a-z\d]{3,11}$/i;
            if(!regExp.test(id.value)){
                alert("유효한 아이디를 입력하세요!!");
                id.value = "";
                id.focus();
                return false;               
            }
          
            // 5_1) 비밀번호 검사
            //    특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
            regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
            if(!regExp.test(pwd1.value)){
                alert("유효한 비밀번호를 입력하세요!!");
                pwd1.value="";
                pwd1.focus();
                return false;
            }
			
            // 5_2) 비밀번호 일치 확인
            // 비밀번호값과 비밀번호 확인값이 일치하는지 검사
            if(pwd1.value != pwd2.value){
                alert("동일한 비밀번호 확인값을 입력하세요!!");
                pwd2.value = "";
                pwd1.focus();
                return false;
            }

             
             //$("#defaultOpen3").removeAttr("disabled");
				$("#defaultOpen3").click();	// 다음페이지로 이동

       	 });
    	</script>
    	
    	
    	<script>
	
		$(function(){
			
			// 중복확인 클릭했을 때
			$("#idCheck").click(function(){
				  var id = document.getElementById("userId");
				  var regExp = /^[a-z][a-z\d]{3,11}$/i;
		            if(!regExp.test(id.value)){
		                alert("유효한 아이디를 입력하세요!!");
		                id.value = "";
		                id.focus();
		                return false;               
		            }
				// 아이디 입력하는 input요소
				var userId = $("#userId").val();
				
				$.ajax({
					url:"idCheck.me",
					data:{userId:userId},
					type:"post", 
					success:function(result){	// 1 또는 0
						
						if(result == 0){		// 사용가능한 아이디
							
							if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
								
								// 아이디 더이상 수정이 불가하게끔
								$("#userId").attr("readonly", "true");
								// 회원가입버튼 활성화
								$("#seconde_agree_btn").removeAttr("disabled");
								
							}else{
								$("#userId").forcus();
								
							}
							
						}else {					// 사용불가능한 아이디
							
							alert("사용할 수 없는 아이디입니다.");
							UserId.focus();
							
						}
						
					},error:function(){
						console.log("ajax통신 실패!!");
					}
					
				
				});
				
			});
			
		});
	
	</script>
    	
    	
    	
    		
    	<script>
    	<%-- $(function(){
    		
    		randomKey ="<%=randomKey%>";

    		console.log(randomKey);
    		if(randomKey!= "null"){
    			$("#defaultOpen3").click();
    		}
	
    	}); --%>
    	</script>
    	
    	<script>
      	 /* (이메일) 인증번호 발송 버튼 클릭시 */
      	 $("#email_send").click(function(){
      		var email = document.getElementById("email"); // 이메일
      		
            // 6) 이메일 유효성검사
            //mail이 입력되었는지 확인하기
             var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
               if (!emailRegExp.test(email.value)) {
                   alert("이메일 형식이 올바르지 않습니다!");
                   form.email.value = "";
                   form.email.focus();
                   return false;
                }
               
           $.ajax({
        	   url:"email.e",
        	   data:{Email:email.value},
        	   success:function(data){
        		   alert("인증번호가 발송되었습니다.");
        		   console.log(data);
        		   randomKey = data;
        	   },error:function(){
        		   alert("이메일발송실패");
        	   }
           })    
       
      	 });
    	</script>
    	
    	<script> /* "인증번호 완료" 버튼 클릭시 -> ramdom키와 사용자입력키(identify)와 비교 */
    	 function check(){
                	
                var Identi = document.getElementById("identify");
                
                
    			var username = $("#userName").val();
    			var Birthday = $("#birthday").val();
    		
    			var firstnumber = $("#firstnumber").val();
    			var phonenum = $("#verification").val();
    			var UserId = $("#userId").val();
    			var UserPwd = $("#userPwd1").val();
    			var email = $("#email").val();
    			
    			console.log(username);
    			if(randomKey != Identi.value){
                	alert("인증에 실패하였습니다.");
                	randomKey = "";
                	Identi.focus();
                	return false;
              	}else{
              		alert("인증 성공하였습니다.");
    				//$("#defaultOpen4").removeAttr("disabled").click();
              		var genderArray = document.getElementsByName("gender");
                    
                    for(var i=0; i<genderArray.length; i++){
          
                        if(genderArray[i].checked){
                          $("#gender2").val(genderArray[i].value);
                        }
                    }
    				$("#userName2").val(username);
    				$("#birthday2").val(Birthday);
    				$("#firstnumber2").val(firstnumber);
    				$("#verification2").val(phonenum);
    				$("#userId2").val(UserId);
    				$("#userPwd12").val(UserPwd);
    				$("#email2").val(email);
    				
    				$("#enroll_final").submit();
    				
              	
              	}
       	 	}
    	
    	
    	</script>
    	 
    	<!-- 
    	<script> /* "인증번호 완료" 버튼 클릭시*/
    	$("#ModifyandEnroll2").click(function(){
                	
                var Identi = document.getElementById("identify");
    		
    			if(randomKey.value != Identi.value){
                	alert("인증에 실패하였습니다.");
                	randomKey.value = "";
                	Identi.focus();
                	return false;
              }
    				alert("인증 성공하였습니다.");
    				$("#defaultOpen4").removeAttr("disabled").click();
    			  	//$("#defaultOpen4").click();	

       	 	});
    	
    	
    	</script>
    	 
    	 -->
    	 

    	
      
    
</body>
</html>