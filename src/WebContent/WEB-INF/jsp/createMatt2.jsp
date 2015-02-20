<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup Web Editor (www.coffeecup.com)">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Save</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="resources/stylemat.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script> 
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
  <script>
  $(document).ready(init);
  $( "#mattTable1 > *").click( function () {
	  	var arg=$(this).attr("id");
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
	      if(cell.style.backgroundColor == "rgb(240, 240, 240)")
	      {
	          cell.style.backgroundColor = "green";
	          for (var x1=0;x1<wekbuf;x1++){
	      			var j1=parseInt(j)+x1*7;
	          		json[4][i][j1]=0;
	          		$('#par1').attr('value', JSON.stringify(json));}
	      }
	      else {
	          cell.style.backgroundColor = "rgb(240, 240, 240)";
	          for (var x1=0;x1<wekbuf;x1++){
	      			var j1=parseInt(j)+x1*7;
	          		json[4][i][j1]=1;
	          		$('#par1').attr('value', JSON.stringify(json));}
	      }  
	  });
  $('td').click();
  function init(){
  $(function() {
    $( "#mattTable1" ).selectable({
    	distance:10,
    	stop: function() {
        $( "td.ui-selected", this ).each(function() {
        	$( this ).click();
        });
      }
    });
  });
  };
 
  </script>
  
<script type="text/javascript">
function save(){
	var json=document.getElementById("par1").value;
	var data ="mattjson="+json;
	$.ajax({
		url : "ajaxjson",
		data : data,
		type : "POST",
		complete : function() {
			document.getElementById("myform").action="saveMatt";
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
			  $(document).ready(init);
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
                    td.setAttribute("onClick", "changeColor(id)");
                    td.style.cursor = "pointer";
                }
                if(json[4][i][j]==2) {
                    td.style.backgroundColor = "yellow";
                    td.setAttribute("onClick", "changeColor(id)");
                    td.style.cursor = "pointer";
                }
                if(json[4][i][j]==1) {
                    td.style.backgroundColor = "#f0f0f0";
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
  	  $(document).ready(init);
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
	  $(document).ready(init);
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
  function changeWek(arg){
 	 var arr = $('#par1').attr('value');
 	 var json = JSON.parse(arr);
      var j = arg.slice(2);
      var wekbuf=1;
      if(document.getElementById("mRepeat").checked && !document.getElementById("mRepeat").disabled){
     	 wekbuf=document.getElementById("txtnext").value;
     	 wekbuf++;
      }		
      
          for(var i = 0; i < json[3].length; i++){
         	var id1 = "td" + i + "s" + j;
         	var cell = document.getElementById(id1);
          	if(cell.style.backgroundColor == "yellow" || cell.style.backgroundColor == "green"){
         		cell.style.backgroundColor = "#f0f0f0";
         		cell.style.cursor =" ";
          		for (var x1=0;x1<wekbuf;x1++){
          		var j1=parseInt(j)+x1*7;
         		json[4][i][j1]=1;
          		$('#par1').attr('value', JSON.stringify(json));}
          		}
          	else {
          		cell.style.backgroundColor = "yellow"
          		cell.setAttribute("onClick", "changeColor(id)");
          		cell.style.cursor = "pointer";
          		for(var x1=0;x1<wekbuf;x1++){
          		var j1=parseInt(j)+x1*7;
          		json[4][i][j1]=2;
          		$('#par1').attr('value', JSON.stringify(json));}
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
      if(cell.style.backgroundColor == "rgb(240, 240, 240)")
      {
          cell.style.backgroundColor = "green";
          for (var x1=0;x1<wekbuf;x1++){
      			var j1=parseInt(j)+x1*7;
          		json[4][i][j1]=0;
          		$('#par1').attr('value', JSON.stringify(json));}
      }
      else {
          cell.style.backgroundColor = "rgb(240, 240, 240)";
          for (var x1=0;x1<wekbuf;x1++){
      			var j1=parseInt(j)+x1*7;
          		json[4][i][j1]=1;
          		$('#par1').attr('value', JSON.stringify(json));}
      }  
  }
  </script>
<script type="text/javascript">
function mdownload(){
	var json=document.getElementById("par1").value;
	var data ="mattjson="+json;
	$.ajax({
		url : "ajaxjson",
		data : data,
		type : "POST",
		complete : function() {
			document.getElementById("myform").action="download";
			document.forms["myform"].submit();
		}
	});
	}
</script>
<script type="text/javascript">
function m_nameerror(){
	var val = document.getElementById("mattName").value.trim();
	if (val) {
		document.getElementById("table").value=document.getElementById("mattName").value;
		document.getElementById("saveMatt").disabled= false;
		document.getElementById("saveMatt").style.cursor="pointer";
	}else{
		document.getElementById("saveMatt").disabled= true;
		document.getElementById("saveMatt").style.cursor="";
	}

}
</script>
<script type="text/javascript">
function m_submit(){
	var x=document.getElementsByClassName("mseti");
    var i;
    var y=0;
    for (i = 0; i < x.length; i++) {
        if(x[i].checked) y++;
    }
    if(y==0) save();
    else mdownload();
}
</script>
  <script>
  function myFunction() {
	    var elmnt = document.getElementById("art");
	    elmnt.scrollTop = 0;
}
  </script>

</head>
<body onload="myFunction()">

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
 			  <input id="par1" name="mattToJSON" value='${matJSON}' type="hidden" style="display:none"/>
              <input id="txtback" name="txtback" value=0 type="hidden"/>
 			  <input id="txtnext" name="txtnext" value=0 type="hidden"/>
 			<div>
            <table id="mattTable"  >
            </table>
            </div>
            <div id="art" style="overflow:auto; height:300px; width:100% ">
            <table id="mattTable1"  >
            </table>
            </div>
            <script>
            viewTab(0);
            </script>
        </div>
    </div>
    </form>
    <form id=myform>
    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Settings</p>
            <p style="font-size:0.6em">Adjust credentials to generate calendar:</p>
            <div style="font-size: 0.6em">
   				Name:<input id="mattName" name="mattName" type="text" onchange="m_nameerror()" style="width: 70%; float: right;"  ><br>
            </div>
                <p>Starting date <input type="text" id="startDate" name="startDate" value='${startDate}' style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right;  "></p>
                <p>Ending date<input type="text" id="endDate" name="endDate" value='${endDate}' style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right; "></p>
               <script>
    var dates = $("#startDate").datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1,
      dateFormat: "dd.mm.yy",
      onSelect: function(selectedDate){
        var option = this.id == "startDate" ? "minDate" : "maxDate",
        instance = $( this ).data( "datepicker" ),
        date = $.datepicker.parseDate(
          instance.settings.dateFormat || $.datepicker._defaults.dateFormat,
          selectedDate, instance.settings);
        dates.not(this).datepicker("option", option, date);
        newJson1();}
    });
    var dates = $("#endDate").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        dateFormat: "dd.mm.yy",
        onSelect: function(selectedDate){
          var option = this.id == "endDate" ? "minDate" : "maxDate",
          instance = $( this ).data( "datepicker" ),
          date = $.datepicker.parseDate(
            instance.settings.dateFormat || $.datepicker._defaults.dateFormat,
            selectedDate, instance.settings);
          dates.not(this).datepicker("option", option, date);
          newJson1();}
      });
  </script> 
            <p>Time slot 	<select id="timeSlot" name="timeSlot" onchange="newJson1()" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px">
                <option value="15" ${ts15}>15 min</option>
                <option value="30" ${ts30}>30 min</option>
                <option value="60" ${ts60}>1 hour</option>
            </select></p>
                <p>repeat <input type="checkbox" id="mRepeat" disabled onclick="repea(this.checked)"></p>
 <!--            	<button id="b_download" type="button" disabled onclick="view()"  style="border: none; color: blue; background: #d6f000; font-size: 0.6em; width: 75px; text-align: right; ">download</button>   -->           
 		<d:forEach items="${download}" var="item" >
		<p>${item.key}</p>
			<d:forEach items="${item.value}" var="itemM" >
				<p><input class="mseti" type="checkbox" name="${item.key}" value="${itemM}" />${itemM}</p>
			</d:forEach>	
		</d:forEach>
				
                <div style="text-align:right; margin: 40px 10px 0px 0px; color: white">
                	<button id="saveMatt" type="button" disabled onclick="m_submit()" >SAVE</button>
            	</div>
            	
        	
		</div>
    </div>

	<input type="hidden" id="table" name="table">

	</form>

</div>
</body>
</html>