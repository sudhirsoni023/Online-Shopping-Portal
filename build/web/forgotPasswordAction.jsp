<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String mobileNumber = request.getParameter("mobileNumber");
    String securityQuestion = request.getParameter("securityQuestion");
    String answer = request.getParameter("answer");
    String newPassword = request.getParameter("newPassword");
    
int check = 0;
try
{
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("Select * from users where email=? and mobileNumber=? and securityQuestion=? and answer=?");
    ps.setString(1,email);
    ps.setString(2,mobileNumber);
    ps.setString(3,securityQuestion);
    ps.setString(4,answer);
    
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
	check = 1;
	PreparedStatement st = conn.prepareStatement("Update users set password=? where email=?");
	st.setString(1,newPassword);
	st.setString(2,email);
	st.executeUpdate();
	response.sendRedirect("forgotPassword.jsp?msg=done");
    }
    if(check == 0)
	response.sendRedirect("forgotPassword.jsp?msg=invalid");
}
catch(Exception ex)
{
    System.out.println(ex);
}
%>
