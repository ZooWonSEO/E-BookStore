<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>다담아에 오신 걸 환영합니다!!</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <!-- Fonts -->
    <!-- Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400i|Source+Sans+Pro:300,400,600,700" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700" rel="stylesheet">

    <!-- CSS -->
    <!-- Bootstrap CDN -->
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
<% String id = (String) session.getAttribute("id"); %>
        

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

    

    <!-- navigation -->
    <header>
        <div class="container">
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
                            <a class="nav-link" href="#" onclick="goBoard()">게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="goProfile()">마이페이지</a>
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
        </div>
    </header>
    <!-- /navigation -->

    <!-- SECTION -->
      <section>
      	 
         <table id="infotable">
            <tr>
              
               
               <td>제목</td>
               <td>사진</td>
               <td>저자</td>
               <td>가격</td>
               <td>남은수량</td>
               <td>구매</td>
            </tr>
         </table>
      </section>
      

<script>

var id = "<%= id%>";	
var user_data = firebase.database().ref('user_data/');

user_data.once('value', function(snapshot) {
    snapshot.forEach(function(childSnapshot) {
      var tmp = childSnapshot.val();
      if(tmp.user_id==id)
        document.getElementById("uid").innerHTML= tmp.user_id;
    });
  });

allBookdata();


function getBuy(isbn, title, author, price, src){
	
	var user_get = firebase.database().ref('user_get/' + id);
	user_get.set
	({
		get_isbn : isbn,
		buy_time : getTimeStamp()
	});
	
	
}




function buy_click(isbn) 
{
	var ret = confirm("구매하시겠습니까?");
    if(ret)
    {
    	var edit_book_info = firebase.database().ref('book_info/' + isbn);
    	edit_book_info.once('value', function(snapshot) {
    	var tmp = snapshot.val();
    	
    	var _title = tmp.title;
    	var _author = tmp.author;
    	var _price = tmp.price;
    	var _src = tmp.src;
    	var _amount = tmp.amount;
    
		edit_book_info.update({
    		
    		title : _title,
    		author : _author,
    		price : _price,
    		src : _src,
    		amount : _amount-1		
    	});
		
		getBuy(isbn, _title, _author, _price, _src);
		alert("해당 책을 구매하였습니다.");
    	});
        location.reload();
    }
    else{
    	alert("구매가 취소되었습니다");
    }

}

function nobuy(){
	alert("구매할 수 없습니다!");
}



function allBookdata() 
{
   var book_data = firebase.database().ref('book_data');
   book_data.on('value', function(snapshot) {
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

      td_amount = document.createElement("td");
      td_amount.innerHTML = tmp.amount;
      new_tr.appendChild(td_amount);

     
      if(tmp.amount<=0){
    	  buy_btn = document.createElement("input");
          buy_btn.setAttribute("type", "button");
          buy_btn.setAttribute("onclick", "nobuy()");
          buy_btn.setAttribute("value", "구매하기");
          new_tr.appendChild(buy_btn);
    	  
      }
      
      else{
    	  buy_btn = document.createElement("input");
          buy_btn.setAttribute("type", "button");
          buy_btn.setAttribute("onclick", "buy_click("+isbn + ")");
          buy_btn.setAttribute("value", "구매하기");
          new_tr.appendChild(buy_btn);
      }
      
     
      

      table.appendChild(new_tr);
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


function goMain2(){
	location.href = "main2.jsp?user_id=" + "<%= id %>";
}

function goItemlist(){
	location.href = "itemList.jsp?user_id=" + "<%= id %>";
}


function logout(){
	
	location.href = "main.jsp";
}

function goBoard()
{
	location.href = "board.jsp?user_id=" + "<%= id %>";
}

/* 학습기록 이동 */
function goProfile()
{
	location.href = "profile.jsp?user_id=" + "<%= id %>";
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