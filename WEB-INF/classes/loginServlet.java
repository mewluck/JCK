

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


//		 HttpSession session2=request.getSession(false);
//		 System.out.println("session44442:   "+session2);
//		 
//		 if(session2!=null )
//		 {
//			 
//			 String stuId = "" + session2.getValue("login");
//			 System.out.println("stuIdstuId:   "+stuId);
//			 
//			 ServletContext context= getServletContext();
//				RequestDispatcher rd= context.getRequestDispatcher("/studentinfo");
//				rd.forward(request, response);
//				return;
//		 }
//		
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if((request.getParameter("action")!=null)&&	(request.getParameter("action").trim().equals("logout")))
		{
			 HttpSession session=request.getSession();  
			session.putValue("login","");
			response.sendRedirect("/");
			return;
		}
		String username = request.getParameter("username");
                String userpasswd = request.getParameter("userpasswd");
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120";
	    
	  	 HttpSession session=request.getSession();  
		session.putValue("login","");
		if ((username!=null) &&(userpasswd!=null))
		{
			if (username.trim().equals("") || userpasswd.trim().equals(""))
			{
				response.sendRedirect("index.htm");
			}
			else
			{
				// code start here
				java.sql.Connection conn=null;
				try {
			            	Class.forName(mysJDBCDriver).newInstance();
	            			java.util.Properties sysprops=System.getProperties();
	            			sysprops.put("user",mysUserID);
	            			sysprops.put("password",mysPassword);
	        
					//connect to the database
	            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
	            			System.out.println("Connected successfully to database using JConnect");
	            
	            			conn.setAutoCommit(false);
	            			java.sql.Statement stmt1=conn.createStatement();

                                        String query = "SELECT * FROM allacc WHERE allacc.Username = ? AND allacc.Password = ?";
                                        java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                        // Replace single quote with double quote
                                        username = username.replace("'", "''");
                                        userpasswd = userpasswd.replace("'", "''");
                                        //Fill in paramater for the query above
                                        ps.setString(1, username);
                                        ps.setString(2, userpasswd);
                                        java.sql.ResultSet rs = ps.executeQuery();
					if (rs.next()){
                                            
                                            String status = rs.getString("Status");
                                            if(status.equals("Client")){
                                                // login success
						session.putValue("login",username);			
						System.out.println("RequestDispatcher rd= context.getRequestDispatcher;");
						ServletContext context= getServletContext();
						response.sendRedirect("ClientHome.jsp");
                                            }
                                            else if(status.equals("Manager")){
                                                // login success
						session.putValue("login",username);			
						System.out.println("RequestDispatcher rd= context.getRequestDispatcher;");
						ServletContext context= getServletContext();
						response.sendRedirect("ManagerHome.jsp");
                                            }
                                            else{
                                                // login success
						session.putValue("login",username);			
						System.out.println("RequestDispatcher rd= context.getRequestDispatcher;");
						ServletContext context= getServletContext();
						response.sendRedirect("CustRepHome.jsp");
                                            }
						
					}
					else
					{
						// username or password mistake
						response.sendRedirect("passMistake.jsp");
					}
				} catch(Exception e)
				{
					e.printStackTrace();
				}
				finally{
					try{conn.close();}catch(Exception ee){};
				}
			}
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
