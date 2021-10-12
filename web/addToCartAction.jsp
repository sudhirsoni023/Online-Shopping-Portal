<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    String product_id = request.getParameter("id");
    int quantity = 1;
    int product_price = 0;
    int product_total = 0;
    int cart_total = 0;
    int z=0;
    try
    {
	Connection conn = DBConnection.getConnection();
	PreparedStatement ps = conn.prepareStatement("Select * from product where id=?");
	ps.setString(1, product_id);
	ResultSet rs = ps.executeQuery();
        if(rs.next())
	{
	    product_price= rs.getInt(4);
	    product_total= product_price;
	}
	PreparedStatement ps1 = conn.prepareStatement("Select * from cart where product_id=? and email=? and address IS NULL");
	ps1.setString(1,product_id);
	ps1.setString(2,email);
	ResultSet rs1 = ps1.executeQuery();
	if(rs1.next())
	{
	  cart_total=rs1.getInt(5);
	  cart_total = cart_total+product_total;
	  quantity = rs1.getInt(3);
	  quantity = quantity+1;
	  z=1;
	}
	if(z==1)
	{
	    PreparedStatement ps2 = conn.prepareStatement("Update cart set total=?, quantity=? where product_id=? and email=? and address IS NULL");
            ps2.setInt(1, cart_total);
	    ps2.setInt(2, quantity);
	    ps2.setString(3, product_id);
	    ps2.setString(4, email);
	    ps2.executeUpdate();
	    response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0)
	{
	   PreparedStatement ps3 = conn.prepareStatement("Insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
	   ps3.setString(1, email);
	   ps3.setString(2, product_id);
	   ps3.setInt(3, quantity);
	   ps3.setInt(4, product_price);
	   ps3.setInt(5,product_total);
	   ps3.executeUpdate();
	   response.sendRedirect("home.jsp?msg=added");
	}
    }
    catch(Exception e)
    {
	System.out.print(e);
	response.sendRedirect("home.jsp?msg=invalid");
    }
%>