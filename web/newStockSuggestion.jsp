<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Stock Suggestion</title>
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
    <li><a href="CustRepHome.jsp">Home</a></li>
    <li><a href="RecordOrder.jsp">Record Order</a></li>
    <li><a href="ClientEdit.jsp">Clients</a></li>
    <li><a href="CustMail.jsp">Customer MailingList</a></li>
    <li class="active"><a href="StockSuggestion.jsp">Stock Suggestion</a></li>
    <li><a href="CustRepHelp.jsp">Help</a></li>
</ul>
</div>  
    
<h1><strong>Stock Suggestion for Customer: <%=request.getParameter("customerID")%></strong></h1>                            
<%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120"; 
                String custID = request.getParameter("customerID");
                java.sql.Connection conn = null;
                
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");

                                    String query = "SELECT DISTINCT T.StockId, S.CompanyName, S.Type, S.PricePerShare, S.NumShares FROM Trade T, Stock S, Account A WHERE T.StockId = S.StockSymbol AND A.Id = T.AccountId AND A.Client = '"+custID+"'";
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();            %>
                                    <div class="col-md-6">
    <table class="table">
        <tr>
            <th>StockId</th>
            <th>CompanyName</th>
            <th>Type</th>            
            <th>PricePerShare</th>            
            <th>NumShares</th>                      
        </tr>
                                  <%  while (rs.next()){ %>
                                    <tr>
                        <td><%=rs.getString("StockId")%></td>
                        <td><%=rs.getString("CompanyName")%></td>
                        <td><%=rs.getString("Type")%></td>
                        <td><%=rs.getString("PricePerShare")%></td>
                        <td><%=rs.getString("NumShares")%></td>
                        </tr>
                                    
                                    <%
                                    }
                                  %>
                                  </table>
                                    </div>
<div class="col-md-4">
<form name="myForm" action="newStockSuggestion.jsp" method="post">
     <div class="form-group">
                    <input type="text" class="form-control" name="customerID" id="customerID" placeholder="Customer ID">
                </div>
                <button type="submit" name="submit" value="monthReport" class="btn btn-default">Generate</button>
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
                            
                            
    </body>
</html>
