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
    <title>아티스트 리스트</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <!-- 숍 이미지 뷰어 코드 -->
     <script src="/js/shopwriteviewer.js"></script>
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
    </style>
    
    <script>	  	
	  	const wbtn = () => {
	  		if($(".title").val().length<1){
	  			alert("상품 명을 입력하세요.")
	  			$(".title").focus();
	  			return;
	  		}
	  		writeFrm.submit();
	  	}
	  	
	  	const readContentUrl = (input) => {
	  		if(input.files && input.files[0]){
	  			var reader = new FileReader();
	  			reader.onload = function(e){
	  				document.getElementById("contentpreview").src = e.target.result;
	  			}
	  			reader.readAsDataURL(input.files[0]);
	  		}else{
	  				document.getElementById("contentpreview").src = "";
	  		}
	  	}
	  	
	  	const readSpinfoUrl = (input) => {
	  	    if (input.files && input.files[0]) {
	  	        var reader = new FileReader();
	  	        reader.onload = function(e) {
	  	            document.getElementById("spinfopreview").src = e.target.result;
	  	        }
	  	        reader.readAsDataURL(input.files[0]);
	  	    } else {
	  	        document.getElementById("spinfopreview").src = "";
	  	    }
	  	}
	  	
	  	const readImage1Url = (input) => {
	  	    if (input.files && input.files[0]) {
	  	        var reader = new FileReader();
	  	        reader.onload = function(e) {
	  	            document.getElementById("image1preview").src = e.target.result;
	  	        }
	  	        reader.readAsDataURL(input.files[0]);
	  	    } else {
	  	        document.getElementById("image1preview").src = "";
	  	    }
	  	}
	  	
	  	const readImage2Url = (input) => {
	  	    if (input.files && input.files[0]) {
	  	        var reader = new FileReader();
	  	        reader.onload = function(e) {
	  	            document.getElementById("image2preview").src = e.target.result;
	  	        }
	  	        reader.readAsDataURL(input.files[0]);
	  	    } else {
	  	        document.getElementById("image2preview").src = "";
	  	    }
	  	}
	  	
	  	const readImage3Url = (input) => {
	  	    if (input.files && input.files[0]) {
	  	        var reader = new FileReader();
	  	        reader.onload = function(e) {
	  	            document.getElementById("image3preview").src = e.target.result;
	  	        }
	  	        reader.readAsDataURL(input.files[0]);
	  	    } else {
	  	        document.getElementById("image3preview").src = "";
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
              <h4 class="page-title">아티스트관리</h4>
              <div class="ms-auto text-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">메인페이지</a></li>
                    <li class="breadcrumb-item active" aria-current="/aartistlist">
                      아티스트관리
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
                  <h5 class="card-title">아티스트등록</h5>
                  <div class="table-responsive">
                  	<form action="/shopwrite" name="writeFrm" method="post" enctype="multipart/form-data">
                    <table
                      id="zero_config"
                      class="table table-striped table-bordered"
                    >
                      <colgroup>
						  <col width="30%">
						  <col width="70%">
					  </colgroup>	
                      <tbody>
						<tr>
							<th>아티스트명</th>
							<td>
							<select name="artistDto.artist_no">
							    <c:forEach var="artist" items="${list}">
							        <option value="${artist.artist_no}">${artist.artist_group_name}</option>
							    </c:forEach>
							</select>
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
							  <select id="categorySelect" name="categorySelect" class="type" style="width:102px;">
							  	  <option value="">직접입력</option>
						          <option value="굿즈">굿즈</option>
						          <option value="의류">의류</option>
						          <option value="앨범">앨범</option>
						          <option value="한정판">한정판</option>
						      </select><br/><br/>
				              <input type="text" id="categoryInput" name="shop_category" class="type" 
        					   style="width:200px; height:30px; display:inline-block;" 
         					   placeholder="직접 입력하세요">
							</td>
						</tr>
	
						<tr>
							<th>상품명</th>
							<td><input type="text" name="shop_title" class="title" style="width:500px; height:30px;"></td>
						</tr>
						<tr>
							<th>상품설명</th>
							<td>
								<input type="text" name="shop_content" class="title" style="width:500px; height:30px;">
							</td>
						</tr>

			   	        <tr>
				  	        <th>이미지 보기</th>
				            <td>
				            <img id="contentpreview" style="width:500px">
				            </td>
				        </tr>
						<tr>
							<th>상품정보</th>
							<td>
								<input type="text" name="shop_spinfo" class="title" style="width:500px; height:30px;">
							</td>
						</tr>
			   	        <tr>
				  	        <th>이미지 보기</th>
				            <td>
				            <img id="spinfopreview" style="width:500px">
				            </td>
				        </tr>
   						<tr>
							<th>상품 이미지1</th>
							<td>
								<input type="text" name="shop_image1" class="title" style="width:500px; height:30px;">
							</td>
						</tr>
			   	        <tr>
				  	        <th>이미지 보기</th>
				            <td>
				            
				            <img id="image1preview" style="width:200px">
				            </td>
				        </tr>
   						<tr>
							<th>상품 이미지2</th>
							<td>
								<input type="text" name="shop_image2" class="title" style="width:500px; height:30px;">
							</td>
						</tr>
			   	        <tr>
				  	        <th>이미지 보기</th>
				            <td>
				            <img id="image2preview" style="width:200px">
				            </td>
				        </tr>
   						<tr>
							<th>상품 이미지3</th>
							<td>
								<input type="text" name="shop_image3" class="title" style="width:500px; height:30px;">
							</td>
						</tr>
			   	        <tr>
				  	        <th>이미지 보기</th>
				            <td>
				            <img id="image3preview" style="width:200px">
				            </td>
				        </tr>
			        	<tr>
							<th>가격</th>
							<td><input type="number" id="shop_price" name="shop_price" class="type" step="1000" style="width:150px;" min="0" placeholder="가격 입력"></td>
						</tr>
			        	<tr>
							<th>할인가격</th>
							<td><input type="number" id="shop_discount_price" name="shop_discount_price" class="type" style="width:150px;" min="0" placeholder="가격 입력"></td>
						</tr>
						
			        	<tr>
							<th>재고수량</th>
							<td><input type="number" name="shop_quantity" class="type" 
       								   style="width:150px;" min="0" placeholder="재고수량 입력"></td>
						</tr>
			        	<tr>
							<th>구매수량</th>
							<td><input type="number" name="shop_buylimit" class="type" 
       								   style="width:150px;" min="0" placeholder="구매수량 입력"></td>
						</tr>
				        
                      </tbody>
                      <tfoot>
						<button type="button" onclick="wbtn()" class="register-button">등록</button>
                      </tfoot>
                    </table>
                    </form>
					<button type="button" onclick="location.href='/shop'" class="register-button">취소</button>
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
    <script>
	   const categorySelect = document.getElementById('categorySelect');
	   const categoryInput = document.getElementById('categoryInput');
	
	   // 초기화: 기본값을 직접 입력 상태로 설정
	   categorySelect.value = "";
	   categoryInput.value = "";
	
	   categorySelect.addEventListener('change', function() {
	     const selected = this.value;
	     if (selected === "") {
	       categoryInput.value = "";
	       categoryInput.readOnly = false;
	       categoryInput.focus();
	     } else {
	       categoryInput.value = selected;
	       categoryInput.readOnly = true;
	     }
	   });
	   
	   const shopPrice = document.getElementById('shop_price');
	   const discountPrice = document.getElementById('shop_discount_price');

	   function updateDiscountPrice() {
	     const price = parseInt(shopPrice.value) || 0;
	     discountPrice.value = Math.round(price * 0.9);
	   }

	   shopPrice.addEventListener('input', updateDiscountPrice);
	   shopPrice.addEventListener('change', updateDiscountPrice);
    </script>
  </body>
</html>
