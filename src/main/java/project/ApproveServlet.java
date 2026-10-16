package project;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

@WebServlet("/ApproveServlet")
public class ApproveServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int id = Integer.parseInt(request.getParameter("lid"));

try{

Class.forName("org.postgresql.Driver");

Connection con=DriverManager.getConnection(
"jdbc:postgresql://localhost:5432/emp",
"postgres",
"pranav"
);



PreparedStatement ps1 = con.prepareStatement(
"SELECT email, \"Applicant Name\" FROM leave_request WHERE leave_id=?"
);

ps1.setInt(1,id);
ResultSet rs = ps1.executeQuery();

String userEmail="";
String name="";

if(rs.next()){
userEmail = rs.getString("email");
name = rs.getString("Applicant Name");
}



PreparedStatement ps = con.prepareStatement(
"UPDATE leave_request SET \"Status\"='Approved' WHERE leave_id=?"
);

ps.setInt(1,id);
ps.executeUpdate();



String from="pranavgaikwad917@gmail.com";   
String password="cqfwfintwygvfkee";          

Properties props=new Properties();
props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.port","587");
props.put("mail.smtp.auth","true");
props.put("mail.smtp.starttls.enable","true");

Session mailSession=Session.getInstance(props,
new Authenticator(){
protected PasswordAuthentication getPasswordAuthentication(){
return new PasswordAuthentication(from,password);
}
});

Message message=new MimeMessage(mailSession);
message.setFrom(new InternetAddress(from));
message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));

message.setSubject("Leave Approved");

message.setText("Hello "+name+",\n\nYour leave has been APPROVED ✅");

Transport.send(message);



response.sendRedirect("leaveapproval.jsp");

con.close();

}catch(Exception e){
e.printStackTrace();
response.getWriter().println(e);
}

}
}