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
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
	var ed; 
	var dialog;
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
		 $(".cleditorToolbar").append( "<div class=\"cleditorGroup\" style=\"width: 49px;\"><button type=\"button\"style=\"width: 25px; height: 25px;\" id=\"bf\"><img style=\"width: 25px; height: 25px;margin-left: -15px; margin-top: -6px\" src=\"Images/pi.png\"/></button> </div>" );
		$( "#bf" ).button().on( "click", function() {
			      dialog.dialog( "open" );
		});
	    ed=$(".editeur").cleditor()[0];
	    
    });
    
    $(function () {
        $('#my_form').on('submit', function (e) {
            // On empêche le navigateur de soumettre le formulaire
            e.preventDefault();
     
            var $form = $(this);
            var formdata = (window.FormData) ? new FormData($form[0]) : null;
            var data = (formdata !== null) ? formdata : $form.serialize();
     
            $.ajax({
                url: $form.attr('action'),
                type: $form.attr('method'),
                contentType: false, // obligatoire pour de l'upload
                processData: false, // obligatoire pour de l'upload
                data: data,
                success: function (response) {
                    if(response.indexOf("Erreur")==-1) {
                    	document.getElementById("id_desc").value+="<img src=\"http://localhost:8080"+response+"\" />";
                    	ed.updateFrame();
                    }
                    else alert(""+response);
                }
            });
        });
    });

    function addAv(){
    	var av=document.getElementById("les_aventeges");
    	var nbr=document.getElementById("nbr").value;
    	nbr++;
    	av.innerHTML+= "<fieldset><legend>Nouvau Aventage</legend><div class=\"form-group\"><label class=\"control-label\">Description : </label ><textarea name=\"desc_av_"+nbr+"\" rows = \"5\" cols=\"20\" class=\"form-control\"> </textarea> </div><div class=\"form-group\"><label class=\"control-label\">Montant: </label><input type=\"text\" name=\"montant_av_"+nbr+"\" class=\"form-control\" /> </div></fieldset>";
    	document.getElementById("nbr").value=nbr;
    }
	</script>
</head>
<body class="container-fluid">
 
<h2 class="page-header" >Ajouter une demande de financement</h2>
	<div id="df">
	   <form id="my_form" method="post" action="imageUpload.html" enctype="multipart/form-data">
		    <div class="form-group"  > <label class="control-label">Votre image :</label> <input type="file" name="image" accept="image/*"> </div>
		    <div align="right" class="form-group"> <button type="submit" class="form-control btn btn-success" onclick=" dialog.dialog( 'close' ); ">OK</button></div>
		</form>
	</div>
  
<form method="POST" action="np.html" enctype="multipart/form-data" class="col-md-5  "> 

	<div class="form-group"  > <label class="control-label">Titre: </label><input type="text" name="titr" value="test" class="form-control" />
		 <span class="text-success bg-success "><c:out value="${titre}" />  </span> </div> 

	
	 <div class="form-group">	<label class="control-label">Description : </label ><textarea id="id_desc" name="desc" rows = "5" cols="20" class="form-control editeur"> </textarea> </div>

	<div class="form-group">	<label class="control-label">Durée: </label><input type="text" name="dure" class="form-control" /> </div>

 	<div class="form-group">	<label class="control-label">Montant: </label><input type="text" name="montant" class="form-control" /> </div>
 
 
  	<div class="form-group"> <label class="control-label">Image: </label>  <input type="file" name="img" /> <span class="text-success bg-success "><c:out value="${img}" /></span> </div>

	<div id="les_aventeges">
			<fieldset>
				<legend>Nouvau Aventage </legend>
					 <div class="form-group"><label class="control-label">Description : </label ><textarea name="desc_av_1" rows = "5" cols="20" class="form-control"> </textarea> </div>
					 <div class="form-group">	<label class="control-label">Montant: </label><input type="text" name="montant_av_1" class="form-control" /> </div>
			</fieldset>
	</div>
	<input type="hidden" value="1" id="nbr" name="nbr" />
	<input type="button" onclick="addAv()" value="+" /> <br/> <br/>
	<div align="right" class="form-group"> <input type="submit" name="action" value="ajouter" class="form-control btn btn-success" /></div>
</form>


</body>
</html>