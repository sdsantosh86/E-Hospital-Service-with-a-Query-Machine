<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.Date , javax.servlet.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%ResultSet resultset =null;%>
 <%
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/cgps_hospitals","root","ch@rwi");

       Statement stm = connection.createStatement() ;
       resultset =stm.executeQuery("select dname,timings from doctors") ;
%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Book an appointment</title>
    <link rel="stylesheet" href="css/registration.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/styleR.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
    <script src="js/form_validation.js" type="text/javascript"></script>
</head>
<body>
<div id="page">
    <div id="header">
        <div>
            <a href="home_page.html" class="logo"><img src="images/logo.png" alt=""></a>
            <ul id="navigation">
                <li>
                    <a href="patient_home.jsp">Homepage </a>
                </li>
                <li class="selected">
                    <a href="patient_book_app.jsp">Appointment</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="body">
        <div class="header">
            <div>
                <h1>Book an appointment</h1>
            </div>
        </div>
        <div class="body">
            <img src="images/cover5.jpg" alt="" height="249">
        </div>

        <div class="footer">
            <div class="article">
                <h1>Appointment Form</h1>

                <div class="container">
                    <div  class="form">
                        <form name="bookform" action="book_action.jsp" method="post" onsubmit="return bform_validation()">
                            
                            <select class="select-style month" required="" name="doc_list">
                                <option value="">Choose a doctor</option>
                                <%  while(resultset.next()){ %>
                                <option value="<%= resultset.getString(1)%>">Dr.<%= resultset.getString(1)%>&nbsp;&nbsp;(<%=resultset.getString(2)%>)</option>
                                <% } %>
                            </select><br><br>
                              <%
                                    }
                                catch(Exception e)
                                {
                                 out.println("wrong entry"+e);
                                }
                               %>
                            <fieldset>
                                <label>Appointment date :</label>
                                <label class="month">
                                    <select class="select-style" required="" name="app_date">
                                        <option value="">Choose date</option>
                                        <%Date today = new Date( );
                                        Date tomo = new Date(today.getTime() + (1000 * 60 * 60 * 24));
                                        Date dayafter = new Date(today.getTime() + (1000 * 60 * 60 * 24) + (1000 * 60 * 60 * 24));
                                        SimpleDateFormat db = new SimpleDateFormat ("yyyy-MM-dd");
                                        SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
                                        %>
                                        <option value="<% out.print( db.format(tomo) ); %>">
                                            <% out.print( ft.format(tomo) ); %>&nbsp;</option> 
                                        <option value="<% out.print( db.format(dayafter) ); %>">
                                            <% out.print( ft.format(dayafter) ); %>&nbsp;</option>   
                                        </option>
                                    </select> </label>
                            </fieldset>
                            <br>

                            <p class="contact"><label for="phone">Mobile phone</label></p>
                            <input id="phone" name="phone" placeholder="phone number" required="" maxlength="10" type="text"> <br>
                            <br>
                            <br>
                            <input class="buttom" tabindex="5" value="Submit" type="submit">
                        </form>
                    </div>
                </div>
            </div>
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
