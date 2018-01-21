<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page  import="java.util.*" %>
<% HttpSession sess = request.getSession(false);%>
<% String data="";
   String doc="";%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient's Homepage</title>
    <link rel="stylesheet" href="css/patient.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
    <link href="http://fonts.googleapis.com/css?family=Waiting+for+the+Sunrise" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <script src="js/mobile.js" type="text/javascript"></script>
</head>
<body>
<div id="page">
    <div id="header">
        <div>
            <a href="home_page.html" class="logo"><img src="images/logo.png" alt=""></a>
            <ul id="navigation">
                <li>
                    <a href="patient_home.jsp">Homepage</a>
                </li>
                <li>
                    <a href="kill_session.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="body">
        <div class="header">
            <div>
                <h1>HomePage</h1>
            </div>
        </div>
        <div id="content">
            <ul class="sale">
                <li>
                    <a name="querybox"><h1>Welcome back !</h1></a>
        
                    <h2><% out.println(sess.getAttribute("userid"));%></h2>
                </li>
                <li>
                    <a href="patient_book_app.jsp"><img src="images/book.jpg" height="100" width="100">
                    <h2>Book an Appointment</h2></a>
                </li>
                <li>
                    <a href="view_presc.jsp?<%=sess.getAttribute("userid")%>"><img src="images/drug.jpg" alt="" height="100" width="100">
                    <h2>View Prescriptions</h2></a>
                </li>
            </ul>
        </div>
        <form action="test_query.jsp" method="post">
        <div class="wrapper">
            <input class="search" type="text" name="query" placeholder="Ask your Query here..." required="" maxlength="40">
            <input class="submit" type="submit" value=" ">
        </div></form>
        <div id="content">
        <div class="result">
            <% try{
                data = sess.getAttribute("data").toString();
                doc =  sess.getAttribute("doc").toString();
            } 
            catch (Exception e){
            }
            finally{ 
                %>
                <h3><%= data %></h3><br><br>
                <p class="line-1 anim-typewriter"><%= doc %>&nbsp;&nbsp;
                    <a href="patient_book_app.jsp" class="myButton">Book Appointment</a></p></div></div>
            <% } %>
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
