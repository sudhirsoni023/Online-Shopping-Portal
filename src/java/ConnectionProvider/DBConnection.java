package ConnectionProvider;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection 
{
 public static Connection getConnection()
    {
	try
	{
	    Class.forName("oracle.jdbc.OracleDriver");     
	    
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//LAPTOP-6VPNB7HE:1521/xe", "onlineshopping", "oracle");
 	    return con;
	}
	catch(ClassNotFoundException cnfe)                               // when class path is not set this will run..
	{
		System.out.println("Cannot load the driver class");
                cnfe.printStackTrace();
		return null;
	}
		catch(SQLException ex)                                          // when connection is not done properly this will run...
	{
		System.out.println("Error in DB");
		ex.printStackTrace();   
		return null;
	}
    }
}