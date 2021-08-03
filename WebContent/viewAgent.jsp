<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 	<!-- get session -->
	<% String agentid = (String) session.getAttribute("sessionId");%>
<!DOCTYPE html>
<html>
<title>AGENT MANAGEMENT SYSTEM</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

.kelas-baru{
	background-color: pink;
}

.footer
{
  position:absolute;
  bottom:0;
  width:100%;
  margin-left:100px;
  text-align:center;
  left:0;
}
</style>

<body>

<!-- Sidenav/menu -->
<nav class="w3-sidenav w3-collapse w3-top w3-large w3-padding kelas-baru" style="z-index:3;width:300px;font-weight:bold;" id="mySidenav"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-padding-xlarge w3-hide-large w3-display-topleft w3-hover-white" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
      <img height="180px" src="picture/company_logo-removebg-preview.png"/>
    <h3 class="w3-padding-64"><b><u>AGENT MANAGEMENT SYSTEM</u></b></h3>
  </div>

<a href="ViewOrderController?id=<%= agentid %>" onclick="w3_close()" class="w3-padding w3-hover-white">Home</a>
  <div class="w3-padding w3-hover-white" onclick="myAccFunc()" style="cursor:pointer">
  Order <i class="fa fa-caret-down"></i></div>
  <div id="demoAcc" class="w3-hide w3-blue-pale w3-card-4">
    <a href="ViewOrderController?id=<%= agentid %>" class="w3-padding w3-hover-white" >View Order</a>
    <a href="viewProductController">Create Order</a>
    <a href="cart.jsp" class="w3-padding w3-hover-white" >View Cart</a>
    <a href="viewReturnOrderForAgent?id=<%= agentid %>" class="w3-padding w3-hover-white" >View Return Order</a>


  </div>
<div class="w3-padding w3-hover-white" onclick="myAccFunc1()" style="cursor:pointer">
	Agent <i class="fa fa-caret-down"></i></div>
  			<div id="demoAcc1" class="w3-hide w3-blue-pale w3-card-4">
			<a href="ViewAgentForAgentViewController?id=<%= agentid %>" class="w3-padding w3-hover-white" >View Agent</a>
		</div>
		<a onclick='confirmationLogout(this);return false;' href="LogoutController" class="w3-padding w3-hover-white">Logout</a>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-pale-blue w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-pale-blue w3-margin-right" onclick="w3_open()">☰</a>
  <span>AGENT MANAGEMENT SYSTEM</span>
</header>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
  <!-- Header -->
  <div class="w3-container" style="margin-top:20px" id="home">
    <h1 class="w3-jumbo"><b>View Agent</b></h1>
    <h1 class="w3-xxxlarge w3-text-black">Agent : <c:out value="${a.agentname}"/></u></b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>

<label for="agentID"><b>Agent ID: </b></label><c:out value="${a.agentid}"/>
<br><br>
<label for="agentName"><b>Agent Name: </b></label><c:out value="${a.agentname}"/>
<br><br>
<label for="agentGender"><b>Agent Gender: </b></label><c:out value="${a.agentgender}"/>
<br><br>
<label for="agentPhoneNo"><b>Agent Phone Number: </b></label><c:out value="${a.agentphoneno}"/>
<br><br>
<label for="agentAddress"><b>Agent Address: </b></label><c:out value="${a.agentaddress}"/>
<br><br>
<label for="agentEmail"><b>Agent Email Address: </b></label><c:out value="${a.agentemail}"/>
<br><br>
<label for="agentDateAssign"><b>Date Assigned: </b></label><c:out value="${a.agentDateAssign}"/>
<br><br>
<label for="agentStatus"><b>Agent Status: </b></label><c:out value="${a.agentstatus}"/>
<br><br>
<a href="UpdateAgentPersonalInformationController?id=${a.agentid}">Update Information</a>
</div>

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-8 footer" style="margin-top:45px;padding-right:58px"><p class="w3-right"><p align="center">© 2020 Agent Management System</p></div>

<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Accordion
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
function myAccFunc1() {
    var x = document.getElementById("demoAcc1");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
function myAccFunc2() {
    var x = document.getElementById("demoAcc2");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
function confirmationLogout(anchor)
{
	var conf = confirm('Are you sure want to Logout?');
	if(conf)
	window.location=anchor.attr("href");
}

</script>

</body>
</html>