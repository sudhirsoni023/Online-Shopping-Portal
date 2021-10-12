<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1)!=null)
window.history.forward(1);    
</script>
</head>
<body>
<br>
<table>
<thead>
<%
    String email = session.getAttribute("email").toString();
    int total=0;
    int sno=0;
    try
    {
      Connection conn = DBConnection.getConnection();
      PreparedStatement ps = conn.prepareStatement("Select sum(total) from cart where email=? and address IS NULL");
      ps.setString(1,email);
      ResultSet rs = ps.executeQuery();
      while(rs.next())
      {
	  total=rs.getInt(1);
      }
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
	  <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><% out.print(total);%> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
     <%
	  PreparedStatement ps1 = conn.prepareStatement("Select * from product inner join cart on product.id=cart.product_id and cart.email=? and cart.address IS NULL");
	  ps1.setString(1, email);
	  ResultSet rs1 = ps1.executeQuery();
	  while(rs1.next())
	  {
      %>   
          <tr>
     <% sno = sno+1; %>     
           <td><% out.print(sno); %></td>
            <td><%= rs1.getString(2)%></td>
            <td><%= rs1.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%= rs1.getString(4)%></td>
            <td> <%= rs1.getString(8)%></td>
            <td><i class="fa fa-inr"></i><%= rs1.getString(10)%> </td>
            </tr>
         <%
	    } 
	 PreparedStatement ps2 = conn.prepareStatement("Select * from users where email=?");
	 ps2.setString(1, email);
         ResultSet rs2 = ps2.executeQuery();
	  while(rs2.next())
	  {
	 %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%= rs2.getString(7)%>">
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%= rs2.getString(8)%>">
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%= rs2.getString(9)%>">
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%= rs2.getString(10)%>">
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<select name="paymentMethod" class="input-style">
    <option value="Cash On Delievery(COD)">Cash On Delievery(COD)</option>
    <option value="Online Payment">Online Payment</option>
</select>
</div>

<div class="right-div">
<h3>Pay online on this sudhir@pay.com</h3>
<input class="input-style" type="text" name="transactionId">
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="<%= rs2.getString(3)%>">
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Save and Proceed to Generate Bill  <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<% 
}
}
catch(Exception ex)
{
System.out.print(ex);
}
%>
      <br>
      <br>
      <br>

</body>
</html>