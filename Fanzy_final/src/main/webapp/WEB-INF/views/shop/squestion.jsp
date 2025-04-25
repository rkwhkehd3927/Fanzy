<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
  <title>문의하기</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    body {
      background-color: #f8f9fa;
      margin: 30px;
      font-family: "Pretendard Variable", sans-serif;
    }
    .container {
      max-width: 600px;
      margin: 0 auto;
    }


    h1 {
      font-size: 2rem;
      font-weight: bold;
      margin-bottom: 1.5rem;
      text-align: center;
    }
    label {
      display: block;
      font-size: 1rem;
      font-weight: 600;
      margin-bottom: 8px;
    }
    select, input[type="text"], textarea, input[type="file"], input[type="email"] {
      width: 100%;
      font-size: 1rem;
      padding: 15px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 10px; /* 둥글둥글하게 */
      outline: none;
    }
    select:focus, input[type="text"]:focus, textarea:focus, input[type="file"]:focus {
      border-color: #000;
    }
    textarea {
      resize: vertical;
      min-height: 150px;
    }
    button {
      width: 100%;
      padding: 15px;
      font-size: 1rem;
      font-weight: 700;
      background-color: #000;
      color: #fff;
      border: none;
      border-radius: 10px; /* 둥글둥글 */
      cursor: pointer;
    }
    button:hover {
      background-color: #333;
    }
    .notice {
      margin-top: 15px;
      font-size: 0.9rem;
      color: red;
      text-align: center;
    }
    .file-wrap {
      position: relative;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>문의하기</h1>
    <form action="#" method="post" enctype="multipart/form-data">
      <label for="type">문의 유형 선택</label>
      <select name="type" id="type">
        <option value="">사용문의</option>
        <option value="핸드폰-이용">제휴문의</option>
        <option value="설명문의">기타문의</option>
        <!-- 필요하면 추가 -->
      </select>

      <label for="title">문의제목</label>
      <input type="text" id="title" name="title" placeholder="문의 제목 입력">

      <label for="content">문의내용</label>
      <textarea id="content" name="content" placeholder="문의 내용을 입력하세요"></textarea>

      <label for="email">회신 email</label>
      <input type="email" name="email" placeholder="Fanzy@asd.com"></input>

      <label for="file">파일 첨부</label>
      <input type="file" id="file" name="file">

      <button type="submit">문의하기</button>
      <p class="notice">*주민등록번호 등 민감정보는 작성하지 말아주세요*</p>
    </form>
  </div>
</body>
</html>