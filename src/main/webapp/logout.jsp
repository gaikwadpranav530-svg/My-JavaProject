<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>

<style>

body{
font-family: Arial;
background:#f2f2f2;
}

.notification{
width:400px;
margin:150px auto;
padding:20px;
border:2px solid green;
border-radius:10px;
text-align:center;
background:white;
box-shadow:0px 0px 10px gray;
}

button{
padding:10px 25px;
font-size:16px;
margin-top:20px;
cursor:pointer;
border:none;
border-radius:5px;
background:green;
color:white;
}

button:hover{
background:darkgreen;
}

</style>

</head>

<body>

<%
session.invalidate();   // logout
%>

<div class="notification">

<h2>Logout Successful</h2>

<button onclick="window.location='login.jsp'">
OK
</button>

</div>

</body>
</html>