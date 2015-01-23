<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup Web Editor (www.coffeecup.com)">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>SetAppointment</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="resources/stylemat.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script> 
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
   

<script type="text/javascript">
function ajaxjson(){
	var json=document.getElementById("par1").value;
	var data ="mattjson="+json;
	$.ajax({
		url : "ajaxjson",
		data : data,
		type : "POST",
		complete : function() {
			document.forms["myform"].submit();
		}
	});
	}
</script>
<script type="text/javascript">
function newJson1(){
	var dateStr=document.getElementById("startDate").value;
	var dateEnd=document.getElementById("endDate").value;
	var timeSlotStr=document.getElementById("timeSlot").value;
	var data="dateStr="+encodeURIComponent(dateStr)+"&dateEnd="+encodeURIComponent(dateEnd)+"&timeSlotStr="+encodeURIComponent(timeSlotStr);
	$.ajax({
		url : "newJson",
		data : data,
		type : "GET",
		success : function(mattToJSON) {
			document.getElementById("par1").value=mattToJSON;
			viewTab(0);
		}
	});
	var data1="dateStr="+encodeURIComponent(dateStr)+"&dateEnd="+encodeURIComponent(dateEnd);
	$.ajax({
		url : "nWek",
		data : data1,
		type : "GET",
		success : function(buf) {
			var mbuf=buf;
			if (mbuf>0){document.getElementById("txtnext").value=mbuf;	
						document.getElementById("next").disabled= false;
						document.getElementById("mRepeat").disabled=false;}
			else {document.getElementById("next").disabled= true;}
			document.getElementById("txtback").value=0;
			document.getElementById("back").disabled= true;
		}
	});
}
    </script> 
    <script type="text/javascript">
    function mtitle(titl,txt){
    	var buf= new Srting();
    	buf=titl+"\n"+txt;
    	return buf;
    }
    </script>
 <script type="text/javascript">
 	function appoint(s1){
		var arr = $('#par1').attr('value');
		var json = JSON.parse(arr);
 		var s=s1;
 		var ng=document.getElementById("nguest").value;
 		var st=document.getElementById("guest").value;
 		st=st.substr(1);
 		st=st.slice(0,-1);
 		st = st.split(", ");
 		
 		for (var io=0;io<st.length;io++){
 			var data1="guest="+encodeURIComponent(st[io]);
 			$.ajax({
 				url : "guestJson",
 				data : data1,
 				type : "GET",
 				success : function(gjson) {
 					var mjson=JSON.parse(gjson);
 		            for(var i = 0; i < json[3].length; i++){
 		               for(var j = s; j < json[2].length && j<s+7; j++){
 		                   if(json[4][i][j]>1 && mjson[4][i][j]==1) {
 		                	 var id = "td" + i+"s" + j;	
 		                	 var titl=document.getElementById(arg).title;
 		                	 document.getElementById(arg).title=mtitle(titl,st[io]);
 		                   }
 		                }
 		            } 					
				}
 			});

 		}
 	}
 </script>
    <script>
    function viewTab(s1){
    	var s=s1;
		var arr = $('#par1').attr('value');

        var json = JSON.parse(arr);

        var oldTable = document.getElementById('mattTable'),
                newTable = oldTable.cloneNode();
        var tr = document.createElement('tr');
        tr.id = "dayValue";
        for(var i = s; i < json[2].length && i<s+7; i++){
            var th = document.createElement('th');
            th.appendChild(document.createTextNode(json[2][i]));
            tr.appendChild(th);
        }
        newTable.appendChild(tr);
      
        var tr1 = document.createElement('tr');
        for(var i = s; i < json[1].length && i<s+7; i++){
            var th1 = document.createElement('td');
            var id = "th" + i;
            th1.id = id;
            th1.appendChild(document.createTextNode(json[1][i]));
            tr1.appendChild(th1);
        }
	       newTable.appendChild(tr1);
	      oldTable.parentNode.replaceChild(newTable, oldTable);
	      
	      var oldTable = document.getElementById('mattTable1'),
    	 newTable = oldTable.cloneNode();
	      
        for(var i = 0; i < json[3].length; i++){
            var tr = document.createElement('tr');
            for(var j = s; j < json[2].length && j<s+7; j++){
                var td = document.createElement('td');
                var id = "td" + i+"s" + j;
                td.id = id;
                td.appendChild(document.createTextNode(json[3][i]));
                if(json[4][i][j]==0) {
                    td.style.backgroundColor = "green";
                    td.style.cursor = "pointer";
                    td.setAttribute("onClick", "changeColor(id)");
                    td.style.cursor = "pointer";
                }
               if(json[4][i][j]==2) {
                    td.style.backgroundColor = "yellow";
                    td.style.cursor = "pointer";
                    td.setAttribute("onClick", "changeColor(id)");
                    td.style.cursor = "pointer";
                } 
                tr.appendChild(td);
            }
            newTable.appendChild(tr);
        }
        oldTable.parentNode.replaceChild(newTable, oldTable);
    }
    </script>
    <script>
    function mback(){
	  var x=document.getElementById("txtnext").value;
  	  var y=document.getElementById("txtback").value;
  	  x++;
  	  y--;
  	  document.getElementById("txtnext").value=x;
  	  document.getElementById("txtback").value=y;
  	  viewTab(y*7);
  	  appoint(y*7);
  	  if(x>0)document.getElementById("next").disabled=false;
  	  if(y==0){document.getElementById("back").disabled=true;
			document.getElementById("mRepeat").disabled=false;}
    }
    </script>
    <script>
  function mnext(){
	  var x=document.getElementById("txtnext").value;
	  var y=document.getElementById("txtback").value;
	  x--;
	  y++;
	  document.getElementById("txtnext").value=x;
	  document.getElementById("txtback").value=y;
	  viewTab(y*7);	 
	  appoint(y*7);
	  if(x==0)document.getElementById("next").disabled=true;
	  if(y>0){document.getElementById("back").disabled=false;
			document.getElementById("mRepeat").disabled=true;}
    }
  </script>
  <script type="text/javascript">
  function repea(arg){
	  if (arg){
		  var arr = $('#par1').attr('value');
		  var json = JSON.parse(arr);
	      wekbuf=document.getElementById("txtnext").value;
	      wekbuf++;
          for(var i = 0; i < json[3].length; i++){//строка              
              for(var j = 0; j < json[2].length && j<7; j++){//столбец
                  for (var x1=1;x1<wekbuf;x1++){
            			var j1=parseInt(j)+x1*7;
            			if (json[4][i][j]==0)json[4][i][j1]=0;
            			if (json[4][i][j]==1)json[4][i][j1]=1;
            			if (json[4][i][j]==2)json[4][i][j1]=2;
                		$('#par1').attr('value', JSON.stringify(json));}
              }
          }
	  }
  }
  </script>
  <script type="text/javascript">
  function changeColor(arg) {
  	var arr = $('#par1').attr('value');
  	var json = JSON.parse(arr);
      var i = arg.slice(2,4);
      i=i.replace ( /[^\d.]/g, '' );	
      var j = arg.slice(4);
      j=j.replace ( /[^\d.]/g, '' );	   	                
      var cell = document.getElementById(arg);
      var wekbuf=1;
      if(document.getElementById("mRepeat").checked && !document.getElementById("mRepeat").disabled){
     	 wekbuf=document.getElementById("txtnext").value;
     	 wekbuf++;
      }		
      if(cell.style.backgroundColor == "green")
      {
          cell.style.backgroundColor = "yellow";
          for (var x1=0;x1<wekbuf;x1++){
        		var j1=parseInt(j)+x1*7;
          		json[4][i][j1]=2;
         		$('#par1').attr('value', JSON.stringify(json));}
      }
      else if
              (cell.style.backgroundColor == "yellow")
      {
          cell.style.backgroundColor = "green";
          for (var x1=0;x1<wekbuf;x1++){
      			var j1=parseInt(j)+x1*7;
          		json[4][i][j1]=0;
          		$('#par1').attr('value', JSON.stringify(json));}
      } 
  }
  </script>
  <script type="text/javascript">
  function myLoad() {
		var mbuf=document.getElementById("txtnext").value;
		if (mbuf>0){document.getElementById("txtnext").value=mbuf;	
					document.getElementById("next").disabled= false;
					document.getElementById("mRepeat").disabled=false;
					document.getElementById("mRepeat").checked=true;}
		else {document.getElementById("next").disabled= true;}
		document.getElementById("txtback").value=0;
		document.getElementById("back").disabled= true;
	    document.getElementById("art").scrollTop = 200;
	}</script>

</head>
<body onload="myLoad()">
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Logged in as:<span id="userName"> ${userName}</span></span>
</div>
<div id="wrapper">
	<form id="blok-form" name="blok-form">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${name}'s Calendar</p>
            <button id="back" type="button" disabled onclick="mback()">back</button>
            <button id="next" type="button" disabled onclick="mnext()">next</button>
        </div>
         <div  >
 			  <input id="par1" name="mattToJSON" value='${matJSON}' type=hidden style="display:none"/>
              <input id="txtback" name="txtback" value=0 type=hidden style="display:none" />
 			  <input id="txtnext" name="txtnext" value='${nWek}' type=hidden style="display:none" /> 
 			  <input id="nguest" name="nguest" value='${nguest}' type=hidden style="display:none" />
 			  <input id="guest" name="guest" value='${guest}' type=hidden style="display:none" /> 
 			<div>
            <table id="mattTable"  >
            </table>
            </div>
            <div id="art" style="overflow:scroll; height:300px; width:100% ">
            <table id="mattTable1"  >
            </table>
            </div>
            <script>
    		var arr = $('#par1').attr('value');
            var json = JSON.parse(arr);
            for(var i = 0; i < json[3].length; i++){
               for(var j = 0; j < json[2].length; j++){
                   if(json[4][i][j]==0) {
                 		json[4][i][j]=2;
                 		$('#par1').attr('value', JSON.stringify(json));
                   }
                }
            }
            
     		var ng=document.getElementById("nguest").value;
     		var st=document.getElementById("guest").value;
     		st=st.substr(1);
     		st=st.slice(0,-1);
     		st = st.split(", ");
     		for (var io=0;io<st.length;io++){
     			var data1="guest="+encodeURIComponent(st[io]);
     			$.ajax({
     				url : "guestJson",
     				data : data1,
     				type : "GET",
     				success : function(gjson) {
     					var mjson=JSON.parse(gjson);
     		            for(var i = 0; i < json[3].length; i++){
     		               for(var j = 0; j < json[2].length; j++){
     		                   if(json[4][i][j]>1 && mjson[4][i][j]==0) {
     		                 		json[4][i][j]=json[4][i][j]+1;
     		                 		if (json[4][i][j]==ng+2) json[4][i][j]=1;
     		                 		$('#par1').attr('value', JSON.stringify(json));
     		                	   
     		                   }
     		                }
     		            } 					
    				}
     			});

     		}

            viewTab(0);   
            appoint(0);
            </script>
        </div>
    </div>
    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Settings</p>
            <p style="font-size:0.6em">Adjust credentials to generate calendar:</p>
            <div style="font-size: 0.6em">
   				Name:<input id="mattName" name="mattName" disabled type="text" value='${name}' onchange="table.value=this.value" style="width: 70%; float: right;"  ><br>
            </div>
                <p>Starting date <input type="text" id="startDate" disabled name="startDate" value='${startDate}' style="border: none; color: blue; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right;  "></p>
                <p>Ending date<input type="text" id="endDate" disabled name="endDate" value='${endDate}' style="border: none; color: blue; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right; "></p>
            <p>Time slot 	<select id="timeSlot" name="timeSlot" disabled style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px">
                <option value="15" ${ts15}>15 min</option>
                <option value="30" ${ts30}>30 min</option>
                <option value="60" ${ts60}>1 hour</option>
            </select></p>
                <p>repeat <input type="checkbox" id="mRepeat" disabled onclick="repea(this.checked)"></p>
           
            <div>
                <div style="text-align:right; margin: 40px 10px 0px 0px; color: white">
                	<button id="setAppoSave" type="button" onclick="ajaxjson()" >Set Appointment</button>
            	</div>
            	
        	</div>
		</div>
    </div>
	</form>
	<form id=myform action="setAppoSave">
	<input type="hidden" id="table" name="table" value='${name}'>
	</form>
</div>
</body>
</html>