package org.apache.jsp.DAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ConnectionProvider.DBConnection;
import java.sql.*;

public final class create_005ftables_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

    try
    {
	Connection conn = DBConnection.getConnection();
	Statement st = conn.createStatement();
//	st.executeUpdate("create table users(name varchar2(40),email varchar2(70),mobilenumber varchar2(12),securityQuestion varchar2(90),answer varchar2(50),password varchar2(30),address varchar2(80),city varchar2(30),state varchar2(40),country varchar2(40),constraint EMAIL_ID_PK primary key(email))");
//	st.executeUpdate("create table product(id number(10)not null,name varchar2(100),category varchar2(200),price number(10)not null,active varchar2(10))");
//	st.executeUpdate("create table cart(email varchar2(70), product_id number(7), quantity number(38),price number(7), total number(7), address varchar2(80), city varchar2(30),state varchar2(30),country varchar2(30),mobileNumber number(12), orderDate varchar2(18), delieveryDate varchar2(20), transactionId varchar2(20), status varchar2(6), paymentMethod varchar2(30))");
	st.executeUpdate("create table message(id NUMBER(10) GENERATED ALWAYS BY DEFAULT ON NULL AS IDENTITY,email varchar2(100),subject varchar2(200),body varchar2(1000),primary key(id))");
	conn.close();
    }
    catch(Exception ex)
    {
	System.out.println(ex);
	ex.printStackTrace();
    }
    
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
