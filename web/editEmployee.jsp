<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Employees</title>
	<script src="jquery-1.11.3.min.js" type="text/javascript"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous" >

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
    </head>
    
    
    <body>
       <div class = "navbar navbar-inverse navbar-static-top">
	<div class = "container">  
                    <ul class = "nav navbar-nav navbar-right">
            	<li><a href="Logout.jsp">Logout</a> </li>
            </ul>
    </div><!--container    
    </div><!--container-->
</div> <!--navbar top -->


<div class="navbar-header">
<ul class="nav navbar-left navbar-nav navbar-inverse col-md-3">
    <li><a href="ManagerHome.jsp">Home</a></li>
    <li><a href="Stocks.jsp">Stocks</a></li>
    <li><a href="EmployeeEdit.jsp">Employees</a></li>
    <li><a href="Orders.jsp">Orders</a></li>
    <li><a href="Revenue.jsp">Revenue</a></li>
    <li><a href="ManagerHelp.jsp">Help</a></li>
</ul>
</div>  

<div class="col-md-6 row">
    <h1><strong>Employees</strong></h1>
</div>
<div class="row">
<div class="col-md-4">
    <table class="table">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Start Date</th>
            <th>Hourly Rate</th>
            <th>Email</th>
            <th>Address</th>
            <th>State</th>
            <th>City</th>
            <th>Zip Code</th>
            <th>Telephone</th>
        </tr>
    
    <%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120";
                String id = request.getParameter("registerSSN");
                String firstName = request.getParameter("registerFName");
                String lastName = request.getParameter("registerLName");
                String email = request.getParameter("registerEmail");
                String address = request.getParameter("registerAddress");
                String zip = request.getParameter("registerZipCode");
                String state = request.getParameter("registerState");
                String city = request.getParameter("registerCity");
                String phone = request.getParameter("registerPhone");
                String hourlyRate = request.getParameter("registerHourlyRate");
                String submit = request.getParameter("submit");

                                java.sql.Connection conn = null;
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);



                                    //connect to the database
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");
                                    conn.setAutoCommit(false);
                                    
                                    java.sql.Statement stmt1 = conn.createStatement();
                                    stmt1.executeUpdate("UPDATE employee SET HourlyRate = '"+hourlyRate+"', Email = '"+email+"' WHERE ID = '"+id+"'");
                                    stmt1.executeUpdate("UPDATE person SET LastName = '"+lastName+"',FirstName = '"+firstName+"',Address='"+address+"',ZipCode='"+zip+"',Telephone = '"+phone+"',City='"+city+"',State='"+state+"' WHERE SSN = '"+id+"'");
                                    
                                    String query = "SELECT * FROM employee";
                                    

                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();
                                    query = "SELECT P.FirstName,P.LastName,P.Address, P.ZipCode, P.Telephone, P.City, P.State FROM person P,Employee E WHERE P.SSN = E.ID";
                                    java.sql.PreparedStatement ps1 = conn.prepareStatement(query);
                                    java.sql.ResultSet rs1 = ps1.executeQuery();
                                    while (rs.next() && rs1.next()) {
                               %>
        
                               
                                <tr>
                                    <td><%=rs.getString("ID")%></td>
                                    <td><%=rs1.getString("FirstName")%></td>
                                    <td><%=rs1.getString("LastName")%></td>
                                    <td><%=rs.getString("StartDate")%></td>
                                    <td><%=rs.getString("HourlyRate")%></td>
                                    <td><%=rs.getString("Email")%></td>
                                    <td><%=rs1.getString("Address")%></td>
                                    <td><%=rs1.getString("State")%></td>
                                    <td><%=rs1.getString("City")%></td>
                                    <td><%=rs1.getString("ZipCode")%></td>
                                    <td><%=rs1.getString("Telephone")%></td>
                                </tr>


                                <% } %>
                            </table>
                        </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3"></div>
                            
                             <div class="col-xs-3">
                                 <h2>Edit Employee Information</h2>
                            <form name="myForm" action="editEmployee.jsp" method="post">
                                                        <div class="form-group">
                                <input type="ssn" class="form-control" name="registerSSN" id="registerSSN" placeholder="Employee ID">
                            </div>    
                            <div class="row form-group">
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="registerFName" id="registerFName" placeholder="First Name">
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="registerLName" id="registerLName" placeholder="Last Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="registerEmail" id="registerEmail" placeholder="Email">
                            </div>
                            <div class="row form-group">
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="registerAddress" id="registerAddress" placeholder="Address">
                                </div>
                                <div class="col-xs-6">
                                    <input type="number" class="form-control" name="registerZipCode" id="registerZipCode" placeholder="Zip Code">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="registerState" id="registerState" placeholder="State">
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="registerCity" id="registerCity" placeholder="City">
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" name="registerPhone" id="registerPhone" placeholder="Telephone">
                            </div>
                            <div class="row-form-group">
                                <input type="number" class="form-control" name="registerHourlyRate" id="registerHourlyRate" placeholder="Hourly Rate"/>
                            </div>                        

                            <button type="submit" value="editEmployee" onclick="return Button1_onclick()" class="btn btn-default">Edit Employee Information</button>
                        </form> 
                            </div>
                                

                            </div>
                            <% }
                             catch (Exception e) {
                                    e.printStackTrace();
                                    out.print(e.toString());
                                } finally {
                                    try {
                                        conn.close();
                                    } catch (Exception ee) {
                                    };
                                }
                            %>
                               
                               
</div>
    
    </body>
</html>
