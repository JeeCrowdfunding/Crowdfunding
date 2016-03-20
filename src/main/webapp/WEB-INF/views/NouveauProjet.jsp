<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajout d'un nouveau projet</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/mine.min.css" />
		<link rel="stylesheet" href="assets/js/CLEditor/jquery.cleditor.css" type="text/css" />
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<!--   <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.js"></script>-->
	<script src="assets/js/CLEditor/jquery.cleditor.js"></script>
	<script src="assets/js/addProjet.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
    
    $(document).ready(function () { 
		$(".editeur").cleditor({
			height: 700,
			width: 1400
		}); 
		
		 dialog= $( "#df" ).dialog({
		      autoOpen: false,
		      height: 200,
		      width: 400,
		      modal: true
		 });
		 
		 dialog_add_cat = $( "#add_cat" ).dialog({
		      autoOpen: false,
		      height: 200,
		      width: 400,
		      modal: true
		 });
		 
		$(".cleditorToolbar").append( "<div class=\"cleditorGroup\" style=\"width: 49px;\"><button type=\"button\"style=\"width: 25px; height: 25px;\" id=\"bf\"><img style=\"width: 25px; height: 25px;margin-left: -15px; margin-top: -6px\" src=\"Images/pi.png\"/></button> </div>" );
		$( "#bf" ).button().on( "click", function() {
			      dialog.dialog( "open" );
		});
	    ed=$(".editeur").cleditor()[0];
	    getCat();
    });
    

    
	</script>
</head>
<body class="container-fluid">
 
<h2 class="page-header" >Ajouter une demande de financement</h2>

	<!--  Upload une image pour la description -->
	<div id="df">
	   <form id="my_form" method="post" action="imageUpload.html" enctype="multipart/form-data">
		    <div class="form-group"  > <label class="control-label">Votre image :</label> <input type="file" name="image" accept="image/*"> </div>
		    <div align="right" class="form-group"> <button type="submit" class="form-control btn btn-success" onclick=" dialog.dialog( 'close' ); ">OK</button></div>
		</form>
	</div>
	
	<!-- Ajouter une catégorie -->
 	<div id="add_cat">
	   <form id="form_add_cat" method="get" action="addCategorie.html" >
		    <div class="form-group"  > <label class="control-label">Titre du catégorie :</label> <input type="text" id="titre_categorie" name="titre" /> </div>
		    <div align="right" class="form-group"> <button type="button" class="form-control btn btn-success" onclick="addCat();">OK</button></div>
		</form>
	</div> 
  <!-- Le form Principale  -->
<form method="POST" action="np.html" enctype="multipart/form-data" class="col-md-5  "> 

	<div class="form-group"  > <label class="control-label">Titre: </label><input type="text" name="titr" value="test" class="form-control" />
		 <span class="text-success bg-success "><c:out value="${titre}" />  </span> </div> 

	
	 <div class="form-group">	<label class="control-label">Description : </label ><textarea id="id_desc" name="desc" rows = "5" cols="20" class="form-control editeur"> </textarea> </div>

	<div class="form-group">	<label class="control-label">Durée: </label><input type="text" name="dure" class="form-control" /> </div>

 	<div class="form-group">	<label class="control-label">Montant: </label><input type="text" name="montant" class="form-control" /> </div>
 
 	<div class="form-group">	
 		<label class="control-label" id="cat" >Catégorie : </label>
 		<select  name="categorie" id="id_categorie" class="form-control" multiple></select>
 		<input type="button" value="+" onclick="javascript: dialog_add_cat.dialog('open');" /> 
 	</div>
 
  	<div class="form-group"> <label class="control-label">Image: </label>  <input type="file" name="img" /> <span class="text-success bg-success "><c:out value="${img}" /></span> </div>

	<div id="les_aventeges">
			<fieldset>
				<legend>Nouvau Aventage </legend>
					 <div class="form-group"><label class="control-label">Description : </label ><textarea id="id_desc_av_1" name="desc_av_1" rows = "5" cols="20" class="form-control"> </textarea> </div>
					 <div class="form-group">	<label class="control-label">Montant: </label><input type="text" id="id_montant_av_1" name="montant_av_1" class="form-control" /> </div>
			</fieldset>
	</div>
	<input type="hidden" value="1" id="nbr" name="nbr" />
	<input type="button" onclick="addAv()" value="+" /> <br/> <br/>
	<div align="right" class="form-group"> <input type="submit" name="action" value="ajouter" class="form-control btn btn-success" /></div>
</form>


</body>
</html>