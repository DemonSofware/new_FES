<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html itemscope itemtype="http://schema.org/Article">

<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

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
    <style>
        head {
            width: auto;
        }
        body {
            width: auto;
            background:#f0f0f0;
            margin-left: auto;
            margin-right: auto;
        }

        .header {
            font-family: Arial, Helvetica, sans-serif;
            background: black;
            width: auto;
            height: auto;
            margin-left: auto;
            margin-right: auto;
            font-size: 1.2em;
            font-weight: bold;
        }
        .topmenu {
            display: inline-block;
            text-align:;
            color: white;
            padding: 10px 19px 10px 0px;
            font-weight:100;
            font-size: 0.9em}
        .logo {
            display: inline-block;
            text-align:left;
            color: white;
            padding: 10px 0px 7px 19px;
        }
        a.logo:link{
            text-decoration:none;
            color:#ffffff;
        }
        a.logo:hover{
            text-decoration:none;
            color:#e9e9e9;
        }
        a.logo:active{
            text-decoration:none;
            color:#e0e0e0;
        }
        a.logo:visited{
            text-decoration:none;
            color:#ffffff;
        }
        p {
            font-size: 0.6em;
        }
        #wrapper {
            width: 100%;
            overflow: hidden; /* will contain if #first is longer than #second */
        }
        #first {
            width: 65%;
            float:left; /* add this */
        }
        #second {
            overflow: hidden; /* if you don't want #second to wrap below #first */
            background: #d6f000;
        }
        .left {
            text-align: left;
            padding:0px 20px 0 20px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1.6em;
            color: #888888;
        }
        .right {
            text-align: left;
            padding:0px 20px 0 20px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1.6em;
            color: #888888;
        }
        #shareembedemail {
            display: inline-block;
            text-align: center;
        }
       button {
            background:none!important;
            border:none;
            padding:0!important;
            /*border is optional*/
            cursor: pointer;
            font-size: 1em;
            color: white;
        }
        #table1
        {
            border:solid 1px;
            border-collapse:collapse;
        }

        #table1 th
        {
            border:solid 1px;
            border-collapse:collapse;
        }

        #table1 td
        {
            border:solid 1px;
            vertical-align:middle;
        }
    </style>
</head>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account settings</title>
</head>
<body>
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Logged in as: ${username}</span>
</div>

<div id="wrapper">
<form action="savesettings">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">Authorization MyAvailableTime in social networks</p>
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
	</div>
    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Account Settings</p>
            <p style="font-size:0.6em">General information:</p>
            <div style="font-size: 0.6em">
                Name:<input type="text" name="firstname" value="${name}" style="float: right;"><br><br>
                Email:<input type="text" name="email" value="${email}" style="float: right;"><br><br>
                New password:<input type="password" name="password" value="" style="float: right;"><br><br>
				Confirm password:<input type="password" name="password1" value="" style="float: right;"><br><br>
				Time zone:<select id="timeZone" name="timeZone" style="float:right; width: 173px">
					<option value="Etc/GMT+12" ${tzEtc_GMT_12}>(GMT-12:00) International Date Line West</option>
					<option value="Pacific/Midway" ${tzPacific_Midway}>(GMT-11:00) Midway Island, Samoa</option>
					<option value="US/Hawaii" ${tzUS_Hawaii}>(GMT-10:00) Hawaii</option>
					<option value="US/Alaska" ${tzUS_Alaska}>(GMT-09:00) Alaska</option>
					<option value="PST" ${tzPST}>(GMT-08:00) Pacific Time (US & Canada)</option>
					<option value="Mexico/BajaNorte" ${tzMexico_BajaNorte}>(GMT-08:00) Tijuana, Baja California</option>
					<option value="US/Arizona" ${tzUS_Arizona}>(GMT-07:00) Arizona</option>
					<option value="America/Mazatlan" ${tzAmerica_Mazatlan}>(GMT-07:00) Chihuahua, La Paz, Mazatlan</option>
					<option value="MST" ${tzMST}>(GMT-07:00) Mountain Time (US & Canada)</option>
					<option value="US/Central" ${tzUS_Central}>(GMT-06:00) Central America</option>
					<option value="CST" ${tzCST}>(GMT-06:00) Central Time (US & Canada)</option>
					<option value="Mexico/General" ${tzMexico_General}>(GMT-06:00) Guadalajara, Mexico City, Monterrey</option>
					<option value="Canada/Saskatchewan" ${tzCanada_Saskatchewan}>(GMT-06:00) Saskatchewan</option>
					<option value="America/Rio_Branco" ${tzAmerica_Rio_Branco}>(GMT-05:00) Bogota, Lima, Quito, Rio Branco</option>
					<option value="EST" ${tzEST}>(GMT-05:00) Eastern Time (US & Canada)</option>
					<option value="US/Eastern" ${tzUS_Eastern}>(GMT-05:00) Indiana (East)</option>
					<option value="Canada/Atlantic" ${tzCanada_Atlantic}>(GMT-04:00) Atlantic Time (Canada)</option>
					<option value="America/Caracas" ${tzAmerica_Caracas}>(GMT-04:00) Caracas, La Paz</option>
					<option value="America/Manaus" ${tzAmerica_Manaus}>(GMT-04:00) Manaus</option>
					<option value="America/Santiago" ${tzAmerica_Santiago}>(GMT-04:00) Santiago</option>
					<option value="CNT" ${tzCNT}>(GMT-03:30) Newfoundland</option>
					<option value="Brazil/East" ${tzBrazil_East}>(GMT-03:00) Brasilia</option>
					<option value="America/Buenos_Aires" ${tzAmerica_Buenos_Aires}>(GMT-03:00) Buenos Aires, Georgetown</option>
					<option value="America/Godthab" ${tzAmerica_Godthab}>(GMT-03:00) Greenland</option>
					<option value="America/Montevideo" ${tzAmerica_Montevideo}>(GMT-03:00) Montevideo</option>
					<option value="Etc/GMT+2" ${tzEtc_GMT_2}>(GMT-02:00) Mid-Atlantic</option>
					<option value="Atlantic/Cape_Verde" ${tzAtlantic_Cape_Verde}>(GMT-01:00) Cape Verde Is.</option>
					<option value="Atlantic/Azores" ${tzAtlantic_Azores}>(GMT-01:00) Azores</option>
					<option value="Atlantic/Reykjavik" ${tzAtlantic_Reykjavik}>(GMT+00:00) Casablanca, Monrovia, Reykjavik</option>
					<option value="GMT" ${tzGMT}>(GMT+00:00) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London</option>
					<option value="ECT" ${tzECT}>(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</option>
					<option value="Europe/Prague" ${tzEurope_Prague}>(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague</option>
					<option value="Europe/Brussels" ${tzEurope_Brussels}>(GMT+01:00) Brussels, Copenhagen, Madrid, Paris</option>
					<option value="Europe/Zagreb" ${tzEurope_Zagreb}>(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb</option>
					<option value="Africa/Malabo" ${tzAfrica_Malabo}>(GMT+01:00) West Central Africa</option>
					<option value="Asia/Amman" ${tzAsia_Amman}>(GMT+02:00) Amman</option>
					<option value="Europe/Istanbul" ${tzEurope_Istanbul}>(GMT+02:00) Athens, Bucharest, Istanbul</option>
					<option value="Asia/Beirut" ${tzAsia_Beirut}>(GMT+02:00) Beirut</option>
					<option value="Africa/Cairo" ${tzAfrica_Cairo}>(GMT+02:00) Cairo</option>
					<option value="Africa/Harare" ${tzAfrica_Harare}>(GMT+02:00) Harare, Pretoria</option>
					<option value="Europe/Helsinki" ${tzEurope_Helsinki}>(GMT+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius</option>
					<option value="Asia/Jerusalem" ${tzAsia_Jerusalem}>(GMT+02:00) Jerusalem</option>
					<option value="Europe/Minsk" ${tzEurope_Minsk}>(GMT+02:00) Minsk</option>
					<option value="CAT" ${tzCAT}>(GMT+02:00) Windhoek</option>
					<option value="Asia/Baghdad" ${tzAsia_Baghdad}>(GMT+03:00) Kuwait, Riyadh, Baghdad</option>
					<option value="Europe/Moscow" ${tzEurope_Moscow}>(GMT+03:00) Moscow, St. Petersburg, Volgograd</option>
					<option value="Africa/Nairobi" ${tzAfrica_Nairobi}>(GMT+03:00) Nairobi</option>
					<option value="Asia/Tbilisi" ${tzAsia_Tbilisi}>(GMT+03:00) Tbilisi</option>
					<option value="Asia/Tehran" ${tzAsia_Tehran}>(GMT+03:30) Tehran</option>
					<option value="Asia/Muscat" ${tzAsia_Muscat}>(GMT+04:00) Abu Dhabi, Muscat</option>
					<option value="Asia/Baku" ${tzAsia_Baku}>(GMT+04:00) Baku</option>
					<option value="Asia/Yerevan" ${tzAsia_Yerevan}>(GMT+04:00) Yerevan</option>
					<option value="Asia/Kabul" ${tzAsia_Kabul}>(GMT+04:30) Kabul</option>
					<option value="Asia/Yekaterinburg" ${tzAsia_Yekaterinburg}>(GMT+05:00) Yekaterinburg</option>
					<option value="Asia/Karachi" ${tzAsia_Karachi}>(GMT+05:00) Islamabad, Karachi, Tashkent</option>
					<option value="IST" ${tzIST}>(GMT+05:30) Sri Jayawardenapura</option>
					<option value="Asia/Calcutta" ${tz56}>(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi</option>
					<option value="Asia/Kathmandu" ${tzAsia_Kathmandu}>(GMT+05:45) Kathmandu</option>
					<option value="Asia/Almaty" ${tzAsia_Almaty}>(GMT+06:00) Almaty, Novosibirsk</option>
					<option value="Asia/Dhaka" ${tzAsia_Dhaka}>(GMT+06:00) Astana, Dhaka</option>
					<option value="Asia/Rangoon" ${tzAsia_Rangoon}>(GMT+06:30) Yangon (Rangoon)</option>
					<option value="Asia/Bangkok" ${tzAsia_Bangkok}>(GMT+07:00) Bangkok, Hanoi, Jakarta</option>
					<option value="Asia/Krasnoyarsk" ${tzAsia_Krasnoyarsk}>(GMT+07:00) Krasnoyarsk</option>
					<option value="Asia/Hong_Kong" ${tzAsia_Hong_Kong}>(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi</option>
					<option value="Asia/Singapore" ${tzAsia_Singapore}>(GMT+08:00) Kuala Lumpur, Singapore</option>
					<option value="Asia/Ulan_Bator" ${tzAsia_Ulan_Bator}>(GMT+08:00) Irkutsk, Ulaan Bataar</option>
					<option value="Australia/Perth" ${tzAustralia_Perth}>(GMT+08:00) Perth</option>
					<option value="Asia/Taipei" ${tzAsia_Taipei}>(GMT+08:00) Taipei</option>
					<option value="Japan" ${tzJapan}>(GMT+09:00) Osaka, Sapporo, Tokyo</option>
					<option value="Asia/Seoul" ${tzAsia_Seoul}>(GMT+09:00) Seoul</option>
					<option value="Asia/Yakutsk" ${tzAsia_Yakutsk}>(GMT+09:00) Yakutsk</option>
					<option value="Australia/Adelaide" ${tzAustralia_Adelaide}>(GMT+09:30) Adelaide</option>
					<option value="Australia/Darwin" ${tzAustralia_Darwin}>(GMT+09:30) Darwin</option>
					<option value="Australia/Brisbane" ${tzAustralia_Brisbane}>(GMT+10:00) Brisbane</option>
					<option value="Australia/Sydney" ${tzAustralia_Sydney}>(GMT+10:00) Canberra, Melbourne, Sydney</option>
					<option value="Australia/Hobart" ${tzAustralia_Hobart}>(GMT+10:00) Hobart</option>
					<option value="Pacific/Guam" ${tzPacific_Guam}>(GMT+10:00) Guam, Port Moresby</option>
					<option value="Asia/Vladivostok" ${tzAsia_Vladivostok}>(GMT+10:00) Vladivostok</option>
					<option value="Pacific/Guadalcanal" ${tzPacific_Guadalcanal}>(GMT+11:00) Magadan, Solomon Is., New Caledonia</option>
					<option value="Pacific/Auckland" ${tzPacific_Auckland}>(GMT+12:00) Auckland, Wellington</option>
					<option value="Pacific/Fiji" ${tzPacific_Fiji}>(GMT+12:00) Fiji, Kamchatka, Marshall Is.</option>
					<option value="Pacific/Tongatapu" ${tzPacific_Tongatapu}>(GMT+13:00) Nuku'alofa</option>
				</select><br><br>
	            <div style="text-align:right; margin: 40px 10px 0px 0px; color: white; font-size: 3em">	
           			<button type="submit" id="savebutton">SAVE</button>
            	</div>
            </div>
         </div>
    </div>
</form>    
</div>
<div id="result"></div>


<!-- style="display:none;" -->
<form id="result_form" action="resauto" method="post" >
	<input id="par1" name="code" type=hidden />
	<input id="par2" name="access_token" type=hidden />
<%-- 	<input id="pGoogleAuth" name="Google_Auth" type=hidden value= "${GoogleAuth}"/>
	<input id="pGoogleCh" name="Google_Ch" type=hidden value= "${GoogleCh}"/> --%>
</form>
 


<script type="text/javascript">
function signInCallback(authResult) {
  if (authResult['code']) {
//  if(result['status']['signed_in']){
	$('#par1').attr('value', authResult['code']);
 	$('#par2').attr('value', authResult['access_token']);
//    $('#signinButton').attr('style', 'display: none');
    document.getElementById('result_form').submit();


  } else if (authResult['error']) {
	  console.log('There was an error: ' + authResult['error']);
  }
 
}
</script>
</body>
</html>