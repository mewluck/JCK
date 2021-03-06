<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Record Order</title>
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
    <li class="active"><a href="RecordOrder.jsp">Record Order</a></li>
    <li><a href="ClientEdit.jsp">Clients</a></li>
    <li><a href="CustMail.jsp">Customer MailingList</a></li>
    <li><a href="StockSuggestion.jsp">Stock Suggestion</a></li>
</ul>
</div>  

<div class="col-md-3">
    <h1><strong>Record an Order</strong></h1>
    
<%
                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/chmak";
                String mysUserID = "chmak";
                String mysPassword = "108695120"; 
                String accountId = request.getParameter("accountId");
                String brokerId = request.getParameter("brokerId");
                String stockId = request.getParameter("stockId");
                String fee = request.getParameter("fee");
                String pricePerShare = request.getParameter("pricePerShare");
                String percentage = request.getParameter("percentage");
                String priceType = request.getParameter("priceType");
                String orderType = request.getParameter("orderType");
                String numShares = request.getParameter("numShares");
                java.sql.Connection conn = null;
                
                                try {
                                    Class.forName(mysJDBCDriver).newInstance();
                                    java.util.Properties sysprops = System.getProperties();
                                    sysprops.put("user", mysUserID);
                                    sysprops.put("password", mysPassword);
                                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                    System.out.println("Connected successfully to database using JConnect");
                                    String query = "SELECT * FROM orders";
                                    java.sql.PreparedStatement ps = conn.prepareStatement(query);
                                    java.sql.ResultSet rs = ps.executeQuery();
                                    int id = 1;
                                    while(rs.next()){
                                        id++;
                                    }
                                    String order = "INSERT INTO orders VALUES('"+numShares+"','"+pricePerShare+"','"+id+"',NOW(),'"+percentage+"','"+priceType+"','"+orderType+"')";
                                    String tran = "INSERT INTO transaction VALUES('"+id+"','"+fee+"',NOW(),'"+pricePerShare+"')";
                                    String trade = "INSERT INTO trade VALUES('"+accountId+"','"+brokerId+"','"+id+"','"+id+"','"+stockId+"')";
                                    java.sql.Statement stmt1=conn.createStatement();
                                    stmt1.executeUpdate(tran);
                                    stmt1.executeUpdate(order);
                                    stmt1.executeUpdate(trade);
                                    

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
    
    <h2><strong>Order Successfully Recorded</strong></h2>
    <form name="myForm" action="RecordOrder.jsp" method="post">
                            <button type="submit" value="recordOrder" onclick="return Button1_onclick()" class="btn btn-default">Record Another</button>
    </form> 
</div>
    
    </body>
</html>
