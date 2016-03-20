var myApp = angular.module("myApp", []);

myApp.controller("TabContentCtrl", function($scope) {
	$scope.content = {};
	$scope.content.titleDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien. Nullam ac nisi vel augue ultrices venenatis sed sed felis.";
	$scope.content.textDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien. Nullam ac nisi vel augue ultrices venenatis sed sed felis. Quisque velit tortor, suscipit et auctor tempus, pretium eu velit. Vestibulum vitae ligula sapien. Donec et felis lorem. Vestibulum non feugiat risus. Sed malesuada nisl vel lorem rhoncus feugiat. Proin pellentesque velit nec metus tincidunt quis egestas tortor venenatis. Phasellus mattis sapien suscipit massa suscipit placerat. Vestibulum semper laoreet tempus. Curabitur ac sagittis urna. Sed rhoncus massa vel lorem lobortis sit amet adipiscing nunc aliquet. Quisque metus velit, mattis a vehicula sed, hendrerit sed leo. Donec aliquet molestie semper. Donec ac condimentum nisl. Ut bibendum scelerisque turpis vitae porttitor. Maecenas eget nisi nulla. Pellentesque sed congue nulla. Etiam magna massa, tempus quis accumsan sit amet, posuere eget odio. Suspendisse pellentesque odio id nunc tempor placerat. Pellentesque ipsum mauris, ultrices ut rhoncus id, vehicula eget est. Sed turpis tortor, accumsan eu ultrices et, egestas eget diam. Praesent ligula felis, varius vitae mollis at, cursus at massa. Sed consequat semper sagittis. Vivamus ultricies massa a urna interdum ultrices";
});

myApp.controller("authorCtrl", function($scope) {
	$scope.authorDetails = {};
	$scope.authorDetails.name = "Hicham Safi";
	$scope.authorDetails.job = "Engineer";
	$scope.authorDetails.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.";
});

myApp.controller("askQuestionCtrl", function($scope) {
	$scope.messageDetails = {};
	$scope.messageDetails.user = "User";
	$scope.messageDetails.time = "April 10, 2016 at 7:34 pm";
	$scope.messageDetails.msg = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa ut justo accumsan malesuada ut pharetra sapien.";
});


myApp.controller("BackThisProjectBlockCtrl", function($scope) {
	$scope.backersDetails = {};
	$scope.backersDetails.backers = "300";
	$scope.backersDetails.pledged = "30,000";
	$scope.backersDetails.pledgedGoal = "$60,000";
	$scope.backersDetails.daysToGo = "60";
});

myApp.controller("PledgesBlockCtrl", function($scope) {
	$scope.pledges = [
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
});


myApp.controller("ProjectsCtrl", function($scope) {
	$scope.projects = [
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
});
