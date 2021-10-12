<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    String subject = request.getParameter("subject");
    String body = request.getParameter("body");
	try
	{
	    Connection conn = DBConnection.getConnection();
	    Statement st = conn.createStatement();
	    PreparedStatement pst = conn.prepareStatement("Insert into message (email,subject,body)values(?,?,?)");
	    pst.setString(1,email);
	    pst.setString(2,subject);
	    pst.setString(3,body);
	    pst.executeUpdate();
	    response.sendRedirect("messageUs.jsp?msg=sent");
        }
	catch(Exception ex)
	{
	    response.sendRedirect("messageUs.jsp?msg=wrong");
	    out.println(ex);
	    System.out.println(ex);
	}
    
%>