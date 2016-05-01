<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Orders</title>
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
    <li class="active"><a href="Orders.jsp">Orders</a></li>
    <li><a href="Revenue.jsp">Revenue</a></li>
</ul>
</div>  
  
<div class="col-md-6 row">
    <h1><strong>Orders</strong></h1>
</div>    
    

<%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120"; 
                String type = request.getParameter("submit");
                String symbol = request.getParameter("symbol");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                java.sql.Connection conn = null;
                
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");
                                    
                                    if(type.equals("stockSymbol")){
                                    String query = "SELECT O.NumShares,O.PricePerShare,O.Id,O.DateTime,O.Percentage,O.PriceType,O.OrderType,T.StockId FROM Orders O, Trade T WHERE O.Id = T.OrderId AND StockId = '"+symbol+"'";
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();            %>
                                    <div class="col-md-12">
    <table class="table">
        <tr>
            <th>Order ID</th>
            <th>StockID</th>
            <th>Num Shares</th>
            <th>Price Per Share</th>
            <th>DateTime</th>
            <th>Percentage</th>
            <th>Price Type</th>
            <th>Order Type</th>
        </tr>
                                  <%  while (rs.next()){ %>
                                    <tr>
                        <td><%=rs.getString("Id")%></td>
                        <td><%=rs.getString("StockId")%></td>
                        <td><%=rs.getString("NumShares")%></td>
                        <td><%=rs.getString("PricePerShare")%></td>
                        <td><%=rs.getString("DateTime")%></td>
                        <td><%=rs.getString("Percentage")%></td>
                        <td><%=rs.getString("PriceType")%></td>
                        <td><%=rs.getString("OrderType")%></td>
                        </tr>
                                    
                                    <%
                                    }
                                  %>
                                  </table>
                                    </div>
                                  <%
                                    }//if stocksymbol
                                    else if(type.equals("name")){
                                    String query = "SELECT DISTINCT P.FirstName, P.LastName, O.NumShares,O.PricePerShare,O.Id,O.DateTime,O.Percentage,O.PriceType,O.OrderType,A.Client FROM Orders O, Account A, Trade T, Person P WHERE O.Id = T.OrderId AND T.AccountId = A.Id AND P.FirstName = '"+firstName+"' AND P.LastName = '"+lastName+"' AND A.Client = P.SSN";
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();            %>
                                    <div class="col-md-4 row">                                    
        <table class="table">
        <tr>
            <th>Account Id</th>
            <th>Client Id</th>
            <th>First Name</th>
            <th>Last Name</th>            
            <th>Num Shares</th>
            <th>Price Per Share</th>
            <th>DateTime</th>
            <th>Percentage</th>
            <th>Price Type</th>
            <th>Order Type</th>
        </tr>
                                  <%  
                                    while(rs.next()){%>
                                    <tr>
                        <td><%=rs.getString("Id")%></td>
                        <td><%=rs.getString("Client")%></td>
                        <td><%=rs.getString("FirstName")%></td>
                        <td><%=rs.getString("LastName")%></td>
                        <td><%=rs.getString("NumShares")%></td>
                        <td><%=rs.getString("PricePerShare")%></td>
                        <td><%=rs.getString("DateTime")%></td>
                        <td><%=rs.getString("Percentage")%></td>
                        <td><%=rs.getString("PriceType")%></td>
                        <td><%=rs.getString("OrderType")%></td>
                        </tr>
                                    
                                    <%} %>
                                    
        </table></div>        
                                    <%}//<-- else if 
                               %>

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

<div class="col-md-6 col-md-offset-4"><strong>Generate Orders By...</strong></div>
<div class="col-md-12"> 
        <div class="col-md-2 col-md-offset-3">
            <form name="myForm" action="newOrders.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="firstName" id="stockSymbol" placeholder="First Name">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="lastName" id="stockSymbol" placeholder="Last Name">
                </div>
                <button type="submit" name="submit" value="name" class="btn btn-default">Generate</button>
            </form></div>
                            
        <div class="col-md-2">
            <form name="myForm" action="newOrders.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="symbol" id="stockSymbol" placeholder="Stock Symbol">
                </div>
                <button type="submit" name="submit" value="stockSymbol" class="btn btn-default">Generate</button>
            </form></div>
</div>
    </body>
</html>
