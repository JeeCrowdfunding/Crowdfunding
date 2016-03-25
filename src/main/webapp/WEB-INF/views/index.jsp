<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
    <meta charset="utf-8">
    <title>Crowdfunding Site</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">

    <link href='http://fonts.googleapis.com/css?family=Patua+One' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700,200,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/jquery-ui.css" rel="stylesheet">
    <link href="assets/css/resp.css" rel="stylesheet">
    <link href="assets/css/colorbox.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/js/CLEditor/jquery.cleditor.css" type="text/css" />
	<link rel="stylesheet" href="assets/js/jquery-ui.css">

    <link rel="apple-touch-icon" href="assets/img/touch-icon.html" />
    <link rel="image_src" href="assets/img/touch-icon.html" />
	<script src="assets/js/appJs.js"></script>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/CLEditor/jquery.cleditor.js"></script>
	<script src="assets/js/addProjet.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	
	
		<script type="text/javascript">
    /*
		function makeConnection(){
			    	
	        $.ajax({
	            url: "makeConnexion.html",
	            type: "GET",
	            success: function (my_text) {
		       		 if(my_text.indexOf("Erreur")==-1){
						 var my=JSON.parse(my_text);
						 if(my.isLogged) {
							 changeHeader();				 
						 }
					 }
					 else alert(""+my_text);
	            }
	        });
			
		}*/
		
		var dialog, dialog_add_cat;
	    $(document).ready(function () {
	    	//makeConnection();
			$(".editeur").cleditor({
				height: 400,
				width: 900
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
			 
			 dialog_login = $( "#loginForm" ).dialog({
			      autoOpen: false,
			      height: 350,
			      width: 350,
			      modal: true,
			      show: {
			          effect: "explode",
			          duration: 1000
			        },
			        hide: {
			          effect: "explode",
			          duration: 1000
			        }
			 });
		
			 dialog_registre = $( "#registreForm" ).dialog({
			      autoOpen: false,
			      height: 600,
			      width: 350,
			      modal: true,
			      show: {
			          effect: "blind",
			          duration: 1000
			        },
			        hide: {
			          effect: "explode",
			          duration: 1000
			        }
			 });
			 

			    
			$(".cleditorToolbar").append( "<div class=\"cleditorGroup\" style=\"width: 49px;\"><button type=\"button\"style=\"width: 25px; height: 25px;\" id=\"bf\"><img style=\"width: 25px; height: 25px;margin-left: -15px; margin-top: -6px\" src=\"Images/pi.png\"/></button> </div>" );
			$( "#bf" ).button().on( "click", function() {
				      dialog.dialog( "open" );
			});
		    ed=$(".editeur").cleditor()[0];
		    makeCnx();
		    var projetShow=location.search.split('projetShow=')[1];
		    if(projetShow==1) {
		    	getMyProject(1);
		    	scrollToAnchor('id3');
		    }
		    else getProjects(1);
		    getCat();
		    
		    
	    });

	</script>

 
    <script>
        /* <![CDATA[ */
        $(window).scroll(function fade() {
            if ($(window).scrollTop() > 400) {
                $("#navtop").css("display", "block");
            }
            else {
                $("#navtop").css("display", "none");
            }
        });
        /* ]]> */
        
        //for saving last this "accordion"
		var preClassActive; 
    </script>
	<style>
		progress[0] {color:green;}
	</style>
</head>

<body>
	  	

	<!--  Forms for Log in and regester ! -->
    <div id="loginForm" title="Log-in" >
      <form id="loginFormP" action="cnx.html" method="post">
        <div >
          <h3>Login information</h3>
          <label for="usrnm" class="ui-hidden-accessible">Username:</label>
          <input type="text"  ng-model="email"  name="email" id="usrnm" placeholder="Username">
          <label for="pswd" class="ui-hidden-accessible">Password:</label>
          <input type="password"  ng-model="pwd"  name="pwd" id="pswd" placeholder="Password">
          <label for="log">Keep me logged in</label>
          <input type="checkbox" name="login" id="log" value="1" data-mini="true">
          <input type="button" onclick="loginFunction()" data-inline="true" value="Log in">
        </div>
      </form>
    </div>
    
     <div id="registreForm" title="Register form" >
      <form action="inscription.html" method="post" enctype="multipart/form-data">
        <div>
          <h3>Register information</h3>
			 <input type="text" ng-model="name" name="name" placeholder="Name"> <br/>
	         <input type="text" ng-model="surname"  name="surname" placeholder="Surname"> <br/>
	         <input type="text" ng-model="email"  name="email" placeholder="Email"><br/>
	         <input type="text" ng-model="phone"  name="phone" placeholder="Phone"><br/>
	         <input type="password" ng-model="pwd"  name="pwd" placeholder="Password"><br/>
	         <input type="password" ng-model="rpwd"  name="rpwd" placeholder="Repeat Password"><br/>
	         <input type="file" ng-model="img" name="image" ><br/>
	         <textarea name="shortDesc" ng-model="shortDesc" class="inputp search-query span3"  rows="5" placeholder="Short Description"></textarea><br/>
			 <input type="submit"  class="inputp search-query span3" data-inline="true" value="Register">
        </div>
      </form>
    </div>
    

	<!--  Upload une image pour la description -->
	<div id="df">
	   <form id="my_form" method="post" action="imageUpload.html" enctype="multipart/form-data">
		    <div class="form-group"  > <label class="control-label">Votre image :</label> <input type="file" name="image" accept="image/*"> </div>
		    <div align="right" class="form-group"> <button type="submit" class="form-control btn btn-success" onclick=" dialog.dialog( 'close' ); ">OK</button></div>
		</form>
	</div>
	
	<!-- Ajouter une catégorie -->
 	<div id="add_cat" title="Add categorie">
	   <form id="form_add_cat" method="get" action="addCategorie.html" >
		    <div class="form-group"  > <label class="control-label">Title of categorie :</label> <input type="text" id="titre_categorie" name="titre" /> </div>
		    <div align="right" class="form-group"> <button type="button" class="form-control btn btn-success" onclick="addCat();">OK</button></div>
		</form>
	</div> 
<div id="header" class="header" >
    <a name="id_home"></a>
        <div class="width titul">
            <div class="reg inline" id="hideLogin">
                <div class="bleft inline login"><a href="#loginForm" id="login-link" onclick="dialog_login.dialog( 'open' );" class="login-link">Login</a></div> 
                <div class="bleft bright inline login"><a href="#registreForm" onclick="dialog_registre.dialog( 'open' );" data-rel="popup" id="reg-link" class="login-link">Register</a></div>
            </div>

            <div class="social inline fright">
                <ul id="social">
                <li class="bleft inline">
                    <ul style="margin-left: 10px">
                        <li><a href="https://www.facebook.com/" target="_blank"  original-title="twitter"><img src="assets/img/social/icon_header_face.png" alt=""></a></li>
                        <li><a href="https://plus.google.com/" target="_blank"  original-title="googleplus"><img src="assets/img/social/icon_header_g.png" alt=""></a></li>
                        <li><a href="https://twitter.com/" title="facebook" target="_blank" ><img src="assets/img/social/icon_header_tw.png" alt=""></a></li>
                        <li><a href="http://www.linkedin.com/" target="_blank" original-title="linkedin"><img src="assets/img/social/icon_header_in.png" alt=""></a></li>
                        <li><a href="johndoe_domainname.html" target="_self" original-title="mail"><img src="assets/img/social/icon_header_p.png" alt=""></a></li>
                        <li><a href="johndoe_domainname.html" target="_self" original-title="mail"><img src="assets/img/social/icon_header_ball.png" alt=""></a></li>
                    </ul>
                </li>
                    <li class="bleft first socialz"><a class="active" href="#">EN</a></li>
                    <li class="bleft socialz"><a href="#">FR</a></li>
                </ul>
            </div>
        </div>

        <div class="clear"></div>
        <div class="navigate">
            <div class="width">
                <div class="logo inline">
                    <h2 class="inline fleft">C-FUNDING</h2>
                </div>

                <div class="navigation inline">
                    <ul class="nav inline menuleft">
                        <li class="active"><a class="bleft" href="index.html">HOME</a></li>
                        <li><a id="link_about" class="bleft" href="#">ABOUT</a></li>
                        <li><a id="link" class="bleft" href="#">PROJECTS</a></li>
                        <li><a id="link_reg" class="bleft" href="#">REGISTER</a></li>
                        <li><a id="link_contact" class="bleft" href="#">CONTACTS</a></li>
                        <li><a id="link_partners" class="bleft last" href="#">GITHUB</a></li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
            <div id="header_select">
                <select id="dynamic_select">
                    <option value="" selected>Select A Page</option>
                    <option value="index.html#id_about">About</option>
                    <option value="index.html#id3">Projects</option>
                    <option value="index.html#id_reg">Registration</option>
                    <option value="index.html#id_cont">Contacts</option>
                    <option value="index.html#id_partn">GitHub</option>
                </select>
            </div>
        </div>


    </div>
<div id="navtop" class="width navigate" style="position: fixed;  display: none; top: 0px; left: 0px;right: 0px;z-index: 99999999999999999;">
    <div class="navigation">
        <ul class="nav inline menuleft">
            <li class="active"><a class="bleft" id="link_home" href="#">HOME</a></li>
            <li><a id="link_about_b" class="bleft" href="#">ABOUT</a></li>
            <li><a id="link_b" class="bleft" href="#">PROJECTS</a></li>
            <li><a id="link_reg_b" class="bleft" href="#">REGISTER</a></li>
            <li><a id="link_contact_b" class="bleft" href="#">CONTACTS</a></li>
            <li><a id="link_partners_b" class="bleft last" href="#">GITHUB</a></li>
        </ul>
    </div>
</div>

<div class="contentt">
<div class="container-fluid line">

    <div class="slides">
            <div class="search_top">
                <div class="search" id="searchh">
                    <span class="white"><strong>Find a project:</strong></span>
                    <input id="autocomplete" onfocus="setActivSherchForProject()" onblur="stopActivSherchForProject()" title="" type="text" class="span7 search-query">
                    <input type="button" onclick="getResultatOfSherch()" class="submit" value="search" name="submit">
                </div>
            </div>
    </div>

    <div class="top_widgets black">
        <section class="black">
            <div class="search-wrapper clearfix">
                <div class="zone clearfix">
                <div class="searchr block">
                <div id="default-search" >

                </div>
                <div id="advanced-search"  style="display: none;">

<!-------------------------------------------- Projects Slides ---------------------------------->

                <div class="row-fluid projects font_p" id="top_slide">
                <div id="myCarousel" class="carousel slide">
                <div class="carousel-inner content" >
                <div id="ProjectsCtrl"></div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"></a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next"></a>
                </div>

                </div>


                </div>
                <div class="advanced-search-control">
                    <a id="advanced-search-button" class="advanced-search-button fright adv_search latest expanded"></a>
                </div>
                </div>

                </div><!-- end of .zone-search -->
            </div><!-- end of .search-wrapper -->

            <div class="map-wrapper">

                <div id="map" class="map" style="position: relative; overflow: hidden; -webkit-transform: translateZ(0);height: 465px">
                    <div id="home-page-featured">
                        <div id="Textus">
                        <div class="clear">
                        <p>WELCOME TO OUR APP</p>
                        </div>
                        <div class="clear">
                        <p>AMAZING CROWDFUNDING SITE</p>
                        </div>
                        </div>
                        
                        <ul>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/01.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/02.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/03.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/04.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/05.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/06.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/07.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/08.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/09.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/10.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/11.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/12.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/13.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                        </ul>
                        <ul>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/14.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/15.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/16.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/17.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/18.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/19.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/20.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/21.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/22.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/23.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/01.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/02.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/03.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>

                        </ul>  
                        <ul>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/16.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/07.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/08.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/10.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/11.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/02.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/03.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/13.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/14.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/15.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/17.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/18.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>
                            <li><a href="#"><img width="155" height="155" src="assets/img/slide/19.jpg" class="attachment-post-thumbnail wp-post-image" alt=""></a></li>

                        </ul>

                        <!-- / container -->
                    </div>
                </div>
            </div><!-- end of .map-wrapper -->
            <a name="id_about"></a>
        </section>
    </div>
</div>

<div class="clear"></div>

<div class="content">
    <h1 class="decoration text-center about"><span class="nobacgr">About</span></h1>
    <div class="about_block">
        <p class="about_cont"><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate egestas sem, eu cursus ligula ullamcorper non. Curabitur tristique velit eu mauris venenatis egestas. Phasellus bibendum placerat metus, sed molestie magna semper eget. Sed sit amet dui felis, tempus porttitor justo.</strong></p>
        <div class="row-fluid folders">
            <div class="span4">
                <div class="folder_bordered">
                    <div class="folder"><a href="#"><img src="assets/img/folder1.png" alt=""></a></div>
                    <div class="folder"><h3 class="nomarg text-center">Step 1:</h3></div>
                    <div class="folder"><p class="green text-center"><strong>Choose a project</strong></p></div>
                </div>
                <div class="folder"><img src="assets/img/folder_n.png" alt=""></div>
            </div>
            <div class="span4">
                <div class="folder_bordered">
                    <div class="folder"><a href="#"><img src="assets/img/folder2.png" alt=""></a></div>
                    <div class="folder"><h3 class="nomarg text-center">Step 2:</h3></div>
                    <div class="folder"><p class="green text-center"><strong>Back a project</strong></p></div>
                </div>
                <div class="folder"><img src="assets/img/folder_n.png" alt=""></div>
            </div>
            <div class="span4">
                <div class="folder_bordered">
                    <div class="folder"><a href="#"><img src="assets/img/folder3.png" alt=""></a></div>
                    <div class="folder"><h3 class="nomarg text-center">Step 3:</h3></div> <a name="id3"></a>
                    <div class="folder"><p class="green strong text-center"><strong>Receive a gift</strong></p></div>

                </div>
                <div class="folder"><img src="assets/img/folder_n.png" alt=""></div>
            </div>

        </div>
    </div>

<h1 class="decoration text-center proj"><span id="spanTitleOfContent" class="nobacgr">Projects</span></h1>

    <section class="section content" id="portfolio-list">

        <div class="wrapper row-fluid projects font_p"  id="contentWrapper">
            <div class="zone-content clearfix" ng-controller="ProjectsCtrl">

                <div class="">

                    <div class="portfolio-selection block">
                        <div class="decoration text-center" data-toggle="buttons-radio">
                            <div class="inline nobacgr">
                                <div class="text-center tags">
                                    <ul id="portfolio-filter">
                                        <li><input class="btn" id="all" type="button" value="All" class="button-2-green current" title=""> </li>
                                        <li><input class="btn" id="creative" type="button" value="Creative" class="button-2-green" title=""> </li>
                                        <li><input class="btn" id="developments" type="button" value="Developments" class="button-2-green" title=""> </li>
                                        <li><input class="btn" id="fashion" type="button" value="Fashion" class="button-2-green" title="">  </li>
                                        <li><input class="btn" id="identity" type="button" value="Identity" class="button-2-green" title="">  </li>
                                        <li><input class="btn" id="movies" type="button" value="Movies" class="button-2-green" title="">  </li>
                                        <li><input class="btn" id="other" type="button" value="Other" class="button-2-green" title="">   </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                
    <!-------------------------------------------- Projects ---------------------------------->
			<div id="projetShow" style="display:none;">
                <div class="portfolio-container" >

                    <div class="portfolio-listing block" style="display: block;">
                        <div class="span4 bordered" >
                            <div class="folder">
                            <h4 class="text-center title"><a href="projects.html?id=##idProjet##">##projetName##</a></h4>
                            </div>
                            <div class="proj_name">
                                <div class="clear"></div>
                                <span class="fleft author">##userNameOfProjet##</span>
                                <table class="icons">
                                    <tbody>
                                    <tr>
                                        <td class="icos_proj_sm bleft"><a class="group1" href="" title=""><img src="assets/img/icon_search.png" alt=""></a></td>
                                        <td class="icos_proj_sm bleft"><a href="projects.html?id=##idProjet##"><img src="assets/img/icon_lock.png" alt=""></a></td>
                                    </tr>
                                    </tbody>
                                 </table>
                                <div class="clear"></div>
                           </div>
                            <div class="folder border"><a href="projects.html?id=##idProjet##"><div class="author_proj" > <img src="##imgProjet##" /></div></a></div>
                            <div class="folder lorem lines">
                                <progress  title="##progTitle##" value="##progValue##" max="##progMax##"></progress>
                            </div>
                            <p class="descr">##descProjet##</p>
                            <div class="folder price topbordered">
                                <div class="span4">
                                    <strong class="green"><span>$</span><span class="project_value"> ##montantProjet##</span></strong>
                                    <p>pledged</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>##gevinToProjet##</strong>
                                    <p>backers</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>##dureeProjet##</strong>
                                    <p>days to go</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
			</div>

            </div><!-- end of .zone-content -->
        
        	<div id="projetsBord"></div>
        </div><!-- end of .content-wrapper -->

    </section>

<div class="btns">
    <div class="btn-toolbar text-center">
        <div class="decoration text-center proj">
                    <div class="btn-group nobacgr" id="pagination">
						
                    </div>
                    <a name="id_reg" id="registr"></a>
        </div>

    </div>

</div>


<h1 class="decoration text-center proj"><span class="nobacgr">Create Your Project</span></h1>
<div class="create_projects" ng-controller="addProjectCtrl">

 <form class="form-search" action="addProject.html" method="post" enctype="multipart/form-data">

<!-----------------------------------------According: Create a Project ---------------------------------------->

<div class="container" >
    <div class="row">
    <div class="col-md-12">
     
     <div id="accordion-first" class="clearfix">
                        <div class="accordion" id="accordion2">

                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" onclick="accordionAfterClick(this,2)">
                                <em class="icon-fixed-width fa fa-plus"></em>Step 1: <span class="green">Project Summary
                              </a>
                            </div>
                            <div style="height: 0px;" id="collapse_2" class="accordion-body collapse">
                              <div class="accordion-inner">
                                <div class="row-fluid border_proj duration">
                                    <div class="span10" style="min-height:900px;">
                                        <div class="bleft column_project">
                                            <h4 class="text-center">Project Description:</h4>
											 	<div class="form-group">	
											
											 	</div>
										 		<div >
										 			<div class="form-group">
										 				<input type="text" name="title"  ng-model="title" class="inputp search-query span12" placeholder="Title"/>
										 				<div class="clear"></div>
										 				<input type="text" name="montant"  ng-model="montant" class="inputp search-query span12" placeholder="Montant"/>
										 				<div class="clear"></div>
										 				
										 				<textarea name="shortDesc" ng-model="shortDesc" class="inputp search-query span12"  rows="5" placeholder="Short Description"></textarea>
										 				<div class="clear"></div>
										 		 		<label class="control-label" id="cat" >Categorie : </label>
											 			<select id="id_categorie" ng-model="data.multipleSelect" class="inputp search-query span12" name="categorie"  multiple>
											 			</select>
											 			<input type="button" value="+" onclick="javascript: dialog_add_cat.dialog('open');" /> 
											 			 <p>{{data.multipleSelect}}</p>
											 			  <input class="inputp search-query span12" type="file" id="file" name="image"/>
											 			<input type="hidden" ng-model="descAventage" id="id_real_desc_av" name="descAventage"/>
											 			<input type="hidden" ng-model="montantAventage" id="id_real_montant_av"  name="montantAventage"/>
											 		</div><br/><br/>
											 		<div class="clear"></div>
											 		<!--  <input type="button" value="+" onclick="javascript: dialog_add_cat.dialog('open');" /> -->
													<fieldset>
														<legend>Add new aventage </legend>
															<input class="inputp search-query span4" type="text" id="id_montant_av"  placeholder="Mantant">
            												<div class="clear"></div>
           											 		<textarea id="id_desc_av"  class="inputp search-query span4"  rows="5" placeholder="Description"></textarea>
           											 		<input type="button" onclick="addAv()" value="+" />
           											 </fieldset>
           											 
           											 <div id="les_aventeges">
           											 
           											 </div>

            
												</div>
												
												
                                        </div>
                                    </div>

                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree" onclick="accordionAfterClick(this,3)" >
                                <em class="icon-fixed-width fa fa-plus"></em>Step 2: <span class="green">Project page</span>
                              </a>
                            </div>
                            <div style="height: 0px;" id="collapse_3" class="accordion-body collapse">
                              <div class="accordion-inner">
                                <div class="row-fluid border_proj duration">
                                    <div class="span10">
                                        <div class="bleft column_project">
                                            <h4 class="text-center">Project Details:</h4>
											<textarea id="id_desc" ng-model="desc" name="desc" rows = "5" cols="20" class="form-control editeur"> </textarea>
                                        </div>
                                    </div>

                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" onclick="accordionAfterClick(this,4)">
                                <em class="icon-fixed-width fa fa-plus"></em>Step 3: <span class="green">Project Duration</span>
                              </a>
                            </div>
                            <div style="height: 0px;" id="collapse_4" class="accordion-body collapse">
                              <div class="accordion-inner">
                                <div class="row-fluid border_proj duration">
                                           <div class="span10">
                                                <div >
                                                    <h4 class="text-center ">Project Duration:</h4>
                                                    <ul>
                                                        <li>
                                                            <input ng-model="duration" id="rfirst" type="radio" name="duration" value="30" checked hidden />
                                                            <label for="rfirst">30 Days ($15)</label>
                                                        </li>
                                                        <li>
                                                            <input ng-model="duration" id="rsecond" type="radio" name="duration" value="45" hidden />
                                                            <label for="rsecond">45 Days ($20)</label>
                                                        </li>
                                                        <li>
                                                            <input ng-model="duration" id="re" type="radio" name="duration" value="60" hidden />
                                                            <label for="re">60 Days ($25)</label>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                </div>
                              </div>
                            </div>
                          </div>  
                        </div><!-- end accordion -->
                    </div>
    </div>


    </div>
</div>


	<!--  <input type="submit" value="ok" ng-click="addProject()" > -->
    <div class="decoration text-center create_butt"><span class="nobacgr_whit"><button class="btn btn-large search-query"  type="submit"> <span class="butt_small"><strong>CREATE</strong></span></button></span><a name="id_cont"></a></div>
 </form> 
</div>


<h1 class="decoration text-center conts"><span class="nobacgr">Contact Us</span></h1>

<div class="contacts">
    <div class="bborder">
        <p><strong>Send Us a <span class="green">Message</span></strong></p>
    </div>
    
</div>

</div>


<a name="id_partn"></a>
<div class="partner_bott">
    <div class="partners">
        <h5 class="decoration text-center"><span class="nobacgr_whit">OUR GITHUB</span></h5>
        <div class="partn_pics">
                    <a href="https://github.com/JeeCrowdfunding/Crowdfunding" class="partner"><img src="assets/img/github.png" alt=""></a>      
         </div>
        </div>
    </div>
</div>


<div id="footer">
   
    <div class="footer_bot">
        <div class="footer_bott">
              <div class="fleft">© All Rights Reserved. M1 info Univ Angers.</div>
              <div class="fright">
                <ul id="social_b" class="socialbott inline">
                    <li><a href="https://twitter.com/" target="_blank" original-title="twitter"><img src="assets/img/social/icon_footer_face.png" alt=""></a></li>
                    <li><a href="https://plus.google.com/" target="_blank" original-title="googleplus"><img src="assets/img/social/icon_footer_g.png" alt=""></a></li>
                    <li><a href="https://www.facebook.com/" title="facebook" target="_blank"><img src="assets/img/social/icon_footer_tw.png" alt=""></a></li>
                    <li><a href="http://www.linkedin.com/" target="_blank" original-title="linkedin"><img src="assets/img/social/icon_footer_in.png" alt=""></a></li>
                    <li><a href="http://www.linkedin.com/" target="_self" original-title="mail"><img src="assets/img/social/icon_footer_p.png" alt=""></a></li>
                    <li><a href="http://www.linkedin.com/" target="_self" original-title="mail"><img src="assets/img/social/icon_footer_ball.png" alt=""></a></li>
                </ul>
              </div>
            <div class="clear"></div>
        </div>
    </div>
</div>


<!--  
<div class="popup-wrapper" id="popup">
    <div class="popup-container" id="popup-2">

        <div  name="myForm" action="#" method="POST" class="popup-form">
            <h3>Enter your email and your password</h3>
            
            <div class="input-group">
                <p><input type="email" id="email" name="email" placeholder="Email"  required ></p>
                <p><input type="password" id="pwd" name="pwd" placeholder="Password"  required ></p>

                <p> 
                
                <input type="hidden" name="action" value="subscribe"> 
                <input type="hidden" name="source" value="http://www.syakirurohman.net/2015/01/tutorial-membuat-popup-tanpa-javascript-jquery.html"> 
                <input type="hidden" name="sub-type" value="widget"> 
                <input type="hidden" name="redirect_fragment" value="blog_subscription-2"> 
                <input type="hidden" id="_wpnonce" name="_wpnonce" value="aaf0b68fcd"> 
                
                <input id = "submit_id" type="button" value="Submit"  >
                </p>
            </div>
        </div>
        <a class="popup-close" href="#popup">X</a>
    </div>
  </div>

<script>

    //Popup close script

    var submit =document.getElementById("submit_id");
    var email;

    submit.addEventListener("click",function (e) {
    //room_name = document.forms["myForm"]["roomName"].value;
    email =document.getElementById("email").value;
    console.log(email);
    var popup = document.getElementById("popup");
    popup.classList.add("popup-closed");
    });

</script> -->


    <script>
        /* <![CDATA[ */
        $(document).ready(function(){
            $("#toggl").click(function(){
                $("#panel").slideToggle("slow");
                $("#home-page-featured").slideToggle("slow");
                $(this).toggleClass('latest_top');
            });
        });
        /* ]]> */
        </script>
<script>
    /* <![CDATA[ */
    jQuery('#advanced-search').hide();
    jQuery('#advanced-search-button').click(function(event) {
        /* Preventing default link action */
        event.preventDefault();
        jQuery('#default-search').slideToggle('fast');
        jQuery('#advanced-search').slideToggle('fast');
        jQuery(this).toggleClass('expanded');
    });
    /* ]]> */

</script>

<script>
    /* <![CDATA[ */
    function scrollToAnchor(aid){
        var aTag = $("a[name='"+ aid +"']");
        $('html,body').animate({scrollTop: aTag.offset().top},'slow');
    }
    $("#link").click(function() {
        scrollToAnchor('id3');
    });
    $("#link_about").click(function() {
        scrollToAnchor('id_about');
    });
    $("#link_reg").click(function() {
        scrollToAnchor('id_reg');
    });
    $("#link_contact").click(function() {
        scrollToAnchor('id_cont');
    });
    $("#link_home").click(function() {
        scrollToAnchor('id_home');
    });
    $("#link_partners").click(function() {
        scrollToAnchor('id_partn');
    });
    $("#link_b").click(function() {
        scrollToAnchor('id3');
    });
    $("#link_about_b").click(function() {
        scrollToAnchor('id_about');
    });
    $("#link_reg_b").click(function() {
        scrollToAnchor('id_reg');
    });
    $("#link_contact_b").click(function() {
        scrollToAnchor('id_cont');
    });
    $("#link_partners_b").click(function() {
        scrollToAnchor('id_partn');
    });
    /* ]]> */


</script>


<script src="assets/js/jquery.selectbox.min.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/contact.js"></script>
<script src="assets/js/jquery.colorbox.js"></script>
<script src="assets/js/jquery.placeholder.js"></script>
<script src="assets/js/jquery.tweet.js"></script>
<script src="assets/js/jflickrfeed.min.js"></script>
<script src="assets/js/scripts.js"></script>

<!--[if IE 8]>
<script src="assets/js/css3-mediaqueries.js"></script>
<![endif]-->
<script>
    /* <![CDATA[ */
    $(document).ready(function(){
        var slider = $(".slider").slider({
            change: function () {
/*                var value = $(this).slider("option", "value");
                $(this).find(".ui-slider-handle").text(value+'%');*/
            },
            slide: function () {
/*                var value = $(this).slider("option", "value");
                $(this).find(".ui-slider-handle").text(value+"%");*/
            }
        });
/*        slider.each(function(index){
            var el = slider.get(index);
            var value = $(el).slider("value");
            $(el).slider("value", value);
        });*/
    });
    /* ]]> */
</script>
<script>
    /* <![CDATA[ */
    $(document).ready(function(){
        //Examples of how to assign the Colorbox event to elements
        $(".group1").colorbox({rel:'nofollow',scalePhotos:'false'});

    });
    /* ]]> */

</script>
<script>
    /* <![CDATA[ */
    $(function() {
        $('input, textarea').placeholder();
    });
    /* ]]> */

</script>



<script>

</script>


</body>
</html>