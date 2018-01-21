<%-- 
    Document   : book_action
    Created on : 6 Jan, 2017, 1:59:55 PM
    Author     : charwitha999
--%>
<%@ page import="com.twilio.Twilio"%>
<%@ page import="com.twilio.rest.api.v2010.account.Message"%>
<%@ page import="com.twilio.type.PhoneNumber"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
    Statement st = con.createStatement();
    
    String doctor=request.getParameter("doc_list");
    String date=request.getParameter("app_date");
    String phone=request.getParameter("phone");
    String sts="Waiting";
    HttpSession sess = request.getSession(false);
    sess.getAttribute("userid");
    
    ResultSet timings = st.executeQuery("select timings from doctors where dname='"+doctor+"'");
    if(timings.next()){
    
        String ACCOUNT_SID = "ACb912865fc5f33e68bbbc345243cf6615";
        String AUTH_TOKEN = "82d6e28a3aa999c596405a2280d807fb";

                String SMSBody = "CGPS Hopistals Appointment Confirmation"+"/";
		SMSBody = SMSBody + "Dr." +doctor+"  ";
		SMSBody = SMSBody + "on "+date+ "  ";
		SMSBody = SMSBody + "at "+timings.getString(1)+ " ";
    
    String userid =(String)sess.getAttribute("userid");
    ResultSet check = st.executeQuery("select app_date from appts where puser='"+userid+"' AND app_date='"+date+"'");
    if(check.next()){
       out.println("<script type=\"text/javascript\">");
       out.println("alert('You already booked an appointment');");
       out.println("location='patient_home.jsp';");
       out.println("</script>");
    }
    else{
    ResultSet count = st.executeQuery("select COUNT(*) from appts where doctor='"+doctor+"' AND app_date='"+date+"'");
    if(count.next() && count.getInt(1)<5){
    ResultSet patient = st.executeQuery("select fname from patients where userid='"+userid+"'");
    if(patient.next()){ 
    String pname = patient.getString(1);
    int i = st.executeUpdate("insert into appts(doctor,app_date,pname,puser,p_phone,status) values('"+doctor+"','"+date+"','"+pname+"','"+userid+"','"+phone+"','"+sts+"')");
    if (i!=0) {
       Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
       Message message = Message.creator(new PhoneNumber("+919100090958"),new PhoneNumber("+1929-244-2919"), SMSBody).create();
    
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Successful. You will receive your confirmation shortly');");
       out.println("location='patient_home.jsp';");
       out.println("</script>");
    }
    }
    }
    else{
       out.println("<script type=\"text/javascript\">");
       out.println("alert('Appointments full. Try for another date');");
       out.println("window.history.back();");
       out.println("</script>");    
    }
    }
    }
    }
    catch(Exception e){
        out.println(e);
    }
    %>


