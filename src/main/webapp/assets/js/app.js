var myApp = angular.module("myApp", []);

 
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

 myApp.controller("ProjectsCtrl", ['$scope', '$log', '$http', function($scope, $log, $http,projectService) {
               
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



myApp.controller("ProjectDetailsCtrl", function($scope,) {
	$scope.projectDetails = projectService.getProject();

});


myApp.controller("", function($scope,projectsService) {
	
});


myApp.factory("projectsService", function() {
	projects = [
		{
			idProject:"1",
			projectName: "Project Name 1",
			authorName: "Author Name 1",
			pledgedGoal:"400",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			ImgUrl:"/adresse",
			categorie:"creative developments",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{	
			idProject:"2",
			projectName: "Project Name 2",
			pledgedGoal:"500",
			authorName: "AuthorName 2",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{	
			idProject:"3",
			pledgedGoal:"500",
			projectName: "Project Name 3",
			authorName: "AuthorName 3",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			projectName: "Project Name",
			authorName: "AuthorName",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			projectName: "Project Name",
			authorName: "AuthorName",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			projectName: "Project Name",
			authorName: "AuthorName",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			idProject:"1",
			projectName: "Project Name 1",
			authorName: "Author Name 1",
			pledgedGoal:"400",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			ImgUrl:"/adresse",
			categorie:"creative developments",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{	
			idProject:"2",
			projectName: "Project Name 2",
			pledgedGoal:"500",
			authorName: "AuthorName 2",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{	
			idProject:"3",
			pledgedGoal:"500",
			projectName: "Project Name 3",
			authorName: "AuthorName 3",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			projectName: "Project Name",
			authorName: "AuthorName",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			projectName: "Project Name",
			authorName: "AuthorName",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			projectName: "Project Name",
			authorName: "AuthorName",
			pledged: "$25",
			backers: "10",
			daysToGo:"25",
			percentageReached :"50",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		}		
	];
	
	return {
		getProjects: function() {
			return projects;
		},
		addProject: function(project) {
			
		}
	}
});

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
			pledged: "$5",
			backers: "10",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "$10",
			backers: "15",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "$15",
			backers: "20",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "$20",
			backers: "25",
			estimateDelivery: "12-08-2016",
			details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		},
		{
			pledged: "$25",
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