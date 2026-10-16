package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();

int user_id = Integer.parseInt(request.getParameter("user_id"));
String password = request.getParameter("password");

try{

Class.forName("org.postgresql.Driver");

Connection con = DriverManager.getConnection(
"jdbc:postgresql://localhost:5432/emp",
"postgres",
"pranav"
);

String sql = "select * from user_registration where user_id=? and password=?";

PreparedStatement ps = con.prepareStatement(sql);

ps.setInt(1,user_id);
ps.setString(2,password);

ResultSet rs = ps.executeQuery();

if(rs.next())
{

HttpSession session=request.getSession();
session.setAttribute("user_id",user_id);

out.println("<script>");
out.println("alert('Login Successful');");
out.println("window.location='dashboard.jsp';");
out.println("</script>");

}
else
{

out.println("<script>");
out.println("alert('Invalid User ID or Password');");
out.println("window.location='login.jsp';");
out.println("</script>");

}

con.close();

}
catch(Exception e)
{
out.println(e);
}

}
}