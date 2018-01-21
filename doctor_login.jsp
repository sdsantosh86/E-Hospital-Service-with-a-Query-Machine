<%-- 
    Document   : doctor_login
    Created on : 5 Jan, 2017, 5:42:56 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<%
    try{
    String userid = request.getParameter("dname");    
    String pwd = request.getParameter("dpass");
    
    HttpSession sess = request.getSession(); 
    sess.setAttribute("duser", userid);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from doctors where userid='"+userid+"' and pwd='"+pwd+"'");
    if (rs.next()) {
        response.sendRedirect("doctor_home.html");
    } 
    else {
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Username/Password incorrect');");
       out.println("location='doctor.html';");
       out.println("</script>");
    }
    }
    catch(Exception e){
        System.out.println(e);
    }
%>
