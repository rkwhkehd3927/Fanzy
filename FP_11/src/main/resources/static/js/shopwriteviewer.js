// 이미지 링크
var baseurl = "https://lh3.googleusercontent.com/d/"

$(document).ready(function() {
	// 상품설명 포커스가 끝나면 (입력 완료시)
	$('input[name="shop_content"]').blur(updateURL1);
    // 또는 엔터키 이벤트
    $('input[name="shop_content"]').keypress(function(e) {
      if (e.which === 13) { // 13은 엔터키의 keyCode
        updateURL1();
      }
    });
	
	// 상품정보 포커스가 끝나면 (입력 완료시)
	$('input[name="shop_spinfo"]').blur(updateURL2);
    $('input[name="shop_spinfo"]').keypress(function(e) {
      if (e.which === 13) { // 13은 엔터키의 keyCode
        updateURL2();
      }
    });
	
	// 상품이미지1 포커스가 끝나면 (입력 완료시)
	$('input[name="shop_image1"]').blur(updateURL3);
    $('input[name="shop_image1"]').keypress(function(e) {
      if (e.which === 13) { // 13은 엔터키의 keyCode
        updateURL3();
      }
    });
	
	// 상품이미지2 포커스가 끝나면 (입력 완료시)
	$('input[name="shop_image2"]').blur(updateURL4);
    $('input[name="shop_image2"]').keypress(function(e) {
      if (e.which === 13) { // 13은 엔터키의 keyCode
        updateURL4();
      }
    });
	
	// 상품이미지3 포커스가 끝나면 (입력 완료시)
	$('input[name="shop_image3"]').blur(updateURL5);
    // 또는 엔터키
    $('input[name="shop_image3"]').keypress(function(e) {
      if (e.which === 13) { // 13은 엔터키의 keyCode
        updateURL5();
      }
    });
	

// url 변경 script
function updateURL1() {
    const inputValue = $('input[name="shop_content"]').val();
    const outputUrl = baseurl + inputValue;
    console.log(outputUrl)
    // img의 src 속성 업데이트
    $('#contentpreview').attr('src', outputUrl);
    console.log("이미지 주소 업데이트 완료")
};

// url 변경 script

function updateURL2() {
    const inputValue = $('input[name="shop_spinfo"]').val();
    const outputUrl = baseurl + inputValue;
    console.log(outputUrl)
    // img의 src 속성 업데이트
    $('#spinfopreview').attr('src', outputUrl);
    console.log("이미지 주소 업데이트 완료")
};

// url 변경 script
function updateURL3() {
    const inputValue = $('input[name="shop_image1"]').val();
    const outputUrl = baseurl + inputValue;
    console.log(outputUrl)
    // img의 src 속성 업데이트
    $('#image1preview').attr('src', outputUrl);
    console.log("이미지 주소 업데이트 완료")
};

// url 변경 script
function updateURL4() {
    const inputValue = $('input[name="shop_image2"]').val();
    const outputUrl = baseurl + inputValue;
    console.log(outputUrl)
    // img의 src 속성 업데이트
    $('#image2preview').attr('src', outputUrl);
    console.log("이미지 주소 업데이트 완료")
};

// url 변경 script
function updateURL5() {
    const inputValue = $('input[name="shop_image3"]').val();
    const outputUrl = "${baseurl}" + inputValue;
    console.log(outputUrl)
    // img의 src 속성 업데이트
    $('#image3preview').attr('src', outputUrl);
    console.log("이미지 주소 업데이트 완료")
};

}); // jquery