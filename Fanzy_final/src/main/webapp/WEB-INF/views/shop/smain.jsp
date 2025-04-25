<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Title</title>
<link rel="stylesheet" as="style" crossorigin
  href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link rel="stylesheet" href="/css/updownstyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
<style>

/* 전체 기본 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: #17171B;
}

body {
	font-family: "Pretendard Variable", sans-serif;
	background: #f0f0f0;
}

/* 메인 컨테이너 */
.container {
	max-width: 1080px;
	margin: 0 auto;
}

/* 숨김 처리 */
.container.hidediv {
	display: none;
}

/* 이미지 슬라이더 스타일 */
.slider-container {
	position: relative;
	width: 100%;
	height: 430px;
	overflow: hidden;
	border-radius: 10px;
	margin-top: 20px;
}

.slide {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.slide.active {
	opacity: 1;
}

.slider-btn {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	padding: 10px 20px;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

/* 제목 + 카드 묶는 래퍼 */
.title-and-cards {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	padding: 16px;
	margin-top: 10px;
}

.title-bar {
	background-color: #F5C3B2;
	border-radius: 4px;
	padding: 20px;
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	text-align: left;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
	color: #17171B;
}

.cards {
	display: grid;
	/* 4개의 고정 너비 열(예: 238px) */
	grid-template-columns: repeat(4, 238px);
	/* 카드 사이 간격 */
	gap: 20px;
	justify-content: space-between;
}

.card {
	width: 238px;
	background-color: #ffffff;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.image-section {
	background-color: white;
	text-align: center;
	overflow: hidden;
	height: 238px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.image-section img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.15s ease;
	will-change: transform;
}

.text-section {
	background-color: #F5C3B2;
	padding: 15px;
	text-align: center;
	overflow: hidden;
	color: #17171B;
}

.more-button {
	width: 100%;
	border: 2px solid #ccc;
	border-radius: 42px;
	padding: 10px;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	margin-top: 20px;
	background: none;
	color: #17171B;
}

.more-button:hover {
	background: #f0f0f0;
}

.image-section:hover img {
	transform: scale(1.1);
}

/* 아티스트 검색 모달 */
.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 999;
}

.modal-backdrop.active {
	display: flex;
}

.alphabet-buttons button.active {
  background: #17171B;
  color: #fff; /* 글자색도 대비되게 변경 */
}

.modal-content {
	background: #fff;
	width: 400px;
	max-height: 80vh;
	overflow-y: auto;
	border-radius: 8px;
	padding: 20px;
	position: relative;
}

.modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	background: none;
	border: none;
	font-size: 20px;
	font-weight: bold;
}

.alphabet-buttons {
	display: flex;
	flex-wrap: wrap;
	gap: 5px;
	margin-bottom: 10px;
}

.alphabet-buttons button {
	border: 1px solid #ccc;
	background: #fff;
	cursor: pointer;
	padding: 5px 10px;
	border-radius: 4px;
}

.alphabet-buttons button:hover {
	background: #f0f0f0;
}

.artist-list {
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.artist-item {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 8px;
	border-radius: 4px;
	cursor: pointer;
}

.artist-item:hover {
	background: #eee;
}

.artist-item img {
	width: 40px;
	height: 40px;
	border-radius: 35%;
	object-fit: cover;
}

/* Recommended Artist (가로 스크롤, 원형 이미지) */
.recommended-artist-container {
  max-width: 1080px;
  margin: 20px auto;
  padding: 16px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 1px 4px rgba(0,0,0,0.2);
}

.recommended-artist-container h2 {
  margin-bottom: 20px;
  font-size: 20px;
  font-weight: bold;
}

.artist-scroll-wrapper {
  display: flex;
  gap: 16px;
  overflow-x: auto;  /* 좌우 스크롤 허용 */
  padding-bottom: 10px;
}

.artist-scroll-wrapper::-webkit-scrollbar {
  height: 6px;       /* 스크롤바 높이 */
}
.artist-scroll-wrapper::-webkit-scrollbar-thumb {
  background: #ccc;  /* 스크롤바 색상 */
  border-radius: 3px;
}

.artist-item-circle {
  flex: 0 0 auto;  /* 내용물 크기만큼 */
  width: 80px;
  text-align: center;
}

.artist-item-circle img {
  width: 73px;
  height: 73px;
  object-fit: cover;
  border-radius: 35%;
  display: block;
  margin: 0 auto 8px auto;
}

.artist-item-circle p {
  font-size: 14px;
  line-height: 1.2;
  margin: 0;
  
  /* 줄바꿈 허용을 위해 추가/수정 */
  white-space: normal;      /* 기본적으로 여러 줄로 감 */
  word-break: keep-all;     /* 단어가 너무 길면 다음 줄로 넘김 */
  /* 필요하다면 word-break: break-all; 로 교체 가능 */
}

</style>

</head>

<body>
 <header class="WeverseXk21_header">
    <div class="WeverseXk21_logo" id="logo">
        <a href="/"><img src="/images/index_login/logo.png" alt="Logo"></a>
    </div>
    <!-- nav_bar -->
    <nav class="WeverseXk21_nav">
        <ul>
            <c:if test="${session_id==null}">
                <li><button type="button" class="WeverseXk21_sign_in">Sign in</button></li>
            </c:if>
            <c:if test="${session_id!=null}">
                <li><a onclick="searchBtn()">
                    <i class="fa-solid fa-magnifying-glass WeverseXk21_icon_solid"></i>
                    <div id="searchBox" class="WeverseXk21_search_wrapper" style="display: none;">
                        <input style="position: absolute; top:-15px; right:20px;" type="text" id="searchInput" class="WeverseXk21_search_input" placeholder="아티스트 검색" />
                        <div id="searchResults" style="display: none; position: absolute; top: 40px; left: -200px; background: white; border-radius: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); width: 200px; padding: 8px 15px;"></div>
                    </div>
                </a></li>
                <li><a onclick="openAlert()"><i style="font-size: 35px; position: relative; top: -5px;" class="fa-regular fa-envelope WeverseXk21_icon_regular"></i></a></li>
                <li><a href="/mypage"><i class="fa-regular fa-user WeverseXk21_icon_regular"></i></a></li>
                <li><a href="/user_setting"><i class="fa-solid fa-gear WeverseXk21_icon_solid"></i></a></li>
                <li class="WeverseXk21_cart WeverseXk21_coin"><a href="/smain"><img src="/images/index_login/coin.png"></a></li>
                <li class="WeverseXk21_cart" style="position: relative; top:-1px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping WeverseXk21_icon_cart"></i></a></li>
            </c:if>
            <c:if test="${session_id==null}">
                <li class="WeverseXk21_cart WeverseXk21_coin"><a href="/smain"><img src="/images/index_login/coin.png"></a></li>
                <li class="WeverseXk21_cart" style="position: relative; top:4px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping WeverseXk21_icon_cart"></i></a></li>
            </c:if>
        </ul>
    </nav>
</header>



	<!-- 이미지 고유 ID앞 링크 -->
	<c:set var="baseurl" value="https://lh3.googleusercontent.com/d/" />
	
	<!-- 메인배너 -->
	<div class="container">
		<div class="slider-container">
			<a href="/sprods?artistNo=1">
			<img src="/images/shopimages/banner/PLAVE.jpg" width="1080px" height="430px" class="slide active">
			</a>
			<a href="/sprods?artistNo=3">
			<img src="/images/shopimages/banner/ISEGYEIDOL.jpg" width="1080px" height="430px" class="slide ">
			</a>
			<a href="/sprods?artistNo=35">
			<img src="/images/shopimages/banner/aespa.jpg" width="1080px" height="430px" class="slide">
			</a>
			<button class="slider-btn" onclick="nextSlide()">다음</button>
		</div>
	</div>
	<!-- 메인배너 -->



<!-- Recommended Artist 섹션 -->
<div class="recommended-artist-container">
  <h2>Recomend Artist</h2>
  <div class="artist-scroll-wrapper">
    <c:choose>
      <%-- nlist가 있을 경우 해당 목록 사용 --%>
      <c:when test="${not empty nlist}">
        <c:forEach var="n" items="${nlist}">
          <a href="/sprods?artistNo=${n.artistDto.artist_no}">
            <div class="artist-item-circle">
              <img src="/images/${n.artistDto.artist_group_image}"
                   onerror="this.src='https://picsum.photos/73/73';"
                   alt="${n.artistDto.artist_group_name}" />
              <p>${n.artistDto.artist_group_name}</p>
            </div>
          </a>
        </c:forEach>
      </c:when>
      <%-- nlist가 없거나 로그인하지 않은 경우 전체 목록 사용 --%>
      <c:otherwise>
        <c:forEach var="adto" items="${list}">
          <a href="/sprods?artistNo=${adto.artist_no}">
            <div class="artist-item-circle">
              <img src="/images/${adto.artist_group_image}"
                   onerror="this.src='https://picsum.photos/73/73';"
                   alt="${adto.artist_group_name}" />
              <p>${adto.artist_group_name}</p>
            </div>
          </a>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </div>
  <button class="more-button" id="openSearchBtn">아티스트 검색</button>
</div>


	<!-- 아티스트 검색 버튼 + 모달 -->
	<div class="container">
	
		<!-- 검색 모달 -->
		<div id="artistSearchModal" class="modal-backdrop">
			<div class="modal-content">
				<button class="modal-close-btn" id="closeSearchBtn">&times;</button>
				<h2 style="margin-bottom: 10px;">아티스트 검색</h2>
		
				<!-- 알파벳 버튼들 -->
				<c:set var="alphabet" value="ABCDEFGHIJKLMNOPQRSTUVWXYZ" />
				<div class="alphabet-buttons">
					<button data-letter="ALL">ALL</button>
					<c:forEach var="i" begin="0" end="25">
						<button data-letter="${fn:substring(alphabet, i, i+1)}">
							${fn:substring(alphabet, i, i+1)}</button>
					</c:forEach>
				</div>
		
				<!-- 아티스트 목록 -->
				<div class="artist-list" id="artistList">
					<c:forEach var="adto" items="${list}">
						<div class="artist-item" data-name="${adto.artist_group_name}"
							data-no="${adto.artist_no}">
							<img src="/images/${adto.artist_group_image}" alt="artist"
								onerror="this.src='https://picsum.photos/40/40';" />
							<span>${adto.artist_group_name}</span>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div>
	<!-- 아티스트 검색 버튼 + 모달 -->


<!-- container(아티스트 상품출력) -->
<c:choose>
  <%-- nlist가 있을 경우 해당 목록 사용 --%>
  <c:when test="${not empty nlist}">
    <c:forEach items="${nlist}" var="n">
      <%-- 상품이 없는 경우 표시하지 않음 --%>
      <div class="container ${ empty n.artistDto.shopList ? 'hidediv' : ''}">
        <div class="title-and-cards">
          <div class="title-bar">${n.artistDto.artist_group_name}</div>
          <div class="cards">
            <c:forEach items="${n.artistDto.shopList}" begin="0" end="3" step="1" var="sdto">
              <div class="card">
                <a href="/sprodview?shopNo=${sdto.shop_no}">
                  <div class="image-section">
                    <img src='${baseurl}${sdto.shop_image1}' alt="상품이미지" 
                    onerror="this.onerror=null; this.src='/images/shopimages/prods/${sdto.shop_image1}.jpg';" />
                  </div>
                  <div class="text-section">
                    <p>${sdto.shop_title}</p>
                    <p><fm:formatNumber value="${sdto.shop_price}" pattern="#,###" /> ₩</p>
                  </div>
                </a>
              </div>
            </c:forEach>
          </div>
          <a href="/sprods?artistNo=${n.artistDto.artist_no}">
            <button class="more-button">see All</button>
          </a>
        </div>
      </div>
    </c:forEach>
    
    <%-- nlist에 상품이 있는 아티스트가 없는 경우 전체 목록 표시 --%>
    <c:set var="hasShopItems" value="false" />
    <c:forEach items="${nlist}" var="n">
      <c:if test="${not empty n.artistDto.shopList}">
        <c:set var="hasShopItems" value="true" />
      </c:if>
    </c:forEach>
    
    <c:if test="${not hasShopItems}">
      <c:forEach items="${list}" var="adto">
        <div class="container ${empty adto.shopList ? 'hidediv' : ''}">
          <div class="title-and-cards">
            <div class="title-bar">${adto.artist_group_name}</div>
            <div class="cards">
              <c:forEach items="${adto.shopList}" begin="0" end="3" step="1" var="sdto">
                <div class="card">
                  <a href="/sprodview?shopNo=${sdto.shop_no}">
                    <div class="image-section">
                      <img src='${baseurl}${sdto.shop_image1}' alt="상품이미지" 
						onerror="this.onerror=null; this.src='/images/shopimages/prods/${sdto.shop_image1}.jpg';" />
                    </div>
                    <div class="text-section">
                      <p>${sdto.shop_title}</p>
                      <p><fm:formatNumber value="${sdto.shop_price}" pattern="#,###" /> ₩</p>
                    </div>
                  </a>
                </div>
              </c:forEach>
            </div>
            <a href="/sprods?artistNo=${adto.artist_no}">
              <button class="more-button">see All</button>
            </a>
          </div>
        </div>
      </c:forEach>
    </c:if>
  </c:when>
  
  <%-- nlist가 없거나 로그인하지 않은 경우 전체 목록 사용 --%>
  <c:otherwise>
    <c:forEach items="${list}" var="adto">
      <div class="container ${empty adto.shopList ? 'hidediv' : ''}">
        <div class="title-and-cards">
          <div class="title-bar">${adto.artist_group_name}</div>
          <div class="cards">
            <c:forEach items="${adto.shopList}" begin="0" end="3" step="1" var="sdto">
              <div class="card">
                <a href="/sprodview?shopNo=${sdto.shop_no}">
                  <div class="image-section">
                      <img src='${baseurl}${sdto.shop_image1}' alt="상품이미지" 
						onerror="this.onerror=null; this.src='/images/shopimages/prods/${sdto.shop_image1}.jpg';" />
                  </div>
                  <div class="text-section">
                    <p>${sdto.shop_title}</p>
                    <p><fm:formatNumber value="${sdto.shop_price}" pattern="#,###" /> ₩</p>
                  </div>
                </a>
              </div>
            </c:forEach>
          </div>
          <a href="/sprods?artistNo=${adto.artist_no}">
            <button class="more-button">see All</button>
          </a>
        </div>
      </div>
    </c:forEach>
  </c:otherwise>
</c:choose>



<footer class="WeverseYb78_footer">
    <div class="WeverseYb78_footer_links">
        <a href="#">이용약관</a>
        <a href="#">서비스운영정책</a>
        <a href="#">유료서비스 이용약관</a>
        <a href="#">청소년 보호 정책</a>
        <a href="#"><strong>개인정보처리방침</strong></a>
        <a href="#">쿠키정책</a>
        <a href="#">쿠키 설정</a>
        <a href="#">입점 신청</a>
        <a href="#">고객센터</a>
    </div>
    <div class="WeverseYb78_footer_info">
        <p>
            상호 &nbsp;<strong>Fanzy Company Inc.</strong>
            <span class="WeverseYb78_footer_gap">|</span>
            대표자 &nbsp;<strong>임민영</strong>
            <span class="WeverseYb78_footer_gap">|</span>
            전화번호 &nbsp;<strong>1544-0790</strong>
            <span class="WeverseYb78_footer_gap">|</span>
            FAX &nbsp;<strong>+82)-2-2144-9399</strong>
            <span class="WeverseYb78_footer_gap">|</span>
            주소 &nbsp;<strong> 서울 금천구 동작대로 132, 한라원앤원타워 3층</strong>
            <span class="WeverseYb78_footer_gap">|</span>
            사업자등록번호 &nbsp;<strong>119-86-20319</strong>
            <span class="WeverseYb78_footer_gap">|</span>
            <a href="#">사업자 정보 확인</a>
        </p>
        <p>
            통신판매업 신고번호 &nbsp;<strong>2022-금천가산P-0557호</strong>
            <span class="WeverseYb78_footer_gap">|</span>
            호스팅 서비스 사업자 &nbsp;<strong>Amazon Web Services, Inc., Naver Cloud</strong>
        </p>
        <p>© <strong>FANZY COMPANY Inc.</strong> Ver 2.32.6</p>
    </div>
</footer>


	<script>
    // 메인배너 출력
    let slides = document.querySelectorAll(".slide");
    let links = document.querySelectorAll(".slider-container a");
    let currentSlide = 0;

    function nextSlide() {
        slides[currentSlide].classList.remove("active");
        links[currentSlide].style.opacity = "0";
        
        setTimeout(() => {
            links[currentSlide].style.display = "none";
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add("active");
            links[currentSlide].style.display = "block";
            setTimeout(() => links[currentSlide].style.opacity = "1", 50);
        }, 500);
    }
    
    // 초기 상태 설정
    links.forEach((link, index) => {
        link.style.transition = "opacity 0.5s ease-in-out";
        if (index !== 0) {
            link.style.display = "none";
            link.style.opacity = "0";
        }
    });
    
    setInterval(nextSlide, 7000);



    // 아티스트 검색 모달
    const openSearchBtn = document.getElementById("openSearchBtn");
    const artistSearchModal = document.getElementById("artistSearchModal");
    const closeSearchBtn = document.getElementById("closeSearchBtn");

    // 모달 열기
    openSearchBtn.addEventListener("click", () => {
      artistSearchModal.classList.add("active");
    });

    // 모달 닫기
    closeSearchBtn.addEventListener("click", () => {
      artistSearchModal.classList.remove("active");
    });

    // 알파벳 버튼 클릭 시 필터링
    const alphaButtons = document.querySelectorAll(".alphabet-buttons button");
    const artistItems = document.querySelectorAll(".artist-item");

    alphaButtons.forEach(btn => {
      btn.addEventListener("click", () => {
 	    // 모든 버튼에서 active 클래스 제거
 	    alphaButtons.forEach(b => b.classList.remove("active"));
 	    // 클릭한 버튼에 active 클래스 추가
 	    btn.classList.add("active");

        const letter = btn.getAttribute("data-letter");
        artistItems.forEach(item => {
          const name = item.getAttribute("data-name") || "";
          if(letter === "ALL") {
            item.style.display = "flex";
          } else {
            if(name.trim().charAt(0).toUpperCase() === letter) {
              item.style.display = "flex";
            } else {
              item.style.display = "none";
            }
          }
        });
      });
    });

    // 아티스트 클릭 시 동작 (예: 모달 닫고 상세 페이지로 이동)
    artistItems.forEach(item => {
      item.addEventListener("click", () => {
        const artistName = item.getAttribute("data-name");
        const artistNo = item.getAttribute("data-no");
        //alert("선택된 아티스트: " + artistName + " (No: " + artistNo + ")");
        location.href = "/sprods?artistNo=" + artistNo;

        // 모달 닫기
        artistSearchModal.classList.remove("active");
      });
    });
	</script>
</body>
</html>
