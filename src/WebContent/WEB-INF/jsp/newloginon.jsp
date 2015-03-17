<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<title>MyAvailableTime&login</title>
</head>

<style>
body {
      width: auto;
      background:#f0f0f0;
     }

#nav,#nav ul {
    list-style:none;
    margin:0;
    padding:0;
}
#nav {
    height:41px;
    padding-left:5px;
    padding-top:5px;
    position:relative;
    z-index:2;
}
#nav ul {
    left:-9999px;
    position:absolute;
    top:37px;
    width:auto;
}
#nav ul ul {
    left:-9999px;
    position:absolute;
    top:0;
    width:auto;
}
#nav li {
    float:left;
    margin-right:5px;
    position:relative;
}
#nav li a {
    background:#c1c1bf;
    color:#000;
    display:block;
    float:left;
    font-size:16px;
    padding:8px 10px;
    text-decoration:none;
}
#nav > li > a {
    -moz-border-radius:6px;
    -webkit-border-radius:6px;
    -o-border-radius:6px;
    border-radius:6px;

    overflow:hidden;
}
#nav li a.fly {
    padding-right:15px;
}
#nav ul li {
    margin:0;
}
#nav ul li a {
    width:120px;
}
#nav ul li a.fly {
    padding-right:10px;
}

/*hover styles*/
#nav li:hover > a {
    background-color:#858180;
    color:#fff;
}

/*focus styles*/
    #nav li a:focus {
    outline-width:0;
}

/*popups*/
#nav li a:active + ul.dd,#nav li a:focus + ul.dd,#nav li ul.dd:hover {
    left:0;
}
#nav ul.dd li a:active + ul,#nav ul.dd li a:focus + ul,#nav ul.dd li ul:hover {
    left:140px;
}
</style> 

<script type="text/javascript">
	function emailpol() {
	var x = document.getElementById("polelogin").value;
 
	var data ="email="+encodeURIComponent(x);
	$.ajax({
		url : "email",
		data : data,
		type : "GET",
		success : function(response) {
			if (response=="3") document.getElementById("ok").src="resources/images/username_test.png";
			else if (response=="0"){ document.getElementById("ok").src="resources/images/username_aktiv.png"; alert("Your account isn't activated. Please, check your email for activation.");}else document.getElementById("ok").src="resources/images/username_open.png";
		}
	});
  
}
</script>
<script type="text/javascript">
function view() {
	document.getElementById('polya').style.display = "block";			
	document.getElementById('knopki').style.display= "none";
}
</script>
 <script type="text/javascript">
	 function submit1(e) {
		if (e==1)document.getElementById("blok-form").action= 'registry';
		if (e==2)document.getElementById("blok-form").action= 'home';
  return true;
 }
</script>
<body>
<div class="">
    <ul id="nav">    
        <li><a class="fly" href="#">MyAvailableTime</a>
            <ul class="dd">
                <li><a href="">About</a></li>
                <li><a href="">User Guide</a></li>
                <li><a href="">Contact Us</a></li>
            </ul>
        </li>
    </ul>
</div>

<div>
 <img class="logo" src="resources/images/logo.gif" alt="" width="379" height="165" />
 <form id="blok-form" name="blok-form">
 <div id="knopki">
   <input type="button" value="Log In" onclick="view()" /><br>
   <input id="1"  type="submit" value="Sing Up" onclick="submit1(this.id)"/>
 </div>
      <div id="polya" style="display: none;">
       <p class="username_or_email">Email address</p>
       <input id="polelogin"  type="text" name="name" onblur="emailpol()"/>
       <img id="ok" src="resources/images/username_test.png"  />
      <p class="password_2">Password</p>
       <input id="password"  type="password" name="password" />
       <img id="codortex"  src="resources/images/knopka_avs.png" alt="" /><br>
       <input id="2" type="submit" value="Load" onclick="submit1(this.id)"/>
     </div>
 </form>
</div>
</body>
</html>