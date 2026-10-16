<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>

body{
    font-family: Arial;
    margin: 0;
    padding: 0;

    
    background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
                url('background.jpg');
    background-size: cover;
    background-position: center;
    height: 100vh;

    display: flex;
    justify-content: center;
    align-items: center;
}


.container{
    text-align: center;
}


.logo{
    width: 140px;
    margin-bottom: 20px;
    opacity: 0.5;
}


.box{
    background: rgba(255, 255, 255, 0.15);
    padding: 35px;
    width: 320px;
    border-radius: 15px;
    box-shadow: 0px 0px 25px rgba(0,0,0,0.6);

    backdrop-filter: blur(8px); /* glass effect */
}


h2{
    color: white;
    margin-bottom: 20px;
}


button{
    width: 230px;
    padding: 12px;
    margin: 10px;
    font-size: 16px;
    background: linear-gradient(to right, #00c6ff, #0072ff);
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover{
    background: linear-gradient(to right, #0072ff, #004aad);
    transform: scale(1.05);
}

</style>
</head>

<body>

<div class="container">

    <!-- Center Logo -->
    <img src="logo.png" class="logo">

    <div class="box">

        <h2>Dashboard</h2>

        <form action="leaverequest.jsp">
            <button type="submit">Leave Request</button>
        </form>

        <form action="leavehistory.jsp">
            <button type="submit">Leave History</button>
        </form>

        <form action="myleavestatus.jsp">
            <button type="submit">Check Leave Status</button>
        </form>

        <form action="login.jsp">
            <button type="submit">Logout</button>
        </form>

    </div>

</div>

</body>
</html>