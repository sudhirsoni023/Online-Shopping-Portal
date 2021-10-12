<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    String product_id = request.getParameter("id");
    try
    {
      Connection conn = DBConnection.getConnection();
      PreparedStatement ps = conn.prepareStatement("Delete from cart where email=? and product_id=? and address IS NULL");
      ps.setString(1,email);
      ps.setString(2,product_id);
      ps.executeUpdate();
      response.sendRedirect("myCart.jsp?msg=removed");
    }
    catch(Exception ex)
    {
	System.out.println(ex);
    }
%>