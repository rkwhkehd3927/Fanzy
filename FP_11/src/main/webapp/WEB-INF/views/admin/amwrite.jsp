
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Matrix lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Matrix admin lite design, Matrix admin lite dashboard bootstrap 5 dashboard template"
    />
    <meta
      name="description"
      content="Matrix Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>공지사항</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- Favicon icon 
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="../assets/images/favicon.png"
    />
    -->
    <!-- Custom CSS -->
    <link
      rel="stylesheet"
      type="text/css"
      href="/css/multicheck.css"
    />
    <link
      href="/css/dataTables.bootstrap4.css"
      rel="stylesheet"
    />
    <link href="/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	.register-button {
    		width: 100px;
		    display: inline-block;
		    color: #7460ee;
		    text-decoration: none;
		    background-color: #fff;
		    border: 1px solid #dee2e6;
		    padding: 8px 16px;
		    font-size: 14px;
		    font-weight: bold;
		    border-radius: 4px;
		    transition: color 0.15s ease-in-out, 
		                background-color 0.15s ease-in-out, 
		                border-color 0.15s ease-in-out, 
		                box-shadow 0.15s ease-in-out;
		    cursor: pointer;
		}
		
		.register-button:hover {
		    background-color: #7460ee;
		    color: #fff;
		}
		    /* 전체 레이아웃 */
	    .signup-container {
	      width: 600px;
	      margin: 50px auto;
	      background-color: #fff;
	      border: 1px solid #ddd;
	      border-radius: 8px;
	      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	      padding: 30px;
	    }
	    .signup-title {
	      text-align: center;
	      font-size: 20px;
	      margin-bottom: 20px;
	      font-weight: bold;
	    }
	    .signup-form label {
	      display: block;
	      margin-top: 15px;
	      font-weight: 600;
	    }
	    .signup-form input[type="text"],
	    .signup-form input[type="password"],
	    .signup-form input[type="date"],
	    .signup-form select {
	      width: 100%;
	      height: 36px;
	      box-sizing: border-box;
	      margin-top: 5px;
	      padding: 0 8px;
	      font-size: 14px;
	    }
	    .signup-form .row-inline {
	      display: flex;
	      align-items: center;
	      gap: 8px;
	    }
	    .signup-form .row-inline input[type="text"] {
	      flex: 1;
	    }
	    .error-msg {
	      color: red;
	      font-size: 13px;
	      margin-top: 5px;
	      display: none; /* 기본은 숨김 */
	    }
	    /* 비밀번호 안내 문구/조건 충족 시 색상 변화 예시 */
	    .pw-msg {
	      font-size: 13px;
	      margin-top: 5px;
	      color: #999;
	    }
	    .pw-msg.valid {
	      color: green;
	    }
	    .pw-msg.invalid {
	      color: red;
	    }
	
	    /* 버튼 */
	    .btn-dup-check {
	      height: 36px;
	      padding: 0 12px;
	      background-color: #F5C3B2;
	      color: #fff;
	      border: none;
	      border-radius: 4px;
	      cursor: pointer;
	      font-size: 14px;
	      font-weight: 600;
	    }
	    .btn-dup-check:hover {
	 	  color: #F5C3B2;
	      background-color: #f5f5f5;
	    }
	    .btn-search {
	      height: 36px;
	      padding: 0 12px;
	      background-color: #4285f4;
	      color: #fff;
	      border: none;
	      border-radius: 4px;
	      cursor: pointer;
	      font-size: 14px;
	    }
	    .btn-search:hover {
	      background-color: #3074e6;
	    }
	    .btn-submit {
	      width: 100%;
	      height: 48px;
	      background-color: #F5C3B2;
	      color: #fff;
	      font-size: 16px;
	      font-weight: 600;
	      border: none;
	      border-radius: 4px;
	      margin-top: 30px;
	      cursor: pointer;
	    }
	    .btn-submit:hover {
	      color: #F5C3B2;
	      background-color: #f5f5f5;
	    }
	    .radio-group {
	      margin-top: 5px;
	    }
	    .radio-group label {
	      font-weight: normal;
	      margin-right: 15px;
	    }
	
	    /* 국가 선택 예시 (번호 표시) */
	    .country-select {
	      width: 100%;
	      margin-top: 5px;
	    }
	
	    /* 숨김 처리 (artistmembership=0) */
	    input[type="hidden"] {
	      display: none;
	    }
    </style>
    
    <script>	  		  	
	  	const readUrl = (input) => {
	  		if(input.files && input.files[0]){
	  			var reader = new FileReader();
	  			reader.onload = function(e){
	  				document.getElementById("preview").src = e.target.result;
	  			}
	  			reader.readAsDataURL(input.files[0]);
	  		}else{
	  				document.getElementById("preview").src = "";
	  		}
	  	}
	 </script>
  </head>

  <body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
      <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
      </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div
      id="main-wrapper"
      data-layout="vertical"
      data-navbarbg="skin5"
      data-sidebartype="full"
      data-sidebar-position="absolute"
      data-header-position="absolute"
      data-boxed-layout="full"
    >
      <!-- ============================================================== -->
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
          <div class="navbar-header" data-logobg="skin5">
            <!-- ============================================================== -->
            <!-- Logo -->
            <!-- ============================================================== -->
            <a class="navbar-brand" href="/">
              <!-- Logo icon -->
              <b class="logo-icon ps-2">
                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                <!-- Dark Logo icon -->
                <img
                  src="/images/tempLogo2.png"
                  alt="homepage"
                  class="light-logo"
                  width="80"
                />
              </b>
              <!--End Logo icon -->
              <!-- Logo text -->
                <!--
              <span class="logo-text ms-2">
                 dark Logo text 
                <img
                  src="../assets/images/logo-text.png"
                  alt="homepage"
                  class="light-logo"
                />
              </span>
                -->
              <!-- Logo icon -->
              <!-- <b class="logo-icon"> -->
              <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
              <!-- Dark Logo icon -->
              <!-- <img src="../assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->

              <!-- </b> -->
              <!--End Logo icon -->
            </a>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Toggle which is visible on mobile only -->
            <!-- ============================================================== -->
            <a
              class="nav-toggler waves-effect waves-light d-block d-md-none"
              href="javascript:void(0)"
              ><i class="ti-menu ti-close"></i
            ></a>
          </div>
          <!-- ============================================================== -->
          <!-- End Logo -->
          <!-- ============================================================== -->
          <div
            class="navbar-collapse collapse"
            id="navbarSupportedContent"
            data-navbarbg="skin5"
          >
            <!-- ============================================================== -->
            <!-- Right side toggle and nav items -->
            <!-- ============================================================== -->
          </div>
        </nav>
      </header>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <aside class="left-sidebar" data-sidebarbg="skin5">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
          <!-- Sidebar navigation-->
          <nav class="sidebar-nav">
            <ul id="sidebarnav" class="pt-4">
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="/aartistlist"
                  aria-expanded="false"
                  ><i class="mdi mdi-view-dashboard"></i
                  ><span class="hide-menu">리스트 관리</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="/aartist"
                  aria-expanded="false"
                  ><i class="mdi mdi-view-dashboard"></i
                  ><span class="hide-menu">아티스트 관리</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="/admin"
                  aria-expanded="false"
                  ><i class="mdi mdi-view-dashboard"></i
                  ><span class="hide-menu">회원관리</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="/shop"
                  aria-expanded="false"
                  ><i class="mdi mdi-chart-bar"></i
                  ><span class="hide-menu">굿즈샵관리</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="/concert"
                  aria-expanded="false"
                  ><i class="mdi mdi-chart-bar"></i
                  ><span class="hide-menu">콘서트관리</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="/notice"
                  aria-expanded="false"
                  ><i class="mdi mdi-chart-bar"></i
                  ><span class="hide-menu">공지관리</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="/event"
                  aria-expanded="false"
                  ><i class="mdi mdi-chart-bar"></i
                  ><span class="hide-menu">이벤트관리</span></a
                >
              </li>
            </ul>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
              <h4 class="page-title">공지관리</h4>
              <div class="ms-auto text-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">메인페이지</a></li>
                    <li class="breadcrumb-item active" aria-current="/aartist">
                      아티스트멤버관리
                    </li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
          <!-- ============================================================== -->
          <!-- Start Page Content -->
          <!-- ============================================================== -->
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">아티스트멤버등록</h5>
                  <div class="table-responsive">
				    <form class="signup-form" action="/amwrite" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
				      <div class="row-inline">
				      <!-- 소속팀 -->
			   		  <select name="artistDto.artist_no">
					      <c:forEach var="artist" items="${alist}">
					          <option value="${artist.artist_no}">${artist.artist_group_name}</option>
					      </c:forEach>
					  </select>
				      </div>
				      <!-- 아이디 -->
				      <label for="artistmember_id">아이디</label>
				      <div class="row-inline">
				        <input type="text" id="artistmember_id" name="artistmember_id" placeholder="아이디 입력" required />
				        <button type="button" class="btn-dup-check" onclick="checkDuplicate()">중복확인</button>
				      </div>
				      <span class="error-msg" id="id-error-msg">이미 사용 중인 아이디입니다.</span>
				      
				      <!-- 비밀번호 -->
				      <label for="artistmember_pw">비밀번호</label>
				      <input type="password" id="artistmember_pw" name="artistmember_pw" placeholder="비밀번호 (8 - 32자)" required />
				      <div class="pw-msg" id="pw-msg">8~32자 이내로 입력하세요.</div>
				      
				      <!-- 이름 -->
				      <label for="artistmember_name">이름</label>
				      <input type="text" id="artistmember_name" name="artistmember_name" placeholder="실명 입력" required />
				      
				      <!-- 닉네임 -->
				      <label for="artistmember_nickname">닉네임</label>
				      <input type="text" id="artistmember_nickname" name="artistmember_nickname" placeholder="닉네임 입력" required />
				      <span class="error-msg" id="nickname-error-msg" style="display: none;">이미 사용 중인 닉네임입니다.</span>
				      
				      <!-- 이메일 (아이디 + 도메인) -->
				      <label for="artistmember_email">이메일</label>
				      <div class="row-inline">
				        <input type="text" id="email_local" placeholder="이메일 아이디" style="flex:1" required />
				        <span>@</span>
				        <select id="email_domain" style="flex:1">
				          <option value="naver.com">naver.com</option>
				          <option value="gmail.com">gmail.com</option>
				          <option value="hanmail.net">hanmail.net</option>
				          <option value="hotmail.com">hotmail.com</option>
				        </select>
				      </div>
				      <!-- 실제 서버로 전송할 hidden input -->
				      <input type="hidden" id="artistmember_email" name="artistmember_email" required />
				      
				      <!-- 생년월일 -->
				      <label for="artistmember_birth">생년월일</label>
				      <input type="text" id="artistmember_birth" name="artistmember_birth" placeholder="YYYY-MM-DD" oninput="formatBirthDate(this)" required />
				      
				      <!-- 전화번호 -->
				      <label for="artistmember_phone">전화번호</label>
				      <input type="text" id="artistmember_phone" name="artistmember_phone" placeholder="010-1234-5678" oninput="formatPhone(this)" required />
				      
				      <!-- 성별 -->
				      <label for="artistmember_gender">성별</label>
				        <select id="artistmember_gender" name="artistmember_gender" required>
				          <option value="남자">남자</option>
				          <option value="여자">여자</option>
				        </select>
				              
				      <!-- 주소 -->
					  <label for="artistmember_address">주소</label>
				      <div class="row-inline">
								<input type="text" id="artistmember_postalCode" class="addressInput" name="artistmember_postalCode"
									placeholder="우편번호" style="width: 100px;" required /> 
								<input type="button" id="addAddressBtn"	class="btn-dup-check" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required />
					  </div><br>
					  <br> <input type="text" id="artistmember_address" placeholder="주소" required /><br>
				      <input type="text" id="detailAddress" placeholder="상세주소" required />
					  <input type="text" id="sample6_extraAddress" placeholder="참고항목" />
					  
					  <input type="hidden" id="full_address" name="artistmember_address"/>
				
				      <!-- 국가/지역 (번호 표시) -->
				      <label for="artistmember_country">국가/지역</label>
				      <select id="artistmember_country" name="artistmember_country" class="country-select" required>
				        <option value="대한민국">대한민국 (+82)</option>
				        <option value="일본">일본 (+81)</option>
				        <option value="미국">미국 (+1)</option>
				        <option value="중국">중국 (+86)</option>
				      </select>

					  <div class="row-inline">
   						<label for="artistmember_image">이미지</label>
								<input type="file" name="files" id="file" onchange="readUrl(this);">
					  </div>
			   	      <div class="row-inline">
   						<label>이미지 미리보기</label>
				            <img id="preview" style="width:1000px">
				      </div>
				      <button type="submit" class="btn-submit">가입하기</button>
				    </form>
				  </div>
					<button type="button" onclick="location.href='/aartist'" class="btn-submit">취소</button>
                </div>
              </div>
            </div>
          </div>
          <!-- ============================================================== -->
          <!-- End PAge Content -->
          <!-- ============================================================== -->
          <!-- ============================================================== -->
          <!-- Right sidebar -->
          <!-- ============================================================== -->
          <!-- .right-sidebar -->
          <!-- ============================================================== -->
          <!-- End Right sidebar -->
          <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
      <script>
	  
	  	let Duplicatecheck = false;
	  
	    function checkDuplicate() {
	      const artistmemberId = document.getElementById('artistmember_id').value.trim();
	      if(!artistmemberId) {
	        alert("아이디를 입력하세요.");
	        return;
	      }
	      
	      $.ajax({
	          url: '/checkartistmemberId',
	          type: 'POST',
	          data: { artistmemberId: artistmemberId },
	          dataType: 'json',
	          success: function(data) {
	            if (data.exists) {
	              $('#id-error-msg').show();
	              Duplicatecheck = false;
	            } else {
	              $('#id-error-msg').hide();
	              alert("사용 가능한 아이디입니다.");
	              Duplicatecheck = true;
	            }
	          },
	          error: function(xhr, status, error) {
	            console.error("Error:", error);
	          }
	        });
	    }
	    
	    // 비밀번호 길이 검사
	    const pwInput = document.getElementById('artistmember_pw');
	    const pwMsg = document.getElementById('pw-msg');
	    pwInput.addEventListener('input', () => {
	      const val = pwInput.value;
	      if(val.length >= 8 && val.length <= 32) {
	        pwMsg.textContent = "사용 가능한 비밀번호입니다.";
	        pwMsg.classList.add('valid');
	        pwMsg.classList.remove('invalid');
	      } else {
	        pwMsg.textContent = "8~32자 이내로 입력하세요.";
	        pwMsg.classList.add('invalid');
	        pwMsg.classList.remove('valid');
	      }
	    });
	    
	    // 닉네임 중복확인
	    let DuplicatecheckNickname = false;
		const nicknameInput = document.getElementById('artistmember_nickname');
		const nicknameErrorMsg = document.getElementById('nickname-error-msg');
		
		nicknameInput.addEventListener('blur', function() {
		    const artistmemberNickname = nicknameInput.value.trim();
		    if (artistmemberNickname !== '') {
		        $.ajax({
		            url: '/checkartistmemberNickname',
		            type: 'POST',
		            data: { artistmemberNickname: artistmemberNickname },
		            dataType: 'json',
		            success: function(data) {
		                if (data.exists) {
		                    nicknameErrorMsg.style.display = 'block';
		                    DuplicatecheckNickname = false;
		                } else {
		                    nicknameErrorMsg.style.display = 'none';
		                    DuplicatecheckNickname = true;
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error("Error:", error);
		            }
		        });
		    }
		});
	
	    // 이메일 domain과 local 합쳐서 hidden input으로 전달
	    const emailLocal = document.getElementById('email_local');
	    const emailDomain = document.getElementById('email_domain');
	    const emailHidden = document.getElementById('artistmember_email');
	    function updateEmail() {
	      emailHidden.value = emailLocal.value + "@" + emailDomain.value;
	    }
	    emailLocal.addEventListener('input', updateEmail);
	    emailDomain.addEventListener('change', updateEmail);
	
	    // 생년월일 자동 포맷 (YYYY-MM-DD)
	    function formatBirthDate(obj) {
	      // 모든 숫자 이외의 문자는 제거
	      let val = obj.value.replace(/\D/g, '');
	      
	      // 4자리 이상이면 'YYYY-' 형태로 만들어주기
	      if (val.length >= 4) {
	        val = val.slice(0,4) + '-' + val.slice(4);
	      }
	      // 7자리 이상이면 'YYYY-MM-' 형태로 만들어주기
	      if (val.length >= 7) {
	        val = val.slice(0,7) + '-' + val.slice(7);
	      }
	      
	      // 최대 10자리까지만 허용 (YYYY-MM-DD)
	      if (val.length > 10) {
	        val = val.slice(0,10);
	      }
	      
	      obj.value = val;
	    }
	
	    // 전화번호 자동 포맷 (010-1234-5678)
	    function formatPhone(obj) {
	      // 숫자 이외의 문자는 제거
	      let val = obj.value.replace(/\D/g, '');
	      
	      let result = '';
	      
	      // 3자리 이하
	      if (val.length < 4) {
	        result = val;
	      }
	      // 7자리 이하 (3자리 + - + 나머지)
	      else if (val.length < 8) {
	        result = val.slice(0,3) + '-' + val.slice(3);
	      }
	      // 그 이상 (3자리 + - + 4자리 + - + 나머지)
	      else {
	        result = val.slice(0,3) + '-' + val.slice(3,7) + '-' + val.slice(7,11);
	      }
	
	      obj.value = result;
	    }
	    
	     function sample6_execDaumPostcode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                 var addr = '';
	                 var extraAddr = '';
	                 if (data.userSelectedType === 'R') {
	                     addr = data.roadAddress;
	                 } else {
	                     addr = data.jibunAddress;
	                 }
	                 if(data.userSelectedType === 'R'){
	                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                         extraAddr += data.bname;
	                     }
	                     if(data.buildingName !== '' && data.apartment === 'Y'){
	                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                     }
	                     if(extraAddr !== ''){
	                         extraAddr = ' (' + extraAddr + ')';
	                     }
	                     document.getElementById("sample6_extraAddress").value = extraAddr;
	                 } else {
	                     document.getElementById("sample6_extraAddress").value = '';
	                 }
	                 document.getElementById('artistmember_postalCode').value = data.zonecode;
	                 document.getElementById("artistmember_address").value = addr;
	                 document.getElementById("detailAddress").focus();
	             }
	         }).open();
	     }
	     
	     function updateAddress() {
	    	  const mainAddress = document.getElementById("artistmember_address").value;
	    	  const detailAddress = document.getElementById("detailAddress").value;
	    	  
	    	  let fullAddress = mainAddress;
	    	  if(detailAddress){
	    		  fullAddress += " " + detailAddress;
	    	  }
	    	  
	    	  document.getElementById("full_address").value = fullAddress;
		 }
	     
	    // 폼 최종 검증
	    function validateForm() {
	      // 중복확인
	      if(!Duplicatecheck){
	    	  alert("아이디 중복확인을 해주세요.");
	    	  return false;
	      }
	      
	      // 비밀번호 유효성
	      const pwVal = pwInput.value;
	      if(pwVal.length < 8 || pwVal.length > 32) {
	        alert("비밀번호는 8~32자 이내로 입력해주세요.");
	        pwInput.focus();
	        return false;
	      }
	      
	      // 닉네임 중복확인
	      if(!DuplicatecheckNickname){
	    	  alert("닉네임이 중복됩니다. 다시 입력해주세요.");
	    	  return false;
	      }
	      
	      // 이메일 값 업데이트
	      updateEmail();
	      
	      // 주소 값 업데이트
	      updateAddress();
	      
	      return true; // 통과 시 폼 전송
	    }
	  </script>
    <script src="/js/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/js/bootstrap.bundle.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="/js/perfect-scrollbar.jquery.min.js"></script>
    <script src="/js/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="/js/custom.min.js"></script>
    <!-- this page js -->
    <script src="/js/datatable-checkbox-init.js"></script>
    <script src="/js/jquery.multicheck.js"></script>
    <script src="/js/datatables.min.js"></script>
    <script>
      /****************************************
       *       Basic Table                   *
       ****************************************/
      $("#zero_config").DataTable();
    </script>
  </body>
</html>
