<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Members</title>
    <link rel="stylesheet" href="css/members.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
</head>
<body>
<div id="page">
    <div id="header">
        <div>
            <a href="home_page.html" class="logo"><img src="images/logo.png" alt=""></a>
            <ul id="navigation">
                <li>
                    <a href="management.html">Homepage</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="body">
        <div class="header">
            <div>
                <h1>Members of the hospital</h1>
            </div>
        </div>
        </div>
                    <div class="wrapper">
                        <h1>Doctors</h1>
                        <div class="table">
                            <div class="row theader green">
                                <div class="cell">Reg. No.</div>
                                <div class="cell">Name</div>
                                <div class="cell">Specialization</div>
                                <div class="cell">Gender</div>
                                <div class="cell">Phone</div>
                                <div class="cell">UserId</div>
                                <div class="cell">Password</div>
                                <div class="cell"></div>
                                
                            </div>
                            <%
                                try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
                                Statement st = conn.createStatement();
                                ResultSet doctors;
                                doctors = st.executeQuery("select * from doctors");
                                
                                while(doctors.next())
                            {
                            %>
                            <div class="row">
                                <div class="cell"><%=doctors.getInt(1) %></div>
                                <div class="cell">Dr.<%=doctors.getString(2) %></div>
                                <div class="cell"><%=doctors.getString(3) %></div>
                                <div class="cell"><%=doctors.getString(4) %></div>
                                <div class="cell"><%=doctors.getString(5) %></div>
                                <div class="cell"><%=doctors.getString(6) %></div>
                                <div class="cell"><%=doctors.getString(7) %></div>
                                <div class="cell"><a href="delete_doc.jsp?<%= doctors.getString(6)%>"><button>X</button></a></div>
                            </div>
                            <%
                            }
                            %>
                            </div>
                        <h1>Patients</h1>
                        <div class="table">

                            <div class="row theader">
                                <div class="cell">Full name</div>
                                <div class="cell">Email</div>
                                <div class="cell">Gender</div>
                                <div class="cell">UserId</div>
                                <div class="cell">Password</div>
                                <div class="cell">Phone</div>
                                <div class="cell"></div>
                            </div>
                            <% 
                                ResultSet patients;
                                patients = st.executeQuery("select * from patients");
                                while(patients.next())
                            {
                                %>
                            <div class="row">
                                <div class="cell"><%=patients.getString(1) %></div>
                                <div class="cell"><%=patients.getString(2) %></div>
                                <div class="cell"><%=patients.getString(5) %></div>
                                <div class="cell"><%=patients.getString(3) %></div>
                                <div class="cell"><%=patients.getString(4) %></div>
                                <div class="cell"><%=patients.getString(6) %></div>
                                <div class="cell"><a href="delete_patients.jsp?<%=patients.getString(3) %>"><button>X</button></a></div>
                            </div>
                            <%
                                    }
                                 %>
                            </div>
                            <h1><a name="appts">Appointments</a></h1>
                        <div class="table">
                            <div class="row theader blue">
                                <div class="cell">Doctor</div>
                                <div class="cell">Appt. Date</div>
                                <div class="cell">Patient Name</div>
                                <div class="cell">Patient UserId</div>
                                <div class="cell">Phone</div>
                                <div class="cell">Status</div>
                            </div>
                            <% 
                                ResultSet appts;
                                appts = st.executeQuery("select * from appts order by doctor,app_date");
                                while(appts.next())
                            {
                               %>
                                <div class="row">
                                <div class="cell">Dr.<%=appts.getString(1) %></div>
                                <div class="cell"><%=appts.getDate(2) %></div>
                                <div class="cell"><%=appts.getString(3) %></div>
                                <div class="cell"><%=appts.getString(4) %></div>
                                <div class="cell"><%=appts.getString(5) %></div>
                                <div class="cell"><%=appts.getString(6) %></div>
                            </div>
                            <%
                                }
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
