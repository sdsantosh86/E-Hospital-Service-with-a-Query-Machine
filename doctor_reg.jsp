<%-- 
    Document   : doctor_reg
    Created on : 5 Jan, 2017, 5:55:33 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%  String regno = request.getParameter("doc_regno");
    String name = request.getParameter("dname");     
    String duser = request.getParameter("username");
    String dpass = request.getParameter("password");
    String spec = request.getParameter("doc_spc");
    String gender = request.getParameter("gender");    
    String phone = request.getParameter("phone");
    String time = request.getParameter("timings");
    
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals",
            "root", "ch@rwi");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into doctors(regno,dname,spec,gender,phone,userid,pwd,timings) values('"+regno+"','"+name+"','"+spec+"','"+gender+"','"+phone+"','"+duser+"','"+dpass+"','"+time+"')");
    if (i!=0) {
        response.sendRedirect("management.html");
    }
    }
    catch(Exception e){
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Duplicate data found. Try again');");
       out.println("window.history.back();");
       out.println("</script>");
    }
    %>

