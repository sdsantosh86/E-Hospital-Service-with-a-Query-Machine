<%-- 
    Document   : kill_session
    Created on : 24 Feb, 2017, 7:32:44 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sess = request.getSession(false);
sess.invalidate();
response.sendRedirect("home_page.html");
%>

