<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<title>Account Setting</title>
    <style>
        #wrapper {
            width: 100%;
            overflow: hidden; /* will contain if #first is longer than #second */
    
        }
        #first {
            width: 25%;
            float:left; /* add this */
            
        }
        #second {
            overflow: hidden; /* if you don't want #second to wrap below #first */
 
        }
 
    </style>
 
</head>
	<script type="text/javascript">
	(function () {
	    var po = document.createElement('script');
	    po.type = 'text/javascript';
	    po.async = true;
  	    po.src = 'https://plus.google.com/js/client:plusone.js?onload=start';
  	    var s = document.getElementsByTagName('script')[0];
  	    s.parentNode.insertBefore(po, s);
    })();    
  </script>

<script type="text/javascript">
function view(state) {
	var buf = parseInt(state);
	switch (buf) {
    case 1:
    	document.getElementById('sing_up').style.display= "block";
    	document.getElementById('profile').style.display= "none";
    	document.getElementById('address_book').style.display= "none";
    	document.getElementById('networks').style.display= "none";
        break;
    case 2:
    	document.getElementById('sing_up').style.display= "none";
    	document.getElementById('profile').style.display= "block";
    	document.getElementById('address_book').style.display= "none";
    	document.getElementById('networks').style.display= "none";
        break;
    case 3:
    	document.getElementById('sing_up').style.display= "none";
    	document.getElementById('profile').style.display= "none";
    	document.getElementById('address_book').style.display= "block";
    	document.getElementById('networks').style.display= "none";
        break;
    case 4:
    	document.getElementById('sing_up').style.display= "none";
    	document.getElementById('profile').style.display= "none";
    	document.getElementById('address_book').style.display= "none";
    	document.getElementById('networks').style.display= "block";
        break;
	}
}
</script>
<script type="text/javascript">
	function subm() {
		alert ("Thank you for registering, Please check your email to confirm.");
		document.forms["form_sing_up"].submit();
}
</script>
<body>

<div id="wrapper">
    <div id="first">
	  <input id="1"  type="button" value="Sing Up" onclick="view(this.id)"/><br>
  	  <input id="2"  type="button" value="Profile" onclick="view(this.id)"/><br>
      <input id="3"  type="button" value="Address Book" onclick="view(this.id)"/><br>
      <input id="4"  type="button" value="My networks" onclick="view(this.id)"/><br>
    </div>

    <div id="second">
 	  <div id="sing_up">
 	  	<form id=form_sing_up action="person">
           <p>First name</p>
           <input type="text" name="firstname" value="${firstname}" ><br>
           <p>Last name</p>
           <input type="text" name="lastname" value="${lastname}" ><br>
           <p>Email(default)</p>
           <input type="text" name="email" value="${email}" ><br>
           <p>Password</p>
           <input type="password" name="password" value="" ><br>
		   <p>Confirm password</p>
		   <input type="password" name="password1" value="" ><br>
    	   <input id="button_sing_up"  type="button" value="SAVE" onclick="subm()"/><br>
    	 </form>
 	  </div>
 	  
 	  <div id="profile" style="display: none;">
           <p>Change name</p>
           <input type="text" name="prof_firstname" value="${prof_firstname}" ><br>
           <p>Change last name</p>
           <input type="text" name="prof_lastname" value="${prof_lastname}" ><br>
           <p>Add email address</p>
           <input type="text" name="prof_email" value="${prof_email}" ><br>
           <p>Change password</p>
           <input type="password" name="prof_password" value="" ><br>
		   <p>Change confirm password</p>
		   <input type="password" name="prof_password1" value="" ><br>
		   <p>Time zone:</p>
		   			<select id="timeZone" name="timeZone" >
					<option value="0" ${tz0}>(GMT-12:00) International Date Line West</option>
					<option value="1" ${tz1}>(GMT-11:00) Midway Island, Samoa</option>
					<option value="2" ${tz2}>(GMT-10:00) Hawaii</option>
					<option value="3" ${tz3}>(GMT-09:00) Alaska</option>
					<option value="4" ${tz4}>(GMT-08:00) Pacific Time (US & Canada)</option>
					<option value="5" ${tz5}>(GMT-08:00) Tijuana, Baja California</option>
					<option value="6" ${tz6}>(GMT-07:00) Arizona</option>
					<option value="7" ${tz7}>(GMT-07:00) Chihuahua, La Paz, Mazatlan</option>
					<option value="8" ${tz8}>(GMT-07:00) Mountain Time (US & Canada)</option>
					<option value="9" ${tz9}>(GMT-06:00) Central America</option>
					<option value="10" ${tz10}>(GMT-06:00) Central Time (US & Canada)</option>
					<option value="11" ${tz11}>(GMT-06:00) Guadalajara, Mexico City, Monterrey</option>
					<option value="12" ${tz12}>(GMT-06:00) Saskatchewan</option>
					<option value="13" ${tz13}>(GMT-05:00) Bogota, Lima, Quito, Rio Branco</option>
					<option value="14" ${tz14}>(GMT-05:00) Eastern Time (US & Canada)</option>
					<option value="15" ${tz15}>(GMT-05:00) Indiana (East)</option>
					<option value="16" ${tz16}>(GMT-04:00) Atlantic Time (Canada)</option>
					<option value="17" ${tz17}>(GMT-04:00) Caracas, La Paz</option>
					<option value="18" ${tz18}>(GMT-04:00) Manaus</option>
					<option value="19" ${tz19}>(GMT-04:00) Santiago</option>
					<option value="20" ${tz20}>(GMT-03:30) Newfoundland</option>
					<option value="21" ${tz21}>(GMT-03:00) Brasilia</option>
					<option value="22" ${tz22}>(GMT-03:00) Buenos Aires, Georgetown</option>
					<option value="23" ${tz23}>(GMT-03:00) Greenland</option>
					<option value="24" ${tz24}>(GMT-03:00) Montevideo</option>
					<option value="25" ${tz25}>(GMT-02:00) Mid-Atlantic</option>
					<option value="26" ${tz26}>(GMT-01:00) Cape Verde Is.</option>
					<option value="27" ${tz27}>(GMT-01:00) Azores</option>
					<option value="28" ${tz28}>(GMT+00:00) Casablanca, Monrovia, Reykjavik</option>
					<option value="29" ${tz29}>(GMT+00:00) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London</option>
					<option value="30" ${tz30}>(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</option>
					<option value="31" ${tz31}>(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague</option>
					<option value="32" ${tz32}>(GMT+01:00) Brussels, Copenhagen, Madrid, Paris</option>
					<option value="33" ${tz33}>(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb</option>
					<option value="34" ${tz34}>(GMT+01:00) West Central Africa</option>
					<option value="35" ${tz35}>(GMT+02:00) Amman</option>
					<option value="36" ${tz36}>(GMT+02:00) Athens, Bucharest, Istanbul</option>
					<option value="37" ${tz37}>(GMT+02:00) Beirut</option>
					<option value="38" ${tz38}>(GMT+02:00) Cairo</option>
					<option value="39" ${tz39}>(GMT+02:00) Harare, Pretoria</option>
					<option value="40" ${tz40}>(GMT+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius</option>
					<option value="41" ${tz41}>(GMT+02:00) Jerusalem</option>
					<option value="42" ${tz42}>(GMT+02:00) Minsk</option>
					<option value="43" ${tz43}>(GMT+02:00) Windhoek</option>
					<option value="44" ${tz44}>(GMT+03:00) Kuwait, Riyadh, Baghdad</option>
					<option value="45" ${tz45}>(GMT+03:00) Moscow, St. Petersburg, Volgograd</option>
					<option value="46" ${tz46}>(GMT+03:00) Nairobi</option>
					<option value="47" ${tz47}>(GMT+03:00) Tbilisi</option>
					<option value="48" ${tz48}>(GMT+03:30) Tehran</option>
					<option value="49" ${tz49}>(GMT+04:00) Abu Dhabi, Muscat</option>
					<option value="50" ${tz50}>(GMT+04:00) Baku</option>
					<option value="51" ${tz51}>(GMT+04:00) Yerevan</option>
					<option value="52" ${tz52}>(GMT+04:30) Kabul</option>
					<option value="53" ${tz53}>(GMT+05:00) Yekaterinburg</option>
					<option value="54" ${tz54}>(GMT+05:00) Islamabad, Karachi, Tashkent</option>
					<option value="55" ${tz55}>(GMT+05:30) Sri Jayawardenapura</option>
					<option value="56" ${tz56}>(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi</option>
					<option value="57" ${tz57}>(GMT+05:45) Kathmandu</option>
					<option value="58" ${tz58}>(GMT+06:00) Almaty, Novosibirsk</option>
					<option value="59" ${tz59}>(GMT+06:00) Astana, Dhaka</option>
					<option value="60" ${tz60}>(GMT+06:30) Yangon (Rangoon)</option>
					<option value="61" ${tz61}>(GMT+07:00) Bangkok, Hanoi, Jakarta</option>
					<option value="62" ${tz62}>(GMT+07:00) Krasnoyarsk</option>
					<option value="63" ${tz63}>(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi</option>
					<option value="64" ${tz64}>(GMT+08:00) Kuala Lumpur, Singapore</option>
					<option value="65" ${tz65}>(GMT+08:00) Irkutsk, Ulaan Bataar</option>
					<option value="66" ${tz66}>(GMT+08:00) Perth</option>
					<option value="67" ${tz67}>(GMT+08:00) Taipei</option>
					<option value="68" ${tz68}>(GMT+09:00) Osaka, Sapporo, Tokyo</option>
					<option value="69" ${tz69}>(GMT+09:00) Seoul</option>
					<option value="70" ${tz70}>(GMT+09:00) Yakutsk</option>
					<option value="71" ${tz71}>(GMT+09:30) Adelaide</option>
					<option value="72" ${tz72}>(GMT+09:30) Darwin</option>
					<option value="73" ${tz73}>(GMT+10:00) Brisbane</option>
					<option value="74" ${tz74}>(GMT+10:00) Canberra, Melbourne, Sydney</option>
					<option value="75" ${tz75}>(GMT+10:00) Hobart</option>
					<option value="76" ${tz76}>(GMT+10:00) Guam, Port Moresby</option>
					<option value="77" ${tz77}>(GMT+10:00) Vladivostok</option>
					<option value="78" ${tz78}>(GMT+11:00) Magadan, Solomon Is., New Caledonia</option>
					<option value="79" ${tz79}>(GMT+12:00) Auckland, Wellington</option>
					<option value="80" ${tz80}>(GMT+12:00) Fiji, Kamchatka, Marshall Is.</option>
					<option value="81" ${tz81}>(GMT+13:00) Nuku'alofa</option>
				</select><br>
		   <p>Select time format</p>
            <table>
            <input type="radio" name="timeformat" value="">    
 			<input type="radio" name="timeformat" value=""><br>
 			12 24<br>
         	</table>
			
           <p>Phone number(optional)</p>
           <input type="text" name="prof_firstname" value="${prof_firstname}" ><br>
		   
    	   <input id="buttn_sing_up"  type="button" value="SAVE" onclick=""/><br>
 	  </div>

 	  <div id="address_book" style="display: none;">
 	  	<p>Address Book</p>
 	  </div>

 	  <div id="networks" style="display: none;">
		    <div id="signinButton">
 			  <input type="checkbox" id="googlecheck" name="google_check" ${GoogleCh} ${GoogleAuth} style="border: none; float: left; width: 50px">
	          <span style="color: black; font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Google</span>
	          <span style="margin-left: 50px "></span>
			  <span class="g-signin"
			    data-scope="${scopesGoogle}"
			    data-clientid="${idGoogle}"
			    data-redirecturi="postmessage"
			    data-accesstype="offline"
			    data-cookiepolicy="single_host_origin"
			    data-approvalprompt="force"
			    data-callback="signInCallback">
			  </span>
			</div><br>            
		    <div id="appleButton">
				<input type="checkbox" id="applecheck" name="apple_check" ${AppleCh} ${AppleAuth} style="border: none; float: left; width: 50px">
	       		<span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Apple</span>
	        	<span style="margin-left: 50px "></span>
			</div><br>  
		    <div id="windowsButton">
 			  <input type="checkbox" id="windowscheck" name="windows_check" ${WindowsCh} ${WindowsAuth} style="border: none; float: left; width: 50px">
	          <span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Windows</span>
	          <span style="margin-left: 50px "></span>
			</div><br>  
		    <div id="facebookButton">
 			  <input type="checkbox" id="facebookcheck" name="facebook_check" ${FacebookCh} ${FacebookAuth} style="border: none; float: left; width: 50px">
	          <span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Facebook</span>
	          <span style="margin-left: 50px "></span>
			</div><br>  
		    <div id="twitterButton">
 			  <input type="checkbox" id="twittercheck" name="twitter_check" ${TwitterCh} ${TwitterAuth} style="border: none; float: left; width: 50px">
	          <span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Twitter</span>
	          <span style="margin-left: 50px "></span>
			</div><br>  
 	  </div>
 	  
   </div >
</div >

<form id="result_form" action="resauto" method="post" >
	<input id="par1" name="code" type=hidden />
	<input id="par2" name="access_token" type=hidden />
</form>
        	<input name="home" type="image" src="resources/img/home.png" title="home" onclick="table.value=this.name, tableForm.action='viewMatt'" width='50' height='50'><br>
       	<input name="edit" type="image" src="resources/img/edit.png" title="edit" onclick="table.value=this.name, tableForm.action='viewMatt'" width='50' height='50'><br>
       	<input name="share" type="image" src="resources/img/share.png" title="share" onclick="table.value=this.name, tableForm.action='viewMatt'" width='50' height='50'><br>
       	<input name="collaborate" type="image" src="resources/img/collaborate.png" title="collaborate" onclick="table.value=this.name, tableForm.action='viewMatt'" width='50' height='50'><br>
       	<input name="upload" type="image" src="resources/img/upload.png" title="upload" onclick="table.value=this.name, tableForm.action='viewMatt'" width='50' height='50'><br>
       	<input name="download" type="image" src="resources/img/download.png" title="download" onclick="table.value=this.name, tableForm.action='viewMatt'" width='50' height='50'><br>
       	<input name="repeat" type="image" src="resources/img/repeat.png" title="repeat" onclick="table.value=this.name, tableForm.action='viewMatt'" width='50' height='50'><br>
 
<script type="text/javascript">
function signInCallback(authResult) {
  if (authResult['code']) {
	$('#par1').attr('value', authResult['code']);
 	$('#par2').attr('value', authResult['access_token']);
    document.getElementById('result_form').submit();
  } else if (authResult['error']) {
	  console.log('There was an error: ' + authResult['error']);
  } 
}
</script>
</body>
</html>

