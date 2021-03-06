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
    
    <div class="col-md-6"><strong>Generate Orders By...</strong></div>
         <div class="col-md-4">
            <form name="myForm" action="newOrders.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="firstName" id="stockSymbol" placeholder="First Name">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="lastName" id="stockSymbol" placeholder="Last Name">
                </div>
                <button type="submit" name="submit" value="name" class="btn btn-default">Generate</button>
            </form></div>
                            
        <div class="col-md-4">
            <form name="myForm" action="newOrders.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="symbol" id="stockSymbol" placeholder="Stock Symbol">
                </div>
                <button type="submit" name="submit" value="stockSymbol" class="btn btn-default">Generate</button>
            </form></div>


    </body>
</html>
