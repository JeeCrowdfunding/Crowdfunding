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

    <link rel="apple-touch-icon" href="assets/img/touch-icon.html" />
    <link rel="image_src" href="assets/img/touch-icon.html" />

    <script src="assets/js/angular.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/jquery.js"></script>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!--[if IE 8]>
    <style type="text/css">
        input[type="checkbox"], input[type="radio"] {
            display: inline;
        }
        input[type="checkbox"] + label, input[type="radio"] + label{
            display: inline;
            background: none;
            margin-bottom: 15px;
        }
        .zone {
            background-color: #727272;
            filter: alpha(Opacity=70);
        }
        .black {
            background-color: #727272;
            filter: alpha(Opacity=70);
        }
    </style>
    <![endif]-->

 
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
	
</head>

<body>
<div id="header" class="header">
    <a name="id_home"></a>
        <div class="width titul">
            <div class="reg inline">
                <div class="bleft inline login"><a href="#" id="login-link" class="login-link">Login</a></div>
                <div class="bleft bright inline login"><a href="#" id="reg-link" class="login-link">Register</a></div>
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
                    <input id="autocomplete" title="" type="text" class="span7 search-query">
                    <input type="submit" class="submit" value="search" name="submit">
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
                <div id="myCarousel" class="carousel slide" ng-controller="ProjectsCtrl">
                <div class="carousel-inner content" >
                <div class="item active" >
                <div ng-repeat= "project in projects">
                   <div class="span4 bordered" ng-if="$index < 3">
                            <div class="folder">
                            <h4 class="text-center title"><a href="projects.html#proj{{project.idProject}}">{{project.projectName}}</a></h4>
                            </div>
                            <div class="proj_name">
                                <div class="clear"></div>
                                <span class="fleft author">{{project.authorName}}</span>
                                <table class="icons">
                                    <tbody>
                                    <tr>
                                        <td class="icos_proj_sm bleft"><a class="group1" href="assets/img/proj{{project.idProject}}.jpg" title=""><img src="assets/img/icon_search.png" alt=""></a></td>
                                        <td class="icos_proj_sm bleft"><a href="projects.html#proj{{project.idProject}}"><img src="assets/img/icon_lock.png" alt=""></a></td>
                                    </tr>
                                    </tbody>
                                 </table>
                                <div class="clear"></div>
                           </div>
                            <div class="folder border"><a href="projects.html#proj{{project.idProject}}"><div class="author_proj proj_{{project.idProject}}" ></div></a></div>
                            <div class="folder lorem lines">
                                <div id="project{{$index+7}}" value="{{project.pledgedGoal}}" class="slider"></div>
                            </div>
                            <p class="descr">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate egestas sem, eu cursus ligula ullamcorper non. Curabitur tristique velit eu</p>
                            <div class="folder price topbordered">
                                <div class="span4">
                                    <strong class="green"><span>$</span><span class="project_value" href="#project{{$index+7}}">200</span></strong>
                                    <p>pledged</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>50</strong>
                                    <p>backers</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>5</strong>
                                    <p>days to go</p>
                                </div>
                            </div>
                        </div>
                        </div>
                </div>
                <div class="item" >
                <div ng-repeat="project in projects"> 
                    <div class="span4 bordered" ng-if="$index > 2">
                            <div class="folder">
                            <h4 class="text-center title"><a href="projects.html#proj{{project.idProject}}">{{project.projectName}}</a></h4>
                            </div>
                            <div class="proj_name">
                                <div class="clear"></div>
                                <span class="fleft author">{{project.authorName}}</span>
                                <table class="icons">
                                    <tbody>
                                    <tr>
                                        <td class="icos_proj_sm bleft"><a class="group1" href="assets/img/proj{{project.idProject}}.jpg" title=""><img src="assets/img/icon_search.png" alt=""></a></td>
                                        <td class="icos_proj_sm bleft"><a href="projects.html#proj{{project.idProject}}"><img src="assets/img/icon_lock.png" alt=""></a></td>
                                    </tr>
                                    </tbody>
                                 </table>
                                <div class="clear"></div>
                           </div>
                            <div class="folder border"><a href="projects.html#proj{{project.idProject}}"><div class="author_proj proj_{{project.idProject}}" ></div></a></div>
                            <div class="folder lorem lines">
                                <div id="project{{$index+7}}" value="{{project.pledgedGoal}}" class="slider"></div>
                            </div>
                            <p class="descr">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate egestas sem, eu cursus ligula ullamcorper non. Curabitur tristique velit eu</p>
                            <div class="folder price topbordered">
                                <div class="span4">
                                    <strong class="green"><span>$</span><span class="project_value" href="#project{{$index+7}}">200</span></strong>
                                    <p>pledged</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>50</strong>
                                    <p>backers</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>5</strong>
                                    <p>days to go</p>
                                </div>
                            </div>
                        </div>
                        </div>
                </div>
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

<h1 class="decoration text-center proj"><span class="nobacgr">Projects</span></h1>

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

                <div class="portfolio-container" ng-repeat="project in projects">

                    <div class="portfolio-listing {{project.categorie}} block"  ng-if="$index < 6" style="display: block;">
                        <div class="span4 bordered" ng-click="chooseProject(project)">
                            <div class="folder">
                            <h4 class="text-center title"><a href="projects.html#proj{{project.idProject}}">{{project.projectName}}</a></h4>
                            </div>
                            <div class="proj_name">
                                <div class="clear"></div>
                                <span class="fleft author">{{project.authorName}}</span>
                                <table class="icons">
                                    <tbody>
                                    <tr>
                                        <td class="icos_proj_sm bleft"><a class="group1" href="assets/img/proj{{project.idProject}}.jpg" title=""><img src="assets/img/icon_search.png" alt=""></a></td>
                                        <td class="icos_proj_sm bleft"><a href="projects.html#proj{{project.idProject}}"><img src="assets/img/icon_lock.png" alt=""></a></td>
                                    </tr>
                                    </tbody>
                                 </table>
                                <div class="clear"></div>
                           </div>
                            <div class="folder border"><a href="projects.html#proj{{project.idProject}}"><div class="author_proj proj_{{project.idProject}}" ></div></a></div>
                            <div class="folder lorem lines">
                                <div id="project{{$index+1}}" value="{{project.pledgedGoal}}" class="slider"></div>
                            </div>
                            <p class="descr">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate egestas sem, eu cursus ligula ullamcorper non. Curabitur tristique velit eu</p>
                            <div class="folder price topbordered">
                                <div class="span4">
                                    <strong class="green"><span>$</span><span class="project_value" href="#project{{$index+1}}">200</span></strong>
                                    <p>pledged</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>50</strong>
                                    <p>backers</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>5</strong>
                                    <p>days to go</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--
                <div class="portfolio-container" ng-repeat="project in projects">

                    <div class="portfolio-listing development other movies block"  ng-if="$index > 10" style="display: block;">
                        <div class="span4 bordered">
                            <div class="folder"><h4 class="text-center title"><a href="projects.html#proj4">{{project.projectName}}</a></h4></div>
                            <div class="proj_name">
                                <div class="clear"></div>
                                <span class="fleft author">{{project.authorName}}</span>
                                <table class="icons">
                                    <tbody>
                                    <tr>
                                        <td class="icos_proj_sm bleft"><a class="group1" href="assets/img/proj4.jpg" title=""><img src="assets/img/icon_search.png" alt=""></a></td>
                                        <td class="icos_proj_sm bleft"><a href="projects.html#proj4"><img src="assets/img/icon_lock.png" alt=""></a></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="clear"></div>
                            </div>
                            <div class="folder border"><a href="projects.html#proj4"><div class="author_proj proj_4"></div></a></div>
                            <div class="folder lorem lines">
                                <div id="project4" value="234" class="slider"></div>
                            </div>
                            <p class="descr">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate egestas sem, eu cursus ligula ullamcorper non. Curabitur tristique velit eu</p>
                            <div class="folder price topbordered">
                                <div class="span4">
                                    <strong class="green"><span>$</span><span class="project_value" href="#project4">190</span></strong>
                                    <p>pledged</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>80</strong>
                                    <p>backers</p>
                                </div>
                                <div class="span4 bleft">
                                    <strong>25</strong>
                                    <p>days to go</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                 -->


            </div><!-- end of .zone-content -->
        </div><!-- end of .content-wrapper -->

    </section>

<div class="btns">
    <div class="btn-toolbar text-center">
        <div class="decoration text-center proj">
                    <div class="btn-group nobacgr">
                        <button class="btn"><span class="gray">1</span></button>
                        <button class="btn mleft10">2</button>
                        <button class="btn mleft10">3</button>
                        <button class="btn mleft10">4</button>
                        <button class="btn mleft10">5</button>
                    </div>
                    <a name="id_reg" id="registr"></a>
        </div>

    </div>

</div>


<h1 class="decoration text-center proj"><span class="nobacgr">Create Your Project</span></h1>
<div class="create_projects">



<!-----------------------------------------According: Create a Project ---------------------------------------->

<div class="container">
    <div class="row">
    <div class="col-md-12">
     
     <div id="accordion-first" class="clearfix">
                        <div class="accordion" id="accordion2">
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" onclick="accordionAfterClick(this,1)">
                                <em class="icon-fixed-width fa fa-plus"></em>Step 1: <span class="green">Registration</span>
                              </a>
                            </div>
                            <div style="height: 0px;" id="collapse_1" class="accordion-body collapse">
                              <div class="accordion-inner">
                                <div class="row-fluid border_proj duration">
                                <div class="span10 ">
                                    <div class="column_project">
                                        <h4 class="text-center">Personal Info:</h4>
                                        <form action="inscription" method="post" class="form-search" >
                                            <input type="text" class="inputp search-query span12" placeholder="Name">
                                            <input type="text" class="inputp search-query span12" placeholder="Surname">
                                            <input type="text" class="inputp search-query span12" placeholder="Email">
                                            <input type="text" class="inputp search-query span12" placeholder="Phone">
                                            <input type="text" class="inputp search-query span12" placeholder="Password">
                                            <input type="text" class="inputp search-query span12" placeholder="Repeat Password">
                                        </form>
                                    </div>
                                </div>
                                </div>

                              </div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" onclick="accordionAfterClick(this,2)">
                                <em class="icon-fixed-width fa fa-plus"></em>Step 2: <span class="green">Project Summary
                              </a>
                            </div>
                            <div style="height: 0px;" id="collapse_2" class="accordion-body collapse">
                              <div class="accordion-inner">
                                <div class="row-fluid border_proj duration">
                                    <div class="span10">
                                        <div class="bleft column_project">
                                            <h4 class="text-center">Project Description:</h4>
                                            <form class="form-search">
                                                <input type="text" class="inputp search-query span12" placeholder="Project Name">
                                                <select class="">
                                                    <option>Category</option>
                                                    <option>Armenia</option>
                                                    <option>England</option>
                                                    <option>China</option>
                                                </select>
                                                <select class="">
                                                    <option>Location</option>
                                                    <option>Armenia</option>
                                                    <option>England</option>
                                                    <option>China</option>
                                                </select>
                                                <div class="upload_img inline">
                                                    <input type="file" name="upload"/>
                                                </div>
                                                <textarea id="redex2" class="inputp search-query span12" rows="9" placeholder="Short description"></textarea>
                                                <input type="text" class="inputp search-query span12" placeholder="Payment Gateway">
                                            </form>
                                        </div>
                                    </div>

                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree" onclick="accordionAfterClick(this,3)" >
                                <em class="icon-fixed-width fa fa-plus"></em>Step 3: <span class="green">Project page</span>
                              </a>
                            </div>
                            <div style="height: 0px;" id="collapse_3" class="accordion-body collapse">
                              <div class="accordion-inner">
                                <div class="row-fluid border_proj duration">
                                    <div class="span10">
                                        <div class="bleft column_project">
                                            <h4 class="text-center">Project Details:</h4>
                                            <form class="form-search">
                                                <input type="text" class="inputp search-query span12" placeholder="Video URL">
                                                <div class="upload_pic1 inline">
                                                    <input type="file" name="upload"/>
                                                </div>
                                                <div class="upload_pic2 inline">
                                                    <input type="file" name="upload"/>
                                                </div>
                                                <div class="upload_pic3 inline">
                                                    <input type="file" name="upload"/>
                                                </div>
                                                <input type="text" class="inputp search-query span12 face" style="padding-left: 30px;" placeholder="Account Name">
                                                <input type="text" class="inputp search-query span12 tweet" style="padding-left: 30px;" placeholder="Account Name"> <textarea id="redex3" class="inputp search-query span12"  rows="5" placeholder="Project description"></textarea>
                                                <div class="upload_html inline">
                                                    <input type="file" name="upload"/>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" onclick="accordionAfterClick(this,4)">
                                <em class="icon-fixed-width fa fa-plus"></em>Step 4: <span class="green">Project Duration</span>
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
                                                            <input id="rfirst" type="radio" name="radio" checked hidden />
                                                            <label for="rfirst">30 Days ($15)</label>
                                                        </li>
                                                        <li>
                                                            <input id="rsecond" type="radio" name="radio" hidden />
                                                            <label for="rsecond">45 Days ($20)</label>
                                                        </li>
                                                        <li>
                                                            <input id="re" type="radio" name="radio" hidden />
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




    <div class="decoration text-center create_butt"><span class="nobacgr_whit"><button class="btn btn-large search-query" type="button"> <span class="butt_small"><strong>CREATE</strong></span></button></span><a name="id_cont"></a></div>

</div>


<h1 class="decoration text-center conts"><span class="nobacgr">Contact Us</span></h1>

<div class="contacts">
    <div class="bborder">
        <p><strong>Send Us a <span class="green">Message</span></strong></p>
    </div>
    <form id="contact-us-form" class="row-fluid message" data-ajax="true">
        <div class="controls controls-row">
            <input class="inputp search-query span4" type="text" name="name" placeholder="Name*">
            <input class="inputp search-query span4" type="text" name="email" placeholder="Email*">
            <input class="inputp search-query span4" type="text" name="website" placeholder="Website*">
            <div class="clear"></div>
            <textarea id="redex" name="message" class="inputp search-query span12"  rows="5" placeholder="Project description"></textarea>
            <div class="clear"></div>
            <div class="tmargin20">
                <button type="button" class="btn" name="submit" value="submit" id="contact_submit"><strong>Send Message</strong></button>
            </div>
            <div id="error_placeholder" class="form-message text-green"></div>
        </div>
    </form>
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
        (function($) {
            $(function() {

                $('select').selectbox();

                $('#add').click(function(e) {
                    $(this).parents('div.section').append('<br /><br /><select><option>-- Выберите --</option><option>Пункт 1</option><option>Пункт 2</option><option>Пункт 3</option><option>Пункт 4</option><option>Пункт 5</option></select>');
                    $('select').selectbox();
                    e.preventDefault();
                })

                $('#add2').click(function(e) {
                    var options = '';
                    for (i = 1; i <= 5; i++) {
                        options += '<option>Option ' + i + '</option>';
                    }
                    $(this).parents('div.section').find('select').each(function() {
                        $(this).append(options);
                    })
                    $('select').trigger('refresh');
                    e.preventDefault();
                })

                $('#che').click(function(e) {
                    $(this).parents('div.section').find('option:nth-child(5)').attr('selected', true);
                    $('select').trigger('refresh');
                    e.preventDefault();
                })

            })
        })(jQuery)
        /* ]]> */

    </script>

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
    $(function() {

        var availableTags = [
            "ActionScript",
            "AppleScript",
            "Asp",
            "BASIC",
            "C",
            "C++",
            "Clojure",
            "COBOL",
            "ColdFusion",
            "Erlang",
            "Fortran",
            "Groovy",
            "Haskell",
            "Java",
            "JavaScript",
            "Lisp",
            "Perl",
            "PHP",
            "Python",
            "Ruby",
            "Scala",
            "Scheme"
        ];
        $( "#autocomplete" ).autocomplete({
            source: availableTags
        });

        // Hover states on the static widgets
        $( "#dialog-link, #icons li" ).hover(
                function() {
                    $( this ).addClass( "ui-state-hover" );
                },
                function() {
                    $( this ).removeClass( "ui-state-hover" );
                }
        );
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
<script>
    /* <![CDATA[ */
    function hexFromRGB(r, g, b) {
        var hex = [
            r.toString( 16 ),
            g.toString( 16 ),
            b.toString( 16 )
        ];
        $.each( hex, function( nr, val ) {
            if ( val.length === 1 ) {
                hex[ nr ] = "0" + val;
            }
        });
        return hex.join( "" ).toUpperCase();
    }
    function refreshSwatch() {
        var red = $( "#project1" ).slider( "value" ),
                green = $( "#project2" ).slider( "value" ),
                blue = $( "#project3" ).slider( "value" ),
                blues = $( "#project4" ).slider( "value" ),
                hex = hexFromRGB( red, green, blue);
        $( "#swatch" ).css( "background-color", "#" + hex );

    }
    $(function() {
        $( "#project1, #project2, #project3, #project4, #project5, #project6, #project7, #project8, #project9, #project10, #project11, #project12" ).slider({
            orientation: "horizontal",
            range: "min",
            disabled: true,
            max: 100,
            slide: refreshSwatch,
            change: refreshSwatch
        });

        $.each($('.project_value'), function(k,v){
            var value = 100 * Number($(v).text())/Number($($(v).attr('href')).attr('value'));
            value = Math.floor(value);
            $($(v).attr('href')).slider("value", value);
            $($(v).attr('href')).find(".ui-slider-handle").text(value+'%');
        });

    });
    /* ]]> */

</script>

<script src="assets/js/jquery.selectbox.min.js"></script>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/jquery-uii.js"></script>
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


<script>
// Accordion Toggle Items
   

function accordionAfterClick(e, id) {
	
	for(var i= 1 ;i<=4 ;i++) {
		document.getElementById('collapse_'+i).style.height='0';
	}
	if(preClassActive !=null) preClassActive.className="accordion-toggle";
	document.getElementById('collapse_'+id).style.height='auto';
	e.className="accordion-toggle active";
	preClassActive=e;
}
</script>


</body>
</html>