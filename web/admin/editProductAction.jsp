<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try
{
  Connection conn = DBConnection.getConnection();
  PreparedStatement ps = conn.prepareStatement("update product set name=?, category=?, price=?, active=? where id=?");
  ps.setString(1,name);
  ps.setString(2,category);
  ps.setString(3,price);
  ps.setString(4,active);
  ps.setString(5,id);
  ps.executeUpdate();
  if(active.equalsIgnoreCase("No"))
  {
    PreparedStatement pst = conn.prepareStatement("delete from cart where product_id=?, and address IS NULL");
    pst.setString(1,id);
  }
  response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception ex)
{
    System.out.println(ex);
    response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>