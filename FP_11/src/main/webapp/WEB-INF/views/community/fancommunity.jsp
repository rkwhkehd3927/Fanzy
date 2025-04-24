<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/modal.jsp" %> <!-- 모달 HTML 코드 포함 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="/css/Main_recommend_button.css">
    <script type="text/javascript" src="../js/Main_recommend_button.js"></script>   
    <title>슬라이드 게시글</title>
<style>
    /* 기본 스타일 */
      body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }
    .post-box, .post-input {
        display: flex;
        align-items: center;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 20px;
        width: 700px;
    }
    .post-box img, .post-header img, .profile-img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
    }
    .profile-img { width: 30px; height: 30px; }
    input[type="text"] {
        flex: 1;
        border: none;
        outline: none;
        font-size: 14px;
    }
    .file-buttons {
        display: flex;
        gap: 10px;
    }
    .file-buttons img {
        width: 32px;
        height: 32px;
        cursor: pointer;
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
        width: 700px;
        height: 500px;
        padding: 0 20px 20px 20px;
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
/* 네비게이션 스타일 */
.navbar {
    width: 100%;
    background: white;
    padding: 15px 20px;
    display: flex;
    justify-content: center; /* 가운데 정렬 */
    align-items: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.nav-bar { 
    background: linear-gradient(134deg, #ff9a9e 54.07%, #fad0c4 99.24%);
    padding: 10px 0; 
}

.navbar .logo {
    font-size: 1.5rem;
    font-weight: bold;
}



.nav-menu {
    display: flex;
    justify-content: center;
    align-items: center;
    list-style: none;
    padding: 0;
    margin: 0;
    height: 30px;
}

.nav-item { margin: 0 30px; } /* 너무 넓었던 간격 줄임 */

.menu a, .menu button, .nav-link {
    text-decoration: none;
    font-size: 1rem;
    background: none;
    border: none;
    cursor: pointer;
    font-family: inherit;
}

.nav-link {
    color: white !important;
    font-weight: 600;
    padding: 5px 10px;
    position: relative;
}

.nav-link:hover { color: lightgray !important; }

    /* 레이아웃 스타일 */
    .container {
        display: flex;
        max-width: 1200px;
        margin: 20px auto;
        gap: 20px;
    }
    .feed, .sidebar {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
    }
    .feed { flex: 2; }
    .sidebar {
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    .image-container {
        position: relative;
        display: inline-block;
        width: 350px;
    }
    .image-text {
    	width: 300px;
        position: absolute;
        top: 82%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-size: 40px;
        font-weight: bold;
        padding: 5px 10px;
        text-align: center;
        z-index: 50;
    }
    .img-fluid {
        width: 350px;
        height: 300px;
        border-radius: 5px;
    }
    .image-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        justify-content: center;
    }
    .post-item {
        display: flex;
        flex-direction: column;
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }
    .post-header {
    	
        display: flex;
        align-items: center;
        margin-bottom: 5px;
    }
    .username {
        font-weight: bold;
        font-size: 16px;
        margin-right: 5px;
    }
    .timestamp {
        font-size: 12px;
        color: gray;
    }
    .post-content {
        text-align: left;
        font-size: 14px;
        margin-top: 5px;
    }
    .comment-icons {
        display: flex;
        gap: 10px;
        margin-top: 10px;
        color: gray;
        cursor: pointer;
    }
    .comment-icons i { font-size: 16px; }
    .detail-image {
        width: calc(33.33% - 10px);
        max-width: 200px;
        display: block;
        margin: 10px 0;
        align-self: flex-start;
        border-radius: 10px;
    }
    
    
    
    /* 구분선 스타일 */
.section-divider {
    margin: 20px 0;
    border: none;
    border-top: 1px solid #ddd;  /* 연한 회색 실선 */
}

/* 댓글 영역 */
.comment-section {
    margin-top: 20px;
}

/* 댓글 헤더 (N개의 댓글) */
.comment-header {
    font-weight: bold;
    margin-bottom: 10px;
}

/* 댓글 목록의 각 아이템 */
.comment-item {
    display: flex;
    align-items: flex-start;
    margin-bottom: 15px;
}

/* 프로필 이미지 */
.comment-profile {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}

/* 댓글 내용 박스 */
.comment-content {
    background-color: #f7f7f7;
    padding: 10px;
    border-radius: 10px;
    max-width: 80%;
    
}

/* 댓글 작성자 */
.comment-username {
    font-weight: bold;
    text-align: left; 
}

/* 댓글 작성 시간 */
.comment-timestamp {
    font-size: 12px;
    color: gray;
    margin-bottom: 5px;
    text-align: left; 
}

/* 댓글 본문 */
.comment-text {
    margin-top: 5px;
    text-align: left; /* 왼쪽 정렬 */
}

/* 댓글 입력 박스 */
.comment-input-box {
    display: flex;
    align-items: center;
    margin-top: 10px;
}

/* 댓글 입력창 */
.comment-input {
    flex: 1;
    padding: 8px;
    font-size: 14px;
    border-radius: 10px;
    border: 1px solid #ccc;
    outline: none;
}

/* 댓글 등록 버튼 */
.comment-submit {
    margin-left: 10px;
    padding: 8px 12px;
    font-size: 14px;
    background-color: #007bff;
    border: none;
    border-radius: 10px;
    color: #fff;
    cursor: pointer;
}
.comment-submit:hover {
    background-color: #0056b3;
}

/* 드롭다운 컨테이너 */
.dropdown {
    position: relative;
    display: inline-block; /* 혹은 block, 상황에 맞게 조정 */
}

/* 드롭다운 버튼 스타일 */
.menu-btn {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 18px;
}

/* 드롭다운 내용 (처음엔 숨김) */
.dropdown-content {
    display: none;
    position: absolute;
    right: 0; /* 오른쪽 정렬 */
    background-color: #fff;
    min-width: 100px;
    border: 1px solid #ccc;
    border-radius: 5px;
    z-index: 999;
    text-align: left;
    box-shadow: 0 2px 5px rgba(0,0,0,0.15);
}

/* 드롭다운 내부 아이템 */
.menu-item {
    padding: 10px;
    cursor: pointer;
}
.menu-item:hover {
    background-color: #f0f0f0;
}

.comment-header {
    display: flex;
    align-items: center;
    
}

.comment-username {
    /* 원하는 스타일 적용 */
}

.comment-options {
    /* 옵션 영역 스타일 */
}

.like-icon {
    width: 24px;   /* 원하는 너비 */
    height: 24px;  /* 원하는 높이 */
    cursor: pointer;  /* 클릭 가능하게 보이도록 포인터 커서 추가 (선택 사항) */
}
#commentListContainer {
    height: 200px;
    overflow-y: auto;
    border: 1px solid #ddd; /* 선택사항: 테두리 추가 */
    padding: 10px;          /* 선택사항: 내부 여백 */
}
</style>

<style>
@charset "UTF-8";

a{color: inherit; text-decoration: none; cursor: pointer;}
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    background-color: #ffffff;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    position: sticky; /* 스크롤 시 헤더 고정 */
    top: 0; /* 화면 상단에 고정 */
    z-index: 1000; /* 다른 요소들이 헤더 뒤로 가도록 설정 */
    padding-bottom: 0;
}


.mama {
    list-style: none;
    display: flex;
    gap: 20px;
}

.mama li:nth-child(2) {
    margin-top: 4px;
}


.sign_in {
    cursor: pointer;
    background: linear-gradient(134deg, #ff9a9e 54.07%, #fad0c4 99.24%);
    border-radius: 100px;
    border: none;
    color: #fff;
    font-size: 15px;
    font-weight: 700;
    line-height: 18px;
    padding: 8px 20px 10px 22px;
    margin-right: 4px;
    width: auto; /* 너비를 자동으로 설정 */
    min-width: 95px; /* 최소 너비를 설정 */
}


#logo img {
    width: 10%;  /* 부모 요소의 너비에 맞게 확장 */
    position: relative;
    height: 10%;  /* 부모 요소의 높이에 맞게 확장 */
    margin-left: 20px;
    top: -8px;
    object-fit: contain; /* 이미지 비율을 유지하며 꽉 차게 */
}


.fa-solid, .fa-regular{
	font-size: 30px;
	padding-right: 20px;
}
.fa-cart-shopping {
	position: relative;
    font-size: 25px;
    color: #FFCCCC;
    padding-right: 20px;
}

#holy ul li a {
    text-decoration: none;
    color: #333;
}

#holy ul li {
  position: relative;
}

#holy ul li:nth-last-child(3) {
  border-right: 1px solid #ccc; /* 회색 실선 */
  padding-right: 15px; /* 아이콘과 선 사이에 여백 추가 */
  margin-right: 15px; /* 아이콘들 간의 여백 */
  position: relative;
}

/* 회색 동그라미 효과 */
#holy ul li a {
    position: relative; /* 가상 요소를 위해 상대적 위치 설정 */
}

#holy ul li a::before {
    content: '';
    position: absolute;
    top: 38%;
    left: 31%;
    width: 60px;  /* 동그라미 크기 */
    height: 60px;
    background-color: rgba(204, 204, 204, 0.2);  /* 회색 동그라미, 투명도 20% */
    border-radius: 50%;  /* 예쁜 동그라미 모양 */
    transform: translate(-50%, -50%);  /* 중앙 정렬 */
    opacity: 0;  /* 기본적으로 숨겨놓기 */
    transition: opacity 0.3s ease;  /* 부드럽게 나타나게 하기 */
}
/* 첫 번째 아이콘 */
#holy ul li:nth-child(1) a::before,
#holy ul li:nth-child(3) a::before,
#holy ul li:nth-child(4) a::before {
    top: 31%;  /* 첫 번째 아이콘의 위치 */
    left: 29%;  /* 첫 번째 아이콘의 위치 */
}

.cart a::before {
    top: 20% !important; 
}

.cart img{
	position: relative;
	right: 10px;
	top: -5px;
	width: 40px;
}


/* 두 번째 아이콘 */
#holy ul li:nth-child(2) a::before {
    top: -28%;  /* 두 번째 아이콘의 위치 */
    left: 31%;  /* 두 번째 아이콘의 위치 */
}

#holy ul li:nth-child(6) a::before {
    top: 30% !important;
    left: 31%;
}

.coin a::before {
    top: -60% !important; 
    left: 26% !important;
}


/* 호버 시 동그라미 나타나기 */
#holy ul li a:hover::before {
    opacity: 1;  /* 마우스를 올리면 동그라미가 보이게 */
}

/* sign_in 버튼은 동그라미 효과를 제외 */
.sign_in:hover {
    background-color: transparent;
    box-shadow: none;
}

/* .no-hover 클래스가 있을 때, nav ul li a::before의 hover 효과를 비활성화 */
.no-hover:hover::before {
    content: none; /* hover 시에 가상 요소를 제거하거나 비활성화 */
}



/* 배너 */
.banner {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    background: linear-gradient(134deg, #ff9a9e 54.07%, #fad0c4 99.24%);
    color: white;
    font-size: 18px;
}


/* 커뮤니티 슬라이드 */
.event-container {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    max-width: 1110px;
    margin: auto;
}

.event {
    width: 100%;
    max-width: 1110px;
    overflow: hidden;
    padding: 20px 0;
    position: relative;
}

.event-wrapper {
    display: flex;
    transition: transform 0.5s ease-in-out;
    will-change: transform;
}

.event-card {
    width: 535px; /* 카드 너비 */
    height: 295px;
    flex-shrink: 0;
    margin-right: 30px; /* 간격 추가 */
    background-color: #fff;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    position: relative;
}

.event-card img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.text-overlay {
    position: absolute;
    max-width: 100%; /* 또는 원하는 최대 너비 설정 */
    top: 50%;
    transform: translate(-50%, -50%);
    color: white;
    font-size: 22px;
    margin: 0 auto;
    text-align: left;
    padding: 10px;
    border-radius: 5px;
}

.text-overlay.long-text {
	position: absolute;
    left: 40%; /* 텍스트가 길어지면 왼쪽으로 밀어줌 */
}


/* 회색 실선 (전체 슬라이드 진행 범위) */
.progress-bar {
    position: absolute;
    left: 50%; /* 화면의 중앙에 위치하도록 */
    top:505px;
    transform: translateX(-50%); /* 정확히 중앙으로 정렬 */
    height: 3px;
    background-color: #f2f2f2;
    width: 200px; /* 실선 길이 */
}

/* 검정 실선 (현재 슬라이드 위치) */
.progress {
    position: absolute;
    height: 100%;
    background-color: black;
    width: 0%; /* 초기값은 0% */
    transition: width 0.5s ease; /* 슬라이드 이동할 때 부드럽게 이동 */
}



/* 🔹 슬라이드 버튼 (기본 상태: 그림자 없음) */
.slide-btn {
    background: rgba(255, 255, 255, 0.8);
    width: 50px;
    height: 50px;
    color: black;
    border: none;
    cursor: pointer;
    font-size: 20px;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    transition: all 0.3s ease-in-out;
    z-index: 10;
}

/* 🔹 기본 상태에서는 그림자 없음 */
.slide-btn {
    box-shadow: none;
}

/* 🔹 호버 시 그림자 적용 */
.slide-btn:hover {
    box-shadow: 0 6px 15px rgba(255, 182, 193, 0.6); /* 연핑크 그림자 */
    transform: translateY(-50%);
}



/* 🔹 버튼 위치 유지 */
.prev-btn {
    left: -50px;
}

.next-btn {
    right: -50px;
}





/* 공지사항 */
.notice {
  position: relative; /* 상대적 위치 지정 */
  height: 150px;
  padding: 15px;
  margin: 0 350px;
  border-radius: 5px;
  display: flex;
  flex-direction: column-reverse; /* 텍스트 위, 이미지 아래 */
  justify-content: space-between;
  align-items: center;
  padding-top: 30px;
  margin-bottom: 30px;
}

.notice img {
  width: 1100px;
  height: 130px;
  object-fit: cover; /* 이미지가 영역에 맞게 잘림 */
}

.notice div {
  position: absolute;
  top: 55%;
  left: 58%;
  transform: translate(-50%, -50%);
  text-align: left;
  font-size: 18px;
  font-weight: bold;
  color: black;
  line-height: 1.6;
  width: 90%;
}

.notice h3, .notice p {
  color: #333;
  margin: 0; /* 기본 마진 제거 */
  padding: 0; /* 기본 패딩 제거 */
  line-height: 2; /* 줄 간격 */
}

.notice p{color: #666;}

#searchWrapper {
    display: none; /* 기본적으로 검색창 숨김 */
    position: absolute; /* 위치를 절대값으로 설정 */
    top: 50%; /* 화면 가운데 배치 */
    left: 50%;
    transform: translate(-50%, -50%);
}

#searchInput {
    background-color: #f4f6f8; /* 연한 회색 배경 */
    border: none; /* 보더 제거 */
    border-radius: 20px; /* 각을 살짝 둥글게 */
    padding: 8px 15px; /* 적당한 여백 */
    font-size: 14px; /* 글자 크기 */
    width: 200px; /* 너비 설정 */
    height:30px;
    outline: none; /* 포커스 시 테두리 없애기 */
}

#searchInput:focus {
    background-color: #f4f6f8; /* 포커스 시 배경색 변화 */
}

/*------------------------------------------------------------------------------------------------------------*/
/* 나의 커뮤니티 */
.myCommunity {
    width: 100%;
    margin: auto;
    margin-bottom: 30px;
    margin-top: 50px;
    padding-top: 20px;
    padding-bottom: 20px;
    background: #F8F9FA;
}

.myC {
    padding: 0 40px;
    padding-top: 20px;
    width: 60%;
    margin: auto;
}

.myC h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

.community-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    overflow-x: hidden;
    justify-content: flex-start;
    height: 250px;
}

/* 카드 스타일 */
.community-container .artist-card {
    width: 200px;
    height: 230px; /* 💡 높이 고정 */
    border-radius: 30px;
    background-color: white;
    text-align: center;
    font-size: 1rem;
    font-weight: bold;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    overflow: hidden;
    transition: box-shadow 0.3s ease;
    position: relative;
}

/* 이미지 스타일 */
.community-container .artist-card img {
    width: 100%;
    height: 160px; /* 💡 높이 고정 */
    object-fit: cover; /* 비율 유지하면서 채우기 */
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    transition: transform 0.3s ease, opacity 0.3s ease;
    position: relative;
    z-index: 1;
}

/* 아티스트 이름 */
.community-container .artist-name {
    width: 100%;
    height: 55px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    font-weight: bold;
    background-color: white;
    position: absolute;
    bottom: 0; /* 💡 아래쪽에 고정 */
    margin: 0 !important;
    padding-top: 22px !important;
}

.artist-name span {
    display: inline-block;
    width: 200px;
    padding-left: 100%; /* 처음엔 오른쪽에서 시작 */
    animation: marquee var(--duration, 15s) linear var(--iteration-count, infinite) var(--delay, 0.5s);
    animation-play-state: var(--play, running);
    animation-direction: var(--direction, normal);
    white-space: nowrap; /* 💡 무조건 한 줄 유지 */
}

/* 애니메이션 키프레임 */
@keyframes marquee {
    from {
        transform: translateX(0%);
    }
    to {
        transform: translateX(-100%);
    }
}

.logo{
	width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
    position: absolute;
    bottom: 45px; /* 아티스트 이름과 겹치지 않도록 조정 */
    left: 50%;
    transform: translateX(-50%);
    border: 3px solid white; /* 로고 테두리 추가 */
    background-color: white;
    z-index: 2; /* 아티스트 사진보다 위에 배치 */
}

/* 로고 내부 이미지 */
.logo img {
    width: 100% !important;
    height: 100% !important;
    object-fit: contain !important; /* 💡 이미지가 잘리지 않고 원 안에 들어가도록 설정 */
    border-radius: 50%;
}

/* 마우스 호버 효과 */
.community-container .artist-card:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* 이미지 확대 효과 줄이기 */
.community-container .artist-card:hover img {
    transform: scale(1.02); /* 살짝만 확대 */
}


/* 아티스트 이름 스타일 */
.community-container .artist-name {
    margin-bottom: 20px;
    font-size: 1.5rem;
    font-weight: bold;
    text-align: center;
    padding-top: 5px;
    position: relative;
    z-index: 1;
}

/* 반응형 스타일 */
@media (max-width: 768px) {
    .community-container .artist-card {
        width: 150px;
        height: 150px;
    }
    
    .community-container .artist-card img {
        width: 100%;
        height: 100%;
    }
}

/*------------------------------------------------------------------------------------------------------------*/
/* 상품 목록 */
.idolMerch {
    height: 40px;
    font-size: 15px;
    background-color: #f7f7fa;
    color: #555;
    padding: 10px;
    font-weight: normal;
    line-height: 20px;
    border-radius: 20px;
    display: inline-block;  /* 텍스트 길이에 맞게 width가 자동으로 조정되도록 함 */
    white-space: nowrap;    /* 텍스트가 줄 바꿈되지 않도록 함 */
    box-sizing: border-box;
    margin-bottom: 20px;
}

.selected {
    height: 40px;
    font-size: 15px;
    background: black;
    font-weight: bolder;
    color: white;
    padding: 10px;
    line-height: 20px;
    border-radius: 20px;
    display: inline-block;  /* 텍스트 길이에 맞게 width가 자동으로 조정되도록 함 */
    white-space: nowrap;    /* 텍스트가 줄 바꿈되지 않도록 함 */
    box-sizing: border-box;
    margin-bottom: 20px;
}

.merch {
    padding: 20px;
    width: 60%;
    margin: auto;
    margin-bottom: 30px;
}

.merch h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

.merch-container {
    display: flex;
    gap: 15px;
    overflow-x: hidden; /* 가로 스크롤 숨기기 */
    padding-bottom: 10px;
    justify-content: space-between;
}

.merch-item {
    flex: 0 0 auto;
    width: 240px;
    text-align: center;
}

.temBox {
    width: 220px;
    height: 250px;
    overflow: hidden; /* 이미지가 부모 div를 넘지 않도록 */
    position: relative;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
}

.merch-item img {
    width: 100%;
    height: 100%;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.merch-item img:hover {
    transform: scale(1.05); /* 이미지가 커지지만 부모 영역을 넘지 않음 */
}

.merch-title {
    font-size: 16px;
    margin-top: 20px;
}

.merch-price {
    font-size: 16px;
    font-weight: bold;
    color: #000;
    margin-top: 5px;
}

/*------------------------------------------------------------------------------------------------------------*/
/* 아티스트 배너 */
.artist-dm-section {
    padding: 20px;
    background: #F8F9FA;
    border-radius: 12px;
    padding-bottom: 50px;
    margin-top: 50px;
}

.dm-title {
    font-size: 16px;
    color: #000;
    padding-top: 30px;
    display: flex; /* Flexbox를 사용하여 이미지와 텍스트를 나란히 배치 */
    align-items: center; /* 수직 정렬 */
    width: 62%;
    margin: auto;
    margin-bottom: 20px;
}

.dm-icon {
    width: 30px;
    height: 30px;
    margin-right: 10px;
}

.dm-list {
    display: flex; /* grid 대신 flex 사용 */
    flex-wrap: wrap; /* 여러 줄 정렬 가능하도록 설정 */
    gap: 20px; /* 아이템 간 간격 */
    justify-content: flex-start; /* 왼쪽 정렬 */
    width: 65%;
    margin: auto;
}


/* dm-item 스타일 */
.dm-item {
    display: flex;
    height: 80px;
    align-items: center;
    background: white;
    border-radius: 50px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    font-size: 18px;
    font-weight: bold;
    color: #000;
    padding: 10px 30px 10px 15px;
    min-width: 180px; /* 최소 너비 */
    max-width: 500px; /* 너무 길어지지 않도록 제한 */
    flex-shrink: 0; /* 크기 유지 */
}
.art_name{
	font-weight: 200px;
	font-size: 22px;
}

/* 프로필 이미지 스타일 */
.dm-item img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-right: 20px;
    flex-shrink: 0;
}

/* 새로고침 버튼 스타일 */
.dm-item.refresh {
    width: 70px !important;
    height: 70px !important;
    min-width: 70px !important;
    min-height: 70px !important;
    background: #fff;
    border-radius: 50%;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0; /* 크기 유지 */
    padding: 0; /* 내부 패딩 제거 */
    margin-top: 15px;
}

.dm-item.refresh img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    margin: 0;
}

/* 반응형 */
@media (max-width: 768px) {
    .dm-list {
        justify-content: center;
    }

    .dm-item {
        width: 100px;
        height: 50px;
        font-size: 12px;
    }

    .dm-item img {
        width: 35px;
        height: 35px;
    }
}
/*------------------------------------------------------------------------------------------------------------*/
/* 아티스트 리스트 */
.artist-section {
    text-align: center;
    background: #F8F9FA;
}

.artist-section h2 {
    font-size: 1.5em;
    color: #000;
    padding-top: 30px;
    display: flex; /* Flexbox를 사용하여 이미지와 텍스트를 나란히 배치 */
    margin:auto;
    width: 60%;
}


.artist-table {
    border-collapse: separate;
    border-spacing: 40px;
    width: auto;
    margin: auto;
}

.artist-table td {
    width: 200px; /* 너비 설정 */
    height: 200px; /* 높이 설정 */
    border-radius: 30px;
    background-color: white;
    text-align: center;
    font-size: 1rem;
    font-weight: bold;
}

/* 카드 스타일 */
.artist-card {
    width: 100%;
    height: 230px; /* 카드 높이 유지 */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start; /* 위에서부터 요소 배치 */
    position: relative;
    overflow: hidden;
    border-radius: 30px;
    transition: box-shadow 0.3s ease;
}

/* 이미지 스타일 */
.artist-card img {
    width: 100%;
    height: 160px; /* 고정된 높이 설정 (기존 100% → 값 지정) */
    object-fit: cover;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    transition: transform 0.3s ease, opacity 0.3s ease;
    position: relative;
    z-index: 1; /* 이미지가 항상 위에 있도록 설정 */
}

/* 호버 효과 */
.artist-card:hover img {
    transform: scale(1.02); /* 너무 크게 확대되지 않도록 조절 */
    opacity: 0.95; /* 부드러운 효과 추가 */
    z-index: 1; /* z-index를 1로 유지하여 가려지는 문제 방지 */
}

/* 카드에 호버했을 때 그림자 효과 */
.artist-card:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    border-radius: 30px;
}


.artist-name {
	width: 100%; /* 💡 부모 너비를 고정 */
    margin-bottom: 10px;
    font-size: 1.5rem;
    font-weight: bold;
    text-align: center;
    padding-top: 25px;
    z-index: 1; /* 텍스트가 이미지 위로 오도록 설정 */
    overflow: hidden; /* 이미지가 부모 div를 넘지 않도록 */
    box-sizing: border-box;
}



@media (max-width: 768px) {
    .artist-table td {
        width: 150px; /* 작은 화면에서 크기를 줄임 */
        height: 150px;
    }

    .artist-card img {
        width: 100%;
        height: 100%;
    }
}

/* 반응형 디자인을 위한 미디어 쿼리 */
@media (max-width: 1024px) {
    .artist-section h2 {
        font-size: 18px; /* 글자 크기 조정 */
    }

    .artist-section h2 img {
        height: 25px; /* 이미지 크기 조정 */
        left: 4%; /* 화면 크기 작은 경우 위치 좀 더 조정 */
    }
}

@media (max-width: 768px) {
    .artist-section h2 {
        font-size: 16px; /* 글자 크기 조정 */
    }

    .artist-section h2 img {
        height: 20px; /* 이미지 크기 조정 */
        left: 3%; /* 화면 크기 더욱 작을 때 이미지 위치 조정 */
    }
}

/*------------------------------------------------------------------------------------------------------------*/
/* 하단 */
footer {
    background-color: #ddd;
    padding: 40px 0;
    font-size: 16px;
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

.footer-links {
    display: flex;
    justify-content: flex-start; /* 왼쪽 정렬 */
    gap: 30px;
    flex-wrap: wrap;
    margin-left: 300px; /* 왼쪽 여백 */
    margin-bottom: 20px;
}

.footer-links a {
    color: #444;
    text-decoration: none;
    font-size: 12px;
    transition: color 0.3s ease;
}

.footer-info {
    font-size: 10px;
    color: #8e8e8e;
    text-align: left; /* 왼쪽 정렬 */
    line-height: 18px;
    margin-left: 290px; /* 왼쪽 여백 */
}

.footer-info p {
    margin: 5px 0;
    padding-left: 10px; /* 왼쪽에 간격 추가 */
}

.footer-info .footer-gap {
    margin: 0 10px; /* 항목 간 간격 추가 */
}

@media (max-width: 1024px) {
    .footer-links,
    .footer-info {
        margin-left: 20px; /* 화면 크기에 맞춰 여백을 줄임 */
    }
}

@media (max-width: 768px) {
    .footer-links,
    .footer-info {
        margin-left: 10px; /* 더 작은 화면에서 여백을 더욱 줄임 */
    }
}

/*------------------------------------------------------------------------------------------------------------*/
/* 📌 반응형 스타일 */
@media (max-width: 768px) {
    .artist-section h2 {
        font-size: 16px;
        padding-left: 0; /* 작은 화면에서 왼쪽 패딩을 없애고 */
        text-align: center; /* 중앙 정렬 */
    }
}

@media (max-width: 1024px) {
    .event-card {
        width: 100%;
    }
    
    .event-wrapper {
        gap: 10px;
    }

    .event {
        max-width: 90%;
    }
}

@media (max-width: 768px) {
    header {
        flex-direction: column;
        align-items: center;
    }

    nav ul {
        flex-direction: column;
        gap: 10px;
        text-align: center;
    }

    .event {
        max-width: 100%;
        padding: 10px;
    }

    .event-wrapper {
        flex-wrap: wrap;
        justify-content: center;
    }

    .event-card {
        width: 90%;
        height: auto;
    }

    .banner {
        flex-direction: column;
        text-align: center;
    }

    .merch {
        flex-direction: column;
        align-items: center;
    }
}

@media (max-width: 480px) {
    .event-card {
        width: 100%;
    }

    .slide-btn {
        display: none;
    }

    .banner {
        font-size: 14px;
        padding: 15px;
    }

    .sign_in {
        font-size: 13px;
        padding: 6px 16px;
    }
}

#holy ul {
    list-style: none !important;
    display: flex !important;
    gap: 20px !important;
}

#holy ul li:nth-child(2) {
    margin-top: 4px !important;
}


.sign_in {
    cursor: pointer !important;
    background: linear-gradient(134deg, #ff9a9e 54.07%, #fad0c4 99.24%) !important;
    border-radius: 100px !important;
    border: none !important;
    color: #fff !important;
    font-size: 15px !important;
    font-weight: 700 !important;
    line-height: 18px !important;
    padding: 8px 20px 10px 22px !important;
    margin-right: 4px !important;
    width: auto !important; /* 너비를 자동으로 설정 */
    min-width: 95px !important; /* 최소 너비를 설정 */
}


#logo img {
    width: 9.9%;  /* 부모 요소의 너비에 맞게 확장 */
    position: relative;
    height: 10%;  /* 부모 요소의 높이에 맞게 확장 */
    margin-left: 20px;
    top: -8px;
    object-fit: contain; /* 이미지 비율을 유지하며 꽉 차게 */
}


.fa-solid, .fa-regular{
	font-size: 30px !important;
	padding-right: 20px !important;
}
.fa-cart-shopping {
	position: relative !important;
	top: 1px !important;
    font-size: 25px !important;
    color: #FFCCCC !important;
    padding-right: 20px !important;
}

#holy ul li a {
    text-decoration: none !important;
    color: #333;
}

#holy ul li {
  position: relative;
}

#holy ul li:nth-last-child(3) {
  border-right: 1px solid #ccc; /* 회색 실선 */
  padding-right: 15px; /* 아이콘과 선 사이에 여백 추가 */
  margin-right: 15px; /* 아이콘들 간의 여백 */
  position: relative;
}

/* 회색 동그라미 효과 */
#holy ul li a {
    position: relative; /* 가상 요소를 위해 상대적 위치 설정 */
}

#holy ul li a::before {
    content: '';
    position: absolute;
    top: 38%;
    left: 31%;
    width: 60px;  /* 동그라미 크기 */
    height: 60px;
    background-color: rgba(204, 204, 204, 0.2);  /* 회색 동그라미, 투명도 20% */
    border-radius: 50%;  /* 예쁜 동그라미 모양 */
    transform: translate(-50%, -50%);  /* 중앙 정렬 */
    opacity: 0;  /* 기본적으로 숨겨놓기 */
    transition: opacity 0.3s ease;  /* 부드럽게 나타나게 하기 */
}
/* 첫 번째 아이콘 */
#holy ul li:nth-child(1) a::before,
#holy ul li:nth-child(3) a::before,
#holy ul li:nth-child(4) a::before {
    top: 31%;  /* 첫 번째 아이콘의 위치 */
    left: 29%;  /* 첫 번째 아이콘의 위치 */
}

/* 두 번째 아이콘 */
#holy ul li:nth-child(2) a::before {
    top: -28%;  /* 두 번째 아이콘의 위치 */
    left: 31%;  /* 두 번째 아이콘의 위치 */
}

	

/* 호버 시 동그라미 나타나기 */
#holy ul li a:hover::before {
    opacity: 1;  /* 마우스를 올리면 동그라미가 보이게 */
}

/* sign_in 버튼은 동그라미 효과를 제외 */
.sign_in:hover {
    background-color: transparent;
    box-shadow: none;
}

/* .no-hover 클래스가 있을 때, #holy ul li a::before의 hover 효과를 비활성화 */
.no-hover:hover::before {
    content: none; /* hover 시에 가상 요소를 제거하거나 비활성화 */
}

/*------------------------------------------------------------------------------------------------------------*/
/* 추천 아티스트 */
.fixed-heart {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden; /* 이미지가 잘리지 않도록 영역 밖으로 벗어나지 않게 */
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: center; /* 가로 중앙 정렬 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 부드러운 그림자 */
    background: white;
}

.fixed-heart img {
    width: 60%; /* 부모 요소에 맞게 이미지 크기 조정 */
    height: 60%; /* 부모 요소에 맞게 이미지 크기 조정 */
    object-fit: cover; /* 이미지 비율 유지하며 영역에 맞추기 */
}
/*------------------------------------------------------------------------------------------------------------*/
/* 전체 스크롤바 */
::-webkit-scrollbar {
  width: 10px;
}

/* 스크롤바 트랙 (배경) */
::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

/* 스크롤바 핸들 (움직이는 부분) */
::-webkit-scrollbar-thumb {
  background: #d8d8d8;
  border-radius: 10px;
}

/* 스크롤바 핸들 hover 효과 */
::-webkit-scrollbar-thumb:hover {
  background: #898989;
}

/*------------------------------------------------------------------------------------------------------------*/
.image-container {
    position: relative;
    display: inline-block;
}

.image-container::after {
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

.rounded-box {
  width: 360px; /* 상자 너비 설정 */
  height: 140px; /* 상자 높이 설정 */
  background-color: #F7F7FA; /* 배경색 설정 */
  border-radius: 10px; /* 모서리 둥글기 설정 */
  padding: 20px; /* 내부 여백 설정 */
  box-sizing: border-box; /* 패딩, 테두리 포함 크기 설정 */
  display: flex; /* flexbox 레이아웃 사용 */
}
.rounded-box img {
  width: 22px; /* 너비를 자동으로 조정 */
  height: 22px; /* 원하는 높이로 설정 */
  margin-right: 4px; /* 이미지와 텍스트 사이 간격 */
}
.subscribe-button {
  margin-left: -24px; /* 원하는 만큼 음수 값 설정 */
  width: 300px; /* 버튼 너비 설정 */
  padding: 10px; /* 내부 여백 설정 */
  text-align: center; /* 텍스트 가운데 정렬 */
  background-color: #fff; /* 배경색 설정 */
  border-radius: 5px; /* 둥근 모서리 설정 */
  margin-top: 10px; /* 위쪽 여백 설정 */
  cursor: pointer; /* 마우스 커서 설정 */
}
    .notice-title {
        font-size: 10px; /* 글씨 크기 조정 */
        white-space: nowrap; /* 줄 바꿈 방지 */
        overflow: hidden; /* 넘치는 텍스트 숨김 */
        text-overflow: ellipsis; /* 말줄임표 표시 */
        text-align : left;
        max-width: 100%; /* 최대 너비 설정 */
        display: block; /* 블록 요소로 설정 */
    }
</style>

</head>
<body>
    <header>
	        <div id="logo">
	        	<a href="/"><img src="/images/index_login/logo.png" alt="Logo"></a>
	        </div>
	        <!-- nav_bar -->
	        <div id="holy">
	            <ul class="mama">
	            <c:if test="${session_id==null}">
	                <li><button type="button" class="sign_in">Sign in</button></li>
	            </c:if>
				<c:if test="${session_id!=null}">
	                <li><a onclick="searchBtn()">
					    <i class="fa-solid fa-magnifying-glass"></i>
					    <div id="searchBox" style="display: none;">
					        <input style="position: absolute; top:-15px; right:20px;"  type="text" id="searchInput" placeholder="검색..." />
					        <div id="searchResults" style="display: none; position: absolute; top: 40px; left: -200px; background: white; border-radius: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); width: 200px; padding: 8px 15px;"></div>
					    </div>
					</a></li>
	                <li><a onclick="openAlert()"><i style="font-size: 35px; position: relative; top: -5px;" class="fa-regular fa-envelope"></i></a></li>
	                <li><a href="/mypage"><i class="fa-regular fa-user"></i></a></li>
	                <li><a href="/user_setting"><i class="fa-solid fa-gear"></i></a></li>
	                <li class="cart coin"><a><img src="/images/index_login/coin.png"></a></li>
	                <li class="cart" style="position: relative; top:2px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
	            </c:if>
	            <c:if test="${session_id==null}">
	                <li class="cart coin"><a><img src="/images/index_login/coin.png"></a></li>
	                <li class="cart" style="position: relative; top:4px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
	            </c:if>
	            </ul>
	        </div>
	    </header>
<nav class="nav-bar">
	<ul class="nav-menu">
        <li class="nav-item">
            <a class="nav-link active-link" href="/fancommunity?artist_no=${adto.artist_no }">Fan</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/artistcommunity?artist_no=${adto.artist_no }">Artist</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/media?artist_no=${adto.artist_no }">Media</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/chatting">Live</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/smain" target="_blank">Shop <i class="bi bi-box-arrow-up-right"></i></a>
        </li>
    </ul>
</nav>

<script>
    // 클릭하면 active 클래스 변경하는 JS 코드
    document.querySelectorAll(".nav-link").forEach(item => {
        item.addEventListener("click", function() {
            document.querySelectorAll(".nav-link").forEach(link => {
                link.classList.remove("active-link");
            });
            this.classList.add("active-link");
        });
    });
</script>

	<div class="container">
	    <!-- 왼쪽 피드 영역 -->
	    <div class="feed">
	        <!-- 1번: 글쓰기 버튼 -->
		    
		    <div class="post-box" onclick="openModal()">
		        <img src="images/profile.png" alt="프로필 이미지">
		        <input type="text" placeholder="위버스에 포스트를 남겨보세요.">
		    </div>
		    

		

		    <!-- 2번: 모달 창 -->
		    <div id="postModal" class="modal">
		        <div class="modal-content">
		            <h2>포스트 쓰기</h2>
		            <p>${adto.artist_group_name}</p>
		            <form action="/fcwrite" method="post"  id="postFormWrite" enctype="multipart/form-data">
			            <textarea placeholder="위버스에 남겨보세요..."name="f_community_content" rows=17; id="community_content"></textarea>
			            <input type="hidden" name="artist_no" value="${param.artist_no}">
			            <input type="hidden" name="nicknameDto.nickname_name" value="${sessionScope.nickname}">
           			    <div class="file-buttons">
					        <!-- 이미지 파일 업로드 -->
					        <label for="image-upload">
					            <img src="images/album.png" alt="사진 추가">
					        </label>
					        <input type="file" id="image-upload" name="imageFile" accept="image/*" style="display: none;">
					    </div>
					      
					    <!-- 미리보기 이미지 태그 추가 -->
					    <div id="imagePreviewContainer" style="display: none; margin-top: 10px;">
					        <img id="previewImage" src="" alt="미리보기 이미지" style="max-width: 100%;">
					    </div>
					    
		            	<div class="modal-footer">
		                <button type="button" class="close-btn" onclick="closeModal()">닫기</button>
		                <div class="file-buttons">
		                	<button class="submit-btn">등록</button>
				    	</div>
		            </form>
	            </div>
	        </div>
    	</div>
	    	
	    	<!-- 수정용 모달 -->
			<div id="postModal3" class="modal" >
			    <div class="modal-content" >
			        <h2 id="modalTitle">포스트 수정</h2>
		            <p>${adto.artist_group_name}</p>
			        <form id="postForm" action="/fcupdate" method="post" enctype="multipart/form-data">
			            <!-- 게시글 내용: 수정 시 기존 내용 채워 넣을 예정 -->
			            <textarea id="f_community_content" placeholder="위버스에 남겨보세요..." name="f_community_content" rows=17;></textarea>
			            <input type="hidden" name="artist_no" value="${param.artist_no}">
			            <input type="hidden" name="nicknameDto.nickname_name" value="${sessionScope.nickname}">
			            <!-- 수정 시 communityNo 필요 -->
			            <input type="hidden" id="communityNoInput2" name="f_community_no" value="">
			            <div class="file-buttons">
			                <!-- 이미지 파일 업로드 -->
			                <label for="image-upload1">
			                    <img src="images/album.png" alt="사진 추가">
			                </label>
			                <input type="file" id="image-upload1" name="imageFile1" accept="image/*" style="display: none;">
			            </div>
			            <!-- 미리보기 이미지 태그 -->
			            <div id="imagePreviewContainer2" style="display: none; margin-top: 10px;">
			                <img id="previewImage2" src="" alt="미리보기 이미지" style="max-width: 100%;">
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="close-btn" onclick="closeModal3()">닫기</button>
			                <div class="file-buttons">
			                    <!-- (추가 옵션 등) -->
			                </div>
			                <button type="submit" class="submit-btn">등록</button>
			            </div>
			        </form>
			    </div>
			</div>
	    	
		<!-- 전체 리스트 -->
		<div class="post-list">
    	<c:forEach var="post" items="${list}">
        <!-- .post-item에 position: relative;를 적용 -->
        <div class="post-item" data-community-no="${post.f_community_no}" style="position: relative;"
             onclick="openModal2('${post.nicknameDto.nickname_name}', '${post.f_community_content}', '${post.f_community_date}', '${post.f_community_image}', this.dataset.communityNo)">
             
            <!-- 수정/삭제 드롭다운 (작성자일 때만 노출) -->
            <c:choose>
                <c:when test="${post.nicknameDto.nickname_name eq sessionScope.nickname}">
                    <div class="dropdown" style="position: absolute; top: 10px; right: 10px; z-index: 10;">
                        <!-- 드롭다운 열기 버튼 -->
                        <button class="menu-btn" onclick="toggleMenu(event)">...</button>
                        <!-- 드롭다운 내용 -->
                        <div class="dropdown-content" style="display: none; position: absolute; top: 30px; right: 0;">
                            <div class="menu-item" onclick="updatePost(${post.f_community_no}, ${post.artistDto.artist_no}); event.stopPropagation();" style="font-size:15px;">수정하기</div>
                            <div class="menu-item" onclick="deletePost(${post.f_community_no}, ${post.artistDto.artist_no}); event.stopPropagation();" style="font-size:15px;">삭제하기</div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- 작성자가 아니면 버튼 미노출 -->
                </c:otherwise>
            </c:choose>
            
            <!-- 게시글 헤더 -->
            <div class="post-header">
                <img src="images/profile.png" alt="프로필 이미지">
                <span class="username">${post.nicknameDto.nickname_name}</span>
                <span class="timestamp">
                    <fmt:formatDate value="${post.f_community_date}" pattern="MM.dd HH:mm" />
                </span>
            </div>
            
         
            
            <!-- 게시글 내용 -->
            <div class="post-content">
                ${post.f_community_content}
            </div>
            <br>
            <!-- 이미지 영역 -->
            <c:if test="${not empty post.f_community_image}">
                <img src="/images/${post.f_community_image}" alt="게시글 이미지" style="max-width:50%;">
            </c:if>
            <c:if test="${empty post.f_community_image}">
                <!-- 이미지 없을 때 -->
            </c:if>
            
            <!-- 댓글/좋아요 아이콘
            <div class="like-container">
			    <img src="images/빈하트.png" alt="좋아요" 
			         class="like-icon" 
			         data-liked="false" 
			         onclick="toggleLike(this, 'images/빈하트.png', 'images/가득찬하트.png', ${post.f_community_no}, '${sessionScope.nickname}'), event.stopPropagation()">
			    <span class="like-count" id="likeCount_${post.f_community_no}">
			        
			    </span>
			</div>
             -->
            <hr>
			<!-- 댓글 개수 표시 -->
			<!-- 예: 기본값은 서버에서 넘긴 commentList의 길이 -->
			<div class="comment-header" id="commentCount_${post.f_community_no}" onclick="event.stopPropagation()">
			    <!-- 초기값은 빈 문자열이나 기본값(예: "0개의 댓글") -->
			</div>
        </div>
    </c:forEach>
    
</div>

			
			<!-- 상세보기 모달 -->
			<div id="postModal2" class="modal" onclick="closeModal2()">
			    <div class="modal-content" onclick="event.stopPropagation()">
			     	<!-- 여기 안쪽을 클릭하면 이벤트가 전파되지 않아서 창이 안 닫힘, 우끼끼~ -->
			        <div class="post-header modal-header"> <!-- 모달 전용 -->
			            <img src="images/profile.png" alt="프로필 이미지">
			            <span class="username" id="modalUsername"></span>
			            <span class="timestamp" id="modalTimestamp"></span>
			        </div>
			        <div class="image-container" id="modalImage">
			 			
			        </div>
			        <div class="post-content" id="modalContent"></div>
			        
			        <!-- 구분선 -->
			        <br>
       				<hr class="section-divider" />
			        
			        <!-- 댓글 영역 시작, 우끼끼~! -->
			        <div class="comment-section">
			            
			            <div id="commentListContainer" style="height: 300px; overflow-y: auto;">
				            <!-- 실제 댓글 리스트 -->
				            <div id="commentList">
				            
				            </div>
			             </div>
			            <!-- 구분선 -->
				        <br>
	       				<hr class="section-divider" />
			            
			            <!-- 댓글 입력 -->
		         		<form action="/comments/add" method="post" id="commentForm">
				            <div class="comment-input-box">
							    <!-- 게시글 번호(community_no)를 숨겨서 전송 -->
							    <input type="hidden" id="communityNoInput" name="communityNo" value="">
							    <!-- 로그인한 사용자의 닉네임 -->
							    <input type="hidden" name="memberNickname" value="${sessionScope.nickname}">
				                <input type="text" id="commentInput" placeholder="댓글을 입력하세요." class="comment-input" name="comment_content">
				                <button type="button" class="comment-submit" onclick="addComment()">등록</button>
			            </div>
		         		</form>
			        </div>
			        <!-- 댓글 영역 끝 -->
			    </div>
			</div>
	
	    	
	    </div>
	    
	    
	   
	    <script>
	        function openModal() {
	            document.getElementById("postModal").style.display = "flex";
	        }
	        
	        document.getElementById("postFormWrite").addEventListener("submit", function(event) {
	            var content = document.getElementById("community_content").value.trim();

	            if (content === "") {
	                alert("내용을 입력하세요.");
	                document.getElementById("community_content").focus();
	                event.preventDefault();  // 폼 제출을 막음
	            } else {
	                // 빈 내용이 아닌 경우 서버로 보내기 전에 처리
	                document.getElementById("community_content").value = content;
	            }
	        });
	        
	        function closeModal() {
	            document.getElementById("postModal").style.display = "none";
	        }
	        function closeModal3() {
	            console.log("closeModal2 호출됨", document.getElementById("postModal3"));
	            $("#postModal3").hide(); // jQuery를 이용해서 숨기기
	        }

	        var currentUserNickname = '${sessionScope.nickname}';
	        function openModal2(postId, postContent, postDate, postImage, communityNo) {
	            // 게시글 데이터 세팅
	            document.getElementById("modalUsername").textContent = postId;
	            document.getElementById("modalTimestamp").textContent = postDate;
	            document.getElementById("modalContent").textContent = postContent;
	            if (postImage && postImage.trim() !== "") {
	                document.getElementById("modalImage").innerHTML = "<img src='images/" + postImage + "' alt='게시글 이미지'>";
	            } else {
	                document.getElementById("modalImage").innerHTML = "";
	            }
	            
	            // 댓글 초기화 및 새로 로드
	            $("#commentList").empty();
	            console.log("🚀 loadComments 실행됨, communityNo:", communityNo);
	            loadComments(communityNo);
	            
	            // 숨겨진 input에 communityNo 설정
	            document.getElementById("communityNoInput").value = communityNo;
	            
	            // 모달 열기
	            document.getElementById("postModal2").style.display = "flex";
	        }
	        
	        function toggleOptionsMenu(button) {
	            // 버튼의 바로 다음 요소(옵션 메뉴)를 토글하는 예시
	            var menu = button.nextElementSibling;
	            if (menu.style.display === "block") {
	                menu.style.display = "none";
	            } else {
	                menu.style.display = "block";
	            }
	            event.stopPropagation();
	        }

	        function editComment(commentNo) {
	            // 수정 기능 구현 예시
	            alert("댓글 수정 기능 구현: 댓글 번호 " + commentNo);
	        }
	        
	        var currentUserNickname = '${sessionScope.nickname}';
	        function deleteComment(commentNo, communityNo) {
	            // 삭제 기능 구현 예시
	            if (confirm(commentNo+"번 댓글을 삭제하시겠습니까?")) {
	            	$.ajax({
			            url: "/fancomment/delete", // 삭제를 처리할 컨트롤러 URL
			            type: "post",
			            data: { commentNo: commentNo},
			            dataType: "text", // 또는 JSON, 서버에서 어떻게 반환하는지에 따라
			            success: function(response) {
			                alert("게시글이 삭제되었습니다.");
			                // 삭제 후 페이지 새로고침 또는 목록 업데이트
			                loadComments(communityNo);
			                //location.href="/fancommunity?artist_no="+artistNo
			            },
			            error: function() {
			                alert("게시글 삭제에 실패했습니다.");
			            }
			        });
	            }
	        }

	        
	       
	        function loadComments(communityNo) {
	            $.ajax({
	                url: "/fancommunity/detail",
	                type: "get",
	                data: { communityNo: communityNo },
	                dataType: "json",
	                success: function(detailData) {
	                    console.log(detailData);
	                    var htmlData = "";
	                    
	                    for (let i = 0; i < detailData.length; i++) {
	                    	htmlData += '<div class="comment-item">';
	                    	htmlData += '  <img src="images/profile.png" alt="프로필" class="comment-profile">';
	                    	htmlData += '  <div class="content">';
	                    	htmlData += '      <div class="comment-header" style="display: flex; align-items: center; justify-content: space-between;">';
	                    	htmlData += '          <div class="comment-username">' + detailData[i].nicknameDto.nickname_name + '</div>';
	                    	// 조건: 댓글 작성자가 현재 사용자와 같으면 수정/삭제 버튼 추가currentUserNickname 
	                    	if (detailData[i].nicknameDto.nickname_name === currentUserNickname) {
	                    	    htmlData += '          <div class="comment-options">';
	                    	    htmlData += '              <button class="comment-options-btn menu-btn" onclick="toggleOptionsMenu(this)">...</button>';
	                    	    htmlData += '              <div class="comment-options-menu" style="display: none;">';
	                    	    htmlData += '                  <button class="delete-comment" onclick="deleteComment(' + detailData[i].comment_no + ', ' + detailData[i].communityDto.f_community_no + '); event.stopPropagation();">삭제하기</button>';
	                    	    htmlData += '              </div>';
	                    	    htmlData += '          </div>';
	                    	}
	                    	htmlData += '      </div>'; // end .comment-header
	                    	htmlData += '      <div class="comment-timestamp">' + new Date(detailData[i].comment_date).toLocaleString() + '</div>';
	                    	htmlData += '      <div class="comment-text">' + detailData[i].comment_content + '</div>';
	                    	htmlData += '  </div>'; // end .content
	                    	htmlData += '</div>'; // end .comment-item
	                    }
	                    $("#commentList").html(htmlData);
	                },
	                error: function() {
	                    console.error("상세 정보 로드 실패11");
	                }
	            });
	        }

	       
	        
	        
	        
	        
	        

	        function closeModal2() {
	            document.getElementById("postModal2").style.display = "none";
	        }
	        
	        document.getElementById("image-upload").addEventListener("change", function(event) {
	            let file = event.target.files[0];
	            if (file && file.type.startsWith("image/")) {
	                let reader = new FileReader();
	                reader.onload = function(e) {
	                    let previewImage = document.getElementById("previewImage");
	                    previewImage.src = e.target.result;
	                    // 미리보기 컨테이너 보이기
	                    document.getElementById("imagePreviewContainer").style.display = "block";
	                }
	                reader.readAsDataURL(file);
	            } else {
	                // 이미지 파일이 아니면 미리보기 숨기기
	                document.getElementById("imagePreviewContainer").style.display = "none";
	            }
	        });
	        
	     // 댓글 추가 함수
function addComment() {
    // 입력값 확인
    if ($("#commentInput").val().length < 1) {
        alert("내용을 입력하셔야 합니다.");
        return; // 빈 댓글은 추가 안 함, 우끼끼~!
    }

    // ajax
    let htmlData = "";
    $.ajax({
        url: "/comments/add",
        type: "post",
        data: $("#commentForm").serialize(), // form의 모든 데이터를 서버 전송
        dataType: 'json',
        success: function (data) { // 서버에서 dto 객체 받음
            let commentDate = new Date(data.comment_date);
            let formattedDate = formatDate(commentDate);

            htmlData += ' <div class="comment-item">';
            htmlData += ' <img src="images/profile.png" alt="프로필" class="comment-profile">';
            htmlData += ' <div class="comment-content">';
            htmlData += ' <div class="comment-username">' + data.nicknameDto.nickname_name + '</div>';
            htmlData += ' <div class="comment-timestamp">' + formattedDate + '</div>'; // 수정된 부분
            htmlData += ' <div class="comment-text">' + data.comment_content + '</div>';
            htmlData += ' </div>';
            htmlData += ' </div>';

            $("#commentList").prepend(htmlData);

            updateCommentCount();
            // 댓글 입력창 초기화 여기!
            document.getElementById("commentInput").value = "";

        },
        error: function () {
            alert("실패");
        }
    });

    // 입력창 초기화
    commentInput.value = "";
}

function formatDate(date) {
    let datePart = date.toLocaleDateString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit' });
    let timePart = date.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', second: '2-digit' });
    return datePart + ' ' + timePart;
}
	     
	     //댓글 수
	     
	        function toggleMenu(event) {
	            // 이벤트 전파 막아서 바깥 클릭 시 닫힐 수 있도록
	            event.stopPropagation();

	            let dropdownContent = document.getElementById("dropdownMenu");
	            if (dropdownContent.style.display === "block") {
	                dropdownContent.style.display = "none";
	            } else {
	                dropdownContent.style.display = "block";
	            }
	        }

	        // 바깥을 클릭하면 드롭다운이 닫히도록
	        document.addEventListener("click", function() {
	            let dropdownContent = document.getElementById("dropdownMenu");
	            if (dropdownContent) {
	                dropdownContent.style.display = "none";
	            }
	        });
			//게시글수정
	        function updatePost(communityNo, artistNo) {
	        	// AJAX를 통해 해당 게시글의 데이터를 가져옴 (수정용 엔드포인트)
	            $.ajax({
	                url: "/fancommunity/getPost", // 게시글 상세 정보를 JSON으로 반환하는 엔드포인트
	                type: "GET",
	                data: { communityNo: communityNo },
	                dataType: "json",
	                success: function(postData) {
	                	console.log("수정창을 엽니다.")
	                	console.log("postData : ",postData)
	                	console.log("이미지 : ",postData.f_community_image)
	                    // postData는 FanCommunityDto 객체 (JSON)라고 가정
	                    // 모달 타이틀을 "포스트 수정"으로 변경
	                    document.getElementById("modalTitle").textContent = "포스트 수정";
	                	
	                	
	                    // 기존 내용 채워넣기
	                    document.getElementById("f_community_content").value = postData.f_community_content;
	                    // 만약 이미지가 있다면 미리보기 세팅
	                    if (postData.f_community_image && postData.f_community_image.trim() !== "") {
	                        document.getElementById("previewImage2").src = "images/" + postData.f_community_image;
	                        document.getElementById("imagePreviewContainer2").style.display = "block";
	                    } else {
	                        document.getElementById("imagePreviewContainer2").style.display = "none";
	                    }
	                    // 수정 시 필요한 communityNo 값을 hidden input에 세팅
	                    document.getElementById("communityNoInput2").value = postData.f_community_no;
	                    // 폼 action을 수정 전용 URL로 변경 (예: "/fancommunity/update")
	                    document.getElementById("postForm").action = "/fcupdate";
	                    // 모달 열기
	                    document.getElementById("postModal3").style.display = "flex";
	                },
	                error: function() {
	                    console.error("게시글 상세 정보 로드 실패");
	                }
	            });
	        }
	     // 페이지 로드 시 파일 선택 이벤트 핸들러 등록
	        document.addEventListener("DOMContentLoaded", function() {
	            document.getElementById("image-upload1").addEventListener("change", function(event) {
	                let file = event.target.files[0];
	                if (file && file.type.startsWith("image/")) {
	                    let reader = new FileReader();
	                    reader.onload = function(e) {
	                        document.getElementById("previewImage2").src = e.target.result;
	                        document.getElementById("imagePreviewContainer2").style.display = "block";
	                    };
	                    reader.readAsDataURL(file);
	                } else {
	                    document.getElementById("previewImage2").src = "";
	                    document.getElementById("imagePreviewContainer2").style.display = "none";
	                }
	            });
	        });
			
	        //게시글삭제
	       function deletePost(communityNo, artistNo) {
			    if (confirm(communityNo+"번 게시글을 삭제하시겠습니까?")) {
			        $.ajax({
			            url: "/fancommunity/delete", // 삭제를 처리할 컨트롤러 URL
			            type: "post",
			            data: { communityNo: communityNo},
			            dataType: "text", // 또는 JSON, 서버에서 어떻게 반환하는지에 따라
			            success: function(response) {
			                alert("게시글이 삭제되었습니다.");
			                // 삭제 후 페이지 새로고침 또는 목록 업데이트
			                 window.location.replace("/fancommunity?artist_no=" + artistNo);
			                //location.href="/fancommunity?artist_no="+artistNo
			            },
			            error: function() {
			                alert("게시글 삭제에 실패했습니다.");
			            }
			        });
			    }
			}
	        
	        
	        function toggleMenu(event) {
	            event.stopPropagation(); // 클릭 이벤트 전파 차단
	            var dropdown = event.target.nextElementSibling;
	            if (dropdown.style.display === "block") {
	                dropdown.style.display = "none";
	            } else {
	                dropdown.style.display = "block";
	            }
	        }

	        // 바깥 클릭 시 모든 드롭다운 닫기
	        document.addEventListener("click", function() {
	            var dropdowns = document.querySelectorAll(".dropdown-content");
	            dropdowns.forEach(function(dd) {
	                dd.style.display = "none";
	            });
	        });
	        
	        
	        $(document).ready(function(){
	            $('.post-item').each(function(){
	                let communityNo = $(this).data('community-no');  // 각 게시글의 data-community-no 값
	                console.log("communityNo:", communityNo);  // 콘솔에서 확인
	                updateCommentCount(communityNo);
	            });
	        });
	        function updateCommentCount(communityNo) {
	            if (!communityNo) {
	                console.error("오류: communityNo 값이 없음");
	                return;
	            }
	            $.ajax({
	                url: "/comments/count",
	                type: "GET",
	                data: { communityNo: communityNo },
	                dataType: "json",
	                success: function(response) {
	                    console.log("서버 응답:", response);  // 서버 응답 로그 확인
	                    var commentCountElement = document.getElementById("commentCount_" + communityNo);
	                    if (commentCountElement) {
	                        commentCountElement.innerHTML = '<img src="images/메세지.png" alt="메세지" style="width:20px; height:20px; vertical-align:middle; margin-right: 5px;"> '  + response + "개의 댓글";
	                        commentCountElement.style.fontSize = "12px"; 
	                    } else {
	                        console.warn("commentCountElement를 찾을 수 없음:", "commentCount_" + communityNo);
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.error("AJAX 오류:", error);
	                }
	            });
	        }

	        
	        
	     
		
	    </script>
	    
    
	
	    <!-- 오른쪽 사이드바 (경계선 추가) -->
	    <!-- 오른쪽 사이드바 (한 개의 div로 감싸기) -->
	    <div class="sidebar">
	    <!-- ONF 이미지 + 그룹 텍스트 -->
	    <div class="image-container">
	        <img src="images/${adto.artist_cover_image}" class="img-fluid" alt="ONF 이미지">
	        <a href="/artist?artist_no=${adto.artist_no}"><div class="image-text">${adto.artist_group_name}</div></a>
	    </div>
	
	    <!-- 멤버쉽 가입하기 (맵 영역) -->
	    <div class="image-wrapper">
	        <img src="images/멤버쉽.png" usemap="#membershipMap" alt="멤버쉽 가입하기 이미지" >
	        <map name="membershipMap">
	            <area shape="rect" coords="15,67,333,107" href="#" alt="멤버쉽 가입하기">
	        </map>
	    </div>
	
		<div class="rounded-box">
		  <img src="images/공지사항.png" alt="공지사항 이미지" class="notice-image">
		  <div class="notice-text">
		    <b><strong>커뮤니티 공지사항</strong></b><br>
		     <a href="/noticelist?page=0&artistNo=${adto.artist_no}">
			     <div class="subscribe-button">
			     <c:forEach var="notice" items="${ndto}" begin="0" end="1">
					<div class="see" style="width:100%;">
					    <a href="/noticelist?page=0&artistNo=${adto.artist_no}">
					        <p class="notice-title">${notice.notice_title}</p>
					    </a>
					</div>
			     </c:forEach>
		     </div>
		     </a>
		  </div>
		</div>
 
 		<div class="rounded-box">
		  <img src="images/공지사항.png" alt="이벤트 이미지" class="notice-image">
		  <div class="notice-text">
		    <b><strong>이벤트</strong></b><br>
		     <a href="/eventlist?page=0&artistNo=${adto.artist_no}">
		     <div class="subscribe-button"><b>이벤트 〉</b><br></div></a>
		  </div>
		</div>
	</div>
</div>
    
</body>
</html>
