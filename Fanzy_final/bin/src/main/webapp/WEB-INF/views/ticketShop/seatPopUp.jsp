<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>좌석 선택 페이지</title>
    <link rel="stylesheet" href="../css/ticket/seatPopUp.css">
    <script src="/socket.io/socket.io.js"></script>
  	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  	<script src="../js/ticket/seatPopUp.js"></script>
<!--     <script src="../js/ticket/tempStatic.js"></script> -->
</head>

<body>
	<%-- 세션 확인용 (추후 삭제) --%>
<%-- 	<%= request.getSession().getAttribute("session_id") %>  --%>
	<script>
		var sessionId = "<%= request.getSession().getAttribute("session_id") %>";
	
	    if (!sessionId || sessionId === "null") {
	        alert("재 로그인 필요");
	        window.close(); // 현재 창 닫기
	    }
	</script>
	<div class="header">
        <select class="date-select">
            <!-- 추가 날짜 및 시간 옵션 -->
            <c:forEach var="schedule" items="${schedules}">
		        <option value="${schedule.scheduleNo}"
		        	<c:if test="${schedule.scheduleNo == selectedScheduleNo}">selected</c:if>>
		            ${schedule.scheduleDate} ${schedule.scheduleStartTime}
		        </option>
		    </c:forEach>
		    
        </select>
	    <!-- 디버깅용: 데이터 확인 -->
		<%-- <p>콘서트 일정 개수: ${schedules.size()}</p>
		<c:forEach var="s" items="${schedules}">
		    <p>${s.scheduleNo} - ${s.scheduleDate} ${s.scheduleStartTime}</p>
		</c:forEach> --%>
        <div class="logo"></div> <!-- 로고 이미지 -->
    </div>
    <div class="popup" data-id="${saleConcertDto.saleConcertNo}">
        <div class="seat-selection"> <!-- container -->
            <h2>좌석 선택</h2>
			<button id="resetSelection" class="reset-button">좌석 선택 초기화</button>
            <div class="seat-map" id="seatMap">
                <!-- 좌석 미니맵 -->
<!--                 <div class="row">  -->
<!--                 	<div class="seat" data-seat="A1"></div>  -->
<!-- 	                <div class="seat" data-seat="A2"></div>  -->
<!--                 </div>  -->
        	</div>
        </div>	
        <div class="sidebar">

            <h3>좌석 등급</h3>
            <div class="seat-grades">
			    <p id="remaining-vip">VIP: 잔여 0석</p>
			    <p id="remaining-s">S: 잔여 0석</p>
			    <p id="remaining-r">R: 잔여 0석</p>
			    <p id="remaining-a">A: 잔여 0석</p>
			</div>
            
            <h3>선택한 좌석 수</h3>
            <div>
	          <p><span id="count">0</span></p>
	        </div>
            
            <h3>선택한 좌석 정보</h3>
            <div class="selected-seats">
                <p>선택한 좌석: <span id="selected-seats">없음</span></p>
            </div>
            
            <h3>총 금액</h3>
            <div>
	          <p><span id="total">0</span></p>
	        </div>
            <button class="nextStepBtn">다음 단계</button>
        </div>
    </div>
    
</body>
</html>