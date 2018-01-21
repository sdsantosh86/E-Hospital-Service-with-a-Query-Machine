<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%HttpSession sess = request.getSession(false); %>
<%
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals",
            "root", "ch@rwi");
    Statement st = con.createStatement(); 
    String puser = request.getQueryString();
    
    ResultSet prd = st.executeQuery("select doc,pdate,ailment,med from presc where puser='"+puser+"' order by pdate DESC");
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Prescriptions</title>
    <link rel="stylesheet" href="css/presc.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
    <meta name="viewport" content="width=device-width">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
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
                <h1>List of Prescriptions</h1>
            </div>
        </div>
        </div>
        <div class="wrapper">
        <div class="pricing-table group">
                <% while(prd.next()){
                        %>
                       <div class="block personal fr">
                <h2 class="title"><%=prd.getDate(2)%></h2>
                <div class="content">
                    <p class="price"><span><%=prd.getString(3)%></span></p>
                </div>
                <ul class="features">
                    <li><span class="fontawesome-star"><%=prd.getString(4)%></span></li>
                </ul>
                <div class="pt-footer">
                    <p>Dr.<%=prd.getString(1)%></p>
                </div>
            </div>
                            <%
                                    }
                                  }
                            catch(Exception e){
                                out.println(e);
                            }
                            %> </div></div>           
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
</body>
</html>
