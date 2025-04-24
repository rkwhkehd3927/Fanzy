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
    <title>이벤트관리</title>
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
                  href="/ticket"
                  aria-expanded="false"
                  ><i class="mdi mdi-chart-bar"></i
                  ><span class="hide-menu">티켓샵관리</span></a
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
              <h4 class="page-title">이벤트관리</h4>
              <div class="ms-auto text-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">메인페이지</a></li>
                    <li class="breadcrumb-item active" aria-current="/event">
                      이벤트관리
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
                  <h5 class="card-title">이벤트 리스트</h5>
                  <div class="table-responsive">
                    <table
                      id="zero_config"
                      class="table table-striped table-bordered"
                    >
                      <thead>
                        <tr>
                          <th>No</th>
                          <th>제목</th>
                          <th>내용</th>
                          <th>등록일</th>
                          <th>아티스트명</th>
                        </tr>
                      </thead>
                      <tbody>
                       	 <c:if test="${not empty list}">
						 <c:forEach items="${list}" var="edto">
					       <tr>
					         <td>${edto.event_no}</td>
					         <td><a href="/eventInfo?event_no=${edto.event_no}">${edto.event_title}</a></td>
					         <td>${edto.event_content }</td>
					         <td>${edto.event_date}</a></td>
					         <td>${edto.artistDto.artist_group_name}</a></td>
					       </tr>
					     </c:forEach>
                         </c:if>
                         <c:if test="${empty list }">
                           <tr>
                      	     <td colspan="5" style="text-align: center;">게시글이 없습니다.</td>
                           </tr>
                         </c:if>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th>No</th>
                          <th>제목</th>
                          <th>내용</th>
                          <th>등록일</th>
                          <th>아티스트명</th>
                        </tr>
                      </tfoot>
                    </table>
                    <button type="button" class="register-button" onclick="location.href='/ewrite'">등록</button>
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
