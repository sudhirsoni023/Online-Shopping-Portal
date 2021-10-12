<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    String id = request.getParameter("id");
    String incdec = request.getParameter("quantity");
    int price = 0;
    int total = 0;
    int quantity = 0;
    int final_total = 0;
    try
    {
	Connection conn = DBConnection.getConnection();
	PreparedStatement ps = conn.prepareStatement("Select * from cart where email=? and product_id=? and address IS NULL");
	ps.setString(1,email);
	ps.setString(2,id);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
	    price = rs.getInt(4);
	    total = rs.getInt(5);
	    quantity = rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("dec"))
	    response.sendRedirect("myCart.jsp?msg=notPossible");
	else if(quantity!=1 && incdec.equals("dec"))
	{
	    total = total-price;
	    quantity = quantity-1;
	    PreparedStatement ps2 = conn.prepareStatement("Update cart set total=?, quantity=? where email=? and product_id=? and address IS NULL");
	    ps2.setInt(1,total);
	    ps2.setInt(2,quantity);
	    ps2.setString(3,email);
	    ps2.setString(4,id);
	    
	    ps2.executeUpdate();
	    response.sendRedirect("myCart.jsp?msg=dec");
	}
	else
	{
	    total = total+price;
	    quantity = quantity+1;
	    PreparedStatement ps2 = conn.prepareStatement("Update cart set total=?, quantity=? where email=? and product_id=? and address IS NULL");
	    ps2.setInt(1,total);
	    ps2.setInt(2,quantity);
	    ps2.setString(3,email);
	    ps2.setString(4,id);
	    
	    ps2.executeUpdate();
	    response.sendRedirect("myCart.jsp?msg=inc");
	}
	    
    }
    catch(Exception ex)
    {
	System.out.println(ex);
    }
%>