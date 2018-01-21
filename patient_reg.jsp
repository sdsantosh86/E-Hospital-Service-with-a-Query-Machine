<%-- 
    Document   : patient_reg
    Created on : 30 Dec, 2016, 4:32:35 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%  String first = request.getParameter("fname");    
    String email = request.getParameter("email");    
    String puser = request.getParameter("username");
    String ppass = request.getParameter("password");
    String gender = request.getParameter("gender");    
    String phone = request.getParameter("phone");
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals",
            "root", "ch@rwi");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into patients(fname,email,userid,pwd,gender,phone) values('"+first+"','"+email+"','"+puser+"','"+ppass+"','"+gender+"','"+phone+"')");
    if (i!=0) {
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Registered Successfully');");
       out.println("location='patient.html';");
       out.println("</script>");
    }
    }
    catch(Exception e){
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Duplicate data found. Try again');");
       out.println("window.history.back();");
       out.println("</script>");
    }
    %>

