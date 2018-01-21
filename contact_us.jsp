<%@ page import="com.javapapers.java.mail.JavaEmail"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import ="java.sql.*" %>

<%
	if (request.getParameter("submit") != null) {
		JavaEmail javaEmail = new JavaEmail();
		javaEmail.setMailServerProperties();
                String status="NA";
		String emailSubject = request.getParameter("Subject");
		String emailBody = "";
		if (request.getParameter("Name") != null) {
			emailBody = "Name: " + request.getParameter("Name")
					+ "<br>";
		}
		if (request.getParameter("Email") != null) {
			emailBody = emailBody + "Email: "
					+ request.getParameter("Email") + "<br>";
		}
		if (request.getParameter("message") != null) {
			emailBody = emailBody + "Query: " + request.getParameter("message")
					+ "<br>";
		}
		javaEmail.createEmailMessage(emailSubject, emailBody);
		try {
			javaEmail.sendEmail();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cgps_hospitals","root", "ch@rwi");
                        Statement st = conn.createStatement();
                        int i = st.executeUpdate("insert into mailquery(pname,sub,email,content,status) "
                                + "values('"+request.getParameter("Name")+"','"+emailSubject+"','"+request.getParameter("Email")+"','"+request.getParameter("message")+"','"+status+"')");
                        if(i!=0){
                        
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Your response has been recorded. We will get back to you as soon as possible. Thank you.');");
                        out.println("location='home_page.html';");
                        out.println("</script>");
                } }
                    catch (MessagingException me) 
                    {
                        out.println(me);
		}
}
%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Contact Us</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/mobile.css">
        <script src="js/form_validation.js" type="text/javascript"></script>
	<script src="js/mobile.js" type="text/javascript"></script>
</head>
<body>
	<div id="page">
		<div id="header">
                    <div>
			<a href="home_page.html" class="logo"><img src="images/logo.png" alt=""></a>
			<ul id="navigation">
                            <li>
                            <a href="home_page.html">Home</a>
                            </li>
                            <li class="menu">
                            <a href="patient.html">Patient</a>
                            </li>
                            <li class="menu">
                            <a href="doctor.html">Doctor</a>
                            </li>
                            <li class="selected">
                            <a href="contact_us.html">Contact us</a>
                            </li>
				</ul>
			</div>
		</div>
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>Contact us</h1>
				</div>
			</div>
			<div class="body">
				<div>
					<div>
					<img src="images/check-in.png" alt="">
					<h1>UNIT 12, ABC BUILDING, BUSINESS PARK</h1>
                                        <p>Near Aarohi Mindspace, Shamshabad.</p>
					<p>Phone: 040-23311778/79/80, 91+ 9959933234/35</p>
                                        <p>Emergency: 1166 </p>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="contact">
					<h1>INQUIRY FORM</h1>
                                        <form name="contactform" action="" method="post" onsubmit="return cform_validation()">
                                            <input type="text" name="Name" placeholder="Name" required="">
                                            <input type="text" name="Email" placeholder="Your email" required="">
                                            <input type="text" name="Subject" placeholder="Subject" required="">
                                            <textarea name="message" required="" cols="50" rows="7" placeholder="Share your thoughts..." ></textarea>
                                            <input type="submit" value="Send" id="submit" name="submit" onclick="return contact_validation()">
					</form>
				</div>
				<div class="section">
					<h1>WE'D LOVE TO HEAR FROM YOU.</h1>
					<p>If you're still having any doubts, please don't hesitate to ask us.</p>
				</div>
			</div>
		</div>
		<div id="footer">
			<div>
				<div class="connect">
					<a href="http://www.facebook.com" class="facebook">facebook</a>
					<a href="http://www.twitter.com" class="twitter">twitter</a>
					<a href="http://www.googleplus.com" class="googleplus">googleplus</a>
					<a href="http://www.pinterest.com" class="pinterest">pinterest</a>
				</div>
				<p>&copy; 2017 CGPS Hospitals. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>
