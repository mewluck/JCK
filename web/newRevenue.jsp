<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Revenue</title>
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
    <li class="active"><a href="Revenue.jsp">Revenue</a></li>
</ul>
</div>  
  
<div class="col-md-6 row">
    <h1><strong>Revenue</strong></h1>
</div>    


   
    
    <%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120";
                String generateBy = request.getParameter("submit");
                String gen = request.getParameter("gen");
                
                                java.sql.Connection conn = null;
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);


                                    String query = "SELECT Id, P.FirstName, P.LastName, MAX(Revenue) FROM(SELECT T.BrokerId AS Id, SUM(Tr.Fee) AS Revenue FROM Trade T, Transaction Tr WHERE T.TransactionId = Tr.Id GROUP BY T.BrokerId)a,Person P,Trade T WHERE T.BrokerId = P.SSN";

                                    //connect to the database
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");
                                    conn.setAutoCommit(false);

                                    
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();
                                  
                               %>
                               <div class="col-md-6 row">   
                               <div><strong>Most Revenue Customer Representative</strong></div>
                               <table class="table">
                                   <tr>
                                   <th>Id</th>
                                   <th>First Name</th>
                                   <th>Last Name</th>
                                   <th>Max(Revenue)</th>
                                   </tr>
                        <%
                        while (rs.next()){
                        %>           
                                   <tr>
                                       <td><%=rs.getString("Id")%></td>
                                       <td><%=rs.getString("FirstName")%></td>
                                       <td><%=rs.getString("LastName")%></td>
                                       <td><%=rs.getString("MAX(Revenue)")%></td>
                                   </tr>
                              
                        <%  }  %>           
                             </table>
                               </div>    
                        
                        <%
                        query = "SELECT A.Client, P.FirstName, P.LastName, AccountId, MAX(Revenue) FROM Account A, Person P,(SELECT T.AccountId AS AccountId, SUM(Tr.Fee) AS Revenue FROM Trade T, Transaction Tr WHERE T.TransactionId = Tr.Id GROUP BY T.AccountId)a WHERE A.Id = AccountId AND A.Client = P.SSN";
                        ps = conn.prepareStatement(query);
                        rs = ps.executeQuery();
                        %>
                        
                        <div class="col-md-6 row">
                        <div><strong>Most Revenue Customer</strong></div>
                                   <table class="table">
                                   <tr>
                                   <th>Client ID</th>
                                   <th>Account Number</th>
                                   <th>First Name</th>
                                   <th>Last Name</th>
                                   <th>Max(Revenue)</th>
                                   </tr>
                        
                        <%
                        while (rs.next()){
                        %> 
                        <tr>
                        <td><%=rs.getString("Client")%></td>
                        <td><%=rs.getString("AccountId")%></td>
                        <td><%=rs.getString("FirstName")%></td>
                        <td><%=rs.getString("LastName")%></td>
                        <td><%=rs.getString("MAX(Revenue)")%></td>
                        </tr>
                        <%  }  %>   
                        </table>
                        
                        
                        </div>      
                        

                            <div class="row col-md-6"> </div>
                            <div class="col-md-6"><strong>Generate Revenue By...</strong></div>
                                <div class="col-md-4">
                                    <form name="myForm" action="newRevenue.jsp" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="gen" id="stockSymbol" placeholder="Stock ID">
                                        </div>
                                        <button type="submit" name="submit" value="stockID" class="btn btn-default">Generate</button>
                                </form></div>
                            
                                     <div class="col-md-4">
                                    <form name="myForm" action="newRevenue.jsp" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="gen" id="stockSymbol" placeholder="Stock Type">
                                        </div>
                                        <button type="submit" name="submit" value="stockType" class="btn btn-default">Generate</button>
                                </form></div>
                            
                                     <div class="col-md-4">
                                    <form name="myForm" action="newRevenue.jsp" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="gen" id="stockSymbol" placeholder="Customer ID">
                                        </div>
                                        <button type="submit" name="submit" value="customerID" class="btn btn-default">Generate</button>
                                </form></div>
                       
                        
                        <%
                                if(generateBy.equals("stockID"))
                                {
                                    %>
                                    <div class="col-md-6 row">   
                               <div><strong>Revenue Listing By Stock</strong></div>
                               <table class="table">
                                   <tr>
                                   <th>StockID</th>
                                   <th>Num Shares</th>
                                   <th>PricePerShare</th>
                                   <th>OrderType</th>
                                   <th>Fee</th>
                                   </tr>
                                    
                                    
                                    <%
                                    query = "SELECT T.StockId,O.NumShares, O.PricePerShare, O.OrderType, Tr.Fee FROM Trade T, Orders O, Transaction Tr WHERE T.OrderId = O.Id AND Tr.Id = T.TransactionId AND T.StockId = '"+gen+"'";
                                    ps = conn.prepareStatement(query);
                                    rs = ps.executeQuery();
                                    while(rs.next()){
                                    %>
                                    <tr>
                                        <td><%=rs.getString("StockId")%></td>
                                        <td><%=rs.getString("NumShares")%></td>
                                        <td><%=rs.getString("PricePerShare")%></td>
                                        <td><%=rs.getString("OrderType")%></td>
                                        <td><%=rs.getString("Fee")%></td>
                                    </tr>
                                    
                                    
                                    <% } %>
                               </table>
                            <%        
                                }
                                else if(generateBy.equals("stockType"))
                                {
                                    %>
                                    <div class="col-md-6 row">   
                               <div><strong>Revenue Listing By Stock Type</strong></div>
                               <table class="table">
                                   <tr>
                                   <th>StockType</th>
                                   <th>Stock ID</th>
                                   <th>Num Shares</th>
                                   <th>Price Per Share</th>
                                   <th>Order Type</th>
                                   <th>Fee</th>
                                   </tr>
                       
                                    <%
                                     query = "SELECT S.Type,T.StockId,O.NumShares, O.PricePerShare, O.OrderType, Tr.Fee FROM Trade T, Orders O, Stock S, Transaction Tr WHERE T.OrderId = O.Id AND S.Type='"+gen+"' AND T.StockId = S.StockSymbol AND Tr.Id = T.TransactionId";
                                    ps = conn.prepareStatement(query);
                                    rs = ps.executeQuery();
                                    while(rs.next()){
                                    %>
                                    <tr>
                                        <td><%=rs.getString("Type")%></td>
                                        <td><%=rs.getString("StockId")%></td>
                                        <td><%=rs.getString("NumShares")%></td>
                                        <td><%=rs.getString("PricePerShare")%></td>
                                        <td><%=rs.getString("OrderType")%></td>
                                        <td><%=rs.getString("Fee")%></td>
                                    </tr>
                                    
                                    
                                    <% } %>
                               </table>
                                    
                                <%}
                                
                                else if(generateBy.equals("customerID"))
                                {
                                    %>
                                <div class="col-md-6 row col-md-offset-2">   
                               <div><strong>Revenue Listing By Customer</strong></div>
                               <table class="table">
                                   <tr>
                                   <th>Account ID</th>
                                   <th>Client ID</th>
                                   <th>FirstName</th>
                                   <th>LastName</th>
                                   <th>Stock ID</th>
                                   <th>Num Shares</th>
                                   <th>Price Per Share</th>
                                   <th>Order Type</th>
                                   <th>Fee</th>
                                   </tr>    
                                <%    
                                  query = "SELECT DISTINCT T.AccountId,A.Client,P.LastName,P.FirstName,T.StockId,O.NumShares, O.PricePerShare, O.OrderType, Tr.Fee FROM Trade T, Orders O,Person P,Account A, Transaction Tr WHERE T.AccountId = A.Id AND A.Client = P.SSN AND T.OrderId = O.Id AND A.Client = '"+gen+"' AND Tr.Id = T.TransactionId";
                                  ps = conn.prepareStatement(query);
                                  rs = ps.executeQuery();
                                  while(rs.next()){
                                    %>
                               <tr>
                                        <td><%=rs.getString("AccountId")%></td>
                                        <td><%=rs.getString("Client")%></td>
                                        <td><%=rs.getString("FirstName")%></td>
                                        <td><%=rs.getString("LastName")%></td>
                                        <td><%=rs.getString("StockId")%></td>
                                        <td><%=rs.getString("NumShares")%></td>
                                        <td><%=rs.getString("PricePerShare")%></td>
                                        <td><%=rs.getString("OrderType")%></td>
                                        <td><%=rs.getString("Fee")%></td>
                                    </tr>
                                    
                               <%  }
                               %>     
                               </table></div>
                               <%  }
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


    </body>
</html>
