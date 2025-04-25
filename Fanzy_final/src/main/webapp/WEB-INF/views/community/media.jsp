<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Media & Membership</title>
  <link rel="stylesheet" href="styles.css"> <!-- 별도 CSS 파일 사용 시 -->
  <style>
    /* 페이지 전체 스타일 */
      body { font-family: Arial, sans-serif; }
  
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
    background-color: #F5C3B2; 
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

.menu a, .menu button, .nav-link {
    text-decoration: none;
    font-size: 1rem;
    background: none;
    border: none;
    cursor: pointer;
    font-family: inherit;
}

.nav-link {
 color: #fff;              /* 텍스트 색상 (흰색) */
    text-decoration: none;    /* 밑줄 제거 */
    font-size: 1rem;          /* 글자 크기 */
    font-weight: 600;         /* 글자 두께 */
    position: relative;       /* 하위 요소(hover 효과 등)를 위해 position 설정 */
    transition: color 0.2s;   /* 호버 시 부드러운 색상 변화 */
}

    /* 페이지 전체 스타일 */
    body {
      margin: 0;
      padding: 0;
      background-color: #121212; /* 어두운 배경 */
      font-family: Arial, sans-serif;
      color: #fff; /* 기본 텍스트 흰색 */
    }
    /* 컨테이너 */
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }
    /* 섹션 헤더 */
    h2 {
      font-size: 1.5rem;
      margin-bottom: 1rem;
    }
    /* 최신 미디어 섹션 */
    .media-section {
      margin-bottom: 40px;
    }
    .media-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
      gap: 16px;
    }
    .media-item {
      background-color: #1e1e1e; 
      border-radius: 8px;
      overflow: hidden;
      transition: transform 0.2s;
      cursor: pointer;
    }
    .media-item:hover {
      transform: scale(1.02);
    }
    .media-item img {
      width: 100%;
      height: 130px; 
      object-fit: cover; /* 이미지 비율 유지하면서 잘림 */
      display: block;
    }
    .media-info {
      padding: 10px;
    }
    .media-title {
      font-size: 0.95rem;
      margin: 0 0 6px;
      white-space: nowrap; 
      overflow: hidden; 
      text-overflow: ellipsis; /* 길면 생략표시 */
    }
    .media-desc {
      font-size: 0.85rem;
      color: #ccc;
      line-height: 1.2;
      max-height: 2.4em; 
      overflow: hidden; 
      text-overflow: ellipsis;
    }

    /* 멤버십 섹션 */
    .membership-section {
      margin-bottom: 40px;
    }
    .membership-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
      gap: 16px;
    }
    .membership-item {
      background-color: #1e1e1e;
      border-radius: 8px;
      overflow: hidden;
      transition: transform 0.2s;
      cursor: pointer;
    }
    .membership-item:hover {
      transform: scale(1.02);
    }
    .membership-item img {
      width: 100%;
      height: 130px;
      object-fit: cover;
      display: block;
    }
    .membership-info {
      padding: 10px;
    }
    .membership-title {
      font-size: 0.95rem;
      margin: 0 0 6px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    /* ===== 미디어 섹션 ===== */
.media-section {
    text-align: left;
    margin-top: 50px;
    margin-bottom: 200px;
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
    text-align: center;
    width: 280px; height: 30px;
    overflow: hidden;
}
.profile-item p {
    margin-top: 5px;
    font-size: 12px;
    font-weight: bold;
    color: white;
}
.container {
    max-width: 95%;   /* 최대 너비 (원하는 크기로) */
    margin: 0 auto;      /* 수평 가운데 정렬 */
    padding: 0 20px;     /* 좌우 20px씩 내부 여백 */
}

/* 
  영상 영역 (.media-videos)의 outer 컨테이너에 flex-wrap을 적용하고,
  내부 반복되는 각 아이템(내부 .media-videos)을 5열로 배치 
*/
.media-videos {
  display: flex !important; /* inline style를 덮어쓰도록 */
  flex-wrap: wrap;
  gap: 15px; /* 기존 gap 유지 */
}

/* outer .media-videos 내부에 있는 각 영상 아이템에 너비 20% 부여 */
.media-videos > .media-videos {
  width: calc(20% - 15px); /* 5열로 배치 (간격을 고려하여 조정) */
  box-sizing: border-box;
}

/* 
  텍스트 영역 (.media-texts)의 outer 컨테이너에도 flex-wrap을 적용하고,
  내부 반복되는 각 아이템에 너비 20% 부여
*/
.media-texts {
  display: flex !important;
  flex-wrap: wrap;
  gap: 15px;
}

/* outer .media-texts 내부의 반복되는 container 안의 각 텍스트 아이템에 20% 부여 */
.media-texts > .media-texts > .media-text {
  width: calc(20% - 15px);
  box-sizing: border-box;
}




  </style>
</head>
<body>
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
            <a class="nav-link" href="#" target="_blank">Shop <i class="bi bi-box-arrow-up-right"></i></a>
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
		<div class="media-section">
		    <h2 style="text-align: left;">최신 미디어</h2>
		    <br>
		    <div class="media-videos" style="display:flex;">
		        <c:forEach var="media" items="${mediaList}">
	                <div class="media-videos" style="display:flex;">
	                    <div class="media-video">
						   <a href="${media.media_content}"><img src="/images/${media.media_image}" alt="미디어1"></a>
						</div>
						<div class="media-text" style="text-align: center;">
						 	<p class="media-title">${media.media_title}</p>
					   	</div>
	                </div>
            	</c:forEach>
		    </div>
		</div>
	
	
				<div class="media-section">
		    <h2 style="text-align: left;">Live</h2>
		    <br>
		    <div class="media-videos" style="display:flex;">
		        <c:forEach var="media" items="${liveList}">
	                <div class="media-videos" style="display:flex;">
	                    <div class="media-video">
						 <a href="${media.media_content}"><img src="/images/${media.media_image}" alt="미디어1"></a>
						</div>
						<div class="media-text" style="text-align: center;">
						 	<p class="media-title">${media.media_title}</p>
					   	</div>
	                </div>
            	</c:forEach>
		    </div>
		</div>
	</div>
<script>
var swiper = new Swiper('.swiper-container', {
    loop: true,
    slidesPerView: 5,   // 한 화면에 6개의 슬라이드 표시
    spaceBetween: 30,   // 슬라이드 간 간격 (원하는 값으로 조정)
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    // 옵션: 자동 재생 등 추가 설정 가능
    autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },
  });
</script>

</body>
</html>
