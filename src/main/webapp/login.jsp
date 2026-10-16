<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Login</title>

<style>


body{
    margin:0;
    padding:0;
    font-family: Arial, sans-serif;

    background: url("bg.jpg") no-repeat center center/cover;

    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}


body::before{
    content:"";
    position:absolute;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.4);
}


.box{
    position:relative;
    width:330px;
    padding:30px;

    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);

    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.4);

    color:white;
    z-index:1;
}


h2{
    text-align:center;
    margin-bottom:20px;
}


input{
    width:100%;
    padding:10px;
    margin-top:10px;

    border:none;
    border-radius:6px;
    outline:none;

    background: rgba(255,255,255,0.85);
}


button{
    width:100%;
    padding:10px;
    margin-top:15px;

    background:linear-gradient(45deg,#00c6ff,#0072ff);
    color:white;

    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:16px;

    transition:0.3s;
}

button:hover{
    transform:scale(1.05);
    background:linear-gradient(45deg,#0056b3,#003f7f);
}


.register{
    text-align:center;
    margin-top:15px;
}

.register a{
    color:#fff;
    text-decoration:none;
    font-weight:bold;
}

.register a:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="box">

<h2>Staff Login</h2>

<form action="LoginServlet" method="post">

User ID
<input type="text" name="user_id" required>

Password
<input type="password" name="password" required>

<button type="submit">Login</button>

</form>

<div class="register">
    <p>Don't have an account? 
        <a href="register.jsp">Register here</a>
    </p>
</div>

</div>

</body>
</html>