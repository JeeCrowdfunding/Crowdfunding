<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contribuer</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/mine.min.css" />

	<script src="assets/js/jquery.js"></script>

	<script src="assets/js/bootstrap.js"></script>
</head>
<body class="container-fluid">
 
<h2 class="page-header" >Contribuer à ce projet</h2>

<form method="POST" action="contribuer.html" class="col-md-5  "> 
 	

 	<div class="form-group">	<label class="control-label">Montant: </label><input type="text" name="montant" class="form-control" /> </div>
 
	
	<div class="form-group"> <input type="submit" name="action" value="contribuer" class="form-control btn btn-success" /></div>


</form>
</body>
</html>