<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>상품주문</title>
<link rel="stylesheet" as="style" crossorigin	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/css/updownstyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/* 기본 스타일 리셋 */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: "Pretendard Variable", sans-serif;
	background-color: #F7F7FA; /* 대충 회색 배경 */
	padding: 20px;
}

/* 메인 컨테이너: 왼쪽, 오른쪽 분할 */
.wrapper {
	display: flex;
	max-width: 1200px;
	margin: 0 auto;
}

/* 왼쪽 컬럼 */
.left-col {
	width: 60%;
	margin-right: 20px;
}
/* 오른쪽 컬럼 (sticky) */
.right-col {
	width: 40%;
	position: sticky;
	top: 20px; /* 스크롤 내려도 이 위치에 고정 */
	align-self: flex-start; /* 내용 위쪽 정렬 */
}

/* 각 섹션 박스 스타일 */
.box {
	background-color: #fff;
	border: 1px solid #000; /* 사진처럼 검은색 테두리 */
	margin-bottom: 20px;
	padding: 15px;
	border-radius: 10px; /* 둥글둥글하게 */
}

/* 박스 제목 */
.box h3 {
	margin-bottom: 10px;
	font-size: 1rem;
	font-weight: bold;
}

/* 간단한 라벨 스타일 */
label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

/* input, select 등 */
input[type="text"], select, #rewardInput {
	width: 100%;
	padding: 5px;
	margin-bottom: 5px;
	border: 1px solid #ccc;
	font-size: 0.9rem;
	border-radius: 5px; /* 둥글둥글하게 */
}

/* Add 버튼 등 */
.box #confirmBtn, #addAddressBtn {
	padding: 5px 10px;
	background-color: #444;
	color: #fff;
	border: none;
	cursor: pointer;
	font-size: 0.8rem;
	border-radius: 5px; /* 둥글둥글하게 */
}

/* 오른쪽 패널(가격, confirm) */
.price-info {
	margin-bottom: 20px;
}

.price-info p {
	margin-bottom: 5px;
	font-size: 0.9rem;
}

#confirmBtn {
	width: 100%;
	padding: 10px;
	background-color: #f5c3b2;
	border: none;
	color: #fff;
	font-size: 1rem;
	cursor: pointer;
	border-radius: 5px; /* 둥글둥글하게 */
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

</style>

<c:if test="${empty mdto}">
  <script>
    alert("로그인 하셔야 구매가 가능합니다.");
    location.href = "/login";
  </script>
</c:if>

</head>
<body>



	<div class="wrapper">
	
		<!-- 왼쪽 컬럼 -->
		<div class="left-col">

			<!-- 주문정보 노출 DIV -->
<div class="box">
    <h3>Order (Product name)</h3>

    <c:choose>
        <c:when test="${not empty cartList}">
            <!-- 🏷 총 구매 금액 & 총 구매 개수 변수 초기화 -->
            <c:set var="totalPrice" value="0"/>
            <c:set var="totalQuantity" value="0"/>  <!-- ✅ 총 주문 개수 추가 -->

            <!-- 빈 Map 생성 (상품을 그룹화하여 합산하기 위해) -->
            <c:set var="mergedItems" value="<%= new java.util.LinkedHashMap<String, java.util.Map<String, Object>>() %>" />

            <!-- 장바구니 아이템 그룹화 및 수량 합산 -->
            <c:forEach var="cart" items="${cartList}">
                <c:forEach var="item" items="${cart.parsedCartItems}">
                    <c:set var="key" value="${item['shop_title']}" />
                    <input type="hidden" id="productId" value="${cartList[0].parsedCartItems[0]['shop_id']}">
                    <c:choose>
                        <c:when test="${mergedItems[key] != null}">
                            <!-- 기존 아이템이 존재하면 수량을 합산 -->
                            <c:set target="${mergedItems[key]}" property="shop_quantity"
                                   value="${mergedItems[key].shop_quantity + item['shop_quantity']}" />
                        </c:when>
                        <c:otherwise>
                            <!-- 새로운 아이템이면 Map에 추가 -->
                            <c:set target="${mergedItems}" property="${key}" value="${item}" />
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:forEach>

            <!-- 🛒 합산된 아이템 출력 -->
            <c:forEach var="entry" items="${mergedItems}">
                <c:set var="item" value="${entry['value']}" />

                <!-- ✅ 각 상품의 가격을 총 구매 금액에 합산 -->
                <c:set var="totalPrice" value="${totalPrice + (item['shop_price'] * item['shop_quantity'])}"/>

                <!-- ✅ 총 주문 개수도 합산 -->
                <c:set var="totalQuantity" value="${totalQuantity + item['shop_quantity']}"/>

                <div class="cart-item">
                    <p>상품명: ${item['shop_title']}</p>
                    <p>주문개수: <fm:formatNumber value="${item['shop_quantity']}" pattern="#,###"/>개</p>
                    <p>상품가격: <fm:formatNumber value="${item['shop_price'] * item['shop_quantity']}" pattern="#,###"/> ₩</p>
                </div>
                <hr>
            </c:forEach>

            <!-- ✅ 모든 상품의 가격을 합산한 총 구매 금액 출력 -->
            <div>
                <p><strong>총 구매금액:</strong> <fm:formatNumber value="${totalPrice}" pattern="#,###"/> ₩</p>
                <c:set var="finalTotalPrice" value="${totalPrice}"/>
            </div>
        </c:when>

        <c:otherwise>
            <!-- 🛍️ 장바구니가 없을 경우 (단일 상품 주문) -->
            <p>상품번호: ${param.sprodId}</p>
            <p>상품명: ${sdto.shop_title}</p>
            <p>주문개수: ${param.quantity}개</p>
            <p>상품가격: <fm:formatNumber value="${appliedPrice * param.quantity}" pattern="#,###" /> ₩</p>
            <hr/>
            <div>
                <p><strong>총 구매금액:</strong> <fm:formatNumber value="${appliedPrice * param.quantity}" pattern="#,###"/> ₩</p>
                <c:set var="finalTotalPrice" value="${appliedPrice * param.quantity}"/>
            </div>

            <!-- ✅ 단일 주문일 경우 총 주문 개수를 param.quantity로 설정 -->
            <c:set var="totalQuantity" value="${param.quantity}"/>
        </c:otherwise>
    </c:choose>

    <!-- ★★★ orderProductName 설정: sdto가 있으면 sdto.shop_title, 없으면 cartList 첫 번째 상품 이름 사용 -->
    <c:choose>
        <c:when test="${not empty sdto and not empty sdto.shop_no}">
            <c:set var="orderProductName" value="${sdto.shop_no}" />
        </c:when>
        <c:otherwise>
            <c:set var="orderProductName" value="${cartList[0].parsedCartItems[0].shop_no}" />
        </c:otherwise>
    </c:choose>

    <!-- ✅ totalPriceValue, totalQuantity, 그리고 orderProductName을 hidden input으로 설정 -->
    <input type="hidden" id="totalPriceValue" value="${finalTotalPrice}"/>
    <input type="hidden" id="totalQuantity" value="${totalQuantity}"/>
    <input type="hidden" id="orderProductName" value="${orderProductName}"/>
</div>

			<!-- 고객정보 노출 DIV -->
			<div class="box">
				<h3>주문자</h3>
				<p>${mdto.member_name}</p>
				<p>${mdto.member_email}</p>
			</div>

			<!-- 주소 입력 DIV -->
			<div class="box">
			    <h3>주소</h3>
			    <input type="text" id="sample6_postcode" class="addressInput"
			        placeholder="우편번호"
			        value="${selectedAddress != null ? selectedAddress.address_postalCode : ''}">
			    <input type="button" id="addAddressBtn" onclick="FindDaumPostcode()" value="우편번호 찾기">
			    <br><br>
			    <input type="text" id="src_address" placeholder="주소"
			        value="${selectedAddress != null ? selectedAddress.address_address : ''}">
			    <br>
			    <input type="text" id="refAddress" placeholder="참고항목">
			</div>

			<!-- 배송옵션 DIV -->
			<div class="box">
			  <h3>배송</h3>
			  <div id="shippingOptions">
			    <!-- 한국 내 배송 (70,000원 이상) -->
			    <div id="shipping-korea-free" style="display:none;">
			      <p>배송비: <strong>무료</strong></p>
			      <input type="hidden" id="shippingSelect" value="0">
			    </div>
			    
			    <!-- 한국 내 배송 (70,000원 미만) -->
			    <div id="shipping-korea-paid" style="display:none;">
			      <p>배송비: <strong>3,000원</strong> (국내배송)</p>
			      <input type="hidden" id="shippingSelect" value="3000">
			    </div>
			    
			    <!-- 해외 배송 -->
			    <div id="shipping-international" style="display:none;">
			      <p>배송비: <strong>0원</strong></p>
			      <input type="hidden" id="shippingSelect" value="30000">
			    </div>
			  </div>
			</div>

			<!-- 적립금 사용 DIV -->
			<div class="box">
			  <h3>적립금 사용</h3>
			  <label for="rewardInput" id="rewardLabel">
				  적용할 금액 입력 (최대 <fm:formatNumber value="${appliedPrice * param.quantity}" pattern="#,###" />₩ 사용가능)
			  </label>
			  <p>보유 적립금: ${mdto.member_mileage}</p>
			  <p id="errorMessage" style="color: red; display: none;">보유 적립금보다 많은 금액은 입력할 수 없습니다.</p>
				<input type="number"
				       id="rewardInput"
				       min="0"
				       max="${Math.floor(appliedPrice * param.quantity * 0.01)}"
				       placeholder="사용할 적립금 입력">
			</div>

			<!-- 결제수단 선택 DIV -->
			<div class="box">
				<h3>결제수단</h3>
				<select id="paymentMethod">
					<option value="kakaopay">카카오페이</option>
					<option value="tosspay">토스페이</option>
				</select>
			</div>
		</div>
		<!-- 왼쪽섹션 -->

		<!-- 오른쪽 정보, 구매버튼 -->
		<div class="right-col">
			<div class="box price-info">
			    <p><strong>가격 정보</strong></p>
			    <p>상품 가격: <span id="productPrice"><fm:formatNumber value="${appliedPrice * param.quantity}" pattern="#,###" /> ₩</span></p>
			    <p>배송비: <span id="shippingFee">0 ₩</span></p>
			    <p>적립금 사용: <span id="rewardDiscount">0 ₩</span></p>
			    <hr>
			    <p><strong>총 결제금액: <span id="totalPrice"><fm:formatNumber value="${appliedPrice * param.quantity}" pattern="#,###" /> ₩</span></strong></p>
			</div>
			<div id="confirmBtn" onclick="buyBtn()">구매</button>
		</div>
	</div>
	
<script>
$(document).ready(function() {
    // 가격 및 국가 정보
    const country = "${mdto.member_country}";
    const productPrice = 
        <c:choose>
            <c:when test="${not empty sdto}">
            	${appliedPrice * param.quantity}
            </c:when>
            <c:otherwise>
                ${totalPrice}
            </c:otherwise>
        </c:choose>;
    
    console.log("국가:", country, "상품가격:", productPrice);
    
    // 배송 옵션 표시 (조건에 따라)
    if (country === "대한한국") {
        if (productPrice >= 70000) {
            // 7만원 이상 무료배송
            $("#shipping-korea-free").show();
        } else {
            // 7만원 미만 3천원
            $("#shipping-korea-paid").show();
        }
    } else {
        // 한국 외 모든 국가는 3만원
        $("#shipping-international").show();
    }
    
    // 가격 계산 함수
    window.updatePrices = function() {
        const shippingFee = parseInt($("#shippingSelect").val() || 0);
        const rewardDiscount = parseInt($("#rewardInput").val() || 0);
        
        // 총 금액 계산
        const totalPrice = productPrice + shippingFee - rewardDiscount;
        
        // 화면 업데이트
        $("#productPrice").text(productPrice.toLocaleString() + ' ₩');
        $("#shippingFee").text(shippingFee.toLocaleString() + ' ₩');
        $("#rewardDiscount").text('-' + rewardDiscount.toLocaleString() + ' ₩');
        $("#totalPrice").text(totalPrice.toLocaleString() + ' ₩');
        
        // 전역 변수에 저장
        window.calculatedTotalPrice = totalPrice;
        window.selectedShippingFee = shippingFee;
        window.usedReward = rewardDiscount;
    };
    
    // 적립금 입력 처리
    $("#rewardInput").on('input', function() {
        const inputVal = Number($(this).val());
        const availableMileage = Number(${mdto.member_mileage});
        const maxUsableMileage = Math.min(
        	    availableMileage, 
        	    Math.floor(productPrice * 0.01)
        	);
        
        // 입력값 검증
        if (inputVal > availableMileage) {
            $("#errorMessage").text("보유 적립금보다 많은 금액은 입력할 수 없습니다.");
            $("#errorMessage").show();
            $(this).val(availableMileage);
        } else if (inputVal > maxUsableMileage) {
            $("#errorMessage").text("주문 금액의 최대 1%까지만 사용할 수 있습니다.");
            $("#errorMessage").show();
            $(this).val(maxUsableMileage);
        } else {
            $("#errorMessage").hide();
        }
        
        // 가격 갱신
        window.updatePrices();
    });
    
    // 초기 가격 계산
    window.updatePrices();
});

// 우편번호 검색 함수
function FindDaumPostcode() {
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
                document.getElementById("refAddress").value = extraAddr;
            
            } else {
                document.getElementById("refAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("src_address").value = addr;
            document.getElementById("src_detailAddress").focus();
        }
    }).open();
}

// 구매 버튼 클릭
// sptwind.jsp 파일의 buyBtn 함수 부분 수정

function buyBtn() {
    if(confirm("상품을 구매하시겠습니까?")) {
        // 주소 입력 여부 확인
        if(!$("#src_address").val() || !$("#sample6_postcode").val()) {
            alert("배송지 주소를 입력해주세요.");
            return;
        }
        
        // 구매 수량 변수 설정
        const purchaseQuantity = 
	    <c:choose>
	        <c:when test="${not empty quantity}">
	            ${quantity}
	        </c:when>
	        <c:otherwise>
	            ${totalQuantity}
	        </c:otherwise>
	    </c:choose>;
	    console.log("구매 수량:", purchaseQuantity);
        
        // 결제 데이터 준비
        let buyData = {
        		name: "${orderProductName}",
            totalPrice: window.calculatedTotalPrice || ${appliedPrice * param.quantity},
            order_total_amount: purchaseQuantity, // 여기에 수량 저장
            order_product_price: 
            	<c:choose>
            	    <c:when test="${not empty sdto}">
            	        ${sdto.shop_price}
            	    </c:when>
            	    <c:otherwise>
            	        ${totalPrice}
            	    </c:otherwise>
            	</c:choose>,
 // 단가 저장
            order_shipping_fee: window.selectedShippingFee || 0,
            order_used_reward: window.usedReward || 0,
            order_address: $("#src_address").val(),
            order_zipcode: $("#sample6_postcode").val(),
            order_detail_address: "${param.sprodId}" || 112322323, // 상품번호를 임시로 저장
            order_payment_method: $("#paymentMethod").val(),
            orderQuantity: purchaseQuantity // 추가 파라미터로 수량 전달
        };
        
        // AJAX로 결제 API 호출
        $.ajax({
            url: '/pay/orderPay',
            type: 'POST',
            data: buyData,
            dataType: 'json',
            success: function(data) {
                console.log(data);
                location.href = data.next_redirect_pc_url;
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert("결제 요청 중 오류가 발생했습니다: " + error);
            }
        });
    } else {
        alert("결제가 취소되었습니다.");
    }
};
</script>
</body>
</html>
