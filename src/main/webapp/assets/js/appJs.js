/**
 * 
 */


var dialog_login, dialog_register;
var sherchForProject;
var okAccordion=false;
function findProjectByTitle(){
	title=document.getElementById("autocomplete").value;
	if(title.length>=2 && title!=ch){
		ch=title;
		clearInterval(sherchForProject);
        $.ajax({
            url: "findProjet.html?titre="+ch+"&page="+1+"&type=0",
            type: "GET",
            success: function (my_text) {
				 if(my_text.indexOf("Erreur")==-1){
					 
					 var tp=my_text.split(",");
					 //alert(""+tp[0]);
				      $( "#autocomplete" ).autocomplete({
				            source: tp
				       });
					 
				 }			 
				 else alert(""+my_text);
            }
        });
	}	
}

function setActivSherchForProject() { sherchForProject=setInterval('findProjectByTitle();', 250); }

function stopActivSherchForProject() {clearInterval(sherchForProject);}	
    
function changeHeader(b){
	var h=document.getElementById("hideLogin");
	if(b){	
		h.innerHTML="<div class=\"bleft inline login\"><a href=\"#\" id=\"login-link\" onclick=\"logout()\" class=\"login-link\">Logout</a></div>";	
		okAccordion=true;
	}
	else {
		h.innerHTML="<div class=\"bleft inline login\"><a href=\"#loginForm\" id=\"login-link\" onclick=\"dialog_login.dialog( 'open' );\" class=\"login-link\">Login</a></div> <div class=\"bleft bright inline login\"><a href=\"#registreForm\" onclick=\"dialog_registre.dialog( 'open' );\" data-rel=\"popup\" id=\"reg-link\" class=\"login-link\">Register</a></div>";
		
	}
}

function logout(){
	
    $.ajax({
        url: "logout.html",
        type: "GET",
        success: function (my_text) {
			 if(my_text.indexOf("Erreur")==-1){
					 changeHeader(false);	
					 okAccordion=false;
			 }
			 else alert(""+my_text);
        }
    });
}

//Accordion Toggle Items


function accordionAfterClick(e, id) {
	
	if(okAccordion) {
		for(var i= 2 ;i<=4 ;i++) {
			document.getElementById('collapse_'+i).style.height='0';
		}
		if(preClassActive !=null) preClassActive.className="accordion-toggle";
		document.getElementById('collapse_'+id).style.height='auto';
		e.className="accordion-toggle active";
		preClassActive=e;
	}
	
}

function loginFunction(){
    var $form = $("#loginFormP");
    $.ajax({
        url: $form.attr('action'),
        type: $form.attr('method'),
        data: $form.serialize(),
        success: function (response) {
            if(response.indexOf("Erreur")==-1) {
           	 	changeHeader(true);
           	 	dialog_login.dialog( 'close' );
            }
            else alert(""+response);
        }
    });
	
}

function makeCnx(){
	
    $.ajax({
        url: "makeConnexion.html",
        type: "GET",
        success: function (my_text) {
			 if(my_text.indexOf("Erreur")==-1){
				 var my=JSON.parse(my_text);
				 if(my.isLogged) {
					 changeHeader(true);				 
				 }
			 }
			 else alert(""+my_text);
        }
    });
    
}

