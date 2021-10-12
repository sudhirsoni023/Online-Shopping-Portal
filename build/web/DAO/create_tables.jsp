<%@page import="ConnectionProvider.DBConnection" %>
<%@page import="java.sql.*" %>
<%
    try
    {
	Connection conn = DBConnection.getConnection();
	Statement st = conn.createStatement();
	st.executeUpdate("create table users(name varchar2(40),email varchar2(70),mobilenumber varchar2(12),securityQuestion varchar2(90),answer varchar2(50),password varchar2(30),address varchar2(80),city varchar2(30),state varchar2(40),country varchar2(40),constraint EMAIL_ID_PK primary key(email))");
	st.executeUpdate("create table product(id number(10)not null,name varchar2(100),category varchar2(200),price number(10)not null,active varchar2(10))");
	st.executeUpdate("create table cart(email varchar2(70), product_id number(7), quantity number(38),price number(7), total number(7), address varchar2(80), city varchar2(30),state varchar2(30),country varchar2(30),mobileNumber number(12), orderDate varchar2(18), delieveryDate varchar2(20), transactionId varchar2(20), status varchar2(6), paymentMethod varchar2(30))");
	conn.close();
    }
    catch(Exception ex)
    {
	System.out.println(ex);
	ex.printStackTrace();
    }
    %>
