/**
 * 
 */

var id_projet;
	var contunieToGetComment=true;
	var isCharging=false;
    function getCommentaire() {
    	var scrollPosition = window.pageYOffset;
    	var clientHeight =document.documentElement.clientHeight; // Height de la page qui s'affiche au client 
    	var HeightPage =document.documentElement.scrollHeight;
    	  
    	if((scrollPosition+clientHeight+500) >=HeightPage && contunieToGetComment && !isCharging) {
    		isCharging=true;
			var oneComment= document.getElementById("oneComment").innerHTML;
			var comments= document.getElementById("comments");
			var img=document.getElementById("image_chargement");
			var page=parseInt(document.getElementById("idPageComment").value);
			
	        $.ajax({
	            url: "getCommentaire.html?id_projet="+id_projet+"&page="+page,
	            type: "GET",
	            success: function (my_text) {
					 if(my_text.indexOf("Erreur")==-1){
						 if(my_text!=""){
						      var commentaires= my_text.split("|");
						      for(var i=0;i<commentaires.length;i++) {
						    	  if(commentaires[i] !="" && commentaires[i] !=null) {
						    	  		var one= commentaires[i].split(";");			    	  
						    	  		var addc=oneComment;
						    	  		addc=addc.replace("##nameUser##", one[0]);
						    	  		addc=addc.replace("##imgUser##", one[1]);
						    	  		addc=addc.replace("##timeUser##", one[2]);
						    	  		addc=addc.replace("##msgUser##", one[3]);
						    	  		comments.innerHTML+=addc;
						    	  }
						    	 
						     }
						     isCharging=false;
						     img.style.display="none";
						     page++;
					    	 document.getElementById("idPageComment").value=page;
						 }
						 else contunieToGetComment=false;
					 }
					 else contunieToGetComment=false;
	            }
	        });
    	}
  	
    }
    
    function addComment() {
  			
    		var msg=document.getElementById("commentMsg");
    		if(msg.value!=""){
	            var $form =$('#addCommentForm');  
	            $.ajax({
	                url: $form.attr('action'),
	                type: $form.attr('method'),
	                data: $form.serialize(),
	                success: function (response) {
	                    if(response.indexOf("Erreur")==-1) {
	                    	var comments= document.getElementById("comments");
	                    	var addc=document.getElementById("oneComment").innerHTML;
	                    	var one=response.split(";");	
			    	  		addc=addc.replace("##nameUser##", one[0]);
			    	  		addc=addc.replace("##imgUser##", one[1]);
			    	  		addc=addc.replace("##timeUser##", one[2]);
			    	  		addc=addc.replace("##msgUser##", one[3]);
	                    	msg.value="";
	                    	
	                    	var tmp= comments.innerHTML;
	                    	comments.innerHTML=addc+tmp;
	                    }
	                    else alert(""+response);
	                }
	            });
    		}
    		else alert("Erreur : le champs de message est obligatoire !");
    }
 
    function updateUserLike(a){
    	var l=document.getElementById("like_vote");
    	var d= document.getElementById("dislike_vote");
		 if(a==1 || a=="1") {
				l.src="Images/like.png"; 
				l.style.width="50px";
				d.src="Images/no_dislike.png"; 
		 }
			 
		 else {
				 d.src="Images/dislike.png";
				 l.src="Images/no_like.png"; 
				 l.style.width="37px";
				 s.style.width="37px";
		 }
   	
   }
   
   function updateLike(){
   	var l=document.getElementById("like_vote");
   	var d= document.getElementById("dislike_vote");
   	var jaime=document.getElementById("jaime");
   	var jaimepas=document.getElementById("jaimepas");
   	
       $.ajax({
           url: "getLikes.html?id_projet="+id_projet,
           type: "GET",
           success: function (my_text) {
				 if(my_text.indexOf("Erreur")==-1){
					 var donne=my_text.split("|");
					 if(donne.length>=3){
						 jaime.value=donne[0];
						 jaimepas.value=donne[1];
						 jaime.max=donne[2];
						 jaimepas.max=donne[2];
						 
						 jaime.title=""+(donne[0]/donne[2]*100)+"% Like";
						 jaimepas.title=""+(donne[1]/donne[2]*100)+"% Dislike";
						 if(donne[3]!="2") {
							 updateUserLike(donne[3]);
						 }
					 }
				 }
           }
       });
   }
   
    function like (a) {
    	
        $.ajax({
            url: "projetLike.html?id_projet="+id_projet+"&like="+a,
            type: "GET",
            success: function (my_text) {
				 if(my_text.indexOf("Erreur")==-1){
					 updateUserLike(a);
					 updateLike();
				 }
				 else alert(""+my_text);
            }
        });
        
    	
    }
    

