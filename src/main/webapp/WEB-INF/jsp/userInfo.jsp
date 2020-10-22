<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
  <title>마이페이지</title>
  <link rel="stylesheet" href="/css/userInfo.css">
</head>
<body>
	<div id="tabMenuContainer">
    <button type="button" id="menu1" class="tabMenuBtn " onclick="temp(0)">프로필수정</button>
    <button type="button" id="menu2" class="tabMenuBtn " onclick="temp(1)">내가올린거</button>
    <button type="button" id="menu3" class="tabMenuBtn " onclick="temp(2)">구독구독</button>
    <button type="button" id="menu4" class="tabMenuBtn " onclick="temp(3)">내정보수정</button>
    <button type="button" id="menu5" class="tabMenuBtn " onclick="temp(4)">로그아웃</button>
    <button type="button" id="menu6" class="tabMenuBtn " onclick="temp(5)">메인화면</button>
	</div>
  <div class="tabBoxContainer">
    <div class="tabBox">첨부파일</div>
    <div class="tabBox">수정하기</div>
    <div class="tabBox">알람끄기</div>
    <div class="tabBox">개인정보</div>
    <div class="tabBox">메인페이지돌아가</div>
  </div>
</body>
<script>
  const underline = document.getElementsByClassName('tabMenuBtn')
  function temp(idx) {
      location.href = '#'
    addUnderLine(idx)
    removeUnderLine(idx)
  }
  function addUnderLine(idx) {
    for(var i=0; i < underline.length; i++) {
      if( i == idx ){
          underline[i].classList.add('underline')
      }
    }
  }

  function removeUnderLine(idx) {
    for(var i=0; i < underline.length; i++) {
      if( i == idx ){
        continue;
    }
    underline[i].classList.remove('underline')
    }
  }

</script>
</html>