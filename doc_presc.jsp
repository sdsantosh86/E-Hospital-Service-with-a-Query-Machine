<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%HttpSession sess = request.getSession(false); %>
<%
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals",
            "root", "ch@rwi");
    Statement st = con.createStatement(); 
    String doc = (String)sess.getAttribute("dname");
    String puser = request.getQueryString();
    
    ResultSet prd = st.executeQuery("select doc,pdate,ailment,med from presc where puser='"+puser+"' AND doc='"+doc+"' order by pdate DESC");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Members</title>
    <link rel="stylesheet" href="css/presc.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
</head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<body>
<div id="page">
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
            <div class="block personal fl">
                <h2 class="title"><%=prd.getString(2)%></h2>
                <div class="content">
                    <p class="price"><span><%=prd.getString(3)%></span></p>
                </div>
                <ul class="features">
                    <li><span class="fontawesome-star"></span><%=prd.getString(4)%></li>
                </ul>
                <div class="pt-footer"><p>Dr.<%=prd.getString(1)%></p></div>
            </div>
                            <%
                                    }
                                  }
                            catch(Exception e){
                                out.println(e);
                            }
                            %>
                    </div> </div>
</body>
</html>
