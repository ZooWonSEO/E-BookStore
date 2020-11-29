<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>게시판입니다.</title>

  <!-- Bootstrap core CSS -->
  <link href="bootstrap/board/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="bootstrap/board/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="bootstrap/board/css/clean-blog.min.css" rel="stylesheet">

</head>

<body>

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/6.0.2/firebase.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#config-web-app -->

<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyB7xuB6Aw9bbi-WyuWKoKNKlPSOxuxUqMc",
    authDomain: "name-19c80.firebaseapp.com",
    databaseURL: "https://name-19c80.firebaseio.com",
    projectId: "name-19c80",
    storageBucket: "name-19c80.appspot.com",
    messagingSenderId: "425841148694",
    appId: "1:425841148694:web:49a9a1a02ceee02a"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
</script>
  
<% String id = (String) session.getAttribute("id"); %>



  <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
                <a class="navbar-brand" href="#" onclick="goMain2()">다담아 서점</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto text-center text-lg-left">
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="goMain2()">HOME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="goItemlist()">상품 목록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goBoard()">게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goProfile()">마이페이지</a>
                        </li>
                    	<li class="nav-item">
                            <a class="nav-link"><%= id %>님 반갑습니다!</a>
                        </li>
                     	<li class="nav-item">
                            <a class="nav-link" href="#" onclick="logout()">로그아웃</a>
                        </li>
                        
                    </ul>
                </div>
            </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('bootstrap/board/img/book_bok.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>서평 게시판</h1>
            <span class="subheading">내가 읽은 책을 다른 사람들에게 들려주세요</span>
            <a href="#" onclick="writePost()" style="border-radius:25px;font-size:20px;">
	            		게시글 작성하기
	            	</a>
          </div>
        </div>
      </div>
    </div>
  </header>
<!-- MAIN CONTENT -->
		<section class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="post-preview">
						
						<!-- BOARD CONTAINER -->
						<div id="container"></div>
						
						<!-- JAVA SCRIPT -->
						<script>
							
						
							var user_post = firebase.database().ref('user_post');
								user_post.on('value', function(snapshot) {
								snapshot.forEach(function(childSnapshot) {
								var tmp = childSnapshot.val();
						
								// 동적으로 element 생성
								var div = document.createElement("div");
								var h3 = document.createElement("h3");
								var p = document.createElement("p");
								var hr = document.createElement("hr");
								
								// 동적으로 생성된 요소의 CSS 설정
								h3.setAttribute("style", "font-family:'Jua',sans-serif;");
								p.setAttribute("style", "font-size:20px;font-family:'Jua',sans-serif;");
								
								// 포스트날짜를 파싱하는 처리
								var str = tmp.post_date;
								var parse1 = String(str).split("-");
								var parse2 = String(parse1[2]).split(" ");
								var result = parse1[0] + parse1[1] + parse2[0];
								
								
								// DB로 부터 내용 가져옴
								h3.innerHTML = tmp.post_title;
								p.innerHTML = "작성자 : " + tmp.user_id;
								p.innerHTML += "<br>" + "나의서평 : " + tmp.post_content + "<br>" 
													+ "작성시간 : " + tmp.post_date + " "+ tmp.post_time; 
								
								
								
								div.appendChild(h3);
								div.appendChild(p);
								div.appendChild(hr);
								document.getElementById("container").appendChild(div);
								});
							});
						</script>
						<!--/ JAVA SCRIPT -->
					</div>
				</div>
			</div>
		</section>
		<!--/ MAIN CONTENT -->
  
<script>
var id = "<%=id %>";
document.getElementById("login_id").innerHTML = "ID: " + id;
 
var user_data = firebase.database().ref('user_data/');

user_data.once('value', function(snapshot) {
    snapshot.forEach(function(childSnapshot) {
      var tmp = childSnapshot.val();
      if(tmp.user_id==id)
        document.getElementById("uid").innerHTML= tmp.user_id;
    });
  });


var user_ref = firebase.database().ref('user_profile/'+id);
user_ref.once('value', function(snapshot) {
		    var tmp = snapshot.val();
			    document.getElementById("name").innerHTML = "이름: "+tmp.user_name;
  			    document.getElementById("sex").innerHTML = "성별: "+tmp.user_sex;
  			    document.getElementById("major").innerHTML = "전공: "+tmp.user_major;
  			    document.getElementById("grade").innerHTML = "학년: "+tmp.user_grade;
  			    document.getElementById("hobby").innerHTML = "관심사: "+tmp.user_hobby;
});


function writePost(){
	location.href = "writePost.jsp?user_id=" + "<%= id %>";
}



function goMain2(){
	location.href = "main2.jsp?user_id=" + "<%= id %>";
}


function goItemlist(){
	location.href = "itemList.jsp?user_id=" + "<%= id %>";
}


function goBoard()
{
	location.href = "board.jsp?user_id=" + "<%= id %>";
}

function goProfile()
{
	location.href = "profile.jsp?user_id=" + "<%= id %>";
}

function logout(){
	location.href = "main.jsp";
}

</script>



	<!-- Bootstrap core JavaScript -->
  <script src="bootstrap/board/vendor/jquery/jquery.min.js"></script>
  <script src="bootstrap/board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="bootstrap/board/js/clean-blog.min.js"></script>



</body>

</html>
