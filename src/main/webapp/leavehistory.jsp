<%@ page import="java.sql.*" %>

<html>
<head>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:url('clg.jpg') no-repeat center center fixed;
    background-size:cover;
}


.container{
    width:100%;
    text-align:center;
    margin-top:50px;
}


.form-box{
    background:rgba(255,255,255,0.8);
    display:inline-block;
    padding:20px;
    border-radius:10px;
}


table{
    width:70%;
    margin:auto;
    margin-top:20px;
    border-collapse:collapse;
    background:rgba(255,255,255,0.85);
    font-size:18px;
}

th, td{
    padding:12px;
    border:1px solid black;
    text-align:center;
}

th{
    background:#4CAF50;
    color:white;
}


.button-container{
    margin-top:20px;
}

button{
    padding:10px 20px;
    font-size:16px;
    background:#4CAF50;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}


.error{
    color:red;
    background:rgba(255,255,255,0.8);
    display:inline-block;
    padding:10px;
    border-radius:8px;
}

</style>

</head>

<body>

<div class="container">

<h2>Leave History</h2>

<div class="form-box">

<form method="post">

Enter User ID:
<input type="number" name="user_id" required>

<input type="submit" value="Submit">

</form>

</div>

<br>

<%

Integer loginUserId=(Integer)session.getAttribute("user_id");

if(loginUserId==null)
{
response.sendRedirect("login.jsp");
}

String uid=request.getParameter("user_id");

if(uid!=null)
{

int enteredId=Integer.parseInt(uid);

if(loginUserId!=enteredId)
{

%>

<h3 class="error">Error: You cannot view other user's leave history</h3>

<div class="button-container">
<button onclick="location.href='dashboard.jsp'">OK</button>
</div>

<%

}
else
{

try{

Class.forName("org.postgresql.Driver");

Connection con=DriverManager.getConnection(
"jdbc:postgresql://localhost:5432/emp",
"postgres",
"pranav"
);

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM leave_history WHERE user_id=?"
);

ps.setInt(1,enteredId);

ResultSet rs=ps.executeQuery();

%>

<table>

<tr>
<th>History ID</th>
<th>User ID</th>
<th>Total Leave</th>
<th>Pending Leave</th>
<th>Used Leave</th>
</tr>

<%

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("history_id")%></td>
<td><%=rs.getInt("user_id")%></td>
<td><%=rs.getInt("total_leave")%></td>
<td><%=rs.getInt("pending_leave")%></td>
<td><%=rs.getInt("used_leave")%></td>
</tr>

<%
}

rs.close();
ps.close();
con.close();

}catch(Exception e){
out.println(e);
}

%>

</table>

<div class="button-container">
<button onclick="location.href='dashboard.jsp'">OK</button>
</div>

<%
}
}
%>

</div>

</body>
</html>