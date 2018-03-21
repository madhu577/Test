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
		<h1>Employer Registration</h1>
		

		<div class="row">
			<div ng-controller="postemployerController" class="col-md-3">
				<form name="employerForm" ng-submit="submitForm()">
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
			<div ng-controller="getallemployersController" class="col-md-3">
				<h3>All Employers</h3>

				<button ng-click="getAllEmployers()">Get All Employers</button>

				<div ng-show="showAllEmployers">
					<ul class="list-group">
						<li ng-repeat="employer in allemployers.data"><h4 class="list-group-item">
								<strong>Employer {{$index}}</strong><br />
								Id: {{employer.id}}<br />
								First Name: {{employer.firstName}}<br />
								Last Name: {{employer.lastName}}
						</h4></li>
					</ul>
				</div>
				<p>{{getResultMessage}}</p>
			</div>

			<div ng-controller="getemployerController" class="col-md-3">
				<h3>Employer by ID</h3>

				<input type="text" class="form-control" style="width: 100px;"
					ng-model="employerId" /> <br />
				<button ng-click="getEmployer()">Get Employer</button>

				<div ng-show="showEmployer">
					Id: {{employer.data.id}}<br />
					First Name: {{employer.data.firstName}}<br />
					Last Name: {{employer.data.lastName}}
				</div>
				<p>{{getResultMessage}}</p>
			</div>

			<div ng-controller="getemployersbylastnameController" class="col-md-4">
				<h3>Employers by LastName</h3>

				<input type="text" class="form-control" style="width: 100px;" ng-model="employerLastName" /><br />
				<button ng-click="getEmployersByLastName()">Get Employer</button>

				<div ng-show="showEmployersByLastName">

					<ul class="list-group">
						<li ng-repeat="employer in allemployersbylastname.data"><h4	class="list-group-item">
								<strong>Employer {{$index}}</strong><br />
								Id: {{employer.id}}<br />
								First Name: {{employer.firstName}}<br />
								Last Name: {{employer.lastName}}
						</h4></li>
					</ul>
				</div>
				<p>{{getResultMessage}}</p>
			</div>

		</div>
		
		<div class="row">
		

			<div ng-controller="getemployerController" class="col-md-3" >
				<h3>Edit Employer by ID</h3>

				<input type="text" class="form-control" style="width: 100px;"
					ng-model="employerId" /> <button ng-click="getEmployer()">Get Employer to edit</button>

				<div ng-show="showEmployer" class="selected">
					Id: {{employer.data.id}}<br />
					First Name: <br />
					<input type="text" class="form-control" style="width: 100px;"
					ng-model="employer.data.firstName" /> 
					Last Name: 
					<input type="text" class="form-control" style="width: 100px;"
					ng-model="employer.data.lastName" /> 
					<button ng-click="editsubmitForm()">Update Employer</button>
				</div>
				<p>{{getResultMessage}}</p>
			</div>

			

		</div>
	</div>
</body>
</html>