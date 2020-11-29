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
  
<!-- ����� ���� �������� -->  
<% String id = (String) session.getAttribute("id"); %>
  
  
  
    <!-- navigation -->
    <header>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-white">
                <a class="navbar-brand" href="#" onclick="goAdmin()">�ٴ�� ����</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto text-center text-lg-left">
                     <form id=form2  method="POST">
                    
                    	
                    	<li class="nav-item">
                    		<h4 class="nav-link">��й�ȣ�� �Է��ϼ���.</h4>
                    	</li>
						<li class="nav-item">
                            <input class ="nav-link" type="password" id="pw">
                        </li>
                    	<li>
                    		<input class ="nav-link" type="button" onclick ="adminInfo()"value="����Ȯ��">
                    	</li>
                    
                    </form>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="goAdmin()">������</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goItemload()">��ǰ���</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"onclick="goItemManage()">��ǰ����</a>
                        </li>
                    	<li class="nav-item">
                            <a class="nav-link">�����ڴ� �ݰ����ϴ�!</a>
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

    <!-- SECTION -->
      <section>
         <table id="infotable">
            <tr>
               <td>ID</td>
               <td>�̸�</td>
               <td>�г�</td>
               <td>����</td>
               <td>����</td>
               <td>���ɻ�</td>
               <td>���ӽð�</td>
               <td>����</td>
            </tr>
         </table>
      </section>
      
<script>
      
      
     
         allUserdata();
         
         
         function allUserdata() 
         {
            var user_data = firebase.database().ref('user_data');
            user_data.once('value', function(snapshot) {
               snapshot.forEach(function(childSnapshot) {
                  var tmp = childSnapshot.val();
                  allUserProfile(tmp.user_id, tmp.last_login);
               });
            });
         }
         
         function allUserProfile(_id, time) 
         {
        	 table = document.getElementById("infotable");
            var user_data = firebase.database().ref('user_profile/' + _id);
            user_data.once('value', function(snapshot) {
               var tmp = snapshot.val();
   
              
               new_tr = document.createElement("tr");
   
               td_id = document.createElement("td");
               td_id.innerHTML = _id;
               new_tr.appendChild(td_id);
   
               td_name = document.createElement("td");
               td_name.innerHTML = tmp.user_name;
               new_tr.appendChild(td_name);
   
               td_grade = document.createElement("td");
               td_grade.innerHTML = tmp.user_grade;
               new_tr.appendChild(td_grade);
   
               td_major = document.createElement("td");
               td_major.innerHTML = tmp.user_major;
               new_tr.appendChild(td_major);
   
               td_sex = document.createElement("td");
               td_sex.innerHTML = tmp.user_sex;
               new_tr.appendChild(td_sex);
   
               td_h = document.createElement("td");
               td_h.innerHTML = tmp.user_hobby;
               new_tr.appendChild(td_h);
   
               td_time = document.createElement("td");
               td_time.innerHTML = time;
               new_tr.appendChild(td_time);
   
               del_btn = document.createElement("input");
               del_btn.setAttribute("type", "button");
               del_btn.setAttribute("onclick", "del_click(" +_id + ")");
               del_btn.setAttribute("value", "����");
               new_tr.appendChild(del_btn);
   
               table.appendChild(new_tr);
            });
         }
         
         function del_click(_id) 
         {
        	
            var user_data = firebase.database().ref('user_data/' + _id);
            user_data.remove();
            
            var user_profile = firebase.database().ref('user_profile/' + _id);
            user_profile.remove();
       
            var user_post = firebase.database().ref('user_post/' + _id);
			user_post.remove();
			
   
			var user_get = firebase.database().ref('user_get/'+_id);
			user_get.remove();
			
			
            alert("��� ����ڸ� �����Ͽ����ϴ�.");
   			location.reload();
            
         }

function adminInfo(){
	
	var pw = document.getElementById("pw").value;
	var form = document.getElementById("form2");
    form.setAttribute("action", "./Change?pw="+pw+"");
    form.submit();// 
	alert("���������?");
	
	
}
         
         

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