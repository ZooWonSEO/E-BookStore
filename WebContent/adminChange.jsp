<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html class="no-js">

<head>

 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>다담아에 오신 걸 환영합니다!!</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   <!-- bootstrap code -->
    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400i|Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/main2/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/main2/plugins/themefisher-fonts/themefisher-fonts.css">
    <link rel="stylesheet" href="bootstrap/main2/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="bootstrap/main2/plugins/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="bootstrap/main2/css/style.css">
    <!-- Responsive Stylesheet -->
    
    <style>
    #infotable, tr, td
         {
            border: 3px solid black;
            border-collapse: collapse;
            padding: 10px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
         }
    </style>
</head>


<body id="body">

<!-- firebase 가져오기 -->
<script src="https://www.gstatic.com/firebasejs/6.0.2/firebase.js"></script>
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
  
<!-- 사용자 정보 가져오기 -->  
<% String id = (String) session.getAttribute("id"); %>
  
  
  
    <!-- navigation -->
    <header>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-white">
                <a class="navbar-brand" href="#" onclick="goAdmin()">다담아 서점</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto text-center text-lg-left">
               
                     
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="goAdmin()">고객관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goItemload()">상품등록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goItemManage()">상품관리</a>
                        </li>
                    	<li class="nav-item">
                            <a class="nav-link">관리자님 반갑습니다!</a>
                        </li>
                     	<li class="nav-item">
                            <a class="nav-link" href="#" onclick="logout()">로그아웃</a>
                        </li>
                        
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- /navigation -->

    <!-- SECTION -->
      <section>
        
        <table>
    		<tr>
      		<td>
        			<label for="name">이름
      		</td>
      		<td>
        			<input type="text" name="name" id="name" size="20px" value="서주원">
      		</td>
    		</tr>
    
     		<tr>
      		<td>
        			<label for="sex">성별
      		</td>
      		<td>
        			<input type="text" name="sex" id="sex" size="20px" value="남자">
      		</td>
    		</tr>
    
     		<tr>
      		<td>
        			<label for="major" >전공
      		</td>
      		<td>
        			<input type="text" name="major" id="major" size="20px"value="컴퓨터공학">
      		</td>
    		</tr>
    
     		<tr>
      		<td>
        			<label for="grade">학년
      		</td>
      		<td>
        			<input type="text" name="grade" id="grade" size="20px" value="3학년">
      		</td>
    		</tr>
    
    		<tr>
      		<td>
        			<label for="hobby">관심사
      		</td>
     	 		<td>
        			<input type="text" name="hobby" id="hobby" size="20px" value="야구">
      		</td>
    		</tr>
    		
    		<tr>
      		<td>
        			<label for="hobby">마지막 로그인
      		</td>
      		<td>
        			<input type="text" name="last" id="last" size="20px" value="그런거 없음">
      		</td>
    		</tr>  
  </table>    
         
      </section>


<script>      
function goAdminChange(){
	
	location.href = "adminChange.jsp?user_id=" + "<%= id %>";

}


function goAdmin(){
	location.href = "admin.jsp?user_id=" + "<%= id %>";
}



function goItemload()
{
	location.href = "itemLoad.jsp?user_id=" + "<%= id %>";
}

function goItemManage(){
	location.href = "itemManage.jsp?user_id=" + "<%= id %>";
}


function logout(){
	
	location.href = "main.jsp";
}


</script>
  
 <!-- Js -->
    <script src="bootstrap/main2/plugins/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/main2/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="bootstrap/main2/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="bootstrap/main2/plugins/magnific-popup/jquery.magnific.popup.min.js"></script>
    <script src="bootstrap/main2/js/main.js"></script>  
   
</body>
</html>