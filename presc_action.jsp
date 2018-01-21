<%-- 
    Document   : presc_action
    Created on : 8 Jan, 2017, 6:46:40 PM
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
    
    String puser = request.getQueryString();
    String doc = (String)sess.getAttribute("dname");
    String date = (String)sess.getAttribute("date");
    String age = request.getParameter("age");
    String ailment = request.getParameter("ail");
    String med = request.getParameter("med");
                               
        int i = st.executeUpdate("insert into presc(doc,puser,pdate,age,ailment,med) values('"+doc+"','"+puser+"','"+date+"','"+age+"','"+ailment+"','"+med+"')");
        if (i!=0) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Successfully updated');");
        out.println("location='view_appts.jsp';");
        out.println("</script>");    
        }
        }
        catch(Exception e){
                out.println(e);
                }
%>