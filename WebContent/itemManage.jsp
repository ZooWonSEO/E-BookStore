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
         <table id="infotable">
            <tr>
               <td>ISBN</td>
               <td>제목</td>
               <td>저자</td>
               <td>가격</td>
               <td>남은수량</td>
               <td>사진경로</td>
               <td>관리</td>
            </tr>
         </table>
      </section>
      
<script>
      
     
         allBookdata();
         
         function del_click(isbn) 
         {
            var book_data = firebase.database().ref('book_data/' + isbn);
            book_data.remove();
            
            var book_info = firebase.database().ref('book_info/' + isbn);
            book_info.remove();
       
   
            alert("해당 책을 삭제하였습니다.");
   			location.reload();
            
         }
         
         function allBookdata() 
         {
            var book_data = firebase.database().ref('book_data');
            book_data.once('value', function(snapshot) {
               snapshot.forEach(function(childSnapshot) {
                  var tmp = childSnapshot.val();
                  allBookInfo(tmp.isbn);
               });
            });
         }
         
         function allBookInfo(isbn) 
         {
            table = document.getElementById("infotable");
            var book_info = firebase.database().ref('book_info/' + isbn);
            book_info.once('value', function(snapshot) {
               var tmp = snapshot.val();
   
               new_tr = document.createElement("tr");
   
               td_isbn = document.createElement("td");
               td_isbn.innerHTML = isbn;
               new_tr.appendChild(td_isbn);
   
               td_title = document.createElement("td");
               td_title.innerHTML = tmp.title;
               new_tr.appendChild(td_title);
   
               td_author = document.createElement("td");
               td_author.innerHTML = tmp.author;
               new_tr.appendChild(td_author);
   
               td_price = document.createElement("td");
               td_price.innerHTML = tmp.price;
               new_tr.appendChild(td_price);
   
               td_amount = document.createElement("td");
               td_amount.innerHTML = tmp.amount;
               new_tr.appendChild(td_amount);
   
               td_src = document.createElement("td");
               td_src.innerHTML= "<img src='./img/"+tmp.src+"' width=50 height=50>";
               new_tr.appendChild(td_src);
   
             
               del_btn = document.createElement("input");
               del_btn.setAttribute("type", "button");
               del_btn.setAttribute("onclick", "del_click(" + isbn + ")");
               del_btn.setAttribute("value", "삭제");
               new_tr.appendChild(del_btn);
   
               table.appendChild(new_tr);
            });
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