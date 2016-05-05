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
    <li class="active"><a href="ClientHome.jsp">Home</a></li>
    <li><a href="ClientConditionOrders.jsp">Conditional Orders</a></li>
    <li><a href="ClientStocks.jsp">Stock History</a></li>
    <li><a href="BestSellingStocks.jsp">Best Selling Stocks</a></li>
    <li><a href="ClientStockSuggestions.jsp">Stock Suggestions</a></li>
    <li><a href="ClientTest.jsp">TEST</a></li>
</ul>
</div>  
    
<h1><strong>Stock History for <%=session.getValue("login")%></strong></h1>

<%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120"; 
                String user = session.getValue("login").toString();
                java.sql.Connection conn = null;
                
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");

                                    String query = "SELECT O.Id, O.NumShares, O.PricePerShare, O.DateTime, O.Percentage, O.PriceType, O.OrderType, T.StockId "
                                            + "FROM Orders O, Trade T "
                                            + "WHERE O.Id = T.OrderId AND T.AccountId = ?";
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    ps.setString(1, session.getValue("AccountId").toString());
                                    java.sql.ResultSet rs = ps.executeQuery();
%>
                                  <div class="col-md-12">
    <table class="table">
        <tr>
            <th>Order ID</th>
            <th>NumShares</th>
            <th>PricePerShare</th>
            <th>DateTime</th>
            <th>Percentage</th>
            <th>PriceType</th>
            <th>OrderType</th>
            <th>StockId</th>
        </tr>
                                  <%  while (rs.next()){ %>
                                    <tr>
                        <td><%=rs.getString("Id")%></td>
                        <td><%=rs.getString("NumShares")%></td>
                        <td><%=rs.getString("PricePerShare")%></td>
                        <td><%=rs.getString("DateTime")%></td>
                        <td><%=rs.getString("Percentage")%></td>
                        <td><%=rs.getString("PriceType")%></td>
                        <td><%=rs.getString("OrderType")%></td>
                        <td><%=rs.getString("StockId")%></td>
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