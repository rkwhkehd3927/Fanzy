<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/concert.css?v=Y" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Chat Application</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
	<link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <!-- 헤더 -->
 	<header>
        <div id="logo">
        	<a href="/"><img src="/images/index_login/logo.png" alt="Logo"></a>
        </div>
        <!-- nav_bar -->
        <nav>
            <ul>
                <li><a onclick="searchBtn()">
				    <i class="fa-solid fa-magnifying-glass"></i>
				    <div id="searchBox" style="display: none;">
				        <input style="position: absolute; top:-15px; right:20px;"  type="text" id="searchInput" placeholder="아티스트 검색" />
				        <div id="searchResults" style="display: none; position: absolute; top: 40px; left: -200px; background: white; border-radius: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); width: 200px; padding: 8px 15px;"></div>
				    </div>
				</a></li>
                <li><a onclick="openAlert()"><i style="font-size: 35px; position: relative; top: -5px;" class="fa-regular fa-envelope"></i></a></li>
                <li><a href="/mypage"><i class="fa-regular fa-user"></i></a></li>
                <li><a href="/user_setting"><i class="fa-solid fa-gear"></i></a></li>
                <li class="cart coin"><a><img src="/images/index_login/coin.png"></a></li>
                <li class="cart" style="position: relative; top:2px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
            </ul>
        </nav>
    </header>
    
    <!-- 전체 레이아웃 컨테이너 -->
    <div class="container">
        <!-- 동영상 영역 -->
        <div id="video-section">
            <!-- 실제 비디오를 넣을 수 있는 부분 -->
            <video controls>
		    <source src="videos/이세돌비디오.mp4" type="video/mp4"></video>
		    <h2 style="color: #fff;">Panorama(파노라마) - IZ*ONE(아이즈원) 이세계아이돌(ISEGYE IDOL) COVER｜왁타버스 뮤직 어워즈 2024</h2>
		    <!-- 사용자 수 표시 -->
		    <div id="userCount"><img src="images/사람.png" style="width: 25; height: 25; margin-right: 10px; filter: brightness(0) invert(1);">
		    <span style="padding-top: 10px; font-size: 28px; color: #fff;">${userCount}</span></div>
       </div>
        <!-- 채팅 영역 -->
        <div id="chat-section">
            <div id="chatHeader">채팅방
            <span style="color: red; padding-left: 200px;">
            	<img src="images/사이렌.png" style="width: 30px; height: 30px; "> <button onclick="reportBadWord()">신고하기</button></span></div>
	            <div id="chat">
	                <!-- 채팅 메시지가 표시될 영역 -->
	            </div>
            <input type="text" id="messageInput" placeholder="채팅 입력.." disabled />
            <button onclick="sendMessage()" disabled>전송</button>
        </div>
	
    </div>



    <script>
        let stompClient = null;
        let currentRoomId = "1234";  // 방 번호를 여기 고정 또는 동적으로 설정할 수 있습니다.

        // WebSocket 연결을 위한 설정 (페이지 로드 시 바로 연결)
        function connectSocket() {
            const socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);

            stompClient.connect({}, function (frame) {
                console.log('Connected');
                
                // userCount 업데이트를 위해 구독
                stompClient.subscribe('/topic/userCount', function (message) {
                    let userCount = message.body;  // 서버에서 전달한 사용자 수
                    // 사용자 수 업데이트 (HTML에 표시)
                    document.getElementById("userCount").innerHTML = 
                        '<img src="images/사람.png" style="width: 25px; height: 25px; margin-right: 10px; filter: brightness(0) invert(1);"> ' + 
                        '<span style="font-size: 28px; color: #fff;">' + userCount + '</span>';
                });

                // 채팅 메시지 구독
                stompClient.subscribe('/topic/rooms/' + currentRoomId, function (message) {
                    const chatMessage = JSON.parse(message.body);
                    const chatDiv = document.getElementById('chat');
                    const newMessage = document.createElement('div');
                    newMessage.textContent = chatMessage.sender + ": " + chatMessage.content;
                    const sessionId = '${session_nickname}'; // 실제 세션 ID
                    if (chatMessage.sender === sessionId) {
                        newMessage.classList.add("sent-message"); // 자신의 메시지 스타일 적용
                    } else {
                        newMessage.classList.add("received-message"); // 다른 사람의 메시지 스타일
                    }
                    chatDiv.appendChild(newMessage);
                    // 채팅 기록을 sessionStorage에 저장 (새로고침 후에도 유지)
                    saveChatHistory(chatMessage.sender + ": " + chatMessage.content);
                    
                    // 스크롤 가장 아래로 이동
                    chatDiv.scrollTop = chatDiv.scrollHeight;
                });

                // 2초 동안 채팅창 잠금 (새로운 사용자에게만 적용)
                if (!sessionStorage.getItem("hasEntered")) {
                    sessionStorage.setItem("hasEntered", "true"); // 새로운 사용자가 들어왔음을 기록
                    setTimeout(function() {
                        document.getElementById('messageInput').disabled = false; // 채팅창 활성화
                        document.querySelector('button[onclick="sendMessage()"]').disabled = false; // 보내기 버튼 활성화
                        // 페이지 새로 고침
                        location.reload(); // 새로 고침
                    }, 2000); // 2초 후 새로 고침
                } else {
                    // 이미 들어온 사용자라면 바로 채팅창 활성화
                    document.getElementById('messageInput').disabled = false;
                    document.querySelector('button[onclick="sendMessage()"]').disabled = false;
                }
            });
        }

        // 채팅 기록을 sessionStorage에 저장하는 함수
        function saveChatHistory(message) {
            let chatHistory = JSON.parse(sessionStorage.getItem("chatHistory")) || [];
            chatHistory.push(message);
            sessionStorage.setItem("chatHistory", JSON.stringify(chatHistory));
        }

        // 페이지 로드 시 기존 채팅 기록 불러오기
        function loadChatHistory() {
            let chatHistory = JSON.parse(sessionStorage.getItem("chatHistory")) || [];
            const chatDiv = document.getElementById('chat');
            chatHistory.forEach(msg => {
                const newMessage = document.createElement('div');
                newMessage.textContent = msg;
                chatDiv.appendChild(newMessage);
            });
            // 스크롤 가장 아래로 이동
            chatDiv.scrollTop = chatDiv.scrollHeight;
        }

        // 메시지 보내기
        function sendMessage() {
            const messageInput = document.getElementById('messageInput');
            const messageContent = messageInput.value.trim();

            if (!messageContent || !currentRoomId) {
                return;
            }

            const message = {
                sender: '${session_nickname}', // 실제 사용자 이름을 여기 넣을 수 있음
                content: messageContent,
                type: 'CHAT'
            };

            stompClient.send('/app/chat/' + currentRoomId, {}, JSON.stringify(message));
            messageInput.value = ''; // 입력 필드 초기화
        }

        // 엔터 키로 메시지 전송
        document.getElementById('messageInput').addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
                sendMessage(); // 엔터 키가 눌렸을 때 메시지 전송
            }
        });
        // 페이지가 로드되면 자동으로 WebSocket 연결 및 기존 채팅 기록 로드
        window.onload = function() {
            connectSocket();  // WebSocket 연결 시작
            loadChatHistory(); // 기존 채팅 기록 로드
        };
     // 신고하기 버튼 클릭 시 실행되는 함수
	function reportBadWord() {
	    const badWord = prompt("신고할 욕설을 입력하세요: "); // 신고할 단어 입력 받기
	    if (badWord) {
	        // 서버에 신고된 단어를 전송하여 필터링 목록에 추가
	        fetch('/reportBadWord', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'  // JSON 형식으로 데이터 전송
	            },
	            body: JSON.stringify({ word: badWord })  // JSON 데이터로 변환하여 전송
	        })
	        .then(response => response.json())
	        .then(data => {
	        	alert(data.message);  // 서버에서 전달한 메시지를 alert로 표시
	        })
	        .catch(error => {
	            alert("신고 처리에 실패했습니다.");
	            console.error('Error:', error);  // 오류 출력
	        });
	    }
	}

    </script>
</body>
</html>
