
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>MyMatt</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>


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
 	#wrap{
		display: none;
		opacity: 0.8;
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		padding: 16px;
		background-color: rgba(1, 1, 1, 0.725);
		z-index: 100;
		overflow: auto;
	}
	
	#window{
		width: 400px;
		height: 400px;
		margin: 50px auto;
		display: none;
		background: #fff;
		z-index: 200;
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		padding: 16px;
	}
	
 
    </style>
 
</head>

		<script type="text/javascript">
			function show(state){
					document.getElementById('window').style.display = state;			
					document.getElementById('wrap').style.display = state; 			
			}			
		</script>

<body>
	<div onclick="show('none')" id="wrap"></div>

	<div id="window">
	<form action="newmatt">
			<input type="button" value="X" onclick="show('none')" /><br>
			Title<input type="text" name="namecalendar" />
	        <p>Time slot <select id="timeSlot" name="timeSlot" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px">
               <option value="15">15 min</option>
               <option value="30" selected>30 min</option>
               <option value="60">1 hour</option>
               </select> </p>
			 <input id="2" type="submit" value="NEXT" />			
	</form>
	</div>


<div class="header">
<form id="log" >
    <span><a class="logo">Logged in as: ${userName}</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> <button type="submit" style="color: white;" onclick="log.action='accountsettings'">Account settings</button></span> 
</form>
</div>

    <div id="first">
 		<img class="logo" src="resources/images/logo.gif" alt="" width="379" height="165" />
        <form  id="form2" >
          <img src="resources/img/calendar.png" title="Create a new Available calendar" onclick="show('block')" width='50' height='50' />
        </form>
        <form id="tableForm" name="tableForm" >
	<input type="hidden" id="table" name="table">
	<input type="hidden" name="username" value="${userName}">
    <div id="placetable" style="overflow:scroll; height:380px; width:100% ">
                     
   <d:forEach items="${matt}" var="item" >
         
   <table style="width:80%; margin-left:10%">  
   
   <tr>
		<td><input name="${item.key}" type="image" src="resources/img/view.png" title="View" onclick="table.value=this.name, tableForm.action='action_edit'" width='50' height='50'></td>
		<td><input name="${item.key}" type="image" src="resources/img/delete.png" title="Remove" onclick="table.value=this.name, tableForm.action='removematt'" width='50' height='50'></td>
		<td colspan='8'>${item.value}</td>
   </tr>
 		
   </table>
<br>
  </d:forEach>
            </div>            
        </form>
    </div>

</body>
</html>