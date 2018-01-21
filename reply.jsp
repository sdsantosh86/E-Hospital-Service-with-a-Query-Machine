<%-- 
    Document   : reply
    Created on : 19 Mar, 2017, 5:42:30 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.javapapers.java.mail.JavaEmail"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import ="java.sql.*" %>

       <%
       String emailTo,emailSubject,query;
       try {
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root","ch@rwi");
        
       String id = request.getQueryString();
       Statement stm = connection.createStatement() ;
       ResultSet rs=stm.executeQuery("select pname,sub,email,content from mailquery where sno='"+id+"'") ;
       if(rs.next()){
       emailTo = rs.getString(3);
       emailSubject = "Re: "+rs.getString(2);
       query = rs.getString(4);
       
        %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reply</title>
    <link rel="stylesheet" href="css/members.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
</head>
<body>
<div id="page">
    <div id="header">
        <div>
            <a href="home_page.html" class="logo"><img src="images/logo.png" alt=""></a>
            <ul id="navigation">
            </ul>
        </div>
    </div>
    <div id="body">
        <div class="header">
            <div>
                <h1>Reply Form</h1>
            </div>
        </div>
        </div>
                    <div class="wrapper">
                        <h1><%=query %></h1>
                        <h4>To: <%=emailTo %></h4>
                        <h4>Subject: <%=emailSubject%></h4>
                        <form name="reply" action="" method="post">
                            <textarea class="textbox" name="replymsg" required="" cols="50" rows="7" placeholder="Reply here..."></textarea><br><br>
                        <input class="css_button" type="submit" value="Send" name="send">
                        </form>
    <%                    
    if (request.getParameter("send") != null) {
		JavaEmail javaEmail = new JavaEmail();
		javaEmail.setMailServerProperties();
                String status="A";
		String emailBody = "In reply to: "+"<br>"+rs.getString(4)+"<br><br><br>";
		emailBody = emailBody + "Dear " + rs.getString(1) +","+"<br>";
		emailBody = emailBody + request.getParameter("replymsg")+ "<br>";
                
		javaEmail.createReplyMessage(emailTo, emailSubject, emailBody);
 
		javaEmail.sendEmail();
                int i = stm.executeUpdate("update mailquery set status='"+status+"' where sno='"+id+"'");
                if(i!=0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your response has been sent.');");
                out.println("location='mail_queries.jsp';");
                out.println("</script>");
                } } 
    } }
                catch(Exception e){
                out.println(e);
                }              
       %>
                            </div>
                            </div>
    <div id="footer">
        <div>
            <div class="connect">
                <a href="http://www.facebook.com" class="facebook">facebook</a>
                <a href="http://www.twitter.com" class="twitter">twitter</a>
                <a href="http://www.googleplus.com" class="googleplus">googleplus</a>
                <a href="http://www.pinterest.com" class="pinterest">pinterest</a>
            </div>
            <p>&copy; 2017 CGPS Hospitals. All Rights Reserved.</p>
        </div>
    </div>
</div>
</body>
</html>

