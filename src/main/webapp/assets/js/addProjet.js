/**
 * 
 * 
 */

	var ed; 
	var dialog, dialog_add_cat;
	
    function getCat() {
    	
    	var sel=document.getElementById("id_categorie");
    	document.getElementById("cat").innerHTML +="<img src=\"Images/chargement.gif\" width=\"120\" />";
        var $form = $("#form_add_cat");
        $.ajax({
            url: "getCat.html",
            type: "GET",
            success: function (my_text) {
				 if(my_text.indexOf("Erreur")==-1){
				      var cat= my_text.split(";");
				      for(var i=0;i<cat.length;i++) {
				    	  if(cat[i] !="" && cat[i] !=null) {
				    	  	var mycateg= cat[i].split(" ");			    	  
				    	  	sel.innerHTML+="<option value=\""+mycateg[0]+"\">"+mycateg[1]+"</option>";
				    	  }
				     }
				      sel.innerHTML+="<option value=\"0\">Autre</option>";
				      document.getElementById("cat").innerHTML ="Catégorie";
				 }			 
				 else alert(""+my_text);
            }
        });
  	
    }
    
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
    	var nbr=parseInt(document.getElementById("nbr").value);
    	nbr=nbr+1;
    	var ar_d=new Array();
    	var ar_m=new Array();
    	for(var i=1;i<nbr;i++) {
    		ar_d[(i-1)]=document.getElementById("id_desc_av_"+i).value;
    		ar_m[i-1]=document.getElementById("id_montant_av_"+i).value;
    	}
    	av.innerHTML+= "<fieldset><legend>Nouvau Aventage</legend><div class=\"form-group\"><label class=\"control-label\">Description : </label ><textarea id=\"id_desc_av_"+nbr+"\" name=\"desc_av_"+nbr+"\" rows = \"5\" cols=\"20\" class=\"form-control\"> </textarea> </div><div class=\"form-group\"><label class=\"control-label\">Montant: </label><input type=\"text\" id=\"id_montant_av_"+nbr+"\" name=\"montant_av_"+nbr+"\" class=\"form-control\" /> </div></fieldset>";
    	document.getElementById("nbr").value=nbr;
    	
    	for(var i=1;i<nbr;i++) {
    		document.getElementById("id_desc_av_"+i).value=ar_d[i-1];
    		document.getElementById("id_montant_av_"+i).value=ar_m[i-1];
    	}
    	
    }
    
    function addCat(){
    	var titre=document.getElementById("titre_categorie").value;
    	if(titre!=null && titre!="" ) {
         
                var $form = $("#form_add_cat");
                $.ajax({
                    url: $form.attr('action'),
                    type: $form.attr('method'),
                    data: $form.serialize(),
                    success: function (response) {
                        if(response.indexOf("Erreur")==-1) {
                        	dialog_add_cat.dialog('close');
                        	document.getElementById("id_categorie").innerHTML+="<option value=\""+response+"\">"+titre+"</option>";
                        }
                        else alert(""+response);
                    }
                });

    	}
    	
    	else alert("Le champ titre est obligatoire * ");
    	
    }
    