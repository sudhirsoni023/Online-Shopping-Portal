<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    if(email.equals("admin@gmail.com") && password.equals("admin"))
    {
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHome.jsp");
    }
    else
    {
	int flag = 0;
	try
	{
	    Connection conn = DBConnection.getConnection();
	    PreparedStatement ps = conn.prepareStatement("Select * from users where email=? and password=?");
	    ps.setString(1,email);
	    ps.setString(2,password);
	    ResultSet rs = ps.executeQuery();
	   if(rs.next())
	    {
		flag = 1;
		session.setAttribute("email",email);
		response.sendRedirect("home.jsp");
	    }
	    if(flag == 0)
		response.sendRedirect("login.jsp?msg=notexist");
	}
	catch(Exception ex)
	{
	    System.out.println(ex);
	    response.sendRedirect("login.jsp?msg=invalid");
	}
    }
%>