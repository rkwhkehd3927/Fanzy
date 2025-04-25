<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>약관 동의</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- 외부 CSS 연동 가능 (예: <link rel="stylesheet" href="css/terms.css" /> ) -->
    <style>
        /* 전체 영역 레이아웃 */
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-color: #f9f9f9;
        }
        
        .terms-container {
		      width: 600px;
		      height: 700px;
		      margin: 50px auto;
		      background-color: #fff;
		      border: 1px solid #ddd;
		      border-radius: 8px;
		      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
		      padding: 30px;
        }

        .terms-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
        }

        /* 전체동의 영역 */
        .terms-all-agree {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            background-color: #f5f5f5;
            padding: 15px;
            border-radius: 4px;
        }
        .terms-all-agree input[type="checkbox"] {
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }
        .terms-all-agree span {
            font-size: 16px;
            font-weight: 600;
        }

        /* 개별 약관 영역 */
        .terms-item {
            margin-bottom: 20px;
        }
        .terms-item-label {
            display: flex;
            align-items: center;
            cursor: pointer;
            margin-bottom: 8px;
        }
        .terms-item-label input[type="checkbox"] {
            width: 16px;
            height: 16px;
            margin-right: 8px;
        }
        .terms-item-label .title {
            font-size: 14px;
            font-weight: 600;
        }
        .terms-content {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 12px;
            font-size: 13px;
            line-height: 1.4;
            height: 80px; /* 스크롤이 필요한 경우 고정 높이 */
            overflow-y: auto;
        }

        /* 버튼 영역 */
        .btn-area {
            text-align: center;
            margin-top: 40px;
        }
        .btn-next {
            width: 100%;
            max-width: 480px;
            height: 48px;
            border: none;
            border-radius: 4px;
            background-color: #F5C3B2;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
        }
        .btn-next:hover {
        	color: #F5C3B2;
            background-color: #f5f5f5;
        }

    </style>
</head>
<body>
    <div class="terms-container">
        <h1 class="terms-title">약관 동의</h1>

        <!-- 전체 동의 -->
        <div class="terms-all-agree">
            <input type="checkbox" id="checkAll" />
            <span>전체 동의</span>
        </div>

        <!-- 개별 약관 항목 -->
        <div class="terms-item">
            <label class="terms-item-label" for="term1">
                <input type="checkbox" id="term1" name="term1" />
                <span class="title">[필수] 이용 약관 동의</span>
            </label>
            <div class="terms-content">
                (1) 본 약관은 회원이 사이트를 이용하는 데 필요한 권리, 의무 및 책임 사항을 규정합니다. 회원 가입 시 본 약관에 동의함으로써, 서비스 이용과 관련된 모든 정책을 준수해야 합니다.<br/>
               
            </div>
        </div>

        <div class="terms-item">
            <label class="terms-item-label" for="term2">
                <input type="checkbox" id="term2" name="term2" />
                <span class="title">[필수] 개인정보 수집 및 이용 동의</span>
            </label>
            <div class="terms-content">
                (2) 본 사이트는 회원의 원활한 서비스 이용을 위해 최소한의 개인정보(이름, 이메일, 연락처 등)를 수집하며, 해당 정보는 서비스 제공 및 운영 목적 이외의 용도로 사용되지 않습니다. 개인정보는 관련 법령에 따라 안전하게 관리됩니다.
            </div>
        </div>

        <div class="terms-item">
            <label class="terms-item-label" for="term3">
                <input type="checkbox" id="term3" name="term3" />
                <span class="title">[선택] 이벤트/마케팅 수신 동의</span>
            </label>
            <div class="terms-content">
                (3) 회원에게 유용한 정보(이벤트, 프로모션, 할인 혜택 등)를 제공하기 위해 이메일 또는 문자 메시지를 발송할 수 있습니다. 단, 해당 서비스는 선택 사항이며, 동의를 철회할 경우 언제든지 수신을 거부할 수 있습니다.
            </div>
        </div>

        <!-- 다음 버튼 -->
        <div class="btn-area">
            <button class="btn-next" onclick="submitTerms()">다음</button>
        </div>
    </div>

    <script>
        // 전체 동의 체크 시 개별 체크박스도 체크/해제
        const checkAll = document.getElementById('checkAll');
        const termCheckboxes = document.querySelectorAll('input[type="checkbox"][name^="term"]');

        checkAll.addEventListener('change', function() {
            termCheckboxes.forEach(chk => {
                chk.checked = checkAll.checked;
            });
        });

        // 개별 체크박스가 모두 체크되면 전체동의도 체크
        termCheckboxes.forEach(chk => {
            chk.addEventListener('change', function() {
                if ([...termCheckboxes].every(v => v.checked)) {
                    checkAll.checked = true;
                } else {
                    checkAll.checked = false;
                }
            });
        });

        // '다음' 버튼 클릭 시 폼 제출 혹은 다음 페이지 이동 로직
        function submitTerms() {
            // 필수 약관 체크 여부 확인 로직 (예: term1, term2)
            const requiredTerms = [document.getElementById('term1'), document.getElementById('term2')];
            const isAllRequiredChecked = requiredTerms.every(chk => chk.checked);

            if (!isAllRequiredChecked) {
                alert("필수 약관에 동의하셔야 진행 가능합니다.");
                return;
            }

            // 실제로 서버에 폼 제출이 필요하면 form 태그로 감싸고 submit
            // 지금은 예시이므로 alert 후 이동
            alert("약관에 모두 동의하셨습니다. 다음 단계로 이동합니다.");
            location.href = "/member"; // 실제 다음 페이지로 이동
        }
    </script>
</body>
</html>