<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
    <meta charset="utf-8">
    <title>Crowdfunding Site</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/resp.css" rel="stylesheet">
    <link href="assets/css/jquery-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    
    <style type="text/css"></style>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/appJs.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script src="assets/js/project.js"></script>


	<script>
		$(document).ready(function () {
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
			 makeCnx();
			 id_projet= location.search.split('id=')[1];
			 setInterval('getCommentaire();', 250);
			 updateLike();
			 getMyProjet();
		});
	
	</script>
</head>

<body >

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
    
<div id="header" class="header">
    <div class="width titul">
          <div class="reg inline" id="hideLogin">
                <div class="bleft inline login"><a href="#loginForm" id="login-link" onclick="dialog_login.dialog( 'open' );" class="login-link">Login</a></div> 
                <div class="bleft bright inline login"><a href="#registreForm" onclick="dialog_registre.dialog( 'open' );" data-rel="popup" id="reg-link" class="login-link">Register</a></div>
            </div>

        <div class="social inline fright">
            <ul id="social">
                <li class="bleft inline">
                    <ul>
                        <li><a href="https://www.facebook.com/" target="_blank"  original-title="twitter"><img src="img/social/icon_header_face.png" alt=""></a></li>
                        <li><a href="https://plus.google.com/" target="_blank"  original-title="googleplus"><img src="img/social/icon_header_g.png" alt=""></a></li>
                        <li><a href="https://twitter.com/" title="facebook" target="_blank" ><img src="img/social/icon_header_tw.png" alt=""></a></li>
                        <li><a href="http://www.linkedin.com/" target="_blank" original-title="linkedin"><img src="img/social/icon_header_in.png" alt=""></a></li>
                        <li><a href="Hicham_domainname.html" target="_self" original-title="mail"><img src="img/social/icon_header_p.png" alt=""></a></li>
                        <li><a href="Hicham_domainname.html" target="_self" original-title="mail"><img src="img/social/icon_header_ball.png" alt=""></a></li>
                    </ul>
                </li>

                <li class="bleft first socialz"><a class="active" href="#">EN</a></li>
                <li class="bleft socialz"><a href="#">FR</a></li>
                <li class="bleft socialz"><a href="#">IT</a></li>
                <li class="bleft last socialz"><a href="#">DE</a></li>
            </ul>
        </div>
    </div>

    <div class="clear"></div>
    <div class="navigate">
        <div class="width">
            <div class="logo inline">
                <h2 class="inline fleft">C-FUNDING</h2>
            </div>

            <div class="navigation inline fright">
                <ul class="nav inline menuleft">
                    <li><a class="bleft" href="index.html">HOME</a></li>
                    <li><a class="bleft" href="index.html#id_about">ABOUT</a></li>
                    <li class="active"><a class="bleft" href="projects.html#id3">PROJECTS</a></li>
                    <li><a class="bleft" href="index.html#registr">REGISTER</a></li>
                    <li><a class="bleft" href="index.html#id_cont">CONTACTS</a></li>
                    <li><a class="bleft last" href="index.html#id_partn">PARTNERS</a></li>
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
                <option value="index.html#id_partn">Partners</option>
            </select>
        </div>
    </div>
</div>

<div class="container-fluid line contentt description_page" id="ProjectDetailsCtrl">

<div class="clear"></div>
<div class="content description">
<div class="row-fluid cols">
<div class="left_content_descr span8">
<h1 class="decoration text-center"><span class="nobacgr">##projetName##</span></h1>
<div class="video">
    <div id="myCarousel" class="carousel slide" style="z-index:0;">
        <div class="carousel-inner content" style="width: 100%">

            <div class="item active">
                <div>
                    <img src="##imgProjet##">
                </div>
            </div>
        <!--     <div class="item">
                <div>
                    <img src="http://placehold.it/620x380">
                </div>
            </div>  -->
        </div>
        <div id="visiblepanel" class="visiblepanel">
            <a class="left carousel-control" href="#myCarousel" data-slide="prev" id="slide_left"></a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next" id="slide_rigth"></a>
        </div>
    </div>
</div>

<div class="tabbable" style="margin-bottom: 18px;">
    <div id="tabs_pages">
        <ul class=" tabs_pages_ul row-fluid">
            <li class="active span4"><a href="#tab1" data-toggle="tab">DESCRIPTION</a></li>
            <li class="span4"><a href="#tab2" data-toggle="tab">BACKERS</a></li>
            <li class="span4"><a href="#tab3" data-toggle="tab">UPDATES</a></li>
        </ul>
    </div>
    <div class="tab-content" style="padding-bottom: 9px;" >
        <div class="tab-pane active" id="tab1">
            <div id="description_content">
                <div class="title_description_content"> ##projetMiniDisc## </div>
                <div class="text_description_content"> ##projetDisc## </div>
            </div>
        </div>
       

    </div>
</div>

<div id="social_uncategorized">
    <div class="left_social_uncategorized"><span>##projetCategorie##</span></div>
    <div class="social inline fright">
        <ul id="social_mid" class="bleft_social">
            <li><a href="https://twitter.com/" target="_blank"  original-title="twitter"><img src="img/social/icon_header_face.png" alt=""></a></li>
            <li><a href="https://plus.google.com/" target="_blank"  original-title="googleplus"><img src="img/social/icon_header_g.png" alt=""></a></li>
            <li><a href="https://www.facebook.com/" title="facebook" target="_blank" ><img src="img/social/icon_header_tw.png" alt=""></a></li>
            <li><a href="http://www.linkedin.com/" target="_blank" original-title="linkedin"><img src="img/social/icon_header_in.png" alt=""></a></li>
            <li><a href="Hicham_domainname.html" target="_self" original-title="mail"><img src="img/social/icon_header_p.png" alt=""></a></li>
            <li><a href="Hicham_domainname.html" target="_self" original-title="mail"><img src="img/social/icon_header_ball.png" alt=""></a></li>
        </ul>
    </div>
</div>
<div class="clear"></div>

<div id="author_review" >
    <h3 class="decoration text-center"><span class="nobacgr">Author</span></h3>
    <div id="face_social_text">
        <div class="left_face_social_text span4">
            <div class="face_big span9"><img src="##userProjetImg##" ></div>
            <div class="social_link_author">
                <div class="social_bord"><a href="#" >
                    <img class="social_decc" src="img/description/facebook_author_icon.png" alt="">
                </a></div>
                <div class="social_bord"><a href="#" >
                    <img class="social_decc" src="img/description/twitter_author_icon.png" alt="">
                </a></div>
                <div class="social_bord_last"><a href="#" >
                    <img class="social_decc" src="img/description/google_author_icon.png" alt="">
                </a></div>
            </div>
        </div>
        <div class="right_face_social_text span8">
            <div class="name_surname">##userProjetName##</div>
            <div class="proff">##userProjetTel##</div>
            <div class="text_author_right">##userProjetDesc##</div>
        </div>
    </div>
</div>

<div class="clear"></div>
<h4 class="decoration text-center"><span class="nobacgr">Ask a Question</span></h4>
<div id="asc_a_question" >
	<input type="hidden" id="idPageComment" value="1">
    <div class="reply_user main_reply" id="comments">
    	<div id="oneComment" style="display: none;">
	        <div class="row-fluid">
	            <div class="span2">
	                <div class="image_face">
	                	<img src="##imgUser##" /> 
	                </div>
	            </div>
	            <div class="span10">
	                <div class="name_and_date"><span class="user_name">##nameUser##</span> - ##timeUser## - </div>
	                <div class="text_reply">##msgUser##</div>
	
	            </div>
	        </div>
        </div>
        
    </div>
    
    <img src="Images/chargement.gif" width="120"  id="image_chargement" />

</div>
<div id="asc_a_question_form">
    <h3 class="text-center asc_question_form_name">Ask a <span class="h3_quest">Question</span></h3>
    <div class="form_question">
        <div class="row-fluid">
            <div class="controls controls-row message">
            	<form id="addCommentForm" action="addCommentaire.html" method="post" >
	                <textarea id="commentMsg" class="inputp search-query span12" name="msg" rows="5" placeholder="Project description"></textarea>
	                <input type="hidden" value="5" id="id_projet" name="id_projet" /> <!-- {{projectDetails.idProject}} -->
	                <div class="clear"></div>
	                <div class="tmargin20">
	                    <button type="button" onclick="addComment()" class="btn"><strong>Send Message</strong></button>
	                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

<!--------------------------------- OPEN Div: Project Details + pledged +Payment  ----------------------- -->

<div class="sidebar_descr span4">
    <div id="back_this_project_block" >
        <div class="backers_days_blocks first">
            <div class="row-fluid">
                <div class="span1" style="margin-right: 10px"><div class="image_first"></div></div>
                <div class="text_backers_days_blocks span10">
                    <div class="top_text_backers_days_blocks">{{projectDetails.backers}}</div>
                    <div class="bottom_text_backers_days_blocks">Backers</div>
                </div>
            </div>
        </div>
        <div class="backers_days_blocks">
            <div class="row-fluid">
                <div class="span1" style="margin-right: 10px"><div class="image_second"></div></div>
                <div class="text_backers_days_blocks span10">
                    <div class="top_text_backers_days_blocks">{{projectDetails.pledged}}</div>
                    <div class="bottom_text_backers_days_blocks">pledged of {{projectDetails.pledgedGoal}} goal</div>
                </div>
            </div>
        </div>
        <div class="backers_days_blocks">
            <div class="row-fluid">
                <div class="span1" style="margin-right: 10px"><div class="image_third"></div></div>
                <div class="text_backers_days_blocks span10">
                    <div class="top_text_backers_days_blocks">{{projectDetails.daysToGo}}</div>
                    <div class="bottom_text_backers_days_blocks">days to go</div>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <div id="vote" align="center">
        <a href="javascript: like(1);">
          	<img id="like_vote" src="Images/no_like.png" width="37"/>
        </a>
        <a href="javascript: like(0);">
          	<img id="dislike_vote" src="Images/no_dislike.png" width="50"/>
        </a>
        <br/>
        <progress id="jaime" value="0" max="0" ></progress><br/>
        <progress id="jaimepas" value="0" max="0"></progress>
    </div>
    
     <br/>
    <div class="back_this_project_button">
        <button class="btn btn-large back_project" type="button">
            <small>BACK THIS PROJECT</small>
        </button>
        
    </div>

    <div id="pledges_block" >
        <h3 class="decoration text-center"><span class="nobacgr_desc">Pledges</span></h3>
        <div class="pledges_block_info" ng-repeat="pledge in projectDetails.pledges">
            <div class="pledges_block_info_link" ><a id="link_pledges_block_info_link_1">Pledge {{pledge.pledged}} or more</a></div>

            <div id="pledges_block_info_1" >
                <div class="pledges_block_info_backers">{{pledge.backers}} backers</div>
                <div class="pledges_block_info_text">{{pledge.details}}</div>
                <div class="pledges_block_info_estimate_delivery">Estimate delivery: {{pledge.estimateDelivery}}</div>
            </div>

        </div>

    </div>
    <div id="payment_getaway">
        <!--<h3 class="text-center payment_getaway_name"><span class="title_h3 left_t"></span>Payment Getaway<span class="title_h3 right_t"></span></h3>-->
        <h3 class="decoration text-center"><span class="nobacgr_desc">Payment Getaway</span></h3>
        <div class="payment_getaway_block">
            <div class="payment_cost">$15</div>
            <div class="your_card">
                <h3>Choose Your Card:</h3>

                <ul class="choose">
                    <li>
                        <input id="rfirst" type="radio" name="radio" checked hidden />
                        <label for="rfirst">Visa</label>
                    </li>
                    <li>
                        <input id="rsecond" type="radio" name="radio" hidden />
                        <label for="rsecond">MasterCard</label>
                    </li>
                    <li>
                        <input id="re" type="radio" name="radio" hidden />
                        <label for="re">American Express</label>
                    </li>
                </ul>
            </div>
            <div class="payment_getaway_button">
                <button class="btn btn-large make_payment" type="button">
                    <small>Make Payment</small>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- ##################################################################################### -->
</div>
</div>
</div>
<div id="footer">
    
    <div class="footer_bot">
        <div class="footer_bott">
            <div class="fleft">© All Rights Reserved. Project M1 info Univ Angers.</div>
            <div class="fright">
                <ul id="social_b" class="socialbott inline">
                    <li><a href="https://twitter.com/" target="_blank" original-title="twitter"><img src="img/social/icon_footer_face.png" alt=""></a></li>
                    <li><a href="https://plus.google.com/" target="_blank" original-title="googleplus"><img src="img/social/icon_footer_g.png" alt=""></a></li>
                    <li><a href="https://www.facebook.com/" title="facebook" target="_blank"><img src="img/social/icon_footer_tw.png" alt=""></a></li>
                    <li><a href="http://www.linkedin.com/" target="_blank" original-title="linkedin"><img src="img/social/icon_footer_in.png" alt=""></a></li>
                    <li><a href="http://www.linkedin.com/" target="_self" original-title="mail"><img src="img/social/icon_footer_p.png" alt=""></a></li>
                    <li><a href="http://www.linkedin.com/" target="_self" original-title="mail"><img src="img/social/icon_footer_ball.png" alt=""></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.placeholder.js"></script>
    <script src="assets/js/css3-mediaqueries.js"></script>
    <script src="assets/js/jquery_interaction.js"></script>

<script>
    /* <![CDATA[ */
    $("#link_pledges_block_info_link_1").click(function() {
        if ($('#pledges_block_info_1').is(':visible'))
        {
            $('#link_pledges_block_info_link_1').addClass('not_active');
            $("#pledges_block_info_1").toggle();
        }
        else
        {
            $('#link_pledges_block_info_link_1').removeClass('not_active');
            $("#pledges_block_info_1").toggle();
        }
    });

    $("#link_pledges_block_info_link_2").click(function() {
        if ($('#pledges_block_info_2').is(':visible'))
        {
            $('#link_pledges_block_info_link_2').addClass('not_active');
            $("#pledges_block_info_2").toggle();
        }
        else
        {
            $('#link_pledges_block_info_link_2').removeClass('not_active');
            $("#pledges_block_info_2").toggle();
        }
    });

    $("#link_pledges_block_info_link_3").click(function() {
        if ($('#pledges_block_info_3').is(':visible'))
        {
            $('#link_pledges_block_info_link_3').addClass('not_active');
            $("#pledges_block_info_3").toggle();
        }
        else
        {
            $('#link_pledges_block_info_link_3').removeClass('not_active');
            $("#pledges_block_info_3").toggle();
        }
    });

    $("#link_pledges_block_info_link_4").click(function() {
        if ($('#pledges_block_info_4').is(':visible'))
        {
            $('#link_pledges_block_info_link_4').addClass('not_active');
            $("#pledges_block_info_4").toggle();
        }
        else
        {
            $('#link_pledges_block_info_link_4').removeClass('not_active');
            $("#pledges_block_info_4").toggle();
        }
    });

    $("#link_pledges_block_info_link_5").click(function() {
        if ($('#pledges_block_info_5').is(':visible'))
        {
            $('#link_pledges_block_info_link_5').addClass('not_active');
            $("#pledges_block_info_5").toggle();
        }
        else
        {
            $('#link_pledges_block_info_link_5').removeClass('not_active');
            $("#pledges_block_info_5").toggle();
        }
    });

    $("#link_pledges_block_info_link_6").click(function() {
        if ($('#pledges_block_info_6').is(':visible'))
        {
            $('#link_pledges_block_info_link_6').addClass('not_active');
            $("#pledges_block_info_6").toggle();
        }
        else
        {
            $('#link_pledges_block_info_link_6').removeClass('not_active');
            $("#pledges_block_info_6").toggle();
        }
    });

    $("#link_pledges_block_info_link_7").click(function() {
        if ($('#pledges_block_info_7').is(':visible'))
        {
            $('#link_pledges_block_info_link_7').addClass('not_active');
            $("#pledges_block_info_7").toggle();
        }
        else
        {
            $('#link_pledges_block_info_link_7').removeClass('not_active');
            $("#pledges_block_info_7").toggle();
        }
    });

    $(function(){
        var iframe = $('#player1')[0];
        var player = $f(iframe);
        var $myCarousel = $('#myCarousel');

        player.addEvent('ready', function() {
            // player.addEvent('pause', onPause);
            player.addEvent('play', onPlay);
            //player.addEvent('playProgress', onPlayProgress);
        });


        $('#myCarousel').bind('slide', function(){
            player.api('pause');
            $('#myCarousel').carousel({
                interval: 6000
            })
        });


        function onPlay(id) {
            $myCarousel.carousel('pause');
        }


    });

    /* ]]> */


</script>
<script>
    /* <![CDATA[ */
    var a = $('.left_content_descr').height();
    $('.sidebar_descr').height(a - 70);
    /* ]]> */

</script>

<script>
    /* <![CDATA[ */
    $('#myCarousel').hover(function() {
        $('#visiblepanel').toggle();
    });
    /* ]]> */


</script>
<script>
    /* <![CDATA[ */
    $(function(){
        // bind change event to select
        $('#dynamic_select').bind('change', function () {
            var url = $(this).val(); // get selected value
            if (url) { // require a URL
                window.location = url; // redirect
            }
            return false;
        });
    });
    /* ]]> */

</script>

</body>
</html>
