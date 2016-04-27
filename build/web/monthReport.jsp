<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>JCK TRADE</title>
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
    </div><!--container-->
</div> <!--navbar top -->

<div class="navbar-header">
<ul class="nav navbar-left navbar-nav navbar-inverse col-md-3">
    <li class="active"><a href="ManagerHome.jsp">Home</a></li>
    <li><a href="Stocks.jsp">Stocks</a></li>
    <li><a href="EmployeeEdit.jsp">Employees</a></li>
    <li><a href="Orders.jsp">Orders</a></li>
    <li><a href="Revenue.jsp">Revenue</a></li>
</ul>
</div>  
    
<h1><strong>Welcome <%=session.getValue("login")%></strong></h1>
<div><h2>Sales report for: </h2>    
         <form name="myForm" action="monthReport.jsp" method="post">
                <select id="month" name="month">
	<option value="0">Month</option>
	<option value="1">January</option>
	<option value="2">February</option>
	<option value="3">March</option>
	<option value="4">April</option>
	<option value="5">May</option>
	<option value="6">June</option>
	<option value="7">July</option>
	<option value="8">August</option>
	<option value="9">September</option>
	<option value="10">October</option>
	<option value="11">November</option>
	<option value="12">December</option>
    <select>
                <button type="submit" name="submit" value="monthReport" class="btn btn-default">Generate</button>
            </form>
</div>

<%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120"; 
                String month = request.getParameter("month");
                java.sql.Connection conn = null;
                
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");

                                    String query = "SELECT T.AccountId, T.BrokerId, T.StockId, O.OrderType,O.NumShares,O.PricePerShare,O.Percentage,O.PriceType, O.DateTime FROM Trade T, Orders O WHERE T.OrderId = O.Id AND MONTH(O.DateTime) = '"+month+"'";
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();            %>
                                    <div class="col-md-12">
    <table class="table">
        <tr>
            <th>Account ID</th>
            <th>Broker ID</th>
            <th>Stock ID</th>
            <th>Order Type</th>
            <th>Num Shares</th>
            <th>Price Per Share</th>
            <th>Percentage</th>
            <th>Price Type</th>
            <th>Date Time</th>
            
        </tr>
                                  <%  while (rs.next()){ %>
                                    <tr>
                        <td><%=rs.getString("AccountId")%></td>
                        <td><%=rs.getString("BrokerId")%></td>
                        <td><%=rs.getString("StockId")%></td>
                        <td><%=rs.getString("OrderType")%></td>
                        <td><%=rs.getString("NumShares")%></td>
                        <td><%=rs.getString("PricePerShare")%></td>
                        <td><%=rs.getString("Percentage")%></td>
                        <td><%=rs.getString("PriceType")%></td>
                        <td><%=rs.getString("DateTime")%></td>
                        </tr>
                                    
                                    <%
                                    }
                                  %>
                                  </table>
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

    </body>
</html>