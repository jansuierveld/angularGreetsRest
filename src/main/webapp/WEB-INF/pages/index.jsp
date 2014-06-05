<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-GB">
<head>
	<title></title>
	
	<link href="<c:url value="/resources/style/style.css" />" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.1.5/angular.min.js"></script> 
	
	<script>
            
			var moduleRest = angular.module("ModuleRest", []);
			
			
			moduleRest.controller("HelloController", function($scope, $http) {
				 
				$scope.submit = function(form) {
			
					  $scope.submitted = true;
					  $scope.validForm = false;
					 
					
					  // If form is invalid, return and let AngularJS show validation errors.
					  if (form.$invalid) {
					    return;
					  }
		  			  
		  			  $scope.validForm = true;
		  		      $scope.data = null;
		  		      $scope.realData = '';
					
					  var responsePromise = $http.get("rest/hello/" + form.name, {});
				      responsePromise.success(function(dataFromServer, status, headers, config) {
				           $scope.data = dataFromServer;
					       $scope.realData = dataFromServer.data;
				      });
				       
				      responsePromise.error(function(data, status, headers, config) {
				          alert("Submitting form failed!");
				      });
				      
				}
				
				
				
			});
			
      
            // bootstrap
            angular.element(document).ready(function() {

                var topDiv = document.getElementById("topDiv");
                angular.bootstrap(topDiv, ["ModuleRest"]);
                
            });
    
	</script>
	
</head>
	
	<body>
		
			<div id="topDiv">
				<div id="main" ng-module="ModuleRest">
	
					    
					    <div ng-controller="HelloController">
					    
					    
					    	<form name="myForm" novalidate>
							    <div class="form-group">
							      <label class="label">Your name: </label>&nbsp;<input type="text" name="myName" ng-model="myForm.name" ng-minlength="5" ng-maxlength="20" required>
							      <button data-ng-click="submit(myForm)" >Submit</button>  
								</div>
							</form>
							
							<div>
								<span class="label error" data-ng-show="submitted && myForm.myName.$error.required">The name is required.</span>
								<span class="label error" data-ng-show="submitted && myForm.myName.$error.minlength">The name is too short. It must be at least 5 characters.</span>
								<span class="label error" data-ng-show="submitted && myForm.myName.$error.maxlength">The name is too long. It must be max 20 characters.</span>
							</div>	  
						    
					    	<div ng-if="validForm == true">
								The rest service with submitted name {{myForm.name}} returns json: {{data}}
							<div>
							<div style="margin-top:20px"/>
							<div ng-if="validForm == true">
								So...<p>{{realData}}</p><br/><br/>
							<div>
							
						</div>
				
					
				</div>
			
			</div>
			
			
			
		
	</body>
</html>		