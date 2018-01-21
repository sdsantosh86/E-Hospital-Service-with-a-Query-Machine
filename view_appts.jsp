<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%HttpSession sess = request.getSession(false); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Appointments</title>
    <link rel="stylesheet" href="css/members.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
    <script TYPE="text/javascript">
    function popup(mylink, windowname) { 
    if (! window.focus)return true;
    var href;
    if (typeof(mylink) == 'string') href=mylink;
    else href=mylink.href; 
    window.open(href, windowname, 'width=800,height=600,scrollbars=yes'); 
    return false; 
    }
    </script>
</head>
<body>
<div id="page">
    <div id="header">
        <div>
            <a href="home_page.html" class="logo"><img src="images/logo.png" alt=""></a>
            <ul id="navigation">
                <li>
                    <a href="doctor_home.html">Homepage</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="body">
        <div class="header">
            <div>
                <h1>Appointments</h1>
            </div>
        </div>
    </div>
    <div class="wrapper">
        <div class="table">

            <div class="row theader blue">
                <div class="cell">Appt. Date</div>
                <div class="cell">Patient Name</div>
                <div class="cell">Mobile</div>
                <div class="cell">View</div>
                <div class="cell">Status</div>
            </div>
            <% 
                try{
                    
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
                Statement st = conn.createStatement();
                String duser =(String)sess.getAttribute("duser");
                ResultSet doctor = st.executeQuery("select dname from doctors where userid='"+duser+"'");
                if(doctor.next()){
                String dname = doctor.getString(1);
                sess.setAttribute("dname",dname);
                ResultSet appts = st.executeQuery("select app_date,pname,p_phone,puser,status from appts where doctor='"+dname+"' AND status='Waiting' order by app_date desc");
                            while(appts.next())
                            {
                               %>
                                <div class="row">
                                <div class="cell"><%=appts.getDate(1) %></div>
                                <div class="cell"><%=appts.getString(2) %></div>
                                <div class="cell"><%=appts.getString(3) %></div>
                                <% if(appts.getString(5).equalsIgnoreCase("Waiting")){ %>
                                <div class="cell"><a href="presc_form.jsp?<%=appts.getString(4)%>"><button>OPEN</button></a></div>
                                               <% }
                                   else{ %>
                                   <div class="cell"><a href="doc_presc.jsp?<%= appts.getString(4) %>" onClick="return popup(this, 'Presc')"><button>OPEN</button></a></div>
                                <% } %>
                                <div class="cell"><div class="tooltip"><a href="status_upd.jsp?<%=appts.getString(4)%>"><%=appts.getString(5) %>&nbsp;</a><span class="tooltiptext">Click to update</span></div></div>
                                </div>
                            <% 
                                }
                                }
                                }
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
