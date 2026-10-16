<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<style>


body{
    margin:0;
    padding:0;
    font-family: Arial, sans-serif;

    background: url("svpm.jpg") no-repeat center center/cover;

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


.container{
    position:relative;
    width:380px;
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


input, select{
    width:100%;
    padding:10px;
    margin-top:10px;

    border:none;
    border-radius:6px;
    outline:none;

    background: rgba(255,255,255,0.8);
}


input[type=submit]{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    color:white;
    font-size:16px;
    margin-top:15px;
    cursor:pointer;
    transition:0.3s;
}

input[type=submit]:hover{
    transform:scale(1.05);
    background:linear-gradient(45deg,#0056b3,#003f7f);
}

</style>

</head>

<body>

<div class="container">

<h2>Register</h2>

<form action="RegisterServlet" method="post">

User ID:
<input type="number" name="user_id" required>

Name:
<input type="text" name="name" required>

Email:
<input type="email" name="email" required>

Password:
<input type="password" name="password" required>

Mobile:
<input type="text" name="mobile" required pattern="[0-9]{10}">

Role:
<select name="role" required>
<option value="">Select Role</option>
<option value="staff">Staff</option>
<option value="clerk">Clerk</option>
<option value="hod">HOD</option>
<option value="principal">Principal</option>
</select>

Type:
<select name="type" required>
<option value="">Select Type</option>
<option value="teaching">Teaching</option>
<option value="non-teaching">Non-Teaching</option>
</select>

<input type="submit" value="Register">

</form>

</div>

</body>
</html>