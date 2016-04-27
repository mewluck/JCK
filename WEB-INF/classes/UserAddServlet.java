import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class UserAddServlet extends HttpServlet {

	
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

HttpSession session=request.getSession();  
System.out.println("feafafef");
		String userName = request.getParameter("registerUsername");
		String upassword = request.getParameter("registerPassword");
		String firstName = request.getParameter("registerFName");
                String lastName = request.getParameter("registerLName");
                String ssn = request.getParameter("registerSSN");
		String email = request.getParameter("registerEmail");
		String address = request.getParameter("registerAddress");
                String zipCode = request.getParameter("registerZipCode");
		String state = request.getParameter("registerState");
		String city = request.getParameter("registerCity");
                String ccn = request.getParameter("registerCCN");
		String phone = request.getParameter("registerPhone");
		String status = request.getParameter("registerStatus");
                String hourlyRate = request.getParameter("registerHourlyRate");
                
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120";
                
            if ((userName != null) && (upassword != null)) {  
                if(userName.trim().equals("") || upassword.trim().equals("")){
                    response.sendRedirect("RegisterPage.htm");
                }
                else{
		

			java.sql.Connection conn=null;
			try 
			{
          	Class.forName(mysJDBCDriver).newInstance();
  			java.util.Properties sysprops=System.getProperties();
  			sysprops.put("user",mysUserID);
  			sysprops.put("password",mysPassword);
      
				//connect to the database
          			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
          			System.out.println("Connected successfully to database using JConnect");
          
          			java.sql.Statement stmt1=conn.createStatement();
                                stmt1.executeUpdate("INSERT INTO allacc VALUES('"+userName+"','"+upassword+"','"+status+"')");
                                stmt1.executeUpdate("INSERT INTO person VALUES('"+ssn+"','"+lastName+"','"+firstName+"','"+address+"','"+zipCode+"','"+phone+"','"+city+"','"+state+"')");
                                stmt1.close();
                                if (status.trim().equals("Client"))
                                {
							stmt1.executeUpdate("INSERT INTO client VALUES('"+email+"',1,'"+ccn+"','"+ssn+"')");
//							out.print("insert into Student values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("status")+"')");
							stmt1.close();
				}
                                else if(status.trim().equals("Manager") || status.trim().equals("CustRep"))
                                {
							stmt1.executeUpdate("INSERT INTO employee VALES('"+ssn+"',NOW(),'"+hourlyRate+"','"+email+"')");
//							out.print("insert into Professor values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("DepID")+"')");;
							stmt1.close();
				}
			} catch(Exception e)
			{
				e.printStackTrace();
			
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
	  
	  RequestDispatcher view = request.getRequestDispatcher("index.htm");
      view.forward(request, response);    
    }
}
}
  
}