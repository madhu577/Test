<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Spring Boot Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js"></script>
<script src="/js/angular.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
<style>
        .selected {border: 2px solid #D2D2D2;}
    </style>
</head>
<body>
	<div class="container" ng-app="app">
		<h1>Employer Search</h1>
		

		<div class="row">
			<div ng-controller="postController" class="col-md-3">
				<form name="customerForm" ng-submit="submitForm()">
					<label>FirstName</label>
					<input type="text" name="firstname"	class="form-control" ng-model="firstname" />
					<label>LastName</label>
					<input type="text" name="lastname" class="form-control" ng-model="lastname" />
					
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
				<p>{{postResultMessage}}</p>
			</div>
		</div>
		<div class="row">
			<div ng-controller="getallcustomersController" class="col-md-3">
				<h3>All Employers</h3>

				<button ng-click="getAllCustomers()">Get All Employers</button>

				<div ng-show="showAllCustomers">
					<ul class="list-group">
						<li ng-repeat="customer in allcustomers.data"><h4 class="list-group-item">
								<strong>Customer {{$index}}</strong><br />
								Id: {{customer.id}}<br />
								First Name: {{customer.firstName}}<br />
								Last Name: {{customer.lastName}}
						</h4></li>
					</ul>
				</div>
				<p>{{getResultMessage}}</p>
			</div>

			<div ng-controller="getcustomerController" class="col-md-3">
				<h3>Employer by ID</h3>

				<input type="text" class="form-control" style="width: 100px;"
					ng-model="customerId" /> <br />
				<button ng-click="getCustomer()">Get Employer</button>

				<div ng-show="showCustomer">
					Id: {{customer.data.id}}<br />
					First Name: {{customer.data.firstName}}<br />
					Last Name: {{customer.data.lastName}}
				</div>
				<p>{{getResultMessage}}</p>
			</div>

			<div ng-controller="getcustomersbylastnameController" class="col-md-4">
				<h3>Employers by LastName</h3>

				<input type="text" class="form-control" style="width: 100px;" ng-model="customerLastName" /><br />
				<button ng-click="getCustomersByLastName()">Get Employer</button>

				<div ng-show="showCustomersByLastName">

					<ul class="list-group">
						<li ng-repeat="customer in allcustomersbylastname.data"><h4	class="list-group-item">
								<strong>Employer {{$index}}</strong><br />
								Id: {{customer.id}}<br />
								First Name: {{customer.firstName}}<br />
								Last Name: {{customer.lastName}}
						</h4></li>
					</ul>
				</div>
				<p>{{getResultMessage}}</p>
			</div>

		</div>
		
		<div class="row">
		

			<div ng-controller="getcustomerController" class="col-md-3" >
				<h3>Edit Employer by ID</h3>

				<input type="text" class="form-control" style="width: 100px;"
					ng-model="customerId" /> <button ng-click="getCustomer()">Get Employer</button>

				<div ng-show="showCustomer" class="selected">
					Id: {{customer.data.id}}<br />
					First Name: <br />
					<input type="text" class="form-control" style="width: 100px;"
					ng-model="customer.data.firstName" /> 
					Last Name: 
					<input type="text" class="form-control" style="width: 100px;"
					ng-model="customer.data.lastName" /> 
					<button ng-click="editsubmitForm()">Update Employer</button>
				</div>
				<p>{{getResultMessage}}</p>
			</div>

			

		</div>
	</div>
</body>
</html>