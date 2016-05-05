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
    <li><a href="ManagerHelp.jsp">Help</a></li>
</ul>
</div> 


    
<h1><strong>Manager Help</strong></h1>
<p>Welcome to JCK Trade!</p>
<p>
    From the manager home screen, you can access a sales report for a month from
    the dropdown menu. 
</p>
<p>
    From the Stocks menu, you can view all the types of stocks that we currently
    offer as well as information about them. You can also see the frequency of 
    their trading. You can also update these stocks using the two menus beside
    the information. Enter the information and then click update. 
</p>
<p>
    The Orders tab will let you view information on the orders in the system. 
    You can search by stock symbol or the name of the person who placed the 
    order.
</p>
<p>
    From the Revenue tab, you can see the employee who has generated the most
    revenue as well as the customer who has generated us the most revenue. You
    can also generate revenue tables based on Stock ID, Stock Type, and Customer
    ID. 
</p>
    </body>
</html>
