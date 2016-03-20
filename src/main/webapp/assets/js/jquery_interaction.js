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



    /* <![CDATA[ */
    var a = $('.left_content_descr').height();
    $('.sidebar_descr').height(a - 70);
    /* ]]> */




    /* <![CDATA[ */
    $('#myCarousel').hover(function() {
        $('#visiblepanel').toggle();
    });
    /* ]]> */



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

