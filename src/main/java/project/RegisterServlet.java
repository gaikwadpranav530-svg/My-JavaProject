package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out=response.getWriter();


int user_id = Integer.parseInt(request.getParameter("user_id"));

String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
String role=request.getParameter("role");
String type=request.getParameter("type");
String mobile=request.getParameter("mobile");

try{

Class.forName("org.postgresql.Driver");

Connection con=DriverManager.getConnection(
"jdbc:postgresql://localhost:5432/emp",
"postgres",
"pranav"
);



PreparedStatement check=con.prepareStatement(
"select * from user_registration where user_id=?"
);

check.setInt(1,user_id);

ResultSet rsCheck=check.executeQuery();

if(rsCheck.next()){
out.println("<script>");
out.println("alert('User ID already exists! Try another');");
out.println("window.location='register.jsp';");
out.println("</script>");
return;
}



PreparedStatement ps=con.prepareStatement(

"insert into user_registration(user_id,name,email,password,role,type,mobile) values(?,?,?,?,?,?,?)"

);

ps.setInt(1,user_id);
ps.setString(2,name);
ps.setString(3,email);
ps.setString(4,password);
ps.setString(5,role);
ps.setString(6,type);
ps.setString(7,mobile);

int i=ps.executeUpdate();



PreparedStatement ps3=con.prepareStatement(

"insert into leave_history(user_id,total_leave,used_leave,pending_leave) values(?,?,?,?)"

);

ps3.setInt(1,user_id);
ps3.setInt(2,30);
ps3.setInt(3,0);
ps3.setInt(4,30);

ps3.executeUpdate();



if(i>0)
{
out.println("<script>");
out.println("alert('Registration Successful');");
out.println("window.location='login.jsp';");
out.println("</script>");
}

con.close();

}
catch(Exception e){
out.println(e);
}

}
}
