<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <link rel="stylesheet" href="/css/userInfo.css">
  <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
<body>
	<div id="userInfoContainer">
		<div id="tabMenuContainer">
	    <button type="button" id="menu1" class="tabMenuBtn " onclick="temp(0)">프로필수정</button>
	    <button type="button" id="menu2" class="tabMenuBtn " onclick="temp(1)">내가올린거</button>
	    <button type="button" id="menu3" class="tabMenuBtn " onclick="temp(2)">구독구독</button>
	    <button type="button" id="menu4" class="tabMenuBtn " onclick="temp(3)">내정보수정</button>
	    <button type="button" id="menu5" class="tabMenuBtn " onclick="temp(4)">로그아웃</button>
	   	<span class="material-icons">clear</span>
		</div>
	  <div id="tabBoxContainer">
	    <div class="tabBox" onclick="temp(0)">첨부파일</div>
	    <div class="tabBox">수정하기</div>
	    <div class="tabBox">알람끄기</div>
	    <div class="tabBox">개인정보</div>
	    <div class="tabBox">메인페이지돌아가</div>
	  </div>
  	</div>
</body>
</html>