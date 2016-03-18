<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

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
    <style type="text/css"></style>

    <script src="assets/js/angular.min.js"></script>
    <script src="assets/js/app.js"></script>

</head>

<body>

<div id="header" class="header">
    <div class="width titul">
        <div class="reg inline">
            <div class="bleft inline login"><a href="#" id="login-link" class="login-link">Login</a></div>
            <div class="bleft bright inline login"><a href="#" id="reg-link" class="login-link">Register</a></div>
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

<div class="container-fluid line contentt description_page">

<div class="clear"></div>
<div class="content description">
<div class="row-fluid cols">
<div class="left_content_descr span8">
<h1 class="decoration text-center"><span class="nobacgr">Project Name</span></h1>
<div class="video">
    <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner content" style="width: 100%">

            <div class="item active">
                <div>
                    <img src="http://placehold.it/620x380">
                </div>
            </div>
            <div class="item">
                <div>
                    <img src="http://placehold.it/620x380">
                </div>
            </div>
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
    <div class="tab-content" style="padding-bottom: 9px;"ng-controller="TabContentCtrl" >
        <div class="tab-pane active" id="tab1">
            <div id="description_content">
                <div class="title_description_content"> {{content.titleDescription}} </div>
                <div class="text_description_content"> {{content.textDescription}} </div>
               
            </div>
        </div>
       

    </div>
</div>

<div id="social_uncategorized">
    <div class="left_social_uncategorized"><span>Uncategorized</span></div>
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

<div id="author_review" ng-controller="authorCtrl">
    <h3 class="decoration text-center"><span class="nobacgr">Author</span></h3>
    <div id="face_social_text">
        <div class="left_face_social_text span4">
            <div class="face_big span9"><div class="pix_author"></div></div>
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
            <div class="name_surname">{{authorDetails.name}}</div>
            <div class="proff">{{authorDetails.job}}</div>
            <div class="text_author_right">{{authorDetails.about}}</div>
        </div>
    </div>
</div>

<div class="clear"></div>
<h4 class="decoration text-center"><span class="nobacgr">Ask a Question</span></h4>
<div id="asc_a_question" ng-controller="askQuestionCtrl">

    <div class="reply_user main_reply">
        <div class="row-fluid">
            <div class="span2">
                <div class="image_face"></div>
            </div>
            <div class="span10">
                <div class="name_and_date"><span class="user_name">{{messageDetails.user}}</span> - {{messageDetails.time}} - <span class="reply_t">Reply</span></div>
                <div class="text_reply">{{messageDetails.msg}}</div>

            </div>
        </div>
    </div>

    <div class="reply_user subreply">
        <div class="row-fluid">
            <div class="span2">
                <div class="image_face"></div>
            </div>
            <div class="span10">
                <div class="name_and_date"><span class="user_name">{{messageDetails.user}}</span> - {{messageDetails.time}} - <span class="reply_t">Reply</span></div>
                <div class="text_reply">{{messageDetails.msg}}</div>

            </div>
        </div>
    </div>
</div>
<div id="asc_a_question_form">
    <h3 class="text-center asc_question_form_name">Ask a <span class="h3_quest">Question</span></h3>
    <div class="form_question">
        <div class="row-fluid">
            <div class="controls controls-row message">
                <input class="inputp search-query span4" type="text" placeholder="Name*">
                <input class="inputp search-query span4" type="text" placeholder="Email*">
                <input class="inputp search-query span4" type="text" placeholder="Website*">
                <div class="clear"></div>
                <textarea id="redex" class="inputp search-query span12"  rows="5" placeholder="Project description"></textarea>
                <div class="clear"></div>
                <div class="tmargin20">
                    <button type="submit" class="btn"><strong>Send Message</strong></button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- ######################### OPEN Div: backThisProjectBlockCtrl ################################### -->

<div class="sidebar_descr span4">
    <div id="back_this_project_block" ng-controller="BackThisProjectBlockCtrl">
        <div class="backers_days_blocks first">
            <div class="row-fluid">
                <div class="span1" style="margin-right: 10px"><div class="image_first"></div></div>
                <div class="text_backers_days_blocks span10">
                    <div class="top_text_backers_days_blocks">{{backersDetails.backers}}</div>
                    <div class="bottom_text_backers_days_blocks">Backers</div>
                </div>
            </div>
        </div>
        <div class="backers_days_blocks">
            <div class="row-fluid">
                <div class="span1" style="margin-right: 10px"><div class="image_second"></div></div>
                <div class="text_backers_days_blocks span10">
                    <div class="top_text_backers_days_blocks">{{backersDetails.pledged}}</div>
                    <div class="bottom_text_backers_days_blocks">pledged of {{backersDetails.pledgedGoal}} goal</div>
                </div>
            </div>
        </div>
        <div class="backers_days_blocks">
            <div class="row-fluid">
                <div class="span1" style="margin-right: 10px"><div class="image_third"></div></div>
                <div class="text_backers_days_blocks span10">
                    <div class="top_text_backers_days_blocks">{{backersDetails.daysToGo}}</div>
                    <div class="bottom_text_backers_days_blocks">days to go</div>
                </div>
            </div>
        </div>
    </div>
    <div class="back_this_project_button">
        <button class="btn btn-large back_project" type="button">
            <small>BACK THIS PROJECT</small>
        </button>
    </div>
    <div id="pledges_block" ng-controller="PledgesBlock">
        <h3 class="decoration text-center"><span class="nobacgr_desc">Pledges</span></h3>
        <div class="pledges_block_info" ng-repeat="pledge in pledges">
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
            <div class="fleft">Â© All Rights Reserved. Project M1 info Univ Angers.</div>
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

</body>
</html>
