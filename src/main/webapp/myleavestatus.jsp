<%@ page import="java.sql.*" %>

<html>
<head>
<title>My Leave Status</title>
</head>
<style>


table{
    width:80%;
    margin:auto;
    border-collapse:collapse;
    font-size:18px;
}

th, td{
    padding:12px;
    border:1px solid black;
    text-align:center;
}

th{
    background-color:#4CAF50;
    color:white;
}
</style>

<body>

<h2 align="center">My Leave Status</h2>

<%
Integer user_id=(Integer)session.getAttribute("user_id");

if(user_id==null){
response.sendRedirect("login.jsp");
}

try{

Class.forName("org.postgresql.Driver");

Connection con=DriverManager.getConnection(
"jdbc:postgresql://localhost:5432/emp",
"postgres",
"pranav"
);

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM leave_request WHERE user_id=?"
);

ps.setInt(1,user_id);

ResultSet rs=ps.executeQuery();
%>

<table border="1" align="center">

<tr>
<th>Leave ID</th>
<th>Leave Type</th>
<th>Days</th>
<th>Status</th>
</tr>

<%
while(rs.next()){
%>

<tr>
<td><%=rs.getInt("leave_id")%></td>
<td><%=rs.getString("Leave_type")%></td>
<td><%=rs.getInt("LeaveDays")%></td>
<td><%=rs.getString("Status")%></td>
</tr>

<%
}

rs.close();
con.close();

}catch(Exception e){
out.println(e);
}
%>

</table>

<br><br>

<center>
<button onclick="location.href='dashboard.jsp'">OK</button>
</center>

</body>
</html>
