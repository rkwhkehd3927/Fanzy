<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 상세보기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

/* ===== 기본 스타일 ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Noto Sans KR', sans-serif;
}

body {
    background-color: #121212;
    color: white;
    text-align: center;
}

/* ===== 네비게이션 바 ===== */
.navbar {
    width: 100%;
    background: #121212;
    padding: 8px 20px 15px 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.logo{
	box-sizing: border-box;
	}

.logo p{
	font-weight: bolder;
	color: #fff !important;
	font-size: 40px;
	text-align: left;
	margin-top: 10px;
	position: absolute;
	left: 180px;
}

.logo img {
    width: 10.5%;
    margin-left: 20px;
    float: left; /* 왼쪽 정렬 */
}


.navbar .logo a {
    text-decoration: none;
    color: inherit;
}

.navbar .menu {
    margin-right: 40px;
    display: flex;
    gap: 15px;
}

.menu a, .menu button {
    text-decoration: none;
    font-size: 1rem;
    background: none;
    border: none;
    cursor: pointer;
    font-family: inherit;
    color: #ff9a9e ;
}

/* ===== 메인 컨텐츠 ===== */
.section {
    max-width: 1200px;
    margin: 0 auto;
    text-align: center;
}

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    position: relative;
}

/* 메인 이미지 섹션 */
.main-image {
    position: relative;
    display: inline-block;
    width: 100%;
    max-width: 1000px;
}

.main-image img {
    width: 100%;
    border-radius: 10px;
    display: block;
}

/* 이미지 내부 ONF 문구 */
.group-text {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    font-size: 76px;
    font-weight: bold;
    color: white;
    text-shadow: 4px 4px 10px rgba(0, 0, 0, 0.9);
    padding: 5px 15px;
    border-radius: 8px;
    width:100%;
    z-index: 50;
}

/* 그라데이션 효과 */
.image::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 30%;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0));
    border-radius: 10px;
}

/* ===== 프로필 섹션 ===== */
.profile-section {
    text-align: left;
    margin-top: 40px;
}

.profile-images {
    display: flex;
    gap: 15px;
    justify-content: center;
    justify-content: flex-start; /* ← 왼쪽 정렬 */
    flex-wrap: nowrap;
    overflow-x: auto;
    padding-bottom: 10px;
}

.profile-item {
    display: flex;
    width: 120px;
    flex-direction: column;
    align-items: center;
    text-align: center;
    overflow: hidden;
}

.imageview {
    width: 120px;
    height: 120px;
    overflow: hidden; /* ✅ 넘치는 부분 숨기기 */
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 30px; /* ✅ 부모도 둥글게 */
    position: relative;
}

.profile-item img {
    width: 120px;
    height: 120px;
    border-radius: 30px;
    object-fit: cover;
    transition: transform 0.3s ease-in-out; /* ✅ 부드러운 애니메이션 */
    transform-origin: center; /* ✅ 확대 시 중앙을 기준으로 */
}

.imageview:hover img {
    transform: scale(1.1); /* ✅ hover 시 1.1배 확대 */
}


.profile-item p {
    margin-top: 5px;
    font-size: 12px;
    font-weight: bold;
    color: white;
}

/* ===== 미디어 섹션 ===== */
.media-section {
    text-align: left;
    margin-top: 50px;
    margin-bottom: 70px;
}

.media-videos {
    display: flex;
    gap: 15px;
}

.media-video {
    display: inline-block;
    text-align: center;
    width: 280px; height: 150px;
    overflow: hidden;
    border-radius: 15px;
    margin-bottom: 10px;
}

.media-video img {
    width: 100%;
    height: 150px;
    transition: transform 0.3s ease-in-out;
    display: inline-block; /* 변경 */
    
    
}

.media-video:hover img {
    transform: scale(1.1);
}	

.media-texts {
    display: flex;
    gap: 15px;
}

.media-text {
    display: inline-block;
     display: -webkit-box;
    -webkit-line-clamp: 2; /* ✅ 최대 2줄까지만 표시 */
    -webkit-box-orient: vertical;
    text-align: center;
    width: 280px; height: 30px;
    overflow: hidden;
    white-space: normal; /* ✅ 줄바꿈 허용 */
    min-height: 45px; /* ✅ 최소 높이 지정 (줄바꿈 방지) */
}

.community-button {
  position: fixed;
  bottom: 20px;
  right: 45%;
  background-color: #ffffff;
  padding: 10px 20px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  text-decoration: none;
  font-size: 30px;
  border-radius: 100px;
  box-shadow: 0 10px 60px 0 #000c;
  color: #000;
  display: inline-block;
  font-size: 18px;
  font-weight: 700;
  line-height: 31px;
  cursor: pointer;
}
.community-button a {
  color: inherit;
  text-decoration: none;
}
   /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
    }
    .modal-content {
        background: white;
        width: 500px;
        height: 200px;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        overflow-y: auto;
        max-height: 80vh;
    }
    .modal-content textarea {
        display: block;
        width: 90%;
        height: 72%;
        resize: none;
        font-size: 16px;
        margin: 0 auto;
    }
    .modal-footer {
        display: flex;
        justify-content: space-between;
        margin-top: 10px;
    }
    .close-btn, .submit-btn {
        padding: 10px 15px;
        border: none;
        cursor: pointer;
        font-size: 14px;
        border-radius: 5px;
    }
    .close-btn { background: #ccc; }
    .submit-btn { background: #007bff; color: white; }
    .modal-header {
        position: sticky;
        top: 0;
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 15px;
        background-color: white;
        border-bottom: 1px solid #ddd;
        z-index: 1000;
    }
    
    .main-image::after {
    content: ""; /* 가상 요소 추가 */
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 40%; /* 원하는 높이 조정 */
    background: linear-gradient(to top, rgba(18, 18, 18, 1), rgba(18, 18, 18, 0)); /* ✅ #121212 기반 그라데이션 */
    pointer-events: none; /* 클릭 방해 안 되게 */
    border-radius: 10px;
    }
    
    .desc{
    color: #fff;
    font-size: 15px;
    line-height: 21px;
    margin: auto;
    white-space: pre-line;
    width: 450px;
    }


.see {
    border: 2px solid #fff !important;
    border-radius: 23px !important;
    color: #fff !important;
    font-size: 14px !important;
    font-weight: 700 !important;
    padding: 10px 21px 11px !important;
    background: none !important;
}

.see a {
    text-decoration: none;  
    color: inherit;         
}



</style>
</head>
<body>
    <!-- 네비게이션 바 -->
    <div class="navbar">
        <div class="logo"><a href="/"><img src="/images/index_login/logoPink.png"><p>${adto.artist_group_name}</p></a></div>
        <div class="menu">
            <button onclick="location.href='#'">sign</button>
            <button onclick="location.href='#'">알림</button>
            <button onclick="location.href='#'">스토어</button>
        </div>
    </div>
    
<div class = section>
    <!-- 메인 이미지 섹션 -->
    <div class="container">
        <div class="main-image">
            <img src="images/${adto.artist_cover_image}" alt="ONF 그룹 사진">
            <div class="group-text">${adto.artist_group_name}</div> <!-- 이미지 내부 텍스트 -->
        </div>
        	<div class="desc">
	            <p>${fn:replace(adto.artist_desc, "\\n", "<br>")}</p>
	        	<button class="see">아티스트 정보</button>
        	</div>
        
<br>
<br>

        <!-- 프로필 섹션 -->
   <div class="profile-section">
    <h2 style="text-align: left;">프로필</h2>
    <br>
    <div class="profile-images" style="display:flex;">  
    	<c:forEach items="${list}" var="amdto">
		    <div class="profile-item" style="width: 120px; overflow: hidden; margin-right: 10px;">
		        <a href="#">
		            <div class="imageview">
		                <img src="images/${amdto.artistmember_image}" alt="멤버">
		            </div>
		        </a>
		        <p>${amdto.artistmember_name}</p>
		    </div>
		</c:forEach>

        
        <!-- 
        <div class="profile-item" style="width : 100px; overflow:hidden; margin-right: 10px; ">
            <a href="#"><img src="images/현빈.jpeg" alt="멤버1" style="width : 100px; border-radius: 30px;"></a>
            <p>현빈</p>
        </div>
        <div class="profile-item" style="width : 100px; overflow:hidden; margin-right: 10px; ">
            <a href="#"><img src="images/진혁.jpeg" alt="멤버2" style="width : 100px; border-radius: 30px;"></a>
            <p>진혁</p>
        </div>
        <div class="profile-item" style="width : 100px; overflow:hidden; margin-right: 10px;">
           <a href="#"><img src="images/윤.jpeg" alt="멤버3" style="width : 100px; border-radius: 30px;"></a>
            <p>윤</p>
        </div>
        <div class="profile-item" style="width : 100px; overflow:hidden; margin-right: 10px;">
            <a href="#"><img src="images/연우.jpeg" alt="멤버4" style="width : 100px; border-radius: 30px;"></a>
            <p>연우</p>
        </div>
        <div class="profile-item" style="width : 100px; overflow:hidden; margin-right: 10px;">
            <a href="#"><img src="images/시윤.jpeg" alt="멤버5" style="width : 100px; border-radius: 30px;"></a>
            <p>시윤</p>
        </div>
         -->
    </div>
</div>

<br>
<br>
		<!-- 공지사항 -->
   		<div class="media-section">
		    <h2 style="text-align: left;">공지사항</h2>
		    <br>
		    <c:forEach var="notice" items="${ndto}" begin="0" end="2">
	            <div class="see" style="width:100%;">
	            	<a href="/noticelist?page=0&artistNo=${adto.artist_no}">
	                <p>${notice.notice_title}</p>
	            	</a>
	            </div>
                <br>
		    </c:forEach>
		</div>
<br>
<br>

		<!-- 미디어 -->
	   	<div class="media-section">
		    <h2 style="text-align: left;">미디어</h2>
		    <br>
		   
			<div style="display: flex;">
			    <c:forEach var="media" items="${medilist}" begin="0" end="2">
			        <div style="display: flex; flex-direction: column; align-items: center;">
			            <div class="media-video">
			                 <a href="${media.media_content}"><img src="/images/${media.media_image}" alt="미디어1"></a>
			            </div>
			            <div class="media-text" style="text-align: center;">
			                <p>${media.media_title}</p>
			            </div>
			        </div>
			    </c:forEach>
			</div>
		</div>	

    </div>
</div>

<c:if test="${nicknameDto.artistDto.artist_no != adto.artist_no}">

<div class="community-button" onclick="openModal()">
  커뮤니티 바로가기
</div>
</c:if>
<c:if test="${nicknameDto.artistDto.artist_no == adto.artist_no}">
<a href="/fancommunity?artist_no=${adto.artist_no }">
<div class="community-button">
  커뮤니티 바로가기
</div>
</a>
</c:if>





<!-- <a href="/fancommunity?artist_no=${adto.artist_no}"></a> -->

	<div id="postModal" class="modal">
	    <div class="modal-content">
	        <form id="nicknameForm">
	            <textarea placeholder="사용하실 닉네임을 입력하세요..." name="nickname_name"></textarea>
	            <input type="hidden" name="artistDto.artist_no" value="${adto.artist_no}">
	            <input type="hidden" name="memberDto.member_nickname" value="${mdto.member_nickname}">
	            <div class="modal-footer">
	                <button type="button" class="close-btn" onclick="closeModal()">닫기</button>
	            </div>
	            <button type="button" class="submit-btn">등록</button>
	        </form>
	    </div>
	</div>

   <!-- 2번: 모달 창
   <div id="postModal" class="modal">
       <div class="modal-content">
           <form action="/nickname" method="post">
	           <textarea placeholder="사용하실 닉네임을 입력하세요..." name="nickname_name"></textarea>
	           <input type="hidden" name="artistDto.artist_no" value="${adto.artist_no}">
	           <input type="hidden" name="memberDto.member_nickname" value="${mdto.member_nickname}">
	           <div class="modal-footer">
	               <button type="button" class="close-btn" onclick="closeModal()">닫기</button>
		    	</div>
	            <button class="submit-btn">등록</button>
           </form>
        </div>
    </div>
    -->

<script>
    // 모달 열기
    function openModal() {
        var memberNickname = document.querySelector("input[name='memberDto.member_nickname']").value;

        if (!memberNickname || memberNickname.trim() === "") {
            alert("로그인이 필요합니다.");
            window.location.href = "/login"; // 로그인 페이지로 이동
            return;
        }
        document.getElementById("postModal").style.display = "flex";
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById("postModal").style.display = "none";
    }

    // 문서가 준비되었을 때
    $(document).ready(function () {
        // submit 버튼 클릭 이벤트 처리
        $(".submit-btn").click(function (event) {
            event.preventDefault(); // 기본 제출 방지

            var nickname = $("textarea[name='nickname_name']").val().trim();
            var artistNo = $("input[name='artistDto.artist_no']").val();
            var memberNickname = $("input[name='memberDto.member_nickname']").val();

            // 아티스트 추천을 위한 /recommend 요청
            $.ajax({
                url: "http://localhost:5001/recommend",  // Python 서버 URL
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    artistDto: { artist_no: artistNo }  // artist_no를 JSON으로 전송
                }),
                success: function (response) {
                    console.log("서버 응답:", response);
                    if (response && response.recommendations && Array.isArray(response.recommendations)) {
                        // 추천 아티스트 목록을 서버에 저장하기 위한 두 번째 AJAX 요청
                        saveRecommendedArtists(response.recommendations);

                        // 추천 아티스트 목록 저장 후, 닉네임을 서버로 보내는 AJAX 요청
                        if (nickname === "") {
                            alert("닉네임을 입력하세요!");
                            return;
                        }

                        // /nickname 요청 처리
                        $.ajax({
                            url: "/nickname",
                            type: "POST",
                            contentType: "application/json",
                            data: JSON.stringify({
                                nickname_name: nickname,
                                artistDto: { artist_no: artistNo },
                                memberDto: { member_nickname: memberNickname }
                            }),
                            success: function (response) {
                                if (response.success) {
                                    window.location.href = response.redirectUrl; // 팬 커뮤니티 이동
                                } else {
                                    alert(response.message);
                                }
                            },
                            error: function () {
                                alert("서버 오류 발생. 다시 시도해주세요.");
                            }
                        });
                    } else {
                        console.error("추천 아티스트 목록을 받지 못했습니다.");
                        alert("추천 아티스트 목록을 불러오는 데 문제가 발생했습니다.");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error("AJAX 요청 실패:", textStatus, errorThrown);
                    alert("추천 아티스트를 불러오는 데 실패했습니다.");
                }
            });
        });

        // 추천 아티스트 목록을 서버에 저장하는 AJAX 요청
        function saveRecommendedArtists(recommendations) {
            $.ajax({
                url: "/save-recommendations",  // 서버의 저장 API URL
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(recommendations),  // 추천 아티스트 목록을 JSON 형식으로 전송
                success: function(response) {
                    console.log("추천 아티스트 목록 저장 성공:", response);
                },
                error: function(xhr, status, error) {
                    console.error("추천 아티스트 목록 저장 실패:", error);
                }
            });
        }
    });
</script>
</body>
</html>
