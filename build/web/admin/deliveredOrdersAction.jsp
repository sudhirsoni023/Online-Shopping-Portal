<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String status = "Delivered";
	    try
	    {
		Connection conn = DBConnection.getConnection();
		Statement st = conn.createStatement();
		st.executeUpdate("Update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address IS NOT NULL");
		response.sendRedirect("ordersReceived.jsp?msg=delivered");
	    }
	    catch(Exception ex)
	    {
		response.sendRedirect("ordersRecieved.jsp?msg=wrong");
		out.print(ex);
	    }
%>