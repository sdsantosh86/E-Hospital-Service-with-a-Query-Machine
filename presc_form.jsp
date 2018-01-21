<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%HttpSession sess = request.getSession(false); %>
<%
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals",
            "root", "ch@rwi");
    Statement st = con.createStatement(); 
    String doc =(String)sess.getAttribute("dname");
    String puser = request.getQueryString();
    
    ResultSet pd = st.executeQuery("select a.pname,p.gender,a.app_date from patients p,appts a where a.puser='"+puser+"' AND a.doctor='"+doc+"' AND a.puser=p.userid");
    if(pd.next()){
        String date = pd.getString(3);
        sess.setAttribute("date",date);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Prescription Form</title>
    <link rel="stylesheet" href="css/registration.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/styleR.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
    <script src="js/reg_validation.js" type="text/javascript"></script>
    <script TYPE="text/javascript">
    function popup(mylink, windowname) { 
    if (! window.focus)return true;
    var href;
    if (typeof(mylink) == 'string') href=mylink;
    else href=mylink.href; 
    window.open(href, windowname, 'width=600,height=600,scrollbars=yes'); 
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
                    <a href="view_appts.jsp">Appointments </a>
                </li>
            </ul>
        </div>
    </div>
    <div id="body">
        <div class="header">
            <div>
                <h1>Prescription</h1>
            </div>
        </div>
        <div class="body">
            <img src="images/medicines.jpg" alt="" height="249">
        </div>

        <div class="footer">
            <div class="article">
                <h1>Write Prescription</h1>
                <div class="container">
                    <div  class="form">
                        <p class="contact"><label>Patient Name:</label>&nbsp;&nbsp;<b><%= pd.getString(1)%></b></p>                       
                        <p class="contact"><label>Patient UserId:</label>&nbsp;&nbsp;<% out.println(puser);%></p>
                        <p class="contact"><label>Gender:</label>&nbsp;&nbsp;<%= pd.getString(2)%></p>
                        <p class="contact"><label>Date:</label>&nbsp;&nbsp;<%= pd.getString(3)%></p>
                        <%  }
                           }
                           catch(Exception e){
                           out.println(e);
                         }
                    %>
                    <p class="contact"><label><a href="doc_presc.jsp?<%= request.getQueryString()%>" onClick="return popup(this, 'Presc')">View Previous Prescriptions</a></label><br><br>
                    <form name="presc" action="presc_action.jsp?<%= request.getQueryString()%>" method="post">
                          <p class="contact"> <label>Age&nbsp;&nbsp;<input name="age" type="text" class="birthday" required=""></label></p>
                            <p class="contact"><label for="ail">Ailment</label></p>
                            <input id="ail" name="ail" placeholder="Ailment" required="" maxlength="10" type="text">

                            <p class="contact"><label>Prescription</label></p>
                            <textarea required="" class="birthday" name="med" cols="62" rows="10" placeholder="Write here..."></textarea><br><br>
                            <br>
                            <br>
                            <input class="buttom" name="submit" onclick="return presc_validation()" id="submit" tabindex="5" value="Submit" type="submit">
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
