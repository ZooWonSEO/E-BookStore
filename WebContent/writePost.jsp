<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="write post">
    <meta name="author" content="YOOK DONGHYUN">
    
    <title>게시글 작성</title>
    
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/general/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="bootstrap/general/css/scrolling-nav.css" rel="stylesheet">
    
    <!-- CSS Style Sheet -->
	<style>
		#post
	    {
	    	margin-left:auto;
	        margin-right:auto;
	        padding:10px;
	                
	        border: 1px solid black;
	        border-radius: 25px;
	        box-shadow: 5px 5px gray;
	
	        text-align: center;
	        width: 30%;
	        height: 400px;
	        font-weight: bold;
	        background-color: lightsteelblue;
	
	        float: center;
	     }
	     textarea
	     {
	        width: 250px;
	        height: 150px;
	     }
	     #post_title { width: 250px; }
	</style>
	
	<!-- jQuery import -->
	<script src="jQuery/jquery-1.10.1.js"></script>
  </head>

  <body id="page-top">
  		
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
	    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:rgba(0,46,102,.8);">
	      <div class="container">
	        <a class="navbar-brand" href="#" onclick="goMain2()" style="font-family:'Jua', sans-serif;font-weight:bold;">다담아</a>
	      </div>
	    
	    </nav>
	    <!--/ Navigation -->
		
		<!-- POST -->
		<br><br><br>
		<h1 class="jua" style="text-align:center;">포스트 작성하기</h1>
		<div id="post">
			
			<label class="jua" style="font-size:25px;">제목</label><br>
			<input type="text" id="post_title" class="jua"><br><br>
			<label class="jua" style="font-size:25px;">나의 서평</label><br>
			<textarea id="post_content" class="jua"></textarea><br><br>
			<input type="button" value="작성하기" onclick="writeP()" class="jua btn btn-secondary">
			<input type="button" value="뒤로가기" onclick="goBack()" class="jua btn btn-secondary">
			
		</div>
		<!-- POST -->
	
	<script>
				/* 현재시간 */
				function getTimeStamp() 
				{
					var d = new Date();
					var s = leadingZeros(d.getHours(), 2) + ':'
							+ leadingZeros(d.getMinutes(), 2) + ':'
							+ leadingZeros(d.getSeconds(), 2);
					return s;
				}
				
				
				
				function getDateStamp() 
				{
					var d = new Date();
					var s = leadingZeros(d.getFullYear(), 4) + '-'
							+ leadingZeros(d.getMonth() + 1, 2) + '-'
							+ leadingZeros(d.getDate(), 2)
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
		
				
			

				var id = "<%=id %>";
				
				 
				var user_data = firebase.database().ref('user_data/');
				user_data.once('value', function(snapshot) {
				    snapshot.forEach(function(childSnapshot) {
				      var tmp = childSnapshot.val();
				      if(tmp.user_id==id)
				        document.getElementById("uid").innerHTML= tmp.user_id;
				    });
				  });
				

	

				/* 포스트 작성 */
				function writeP()
				{
					
					var post_title = document.getElementById("post_title").value;
					var post_content = document.getElementById("post_content").value;
					var post_time = getTimeStamp();
					var post_date = getDateStamp();
					var user_post = firebase.database().ref('user_post/' + '<%= id%>');
					
					// create user_post
					user_post.set
					({
						user_id : id,
						post_title : post_title,
						post_content : post_content,
						post_date : post_date,
						post_time : post_time
					});
					
					alert("포스트가 작성되었습니다.");
					history.back();
				}
				
				function goBack()
				{
					location.href = "board.jsp?user_id=" + "<%= id %>"; 
				}
				
				
				function goMain2(){
					location.href = "main2.jsp?user_id=" + "<%= id %>";
				}
				
				
			</script>	
		
		
		
    <!-- Bootstrap core JavaScript -->
    <script src="bootstrap/general/vendor/jquery/jquery.min.js"></script>
    <script src="bootstrap/general/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="bootstrap/general/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom JavaScript for this theme -->
    <script src="bootstrap/general/js/scrolling-nav.js"></script>
  </body>
</html>