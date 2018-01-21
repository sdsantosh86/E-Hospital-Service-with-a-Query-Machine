<%-- 
    Document   : status_upd
    Created on : 9 Jan, 2017, 2:26:44 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%HttpSession sess = request.getSession(false); %>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals",
            "root", "ch@rwi");
    Statement st = con.createStatement();  
    String upd ="Seen";
    String upt ="Waiting";
    String puser = request.getQueryString();
    String doc = (String)sess.getAttribute("dname");
    int i = st.executeUpdate("update appts set status='"+upd+"' where puser='"+puser+"' AND doctor='"+doc+"' AND status='"+upt+"'");
        if (i!=0) {
        response.sendRedirect("view_appts.jsp");
        }
}
catch(Exception e){
    out.println(e);
}




%>