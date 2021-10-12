package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addNewProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../css/addNewProduct-style.css\">\r\n");
      out.write("<title>Add New Product</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");
 String msg = request.getParameter("msg");
	if("done".equals(msg))
	{
      out.write("\r\n");
      out.write("<h3 class=\"alert\">Product Added Successfully!</h3>\r\n");
}
if("wrong".equals(msg))
{
      out.write("\r\n");
      out.write("<h3 class=\"alert\">Some thing went wrong! Try Again!</h3>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("<h3 style=\"color: yellow;\">Product ID: </h3>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"left-div\">\r\n");
      out.write(" <h3>Enter Name</h3>\r\n");
      out.write(" \r\n");
      out.write("<hr>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"right-div\">\r\n");
      out.write("<h3>Enter Category</h3>\r\n");
      out.write(" \r\n");
      out.write("<hr>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"left-div\">\r\n");
      out.write("<h3>Enter Price</h3>\r\n");
      out.write(" \r\n");
      out.write("<hr>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"right-div\">\r\n");
      out.write("<h3>Active</h3>\r\n");
      out.write("   \r\n");
      out.write("<hr>\r\n");
      out.write("</div>\r\n");
      out.write(" <i class='far fa-arrow-alt-circle-right'></i>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<br><br><br>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
