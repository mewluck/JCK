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
    <form name="myForm" action="newRecordOrder.jsp" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" name="accountId" id="registerUser" placeholder="Account ID">
                            </div>
                            <div class="row form-group">
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="brokerId" id="registerFName" placeholder="Broker ID">
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="stockId" id="registerLName" placeholder="Stock ID">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="fee" id="registerSSN" placeholder="Fee">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="pricePerShare" id="registerEmail" placeholder="Price Per Share">
                            </div>
                            <div class="row form-group">
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="percentage" id="registerAddress" placeholder="Percentage">
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" class="form-control" name="numShares" id="registerZipCode" placeholder="Number of Shares">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="priceType" id="registerEmail" placeholder="Price Type">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="orderType" id="registerCCN" placeholder="Order Type">
                            </div>
                            <button type="submit" value="recordOrder" onclick="return Button1_onclick()" class="btn btn-default">Record</button>
                        </form> 
</div>
    
    </body>
</html>

