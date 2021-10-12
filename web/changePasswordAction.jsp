<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
    
    if(newPassword.equals(confirmPassword))
    {
	int check = 0;
	try
	{
	    Connection conn = DBConnection.getConnection();
	    Statement st = conn.createStatement();
	    ResultSet rs = st.executeQuery("Select * from users where email='"+email+"' and password='"+oldPassword+"'");
	    while(rs.next())
	    {
		check = 1;
		st.executeUpdate("Update users set password='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("changePassword.jsp?msg=done");
	    }
	    if(check==0)
		response.sendRedirect("changePassword.jsp?msg=Wrong");
	}
	catch(Exception ex)
	{
	    out.println(ex);
	    System.out.println(ex);
	}
    }
    else
	response.sendRedirect("changePassword.jsp?msg=notMatch");
%>