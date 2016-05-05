<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Stocks</title>
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
    <li class="active"><a href="Stocks.jsp">Stocks</a></li>
    <li><a href="EmployeeEdit.jsp">Employees</a></li>
    <li><a href="Orders.jsp">Orders</a></li>
    <li><a href="Revenue.jsp">Revenue</a></li>
    <li><a href="ManagerHelp.jsp">Help</a></li>
</ul>
</div>  

<div class="col-md-6 row">
    <h1><strong>Set Share Price</strong></h1>
</div>        
<div class="col-md-4 row">
    <table class="table">
        <tr>
            <th>Stock Symbol</th>
            <th>Company Name</th>
            <th>Type</th>
            <th>Price Per Share</th>
            <th>Number of Shares</th>
        </tr>
    
    <%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120";

                                java.sql.Connection conn = null;
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);

                                    // Master query
                                    int args = 3;

                                    String query = "SELECT * FROM stock";

                                    //connect to the database
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");
                                    conn.setAutoCommit(false);

                                    
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                               %>
        
                               
                                <tr>
                                    <td><%=rs.getString("StockSymbol")%></td>
                                    <td><%=rs.getString("CompanyName")%></td>
                                    <td><%=rs.getString("Type")%></td>
                                    <td><%=rs.getString("PricePerShare")%></td>
                                    <td><%=rs.getInt("NumShares")%></td>
                                </tr>


                                <% } %>  
                                
                            </table>
                              
                                                            
                            <div class="col-md-6 row">
                                <h1><strong>Most Actively Traded Stocks</strong></h1>
                            </div>        
                                <table class="table">    
                            <tr>
                                <th>Rank</th>
                                <th>StockID</th>
                                <th>Times Traded</th>
                            </tr>
                                <%
                                int rank = 1;
                                query = "SELECT T.StockId,COUNT(*) AS NumTrades FROM Trade T GROUP BY T.StockId ORDER BY NumTrades DESC";
                                ps=conn.prepareStatement(query);
                                rs = ps.executeQuery();
                                while(rs.next()){                                
                                %>
                                <tr>
                                    <th><%=rank++%></th>
                                    <th><%=rs.getString("StockId")%></th>
                                    <th><%=rs.getString("NumTrades")%></th>
                                </tr>
                                <% } %>
                                
                            </table>
                        </div>
                            
                            <div class="col-md-3 row">
                            <form name="myForm" action="newStocks.jsp" method="post">
                                <div class="form-group">
                                <input type="text" class="form-control" name="stockSymbol" id="stockSymbol" placeholder="Stock Symbol">
                                </div>
                                <div class="form-group">
                                <input type="number" class="form-control" step=.01 name="price" id="price" placeholder="PricePerShare">
                            </div>
                                <button type="submit" value="Update" class="btn btn-default">Update</button>
                            </form>
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
