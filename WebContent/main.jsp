<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- bootstrap code -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <!-- Font Awesome Icons -->
  <link href="bootstrap/main/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="bootstrap/main/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="bootstrap/main/css/creative.min.css" rel="stylesheet">
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>방문해 주셔서 감사합니다!</title>

 
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

  
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="#page-top">다담아</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-uppercase text-white font-weight-bold">로그인 해주세요!</h1>
        </div>
<!-- Login.java로 보내는 code -->
		<form id="form1" method="POST">
    		<table>
      			<tr>
        			<td>
          				<label for="id" style="color:white">아이디
        			</td>
        			<td>
          				<input type="text" name="id" id="id" size="20px">
        			</td>
      			</tr>
      			<tr>
        			<td>
          				<label for="pw" style="color:white">비밀번호
        			</td>
        			<td>
          				<input type="password" name="pw" id="pw" size="20px">
        			</td>
      			</tr>
    		</table>
     	<input type="button" class="btn btn-primary btn-sm" onclick="myjsplogin()" value="로그인">
    	<input type="reset" class="btn btn-primary btn-sm" onclick="gosignup()"  value="회원가입">
		</form>

<!-- form구간 끝 -->		


      </div>
    </div>
  </header>

 
  <!-- Footer -->
  <footer class="bg-light py-5">
    <div class="container">
      <div class="small text-center text-muted">Copyright &copy; 2019 - Start Bootstrap</div>
    </div>
  </footer>


<!-- 함수 구간 -->

  <script>
  function gosignup() {
      location.href="signup.jsp";
    }
 
  
  function updateLoginTime(id, pw){
      var user_ref = firebase.database().ref("user_data/"+id);
      user_ref.set({
        user_id: id,
        user_pw: pw,
        last_login : getTimeStamp()
      });
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
  
  function myjsplogin() {
	  var mycheck=0;
      var id = document.getElementById("id").value;
      var pw = document.getElementById("pw").value;
	  var user_data = firebase.database().ref('user_data');
      user_data.once('value', function(snapshot) {
        snapshot.forEach(function(childSnapshot) {
          var tmp = childSnapshot.val();
          if(tmp.user_id==id){  
            if(tmp.user_pw==pw){
            	
            	if(tmp.user_id=="zzzzz"){
            		mycheck=1;
            		alert("관리자로 로그인 했습니다.!");
            	}
            	
            	else{
            		mycheck=1;
            		 alert("로그인 성공!");
            	}
            	
             
              updateLoginTime(id, pw);
              var form = document.getElementById("form1");
              form.setAttribute("action", "./Login?id="+id+"&&pw="+pw+"");
              form.submit();// form 제출  -> Login.java로 이동 -> Servlet에 의해 처리
            } 
            
            else {
              mycheck=1;
              alert("잘못된 비밀번호입니다");
              
            }
           
          }

        });
        if(mycheck==0){
            alert("존재하지 않는 아이디입니다");
            document.getElementById("id").value ="";
            document.getElementById("pw").value ="";
          }
      });
    }
  
 
  </script>



  <!-- Bootstrap core JavaScript -->
  <script src="bootstrap/main/vendor/jquery/jquery.min.js"></script>
  <script src="bootstrap/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="bootstrap/main/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="bootstrap/main/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="bootstrap/main/js/creative.min.js"></script>
  
  

</body>
</html>