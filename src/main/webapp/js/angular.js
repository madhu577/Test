var app = angular.module('app', []);

app.controller('postController', function($scope, $http, $location) {
	$scope.submitForm = function(){
		var url = $location.absUrl() + "postcustomer";
		
		var config = {
                headers : {
                    'Content-Type': 'application/json;charset=utf-8;'
                }
        }
		
		var data = {
            firstName: $scope.firstname,
            lastName: $scope.lastname
        };
		
		
		$http.post(url, data, config).then(function (response) {
			$scope.postResultMessage = "Insert Sucessful!";
		}, function (response) {
			$scope.postResultMessage = "Fail!";
		});
		
		$scope.firstname = "";
		$scope.lastname = "";
	}
});

app.controller('getallcustomersController', function($scope, $http, $location) {
	
	$scope.showAllCustomers = false;

	$scope.getAllCustomers = function() {
		var url = $location.absUrl() + "findall";
		console.log($location.absUrl());
		var config = {
			headers : {
				'Content-Type' : 'application/json;charset=utf-8;'
			}
		}

		$http.get(url, config).then(function(response) {

			if (response.data.status == "Done") {
				$scope.allcustomers = response.data;
				$scope.showAllCustomers = true;

			} else {
				$scope.getResultMessage = "get All Customers Data Error!";
			}

		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});

	}
});

app.controller('getcustomerController', function($scope, $http, $location) {
	
	$scope.showCustomer = false;
	
	$scope.getCustomer = function() {
		var url = $location.absUrl() + "customer/" + $scope.customerId;

		var config = {
			headers : {
				'Content-Type' : 'application/json;charset=utf-8;'
			}
		}

		$http.get(url, config).then(function(response) {

			if (response.data.status == "Done") {
				$scope.customer = response.data;
				$scope.showCustomer = true;

			} else {
				$scope.getResultMessage = "Customer Data Error!";
			}

		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});

	}
	
	$scope.editsubmitForm = function(){
		var url = $location.absUrl() + "editcustomer";
		
		var config = {
                headers : {
                    'Content-Type': 'application/json;charset=utf-8;'
                }
        }
		
		var data = {
				id: $scope.customerId,
            firstName: $scope.customer.data.firstName,
            lastName: $scope.customer.data.lastName
        };
		
		
		$http.post(url, data, config).then(function (response) {
			$scope.postResultMessage = "Edit Sucessful!";
		}, function (response) {
			$scope.postResultMessage = "Fail!";
		});
		
		$scope.firstname = "";
		$scope.lastname = "";
	}
	
});

app.controller('getcustomersbylastnameController', function($scope, $http, $location) {
	
	$scope.showCustomersByLastName = false;
	
	$scope.getCustomersByLastName = function() {
		var url = $location.absUrl() + "findbylastname";

		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'lastName' : $scope.customerLastName }
		}

		$http.get(url, config).then(function(response) {

			if (response.data.status == "Done") {
				$scope.allcustomersbylastname = response.data;
				$scope.showCustomersByLastName = true;

			} else {
				$scope.getResultMessage = "Customer Data Error!";
			}

		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});

	}
});
