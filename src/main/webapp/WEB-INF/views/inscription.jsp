<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us" ng-app="app">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<title>Inscription</title>
</head>
<body>
	<div ng-controller="ctrl">
            <label>Nom</label>
            <input ng-model="nom" type="text" /><br >
            <label>Prenom</label>
            <input ng-model="prenom" type="text"><br >
            <label>E-mail</label>
            <input ng-model="email" type="text"><br >
            <label>Numero de telephone</label>
            <input ng-model="numtel" type="text"><br >
            <label>Mot de passe</label>
            <input ng-model="mdp" type="password"><br >
            <label>Confirmation de mot de passe</label>
            <input ng-model="confmdp" type="password"><br >
            <button ng-click="send()" type="button">S'inscrire</button>
        </div>
        <script type="text/javascript">
            var app = angular.module('app', []);
            app.controller('ctrl', ['$scope', '$log', '$http', function($scope, $log, $http) {
                $scope.send = function() {
                    // formulaire a envoyé
                    var form = new FormData();
                    form.append('nom', $scope.nom);
                    form.append('prenom', $scope.prenom);
                    form.append('email', $scope.email);
                    form.append('numtel', $scope.numtel);
                    form.append('mdp', $scope.mdp);
                    form.append('confmdp', $scope.confmdp);
                    $http.post('add.html', form, {
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
        </script>
</body>
</html>