<%-- 
    Document   : ClientHelp
    Created on : May 4, 2016, 11:16:39 PM
    Author     : Joshua
--%>

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
    <li><a href="ClientStockSuggestions.jsp">Stock Suggestions</a></li>
    <li><a href="ClientHelp.jsp">Help</a></li>
</ul>
</div> 


    
<h1><strong>Client Help</strong></h1>
<p>Welcome to JCK Trade! </p>
<p>From your client webpage, you can click on the links on the left-hand
    side of your screen to view various information about your account. From 
your home page, you can see your current stock holdings as well as the current
best selling stocks. From the conditional order tab, you can view the status of
your various conditional orders. You can view your stock history from the stock 
history tab. The stock suggestion tab will display suggestions for you as 
determined by the market and our employees. The help tab will return you to this
menu.
</p>
<p>If you have any further questions, feel free to contact your customer 
representative.
</p>
    </body>
</html>
