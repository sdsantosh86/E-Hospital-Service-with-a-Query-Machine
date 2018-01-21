<%-- 
    Document   : test_query
    Created on : 24 Feb, 2017, 6:52:30 PM
    Author     : charwitha999
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<% HttpSession sess = request.getSession(false);%>
      
<% 
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
    Statement st = conn.createStatement();
    
    String sentence = request.getParameter("query"); 
    ArrayList<String> keywords=new ArrayList();
    StringTokenizer t = new StringTokenizer(sentence);
    String word;
    StringBuilder keys=new StringBuilder();
        
            while(t.hasMoreTokens())
            {
            word = t.nextToken();
            if(word.length() > 3)	
            keywords.add(word);
            }
    String[] stoplistwords = {"when","what","where","then","there","good","this","that"};
    ArrayList<String> list = new ArrayList<>(Arrays.asList(stoplistwords));
    keywords.removeAll(list);
    
            for (int i = 0 ; i < keywords.size(); i++ ) {
            keys = i < (keywords.size() - 1) ? keys.append("'"+keywords.get(i)+"'"+",") : keys.append("'"+keywords.get(i)+"'");
            }
            
            StringBuilder check1 = new StringBuilder("select info,doc from query where "
                    + "key1 IN ("+keys+") AND key2 in ("+keys+") AND key3 in ("+keys+")");
            try (PreparedStatement stmt = conn.prepareStatement(check1.toString())) {
            try (ResultSet rs = stmt.executeQuery()) {
            if(rs.next()) {      
            String data = rs.getString(1);
            sess.setAttribute("data", data);
            sess.setAttribute("doc","Doctor: Dr."+rs.getString(2));
            response.sendRedirect("patient_home.jsp#querybox");
                }
            else{
                    StringBuilder check2 = new StringBuilder("select info,doc from query where key1 IN ("+keys+") AND "
                            + "(key2 IN ("+keys+") OR key3 IN ("+keys+"))");
                    try (PreparedStatement stmt2 = conn.prepareStatement(check2.toString())) {
                    try (ResultSet rs2 = stmt2.executeQuery()) {
                    if(rs2.next()) {      
                    String data = rs2.getString(1);
                    sess.setAttribute("data", data);
                    sess.setAttribute("doc","Doctor: Dr."+rs2.getString(2));
                    response.sendRedirect("patient_home.jsp#querybox");
                        }
                    else{
                    String data = "No Results";
                    sess.setAttribute("data", data);
                    sess.setAttribute("doc",data);
                    response.sendRedirect("patient_home.jsp#querybox");   
                                }
                            }}
                    }}}
     }
            catch (Exception e){
            out.println(e);
             } 
    %>

