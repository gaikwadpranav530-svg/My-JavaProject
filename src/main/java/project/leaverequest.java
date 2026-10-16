package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

@WebServlet("/leaverequest")
public class leaverequest extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();



String Email=request.getParameter("Email");
String Leave_type=request.getParameter("Leave_type");
String FromDate=request.getParameter("FromDate");
String LeaveDays=request.getParameter("LeaveDays");
String ApplicantName=request.getParameter("ApplicantName");
String Department=request.getParameter("Department");
String Reason=request.getParameter("Reason");
String Contact=request.getParameter("Contact");
String Mobile=request.getParameter("Mobile");



HttpSession session=request.getSession();
Integer user_id=(Integer)session.getAttribute("user_id");

if(user_id==null){
response.sendRedirect("login.jsp");
return;
}

try{

Class.forName("org.postgresql.Driver");

Connection con=DriverManager.getConnection(
"jdbc:postgresql://localhost:5432/emp",
"postgres",
"pranav"
);



String sql = "INSERT INTO leave_request(leave_id,user_id,email,leave_type,fromdate,\"LeaveDays\",\"Status\","
		+ "\"Applicant Name\",department,reason,contact,mobile,hod_status,principle_status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

PreparedStatement ps = con.prepareStatement(sql);

int id=(int)(Math.random()*1000);

ps.setInt(1,id);
ps.setInt(2,user_id);
ps.setString(3,Email);
ps.setString(4,Leave_type);
ps.setDate(5,java.sql.Date.valueOf(FromDate));
ps.setInt(6,Integer.parseInt(LeaveDays));
ps.setString(7,"Pending");
ps.setString(8,ApplicantName);
ps.setString(9,Department);
ps.setString(10,Reason);
ps.setString(11,Contact);
ps.setString(12,Mobile);
ps.setString(13,"Pending");
ps.setString(14,"Pending");

int i = ps.executeUpdate();



if(i>0){


PreparedStatement psMail = con.prepareStatement(
"SELECT email FROM user_registration WHERE role='principal'"
);

ResultSet rsMail = psMail.executeQuery();

String to="";

if(rsMail.next()){
to = rsMail.getString("email");
}


String from="pranavgaikwad917@gmail.com";
String password="cqfwfintwygvfkee";

Properties props=new Properties();
props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.port","587");
props.put("mail.smtp.auth","true");
props.put("mail.smtp.starttls.enable","true");


props.put("mail.smtp.ssl.trust","smtp.gmail.com");
props.put("mail.smtp.ssl.protocols","TLSv1.2");
props.put("mail.smtp.ssl.checkserveridentity","false");

Session mailSession=Session.getInstance(props,
new Authenticator(){
protected PasswordAuthentication getPasswordAuthentication(){
return new PasswordAuthentication(from,password);
}
});



Message message=new MimeMessage(mailSession);
message.setFrom(new InternetAddress(from));
message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

message.setSubject("New Leave Request");

message.setText(
"New Leave Request\n\n"+
"Name: "+ApplicantName+
"\nEmail: "+Email+
"\nLeave Type: "+Leave_type+
"\nDays: "+LeaveDays
);

Transport.send(message);



PreparedStatement ps2 = con.prepareStatement(
"UPDATE leave_history SET used_leave = used_leave + ?, pending_leave = total_leave - (used_leave + ?) WHERE user_id=?"
);

int days=Integer.parseInt(LeaveDays);

ps2.setInt(1,days);
ps2.setInt(2,days);
ps2.setInt(3,user_id);

ps2.executeUpdate();



out.println("<script>");
out.println("alert('Leave Request Sent & Mail Sent to Principal');");
out.println("window.location='dashboard.jsp';");
out.println("</script>");

}
else{

out.println("<script>");
out.println("alert('Leave Request Failed');");
out.println("window.location='leaverequest.jsp';");
out.println("</script>");

}

con.close();

}catch(Exception e){
e.printStackTrace();
out.println(e);
}

}
}