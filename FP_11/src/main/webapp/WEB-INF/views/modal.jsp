<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">    
    <title>Global Fandom Platform - Fanzy</title>
    <script type="text/javascript" src="../js/Main_recommend_button.js"></script>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/Main_recommend_button.css">
    
    <!-- jQuery 포함 (AJAX 요청을 위한) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 추천 아티스트 버튼 -->
<c:if test="${session_id != null}">
    <a>
        <div class="fixed-heart" id="openModalButton" onclick="openRecommendationModal()">
            <img src="/images/index_login/heart.png" alt="Heart" />
        </div>
    </a>
</c:if>

<!-- 추천 아티스트 모달 -->
<div id="recommendationModal" class="modal-recommend" style="display:none;">
    <div class="modal-recommend-content">
        <span id="recommend-close-btn"><i class="fa-solid fa-chevron-down"></i></span>
        <h2>추천 아티스트</h2>
        <div class="recommend-artist-list">
            <ul id="recommendation-list">
                <!-- 추천 아티스트 목록이 여기에 동적으로 추가됩니다. -->
            </ul>
        </div>
    </div>
</div>

<!-- JavaScript for handling modal and AJAX -->
<script type="text/javascript">
$(document).ready(function () {
    // 추천 아티스트 버튼 클릭 시 모달 열기
    $("#openModalButton").click(function (event) {
        event.preventDefault();  // 기본 제출 방지
        openRecommendationModal(); // 모달 열기
    });

    // ✅ 추천 모달 열기
    function openRecommendationModal() {
        const modal = document.getElementById('recommendationModal');
        if (!modal) {
            console.error("❌ recommendationModal을 찾을 수 없습니다!");
            return;
        }

        console.log("✅ 추천 모달 열기 실행됨!");
        
        // 모달을 표시
        modal.style.display = 'block';

        // 서버에서 추천 아티스트 목록을 받아오기
        $.ajax({
            url: "/modal",  // 추천 아티스트 목록을 요청할 서버 경로
            type: "GET",  // GET 방식으로 요청
            success: function(response) {
                console.log("서버 응답:", response);  // 서버 응답 확인

                // 받은 데이터를 모달에 표시
                if (response && Array.isArray(response)) {
                    displayRecommendedArtists(response); // 데이터가 배열이면 모달에 추가
                } else {
                    console.error("추천 아티스트 목록을 받지 못했습니다.");
                    alert("추천 아티스트 목록을 불러오는 데 문제가 발생했습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", error);
                alert("추천 아티스트를 불러오는 데 실패했습니다.");
            }
        });

        // 애니메이션 실행
        setTimeout(() => {
            modal.classList.add("show"); // 애니메이션 실행
            modal.classList.remove("closing"); // 혹시 남아있을 수도 있는 닫기 클래스 제거
        }, 10);
    }

 // ✅ 추천 아티스트 목록을 모달에 표시하는 함수
    function displayRecommendedArtists(recommendations) {
        const listContainer = $('#recommendation-list');
        listContainer.empty();  // 기존 목록 비우기

        // 추천 아티스트 목록을 순회하며 리스트 아이템 추가
        recommendations.forEach(function(artist) {
            console.log("추천 아티스트 데이터:", artist); // 데이터 확인

            const listItem = $('<li></li>').addClass('artist-item');  // 리스트 항목에 클래스 추가

            // <a> 태그로 이미지를 감싸서 링크 추가
            const artistLink = $('<a></a>').attr('href', '/artist?artist_no=' + artist.artist_no);  // 링크 추가

            // 이미지와 이름을 <a> 태그 안에 넣기
            const artistName = $('<p></p>').text(artist.name).addClass('modal-artist-name');
            const artistImage = $('<img>').attr('src', artist.imagePath).attr('alt', artist.name).addClass('artist-image');

            artistLink.append(artistName).append(artistImage);  // 이름을 위에, 이미지를 아래에 배치
            listItem.append(artistLink);  // 리스트 항목에 추가
            listContainer.append(listItem);  // 모달 목록에 추가
        });
    }

    // ✅ 추천 모달 닫기
    function closeRecommendationModal() {
        const modal = document.getElementById('recommendationModal');
        if (!modal) {
            console.error("❌ recommendationModal을 찾을 수 없습니다!");
            return;
        }

        console.log("✅ 추천 모달 닫기 실행됨!");

        modal.classList.remove("show"); // 열리는 상태 제거
        modal.classList.add("closing"); // 닫기 애니메이션 실행

        // 애니메이션이 끝난 후 display: none 적용
        setTimeout(function () {
            modal.style.display = 'none';
            modal.classList.remove("closing"); // 닫기 애니메이션 끝나면 초기화
        }, 400); // 애니메이션 시간(0.4초) 후 실행
    }

    // ✅ 닫기 버튼 클릭 이벤트 추가
    const closeButton = document.querySelector('#recommend-close-btn');
    if (!closeButton) {
        console.error("❌ 닫기 버튼 (#recommend-close-btn) 찾을 수 없음!");
        return;
    }

    // 닫기 버튼 클릭 시 모달 닫기
    closeButton.addEventListener("click", closeRecommendationModal);
});

</script>
</body>
</html>
