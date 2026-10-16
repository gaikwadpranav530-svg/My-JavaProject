<%@ page import="java.sql.*" %>

<h2 align="center">Leave Approval</h2>

<table border="1" align="center">

<tr>
<th>ID</th>
<th>Name</th>
<th>Days</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
Class.forName("org.postgresql.Driver");

Connection con=DriverManager.getConnection(
"jdbc:postgresql://localhost:5432/emp",
"postgres",
"pranav"
);

PreparedStatement ps=con.prepareStatement(
"select * from leave_request"
);

ResultSet rs=ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("leave_id")%></td>
<td><%=rs.getString("Applicant Name")%></td>
<td><%=rs.getInt("LeaveDays")%></td>
<td><%=rs.getString("Status")%></td>

<td>
<a href="approve?lid=<%=rs.getInt("leave_id")%>">Approve</a> |
<a href="reject?lid=<%=rs.getInt("leave_id")%>">Reject</a>
</td>

</tr>

<%
}
con.close();
%>

</table>