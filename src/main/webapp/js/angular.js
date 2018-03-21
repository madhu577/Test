var app = angular.module('app', []);

app.controller('postemployerController', function($scope, $http, $location) {
	$scope.submitForm = function(){
		var url = $location.absUrl() + "postemployer";
		
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

app.controller('getallemployersController', function($scope, $http, $location) {
	
	$scope.showAllEmployers = false;

	$scope.getAllEmployers = function() {
		var url = $location.absUrl() + "findall";
		console.log($location.absUrl());
		var config = {
			headers : {
				'Content-Type' : 'application/json;charset=utf-8;'
			}
		}

		$http.get(url, config).then(function(response) {

			if (response.data.status == "Done") {
				$scope.allemployers = response.data;
				$scope.showAllEmployers = true;

			} else {
				$scope.getResultMessage = "get All Employers Data Error!";
			}

		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});

	}
});

app.controller('getemployerController', function($scope, $http, $location) {
	
	$scope.showEmployer = false;
	
	$scope.getEmployer = function() {
		var url = $location.absUrl() + "employer/" + $scope.employerId;

		var config = {
			headers : {
				'Content-Type' : 'application/json;charset=utf-8;'
			}
		}

		$http.get(url, config).then(function(response) {

			if (response.data.status == "Done") {
				$scope.employer = response.data;
				$scope.showEmployer = true;

			} else {
				$scope.getResultMessage = "Employer Data Error!";
			}

		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});

	}
	
	$scope.editsubmitForm = function(){
		var url = $location.absUrl() + "update/employer";
		
		var config = {
                headers : {
                    'Content-Type': 'application/json;charset=utf-8;'
                }
        }
		
		var data = {
				id: $scope.employerId,
            firstName: $scope.employer.data.firstName,
            lastName: $scope.employer.data.lastName
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

app.controller('getemployersbylastnameController', function($scope, $http, $location) {
	
	$scope.showEmployersByLastName = false;
	
	$scope.getEmployersByLastName = function() {
		var url = $location.absUrl() + "findbylastname";

		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'lastName' : $scope.employerLastName }
		}

		$http.get(url, config).then(function(response) {

			if (response.data.status == "Done") {
				$scope.allemployersbylastname = response.data;
				$scope.showEmployersByLastName = true;

			} else {
				$scope.getResultMessage = "Employer Data Error!";
			}

		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});

	}
});
