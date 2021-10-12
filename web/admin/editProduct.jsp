<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp" %> 
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
 <%
     String id=request.getParameter("id");
     try
     {
	 Connection conn = DBConnection.getConnection();
	 Statement st = conn.createStatement();
	 ResultSet rs = st.executeQuery("Select * from product where id='"+id+"'");
	 while(rs.next())
	 {
     %>
     <form action="editProductAction.jsp" method="post">
	 <input type="hidden" name="id" value="<% out.print(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
 <input type="text" name="name" class="input-style" value="<%=rs.getString(2)%>" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<input type="text" name="category" class="input-style" value="<%=rs.getString(3)%>" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
<input type="text" name="price" class="input-style" value="<%=rs.getString(4)%>" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
    <option value="Yes">Yes</option> 
    <option value="No">No</option>
</select>   
 <hr>
</div>
<button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>

 <%
     }
}
catch(Exception ex)
{
System.out.println(ex);
}
 %>
</form>
</body>
<br><br><br>
</body>
</html>