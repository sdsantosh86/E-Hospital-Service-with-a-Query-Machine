<%-- 
    Document   : patient_delete
    Created on : 10 Jan, 2017, 6:08:37 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    try {
        
    String patient = request.getQueryString();
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
    Statement st = conn.createStatement();
    int i = st.executeUpdate("delete from patients where userid='"+patient+"'");
        if (i!=0) {
        response.sendRedirect("members.jsp");
        }
    }
    catch(Exception e){
        out.println(e);
    }
    
    %>

