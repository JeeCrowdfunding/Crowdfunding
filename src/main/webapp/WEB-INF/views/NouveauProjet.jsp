<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajout d'un nouveau projet</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/mine.min.css" />

	<script src="assets/js/jquery.js"></script>

	<script src="assets/js/bootstrap.js"></script>
</head>
<body class="container-fluid">
 
<h2 class="page-header" >Ajouter une demande de financement</h2>

<form method="POST" action="np.html" enctype="multipart/form-data" class="col-md-5  "> 

	<div class="form-group"  > <label class="control-label">Titre: </label><input type="text" name="titr" value="test" class="form-control" />
		 <span class="text-success bg-success "><c:out value="${titre}" />  </span> </div> 

	
	 <div class="form-group">	<label class="control-label">Description : </label ><textarea name="desc" rows = "5" cols="20" class="form-control"> </textarea> </div>

	

	<div class="form-group">	<label class="control-label">Durée: </label><input type="text" name="dure" class="form-control" /> </div>

 	<div class="form-group">	<label class="control-label">Montant: </label><input type="text" name="montant" class="form-control" /> </div>
 
 
  	<div class="form-group"> <label class="control-label">Image: </label>  <input type="file" name="img"  "/> <span class="text-success bg-success "><c:out value="${img}" /></span> </div>

	
	<div align="right" class="form-group"> <input type="submit" name="action" value="ajouter" class="form-control btn btn-success" /></div>


</form>
</body>
</html>