<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>다담아에 오신걸 환영합니다!!</title>

  <!-- bootstrap code -->
  <link href="bootstrap/profile/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="bootstrap/profile/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="bootstrap/profile/css/resume.min.css" rel="stylesheet">
  
  <!-- jqeury -->
  <script src="jQuery/jquery-1.10.1.js"></script>
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

<body id="page-top">

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
  

<!-- 사용자 정보 가져옴 -->
<% String id = (String) session.getAttribute("id"); %>





<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
  <a class="navbar-brand js-scroll-trigger" href="#page-top"> 
    <span class="d-none d-lg-block">
      <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/profile.jpg" alt="">
    </span>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link js-scroll-trigger" href="#about">회원정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link js-scroll-trigger" href="#experience">구매한 도서</a>
      </li>
      <li class="nav-item">
        <a class="nav-link js-scroll-trigger" href="#exit">회원탈퇴</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link js-scroll-trigger" href="#" onclick="goMain2()">돌아가기</a>
      </li>
   
    </ul>
  </div>
</nav>

<div class="container-fluid p-0">
  <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="about">
    <div class="w-100">
      <h2 class="mb-5" id="about">회원정보</h2>
      <h5><%= id %>님 반갑습니다!</h5>
		<form method="GET" name="form1">
  	<table>
    		<tr>
      		<td>
        			<label for="name">이름
      		</td>
      		<td>
        			<input type="text" name="name" id="name" size="20px">
      		</td>
    		</tr>
    
     		<tr>
      		<td>
        			<label for="sex">성별
      		</td>
      		<td>
        			<input type="text" name="sex" id="sex" size="20px">
      		</td>
    		</tr>
    
     		<tr>
      		<td>
        			<label for="major">전공
      		</td>
      		<td>
        			<input type="text" name="major" id="major" size="20px">
      		</td>
    		</tr>
    
     		<tr>
      		<td>
        			<label for="grade">학년
      		</td>
      		<td>
        			<input type="text" name="grade" id="grade" size="20px">
      		</td>
    		</tr>
    
    		<tr>
      		<td>
        			<label for="hobby">관심사
      		</td>
     	 		<td>
        			<input type="text" name="hobby" id="hobby" size="20px">
      		</td>
    		</tr>
    		
    		<tr>
      		<td>
        			<label for="hobby">마지막 로그인
      		</td>
      		<td>
        			<input type="text" name="last" id="last" size="20px">
      		</td>
    		</tr>  
  </table>    
  <button type="submit" onclick="updateAccount()">정보 수정하기</button>
 </form>
</div>
</section>


  <hr class="m-0">

  <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="experience">
    <div class="w-100">
      <h2 class="mb-5" id="experience">구매한 도서</h2>
		
		 <section>
    	 
       <table id="booktable">
          <tr>
            
             
             <td>제목</td>
             <td>사진</td>
             <td>저자</td>
             <td>가격</td>
             <td>구매시간</td>
             
             
          </tr>
       </table>
       
       
       
    </section>


    </div>
  </section>
  
   <hr class="m-0">




  <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="exit">
    <div class="w-100">
      <h2 class="mb-5" id="exit">회원탈퇴</h2>
      <p>회원탈퇴하기</p>
		<button type="submit" name="exit" id="exit" onclick="removeAccount()">회원 탈퇴하기</button>
    </div>
  </section>



<script>

var id = "<%= id%>";	
var user_data = firebase.database().ref('user_data/');
user_data.on('value', function(snapshot) {
  snapshot.forEach(function(childSnapshot) {
    var tmp = childSnapshot.val();
    if(tmp.user_id==id)
      document.getElementById("last").value = tmp.last_login;
  });
});


var user_ref = firebase.database().ref('user_profile/'+id);
user_ref.on('value', function(snapshot) {
		    var tmp = snapshot.val();
		    
		    	
		    	
			    document.getElementById("name").value = tmp.user_name;
			    document.getElementById("sex").value = tmp.user_sex;
			    document.getElementById("major").value = tmp.user_major;
			    document.getElementById("grade").value = tmp.user_grade;
			    document.getElementById("hobby").value = tmp.user_hobby;
		  });


getUser();
function getUser(){
	
	var user_get =firebase.database().ref('user_get/'+id);

	user_get.on('value', function(snapshot) {
	    var tmp = snapshot.val();
	   
	    	findBook(tmp.get_isbn, tmp.buy_time);
	   
	  });

	
	
}

function findBook(is_isbn,is_time){
	
	 table = document.getElementById("booktable");
	var book_info = firebase.database().ref('book_info/'+is_isbn);
	
	book_info.on('value', function(snapshot) {
	    var tmp = snapshot.val();
	   
	    
	    new_tr = document.createElement("tr");
	    
        td_title = document.createElement("td");
        td_title.innerHTML = tmp.title;
        new_tr.appendChild(td_title);

        td_src = document.createElement("td");
        td_src.innerHTML= "<img src='./img/"+tmp.src+"' width=50 height=50>";
        new_tr.appendChild(td_src);

        td_author = document.createElement("td");
        td_author.innerHTML = tmp.author;
        new_tr.appendChild(td_author);

        td_price = document.createElement("td");
        td_price.innerHTML = tmp.price;
        new_tr.appendChild(td_price);

        
        td_getTime = document.createElement("td");
        td_getTime.innerHTML = is_time;
        new_tr.appendChild(td_getTime);
    	
    	
    	 table.appendChild(new_tr);

        
	  });

	
	
}

function getTimeStamp() 
{
	var d = new Date();
	var s = leadingZeros(d.getFullYear(), 4)
			+ leadingZeros(d.getMonth() + 1, 2)
			+ leadingZeros(d.getDate(), 2);
	return s;
}
/* 포멧지정 */
function leadingZeros(n, digits) 
{
	var zero = '';
	n = n.toString();
	if (n.length < digits)
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	return zero + n;
}
	
function removeAccount()
{
	    var ret = confirm("정말 탈퇴하시겠습니까?");
	    if(ret)
	    {
	    	var rmv_data = firebase.database().ref('user_data/' + '<%= id %>');
	    	var rmv_profile = firebase.database().ref('user_profile/' + '<%= id %>');
	    	var rmv_post = firebase.database().ref('user_post/' + '<%= id %>');
	    	var rmv_get = firebase.database().ref('user_get/' + <%= id %>);
	    	
	    	rmv_data.remove();
	    	rmv_profile.remove();
	    	rmv_post.remove();
	    	rmv_get.remove();
	    	
			alert("탈퇴되었습니다");
			location.href = "main.jsp";
	    }
	    else
	    	alert("탈퇴가 취소되었습니다");
}	
	
function updateAccount()
{
	var _name = document.getElementById("name").value; // 이름
	var _sex = document.getElementById("sex").value; // 성별
	var _major = document.getElementById("major").value; // 전공
	var _grade = document.getElementById("grade").value; // 학년
	var _hobby = document.getElementById("hobby").value; // 관심사
		
	// 변경 확인 다이얼로그 띄움
		var ret = confirm("정말 수정하시겠습니까?");
	    if(ret)
	    {
	    	var edit = firebase.database().ref('user_profile/' + '<%= id %>');
			edit.update
			({ 
				user_name: _name,
				user_sex: _sex,
				user_major: _major,
				user_grade: _grade,
				user_hobby: _hobby
			});
			alert("수정이 완료되었습니다");
			location.href = "profile.jsp?user_id=" + "<%= id %>";
	    }
	    else
	    	alert("수정이 취소되었습니다.");
}  


function goMain2(){
	location.href = "main2.jsp?user_id=" + "<%= id %>";
}





</script>




  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="bootstrap/profile/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="bootstrap/profile/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="bootstrap/profile/js/resume.min.js"></script>

</body>

</html>
