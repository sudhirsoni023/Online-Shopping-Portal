<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
   String email = session.getAttribute("email").toString();
   String number = request.getParameter("mobileNumber");
   String password = request.getParameter("password");
   int check=0;
    try
    {
	Connection conn = DBConnection.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("Select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
	    check=1;
	PreparedStatement ps= conn.prepareStatement("Update users set mobileNumber=? where email=?");
	ps.setString(1,number);
	ps.setString(2, email);
	ps.executeUpdate();
	response.sendRedirect("changeMobileNumber.jsp?msg=changed");
        }
	if(check==0)
	    response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
    }
    catch(Exception e)
    {
	out.print(e);
	System.out.print(e);
    }
%>