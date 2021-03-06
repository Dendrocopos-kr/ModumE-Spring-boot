<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<sec:authorize var="isLogin" access="isAuthenticated()" />
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="icon" href="/img/favicon.png">
    <link rel="stylesheet" href="/css/index.css?ver=4">
    <link rel="stylesheet" href="/css/boardList.css?ver=2">
    <link rel="stylesheet" href="/css/boardDetail.css?ver=2">
    <link rel="stylesheet" href="/css/login.css?ver=1">
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
     <!-- 아웃라인 material-icon 링크 추가 -->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
</head>
<body>
	<div id="bg1">
		<img src="/img/yousef-salhamoud-kQ6mh2yagDw-unsplash.jpg" alt="" id="bg1_1">
	</div>
	<main class="centralContainer">
		<header class="centralHeader">
			<div class="centralLogo">
				<img id="centralLogoImage" src="/img/logowhite.png" alt="">
			</div>
			<div class="centralSearch">
				<form action="" method="POST" class="centralSearchFrm">
					<div class="centralSearch1_1">
						<input type="text" name="" id="" class="Search1_1__input" placeholder="검색">
					</div>
					<div class="centralSearch1_2">
						<span class="material-icons headMenus" onclick="submit()">search</span>
					</div>
				</form>
			</div>
			<div class="centralMenu">
				<div class="menus centralMenu1_1">
					<span class="material-icons" onclick="alertMenuInit()">notifications_none</span>
				</div>
				<div class="menus centralMenu1_2">
					<span class="material-icons" onclick="userMenuInit(${isLogin})">person_outline</span>
				</div>
			</div>
		</header>
		<section class="centralSection">
			<!-- jsp include -->
			<div class="sectionContainer">
				<div class="slideContainer">
					<%-- <video autoplay="autoplay" controls>
                		<source src = "/videos/${videoName }" type="video/mp4">	
                	</video> --%>


					<div class="slide slide__left">
						<span class="material-icons">keyboard_arrow_left</span>
					</div>
					<div class="slide slide__center" id="twitch-embed">
						<sec:authorize access="isAuthenticated()">
							<div id="video"></div>
						</sec:authorize>
					</div>
					<div class="slide slide__right">
						<span class="material-icons">keyboard_arrow_right</span>
					</div>
				</div>
				<!-- 채팅관련 창 나오는 곳  -->
			</div>
			<aside class="centralSidebar">
				<div class="menus sidebarMenu1_1">
					<span class="material-icons" onclick="boardInit()">assignment</span>
				</div>
				<div class="menus sidebarMenu1_2">
					<span class="material-icons" onclick="chatInit()">chat</span>
				</div>
			</aside>
		</section>
	</main>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/js/index.js?aaa=2"></script>
    <script src="/js/login.js"></script>
    <script src="/js/boardList.js?ver=1"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 트위치 채널 긁어오기(채널지정) -->
    <script src="https://embed.twitch.tv/embed/v1.js"></script>
    <script>
    

    function connect(event){
    	username = '${userInfo.username}';
    	console.log(username)
    	if(username){
    		console.log("connect Start")
    		var socket = new SockJS('/ws');
    		stompClient = Stomp.over(socket);
    		
    		stompClient.connect({},onConnected, onError);
    	}
    	/*event.preventDefault();*/
    }

    /* $.ajax({
    	 type: 'GET',
    	 url: 'https://api.twitch.tv/kraken/channels/twitch',
    	 headers: {
    	   'Client-ID': '95put5vj4zw23iiy5poetela3ilbq6'
    	 },
    	 success: function(data) {
    	   console.log(data);
    	 }
    	});
      
    xhr.send(); */
    /* new Twitch.Embed("twitch-embed", {
        width: 854,
        height: 480,
        channel: "2chamcham2",
        // only needed if your site is also embedded on embed.example.com and othersite.example.com 
        parent: ["embed.example.com", "othersite.example.com"]
      }); */
	</script>


	<sec:authorize access="isAuthenticated()">
	<script src='https://unpkg.com/react-player/dist/ReactPlayer.standalone.js'></script>
		<c:if test="${userInfo.sns == 'twitch'}">
			<script type="text/javascript">
			axios.get('/CallFollows',{}).then(function(res){
				console.log(res)
				axios.get('/CallVideo',{
					params:{
						follow : res.data.data[0].to_id
						}
				}).then(function(res){
					console.log(res)
					const url = `\${res.data.data[0].url}`;
					 const container = document.getElementById('video')
					 renderReactPlayer(container , {
						 url,
						 playing: true,
						 controls: true
					 })
				})
			})
			axios.get('/getStreams',{}).then(function(res){
				console.log(res)
			})
			
	    </script>
		</c:if>
	</sec:authorize>
</body>
</html>
