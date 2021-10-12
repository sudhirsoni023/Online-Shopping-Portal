<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
   String email = session.getAttribute("email").toString();
   String question = request.getParameter("securityQuestion");
   String newAnswer = request.getParameter("answer");
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
	PreparedStatement ps= conn.prepareStatement("Update users set securityQuestion=?, answer=? where email=?");
	ps.setString(1,question);
	ps.setString(2,newAnswer);
	ps.setString(3, email);
	ps.executeUpdate();
	response.sendRedirect("changeSecurityQuestion.jsp?msg=changed");
        }
	if(check==0)
	    response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
    }
    catch(Exception e)
    {
	out.print(e);
	System.out.print(e);
    }
%>