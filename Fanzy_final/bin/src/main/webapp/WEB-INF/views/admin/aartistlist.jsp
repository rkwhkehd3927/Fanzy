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
    <title>리스트관리</title>
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
	   		width: 150px;
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
		/* 스위치 전체 컨테이너 */
		.switch {
		  position: relative;
		  display: inline-block;
		  width: 60px;      /* 토글 폭 */
		  height: 30px;     /* 토글 높이 */
		}
		
		/* 기본 체크박스는 숨기기 */
		.switch input {
		  opacity: 0;       /* 투명도 0으로 숨김 */
		  width: 0;
		  height: 0;
		  margin: 0;
		  padding: 0;
		}
		
		/* 슬라이더 영역 (토글의 트랙) */
		.slider {
		  position: absolute;
		  cursor: pointer;
		  top: 0; left: 0; right: 0; bottom: 0;
		  background-color: #ccc; /* OFF 상태 배경 */
		  transition: .4s;
		  border-radius: 30px;    /* 둥근 모서리 */
		  overflow: hidden;       /* ON/OFF 텍스트가 영역을 벗어나지 않도록 */
		}
		
		/* 슬라이더 내부의 원(핸들) */
		.slider:before {
		  content: "";
		  position: absolute;
		  height: 26px;
		  width: 26px;
		  left: 2px;
		  bottom: 2px;
		  background-color: #fff; 
		  transition: .4s;
		  border-radius: 50%;
		}
		
		/* ON, OFF 텍스트 스타일 */
		.on, .off {
		  position: absolute;
		  width: 50%;          /* 슬라이더 폭의 절반씩 차지 */
		  text-align: center;
		  top: 50%;
		  transform: translateY(-50%);
		  font-size: 12px;
		  font-weight: bold;
		  color: #fff;
		  pointer-events: none; /* 텍스트에 클릭 이벤트가 걸리지 않도록 */
		}
		
		.on {
		  left: 0;
		}
		
		.off {
		  right: 0;
		}
		
		/* 체크 상태(ON)일 때 배경색 변경 */
		.switch input:checked + .slider {
		  background-color: #F5C3B2; /* ON 상태 배경색 */
		}
		
		/* 체크 상태(ON)일 때 핸들 이동 */
		.switch input:checked + .slider:before {
		  transform: translateX(30px);
		}
		
    </style>
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
        <h4 class="page-title">회원관리</h4>
        <div class="ms-auto text-end">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/">메인페이지</a></li>
              <li class="breadcrumb-item active" aria-current="/aartistlist">
                리스트관리
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
            <h5 class="card-title">아티스트 전체리스트</h5>
            <div class="table-responsive">
              <table
                id="zero_config"
                class="table table-striped table-bordered"
              >
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>아티스트 명</th>
                    <th>게시 여부</th>
                  </tr>
                </thead>
                <tbody>
                <c:if test="${not empty list}">
				 <c:forEach items="${list}" var="adto">
			       <tr>
			         <td>${adto.artist_no}</td>
		             <td>
				         	<img src="images/${adto.artist_group_image}"
			         	alt="아티스트 이미지" style="width:60px; height:60px; object-fit:cover; margin-right:10px;">
			         	${adto.artist_group_name}</td>
			         </td>
			         <td>         
						<label class="switch">
						    <!-- 체크박스: 기존에 쓰던 클래스와 data-artistno 그대로 유지 -->
						    <input 
						        type="checkbox"
						        class="toggle-display" 
						        data-artistno="${adto.artist_no}"
						        ${adto.display ? 'checked' : ''}
						    />
						    <!-- 토글 스위치 UI (슬라이더) -->
						    <span class="slider">
						        <span class="on">ON</span>
						        <span class="off">OFF</span>
						    </span>
						</label>
              		 </td>
			       </tr>
			     </c:forEach>
                   </c:if>
                   <c:if test="${empty list }">
                     <tr>
                	     <td colspan="5" style="text-align: center;">아티스트 정보가 없습니다.</td>
                     </tr>
                   </c:if>
                </tbody>
                <tfoot>
                  <tr>
                    <th>번호</th>
                    <th>아티스트 명</th>
                    <th>게시 여부</th>
                        </tr>
                      </tfoot>
                    </table>
                    <button type="button" class="register-button" onclick="location.href='/awrite'">등록</button>
                  </div>
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
	    document.querySelectorAll('.toggle-display').forEach(function(checkbox) {
	        checkbox.addEventListener('change', function() {
	            var artistNo = this.getAttribute('data-artistno');
	            var display = this.checked;
	            
	            // AJAX를 사용해 토글 상태를 서버에 업데이트
	            fetch('/toggleArtistDisplay', {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                    // CSRF 토큰 헤더가 필요하다면 추가
	                },
	                body: JSON.stringify({ artist_no: artistNo, display: display })
	            })
	            .then(response => {
	                if(response.ok) {
	                    // 성공 메시지 표시 등 추가 로직
	                    console.log('업데이트 성공');
	                } else {
	                    console.error('업데이트 실패');
	                }
	            })
	            .catch(error => console.error('에러 발생:', error));
	        });
	    });
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
