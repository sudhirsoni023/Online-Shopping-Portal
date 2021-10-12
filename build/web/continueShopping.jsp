<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    String status ="Processing";
    try
    {
    Connection conn = DBConnection.getConnection();
	PreparedStatement pst= conn.prepareStatement("Update cart set status=? where email=? and status='bill'");
	pst.setString(1,status);
	pst.setString(2,email);
	pst.executeUpdate();
	response.sendRedirect("home.jsp");
    }
    catch(Exception exx)
    {
	out.println(exx);
	System.out.println(exx);
    }
%>