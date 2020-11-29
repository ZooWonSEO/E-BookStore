<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원가입</title>

  <!-- Bootstrap code-->
  <link href="bootstrap/signup/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="bootstrap/signup/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="bootstrap/signup/css/resume.min.css" rel="stylesheet">

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




 <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
      <span class="d-block d-lg-none">Clarence Taylor</span>
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
          <a class="nav-link js-scroll-trigger" href="#about">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="main.jsp">돌아가기</a>
        </li>
      </ul>
    </div>
  </nav>


  <div class="container-fluid p-0">
    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
      <div class="w-100">
        <h1 class="mb-0">다담아
          <span class="text-primary">서점</span>
        </h1>
        

       <form method="GET" name="form1">
       <table>
       	<tr>
        	<td>
          		<label for="id">아이디
        	</td>
        	<td>
            	<input type="text" name="username" id="id" size="20px">
            	<input type="button" onclick="mycheck()" id="check" value="중복확인">
        	</td>
        </tr>
        <tr>
        	<td>
          		<label for="pw">비밀번호
        	</td>
        	<td>
          		<input type="password" name="pw" id="pw" size="20px">
        	</td>
        </tr>
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
          		<input type="radio" name="sex" id ="sex" value="남자">남자
          		<input type="radio" name="sex" id ="sex" value="여자">여자 
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
           		<input type="radio" name="grade" id ="grade" value="1학년">1학년
           		<input type="radio" name="grade" id ="grade" value="2학년">2학년
           		<input type="radio" name="grade" id ="grade" value="3학년">3학년
           		<input type="radio" name="grade" id ="grade" value="4학년">4학년
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
      
    </table>
    <input type="button" onclick="signup()" value="완료">
  </form>
  </div>
</section>


<!-- 함수  -->
<script>

function mycheck(){
    var id = document.getElementById("id").value;
    var checked = 0;

    data.forEach(function(tmp) {
      if(tmp==id){
        alert("이미 사용중인 아이디입니다");
        checked = 1;
      }
    });
    if(checked==0){
      alert("사용 가능한 아이디입니다");
      document.getElementById("id").disabled = true;
    }
}

function getTimeStamp() {
    var d = new Date();
    var s =
    leadingZeros(d.getFullYear(), 4) + '-' +
    leadingZeros(d.getMonth() + 1, 2) + '-' +
    leadingZeros(d.getDate(), 2) + ' ' +

    leadingZeros(d.getHours(), 2) + ':' +
    leadingZeros(d.getMinutes(), 2) + ':' +
    leadingZeros(d.getSeconds(), 2);

    return s;
  }

function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();

    if (n.length < digits) {
      for (i = 0; i < digits - n.length; i++)
        zero += '0';
    }
    return zero + n;
  }

var user_data = firebase.database().ref('user_data');

var data = new Array();
    
user_data.on('value', function(snapshot) {
      data.splice(0, data.length);
      snapshot.forEach(function(childSnapshot) {
        var childData = childSnapshot.val();
        data.push(childData.user_id);
    });
});

    
function signup() {
      
	var sex;
	var grade;
	
	var sexes= document.getElementsByName("sex");
	for(var i=0; i<sexes.length; i++){
		if(sexes[i].checked==true){
			sex = sexes[i].value;
		}
		
	}
	
	
	var grades= document.getElementsByName("grade");
	for(var i=0; i<grades.length; i++){
		if(grades[i].checked==true){
			grade = grades[i].value;
		}
		
	}
	
	
      var id = document.getElementById("id").value;
      var pw = document.getElementById("pw").value;
      
      var name= document.getElementById("name").value;
      var major= document.getElementById("major").value;
      
      var hobby= document.getElementById("hobby").value;
      

      if(document.getElementById("id").disabled){
      	
    	var user_data = firebase.database().ref('user_data/'+id); 
    	user_data.set({
          	user_id: id,
          	user_pw: pw,
          	last_login: getTimeStamp()
        });
    	
    	myProfile(id, sex, name, major, grade, hobby);
        alert("회원가입이 완료되었습니다");
        history.back();
      	} 
	  
      else {
        alert("아이디 중복확인을 눌러주세요");
      }
	
}
    
function myProfile(id, sex, name, major, grade, hobby){
    	var user_ref = firebase.database().ref('user_profile/'+id);
      	user_ref.set({
            user_name: name,
            user_sex: sex,
            user_major: major,
            user_grade: grade,
            user_hobby: hobby
          });
}
    
</script>
  
   
  <!-- Bootstrap core JavaScript -->
  <script src="bootstrap/signup/vendor/jquery/jquery.min.js"></script>
  <script src="bootstrap/signup/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="bootstrap/signup/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="bootstrap/signup/js/resume.min.js"></script>


</body>
</html>