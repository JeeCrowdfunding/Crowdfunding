var myApp = angular.module("myApp", []);
var projects ;

/*
angular.element(document).ready(function ($log) {
	
    $.ajax({
        url: "makeConnexion.html",
        type: "GET",
        success: function (my_text) {
			 if(my_text.indexOf("Erreur")==-1){
				 var my=JSON.parse(my_text);
				 if(my.isLogged) {
					 changeHeader(true);				 
				 }
			 }
			 else alert(""+my_text);
        }
    });
    
    
    
});*/

myApp.factory("projectsService", function() {
	
	return {
		getProjects: function() {
			return projects;
		},
		setProjects: function(data) {
			 projects=data;
		},
		addProject: function(project) {
			
		}
	}
});
/*
(function() {
	  var initInjector = angular.injector(['ng']);
	  var $http = initInjector.get('$http');
	 
	  $http.get('getprojects.html').then(
	    function (response) {
	      angular.module('config', []).constant('CONFIG', response.data);
	      projectsService.setProjects(response.data);
	      $scope.projectDetails = projectService.getProject();
	      angular.element(document).ready(function() {
	          angular.bootstrap(document, ['myApp']);
	        });
	    }
	  );
	})();
*/

myApp.run(function ($http, projectsService) {
	
	angular.element(document).ready(function ($http,$scope,projectsService) {
		
		$http.get('getprojects.html').success(function (data) {
	    	projectsService.setProjects(data);
	    		

	    });
	});
    
});

 myApp.controller("registerUserCtrl", ['$scope', '$log', '$http', function($scope, $log, $http) {
               
                //
                $scope.send = function() {
                    // formulaire a envoyé
                	
                	
                    var form = new FormData();
                    form.append('name', $scope.name);
                    form.append('surname', $scope.surname);
                    form.append('phone', $scope.phone);
                    form.append('email', $scope.email);
                    form.append('pwd', $scope.pwd);
                    form.append('rpwd', $scope.rpwd);
                    form.append('img', $scope.img);
                    form.append('shortDesc', $scope.shortDesc);
                    $http.post('inscription.html', form, {
                            withCredentials: true,
                            headers: {
                                'Content-Type': undefined
                            },
                            transformRequest: angular.identity
                        })
                        .success(function(result) {
                            // 7el console sur firebug pour voir message
                            $log.info(result);
                        })
                        .error(function(data, status) {
                            $log.info(data);
                            $log.info(status);
                        });
                };
            }]);
 
 
 myApp.controller("LoginCtrl", ['$scope', '$log', '$http', function($scope, $log, $http) {
     
     //
     $scope.send = function() {
         // formulaire a envoyé
         var form = new FormData();
         form.append('email', $scope.email);
         form.append('pwd', $scope.pwd);
         $http.post('cnx.html', form, {
                 withCredentials: true,
                 headers: {
                     'Content-Type': undefined
                 },
                 transformRequest: angular.identity
             })
             .success(function(result) {
                 // 7el console sur firebug pour voir message
            	 $log.info(result);
            	 changeHeader(true);
            	 dialog_login.dialog( 'close' );
                 
             })
             .error(function(data, status) {
                 $log.info(data);
                 $log.info(status);
             });
     };
 }]);
 
 myApp.controller("addProjectCtrl", ['$scope', '$log', '$http', function($scope, $log, $http) {
     
     //
	    $scope.img = 'none';
	    $scope.addImg = function(){
	      var f = document.getElementById('file').files[0],
	          r = new FileReader();
	      r.onloadend = function(e){
	        $scope.img = e.target.result;
	      }
	      r.readAsBinaryString(f);
	    }
	    
     $scope.addProject = function() {
    	 $scope.data={
    			 singleSelect:null,
    			 multipleSelect: []
    	 };
    	 
    	 $scope.montantAventage=document.getElementById("id_real_montant_av").value;
    	 $scope.descAventage=document.getElementById("id_desc").value;
         // formulaire a envoyé
    	 //var categorieSelect = $scope.categorie;
    	 $scope.desc=document.getElementById("id_real_desc_av").value
         var form = new FormData();
         form.append('title', $scope.title);
         form.append('shortDesc', $scope.shortDesc);
         form.append('categorie', $scope.data);
         form.append('image', $scope.img);
         form.append('montant', $scope.montant);
         form.append('descAventage', $scope.descAventage);
         form.append('montantAventage', $scope.montantAventage);
         form.append('desc', $scope.desc);
         form.append('duration', $scope.duration);
         $http.post('addProject.html', form, {
                 withCredentials: true,
                 headers: {
                     'Content-Type': undefined
                 },
                 transformRequest: angular.identity
             })
             .success(function(result) {
                 // 7el console sur firebug pour voir message
                 $log.info(result);
             })
             .error(function(data, status) {
                 $log.info(data);
                 $log.info(status);
             });
     };
 }]);
/*
 myApp.controller("ProjectsCtrl", ['$scope', '$log', '$http','projectsService', function($scope, $log, $http,projectsService) {
               
                //
                $scope.projects = projectsService.getProjects();
				 
                $scope.chooseProject = function(project) {
                	
                    // id project
                    var idProject = new FormData();
                    idProject.append('idProject', project.idProject);
                    
                    $http.post('projectDetails.html', idProject, {
                            withCredentials: true,
                            headers: {
                                'Content-Type': undefined
                            },
                            transformRequest: angular.identity
                        })
                        .success(function(result) {
                            // 7el console sur firebug pour voir message
                            $log.info(result);
                        })
                        .error(function(data, status) {
                            $log.info(data);
                            $log.info(status);
                        });
                };
            }]);

*/
/*
myApp.controller("ProjectDetailsCtrl", function($scope,projectService) {
	$scope.projectDetails = projectService.getProject();

});
*/



myApp.factory("projectService", function() {
	
	
	projectDetails = {};
	projectDetails.backers = "300";
	projectDetails.pledged = "30,000";
	projectDetails.pledgedGoal = "$60,000";
	projectDetails.daysToGo = "60";
	
	//authorDetails
	authorDetails = {};
	authorDetails.name = "Hicham Safi";
	authorDetails.job = "Engineer";
	authorDetails.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.";
	projectDetails.authorDetails = authorDetails;
	
	//Description
	content = {};
	content.titleDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien. Nullam ac nisi vel augue ultrices venenatis sed sed felis.";
	content.textDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien. Nullam ac nisi vel augue ultrices venenatis sed sed felis. Quisque velit tortor, suscipit et auctor tempus, pretium eu velit. Vestibulum vitae ligula sapien. Donec et felis lorem. Vestibulum non feugiat risus. Sed malesuada nisl vel lorem rhoncus feugiat. Proin pellentesque velit nec metus tincidunt quis egestas tortor venenatis. Phasellus mattis sapien suscipit massa suscipit placerat. Vestibulum semper laoreet tempus. Curabitur ac sagittis urna. Sed rhoncus massa vel lorem lobortis sit amet adipiscing nunc aliquet. Quisque metus velit, mattis a vehicula sed, hendrerit sed leo. Donec aliquet molestie semper. Donec ac condimentum nisl. Ut bibendum scelerisque turpis vitae porttitor. Maecenas eget nisi nulla. Pellentesque sed congue nulla. Etiam magna massa, tempus quis accumsan sit amet, posuere eget odio. Suspendisse pellentesque odio id nunc tempor placerat. Pellentesque ipsum mauris, ultrices ut rhoncus id, vehicula eget est. Sed turpis tortor, accumsan eu ultrices et, egestas eget diam. Praesent ligula felis, varius vitae mollis at, cursus at massa. Sed consequat semper sagittis. Vivamus ultricies massa a urna interdum ultrices";
	projectDetails.content = content;
	
	//Comment
	messageDetails = {};
	messageDetails.user = "User";
	messageDetails.time = "April 10, 2016 at 7:34 pm";
	messageDetails.msg = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.";
	projectDetails.messageDetails = messageDetails;

	//pledges
	pledges = [
		{
			pledged: "5",
			backers: "10",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "10",
			backers: "15",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "15",
			backers: "20",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "20",
			backers: "25",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "25",
			backers: "30",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		}		
	];
	projectDetails.pledges=pledges;
	
	return {
		getProject: function() {
			return projectDetails;
		},
		addProject: function(project) {
			
		}
	}
});
 
