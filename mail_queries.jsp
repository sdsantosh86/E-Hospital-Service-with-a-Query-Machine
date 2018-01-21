<%-- 
    Document   : mail_queries
    Created on : 19 Mar, 2017, 4:58:12 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Queries</title>
    <link rel="stylesheet" href="css/members.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
</head>
<body>
<div id="page">
    <div id="header">
        <div>
            <a href="home_page.html" class="logo"><img src="images/logo.png" alt=""></a>
        </div>
    </div>
    <div id="body">
        <div class="header">
            <div>
                <h1>Patient Queries</h1>
            </div>
        </div>
        </div>
                    <div class="wrapper">
                        <h1>Unanswered Queries</h1>
                        <div class="table">
                            <div class="row theader green">
                                <div class="cell">S No.</div>
                                <div class="cell">Name</div>
                                <div class="cell">Subject</div>
                                <div class="cell">Query</div>
                                <div class="cell"></div>
                                
                            </div>
                            <%
                                try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
                                Statement st = conn.createStatement();
                                String sts="NA";
                                ResultSet mq;
                                mq = st.executeQuery("select sno,pname,sub,content from mailquery where status='"+sts+"'");
                                
                                while(mq.next())
                            {
                            %>
                            <div class="row">
                                <div class="cell"><%=mq.getInt(1) %></div>
                                <div class="cell"><%=mq.getString(2) %></div>
                                <div class="cell"><%=mq.getString(3) %></div>
                                <div class="cell"><%=mq.getString(4) %></div>
                                <div class="cell"><a href="reply.jsp?<%=mq.getInt(1)%>"><button>Reply</button></a></div>
                            </div>
                            <%
                            }
                            %>
                            </div>
                        
                            <%
                              }
                             catch(Exception e){
                                out.println(e);
                            }
                           %>
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

