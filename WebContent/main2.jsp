<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html class="no-js">

<head>


 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>�ٴ�ƿ� ���� �� ȯ���մϴ�!!</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


<!-- bootstrap code -->
    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400i|Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700" rel="stylesheet">
    <!-- CSS -->
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="bootstrap/main2/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/main2/plugins/themefisher-fonts/themefisher-fonts.css">
    <link rel="stylesheet" href="bootstrap/main2/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="bootstrap/main2/plugins/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="bootstrap/main2/css/style.css">

    
<!-- jQuery 1.8 or later, 33 KB -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- ����θ� -->
	<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
    
</head>


<body id="body">

<!-- firebase �������� -->
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
  


<!-- Login.java���� ������ �����͸� �޴� �� -->
<% String id = (String) session.getAttribute("id"); %>
	    
  
    <!-- navigation -->
    <header>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-white">
                <a class="navbar-brand" href="#" onclick="goMain2()">�ٴ�� ����</a>
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
                            <a class="nav-link" href="#" onclick="goItemlist()">��ǰ ���</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goBoard()">�Խ���</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goProfile()">����������</a>
                        </li>
                    	<li class="nav-item">
                            <a class="nav-link"><%= id %>�� �ݰ����ϴ�!</a>
                        </li>
                     	<li class="nav-item">
                            <a class="nav-link" href="#" onclick="logout()">�α׾ƿ�</a>
                        </li>
                        
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- /navigation -->

	<br><br>
	
  	<section id="index">
  	<div>
  		<h2>���� ��õ� å��</h2>
  	</div>
    <article>
    	
        <div class="fotorama" 
                data-loop = "true"
                data-autoplay="2000" 
                data-arrows="false"
                data-keyboard="true"
                data-width="100%"
                data-height="400"
                data-click="false"
                data-swipe="false"
                data-nav="false"
                >
            <div data-img="bootstrap/main2/images/book_genum.jpg">
                <a href="#" onclick="goItemlist()">
                    	�������
                </a>
            </div>
            <div data-img="bootstrap/main2/images/book_rpm.jpg">
                    <a href="#" onclick="goItemlist()">
                    RPM
                </a>
            </div>
            <div data-img="bootstrap/main2/images/book_su.jpg">
                    <a href="#" onclick="goItemlist()">
                       	����Ư��
                    </a>
            </div>
        </div>        
    </article>
   
</section>
   
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
			    document.getElementById("name").innerHTML = "�̸�: "+tmp.user_name;
  			    document.getElementById("sex").innerHTML = "����: "+tmp.user_sex;
  			    document.getElementById("major").innerHTML = "����: "+tmp.user_major;
  			    document.getElementById("grade").innerHTML = "�г�: "+tmp.user_grade;
  			    document.getElementById("hobby").innerHTML = "���ɻ�: "+tmp.user_hobby;
  			    });


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
  
 <!-- Js -->
    <script src="bootstrap/main2/plugins/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/main2/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="bootstrap/main2/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="bootstrap/main2/plugins/magnific-popup/jquery.magnific.popup.min.js"></script>
    <script src="bootstrap/main2/js/main.js"></script>
   
</body>
</html>