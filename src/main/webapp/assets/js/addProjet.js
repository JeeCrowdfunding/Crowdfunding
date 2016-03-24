/**
 * 
 * 
 */

	var ed; 
	var ch="";
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
				      document.getElementById("cat").innerHTML ="Categorie";
				 }			 
				 //else alert(""+my_text);
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
    	/*
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
    	}*/

    	var mydesc=document.getElementById("id_desc_av");
    	var mym=document.getElementById("id_montant_av");
    	
    	if(mydesc.value!="" && mym.value!="" && !isNaN(mym.value)){
	    	var av=document.getElementById("les_aventeges");
	    	document.getElementById("id_real_desc_av").value +=mydesc.value+";";
	    	document.getElementById("id_real_montant_av").value+=mym.value+";";
	    	av.innerHTML +="<p>" +
	    			"" +mydesc.value+
	    			" >> Montant : <strong>"+mym.value+"</strong>"+
	    			"</p>";
	    	mydesc.value="";
	    	mym.value="";
    	}
    	
    	else alert("Veuillez remplir les champs ! (Montant doit être réel) ");
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
                        	document.getElementById("titre_categorie").value="";
                        }
                        else alert(""+response);
                    }
                });

    	}
    	
    	else alert("Le champ titre est obligatoire * ");
    	
    }
    
    

    
    	/*	
	function getRes(){
	    var s=document.getElementById("id_cherche").value;
		
		if(s.length>1 && ch!=s){
				ch=s;
				if (window.XMLHttpRequest) {
					// code for IE7+, Firefox, Chrome, Opera, Safari
					var my_request = new XMLHttpRequest();
				} else {
					// code for IE6, IE5
					var my_request = new ActiveXObject("Microsoft.XMLHTTP");}
				
				var url="rechercher.php?cherche="+s;
				
				 my_request.onreadystatechange=function() {
				 
					 if (my_request.readyState==4 && my_request.status==200) {
					 
					 var my_text=my_request.responseText; 
					 var t=my_text.split(",");
					  	$( "#id_cherche" ).autocomplete({
							source: t
						});
					 }
				 } 
				my_request.open("GET", url, true) ;
				my_request.send();
	 }
			
	}*/


    function getProjects(page) {
    	
        var div=document.getElementById("projetShow").innerHTML;
        var projets=document.getElementById("projetsBord");
        var p=document.getElementById("pagination");
        projets.innerHTML="<center><img src=\"Images/chargement.gif\" /></center>";
        p.innerHTML="";
        $.ajax({
            url: "getprojects.html?page="+page,
            type: "GET",
            success: function (my_text) {
    			 if(my_text.indexOf("Erreur")==-1){
    				 projets.innerHTML="";
    				 var my=JSON.parse(my_text);
    				 for(var i=0;i<my.length;i++) {
    					 var mydiv=div;
    					 a=my[i];
    					 mydiv=mydiv.replace(/##idProjet##/g,""+a.idProject);
    					 mydiv=mydiv.replace("##projetName##",""+a.projectName);
    					 mydiv=mydiv.replace("##userNameOfProjet##",""+a.authorName);
    					 mydiv=mydiv.replace("##descProjet##",""+a.description);
    					 mydiv=mydiv.replace("##imgProjet##",""+a.ImgUrl);
    					 mydiv=mydiv.replace("##montantProjet##",""+a.pledgedGoal);
    					 mydiv=mydiv.replace("##gevinToProjet##",""+a.pledged);
    					 mydiv=mydiv.replace("##dureeProjet##",""+a.daysToGo);
    					 mydiv=mydiv.replace("##progTitle##",""+(a.pledged/a.pledgedGoal*100));
    					 mydiv=mydiv.replace("##progValue##",""+a.pledged);
    					 mydiv=mydiv.replace("##progMax##",""+a.pledgedGoal);
    					 projets.innerHTML+=mydiv;
    				 }
    				 var nbr=my[0].nbrPages;
    				 if(nbr<=0) nbr=1;
    				 for(var i=1;i<=nbr;i++) {
    						if(i==page) p.innerHTML+= '<button class="btn" onclick="getProjects('+i+')" ><span class="gray">'+i+'</span></button>';
    						else p.innerHTML+= '<button class="btn" onclick="getProjects('+i+')" >'+i+'</button>';
    				 }
    			 }
    			 else alert(""+my_text);
            }
        });    
        
    }


