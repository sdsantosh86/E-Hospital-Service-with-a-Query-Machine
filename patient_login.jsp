<%-- 
    Document   : patient_login
    Created on : 5 Jan, 2017, 1:31:28 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    try{
    String userid = request.getParameter("pname");    
    String pwd = request.getParameter("ppass");
    
    HttpSession sess = request.getSession(); 
    sess.setAttribute("userid", userid);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from patients where userid='"+userid+"' and pwd='"+pwd+"'");
    if (rs.next()) {
        //session.setAttribute("username",userid);
        response.sendRedirect("patient_home.jsp");
    } 
    else {
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Username/Password incorrect');");
       out.println("location='patient.html';");
       out.println("</script>");
    }
    }
    catch(Exception e){
        System.out.println(e);
    }
%>
    