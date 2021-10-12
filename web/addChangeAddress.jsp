<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp" %> 
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add Change Address</title>
</head>
<body>
<%
    String msg=request.getParameter("msg");
    if("updated".equals(msg))
    {
%>
<h3 class="alert">Address Successfully Updated !</h3>
<% } %>
<% 
    if("wrong".equals(msg))
    {
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<% } %>

<%
    try
    {
	Connection conn = DBConnection.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("Select * from users where email='"+email+"'");
	while(rs.next())
	{
%>
<form method="post" action="addChangeAddressAction.jsp">
<h3>Enter Address</h3>
<input class="input-style" type="text" name="address" placeholder="Enter address" value="<%=rs.getString(7)%>">
 <hr>
 <h3>Enter city</h3>
<input class="input-style" type="text" name="city" placeholder="Enter city" value="<%=rs.getString(8)%>"> 
<hr>
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" placeholder="Enter state" value="<%=rs.getString(9)%>">
<hr>
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" placeholder="Enter country" value="<%=rs.getString(10)%>">
<hr>
<button class="button" type="submit"> <i class='far fa-arrow-alt-circle-right'> SAVE </i></button>
</form>
 <% 
 }
}
    catch(Exception e)
    {
	out.println(e);
	System.out.println(e);
    }
%>
</body>
<br><br><br>
</html>