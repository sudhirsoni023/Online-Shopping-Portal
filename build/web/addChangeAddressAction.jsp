<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
String address = request.getParameter("address");
String city= request.getParameter("city");
String state=request.getParameter("state");
String country = request.getParameter("country");
String email = session.getAttribute("email").toString();
try
{
    Connection conn = DBConnection.getConnection();
    PreparedStatement pst = conn.prepareStatement("Update users set address=?, city=?,state=?,country=? where email=?");
    pst.setString(1,address);
    pst.setString(2,city);
    pst.setString(3,state);
    pst.setString(4,country);
    pst.setString(5,email);
    pst.executeUpdate();
    response.sendRedirect("addChangeAddress.jsp?msg=updated");
}
catch(Exception exc)
{
    out.print(exc);
    System.out.println(exc);
    response.sendRedirect("addChangeAddress.jsp?msg=wrong");
}
%>