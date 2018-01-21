<%-- 
    Document   : admin_login
    Created on : 4 Jan, 2017, 10:23:49 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    try{
    String userid = request.getParameter("mname");
    String pwd = request.getParameter("mpass");    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from management where userid='"+userid+"' and pass='"+pwd+"'");
    if (rs.next()) {
        response.sendRedirect("management.html");
    } 
    else {
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Username/Password incorrect');");
       out.println("location='doctor.html';");
       out.println("</script>");
    }
    }
    catch(Exception e){
        out.println(e);
    }
%>