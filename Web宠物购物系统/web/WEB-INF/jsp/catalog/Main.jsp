<%@ page import="org.csu.myproject.domain.Account" %><%--
  Created by IntelliJ IDEA.
  User: tu
  Date: 2021/2/2
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style1.css" />
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--Google Fonts-->
    <link href='#css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='#css?family=Rambla:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- //end-smoth-scrolling -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" type="text/css" media="screen" />
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
<!--banner strat here-->
<div class="banner">
    <div class="container">
        <div class="banner-main">
            <div class="banner-text">
                <a href="main"><div class="logo">
                    <h1>PETS HOUSE</h1>
                    <p>Lorem ipsum dolor sit amet adipiscing elit.</p>
                </div></a>
            </div>
            <h3>On the other hand, we denounce with righteous indignation and dislike and trouble that are bound to ensue blame.</h3>
        </div>
    </div>
</div>
<!--baner end here-->
<!--header start here-->
<div class="header-bottom">
    <div class="fixed-header">
        <div class="container">
            <div class="header-main">
                <div class="header-left">
                    <h2><a href="main">Pets House</a></h2>
                </div>
                <div class="header-right">
                    <div class="top-nav">
                        <span class="menu"><img src="${pageContext.request.contextPath}/images/menu.png" alt=""/></span>
                        <ul class="nav1">
                            <li><a href="main" class="active">Home</a></li>
                            <li><a class="active" href="viewCart">购物车</a></li>
<%--                            <li><a class="scroll" href="#services">Sign in</a></li>--%>
                            <%
                                Account loginUser = (Account) session.getAttribute("loginUser");
                                if (loginUser==null){
                                    out.write("<li><a class=\"active\" href=\"loginForm\">Sign In</a></li>");
                                }else {
                                    out.write("<li><a class=\"active\" href=\"signOut\">Sign Out</a></li>");
                                }
                            %>
                            <li><a class="active" href="editAccountForm">My Account</a></li>
                            <li><a class="active" href="logForm" >logs</a></li>
                        </ul>
                        <!-- script-for-menu -->
                        <script>
                            $( "span.menu" ).click(function() {
                                $( "ul.nav1" ).slideToggle( 300, function() {
                                    // Animation complete.
                                });
                            });
                        </script>
                        <!-- /script-for-menu -->
                        <!-- script-for sticky-nav -->
                        <script>
                            $(document).ready(function() {
                                var navoffeset=$(".header-bottom").offset().top;
                                $(window).scroll(function(){
                                    var scrollpos=$(window).scrollTop();
                                    if(scrollpos >=navoffeset){
                                        $(".header-bottom").addClass("fixed");
                                    }else{
                                        $(".header-bottom").removeClass("fixed");
                                    }
                                });

                            });
                        </script>
                        <!-- /script-for sticky-nav -->
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--header end here-->
<!--About strat here-->
<div class="about" id="about">
    <div class="container">
        <div class="about-main">
            <h3>About</h3>
            <div class="col-md-6 about-left">
                <img src="${pageContext.request.contextPath}/images/a1.png" alt="" class="img-responsive">
            </div>
            <div class="col-md-6 about-right">
                <h4>Nemo enim ipsam voluptatem</h4>
                <h5>Temporibus autem</h5>
                <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain</p>
                <ul>
                    <li><a href="#"> <span class="fts"> </span>Foots </a></li>
                    <li><a href="#"> <span class="brh"> </span>Brush</a></li>
                    <li><a href="#"> <span class="feed"> </span>Feed </a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--About text end here-->
<!--pets show strat here-->
<div class="pets-show">
    <div class="container">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <div class="pets-show-main">
                            <div class="col-md-6 pets-show-left">
                                <h3>Temporibus autem quibusdam et aut officiis </h3>
                                <h4>cum soluta nobis est eligendi optio</h4>
                                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
                            </div>
                            <div class="col-md-6 pets-show-right">
                                <img src="${pageContext.request.contextPath}/images/p2.png" alt="" class="img-responsive">
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </li>
                    <li>
                        <div class="pets-show-main">
                            <div class="col-md-6 pets-show-left">
                                <h3>Temporibus autem quibusdam et aut officiis </h3>
                                <h4>cum soluta nobis est eligendi optio</h4>
                                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
                            </div>
                            <div class="col-md-6 pets-show-right">
                                <img src="${pageContext.request.contextPath}/images/p4.png" alt="" class="img-responsive">
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </li>
                    <li>
                        <div class="pets-show-main">
                            <div class="col-md-6 pets-show-left">
                                <h3>Temporibus autem quibusdam et aut officiis </h3>
                                <h4>cum soluta nobis est eligendi optio</h4>
                                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
                            </div>
                            <div class="col-md-6 pets-show-right">
                                <img src="${pageContext.request.contextPath}/images/p5.png" alt="" class="img-responsive">
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>
<!--pets show end here-->
<!-- FlexSlider -->
<script defer src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(function(){

    });
    $(window).load(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider){
                $('body').removeClass('loading');
            }
        });
    });
</script>
<!-- FlexSlider -->

<!--services start here-->
<div class="services" id="services">
    <div class="container">
        <div class="services-main">
            <div class="ser-top">
                <h3>Pet Services</h3>
            </div>
            <div class="ser-bottom">
                <div class="col-md-4 ser-grid">
                    <div class="view view-first">
                        <img src="${pageContext.request.contextPath}/images/s1.png" />
                        <div class="mask">
                            <h2>CAT</h2>
                        </div>
                    </div>
                    <h4>Lorem ipsum</h4>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit</p>
                    <div class="ser-btn">
                        <a href="viewCategory?categoryId=CATS">Learn More</a>
                    </div>
                </div>
                <div class="col-md-4 ser-grid">
                    <div class="view view-first">
                        <img src="${pageContext.request.contextPath}/images/s2.png" />
                        <div class="mask">
                            <h2>BIRD</h2>
                        </div>
                    </div>
                    <h4>Lorem ipsum</h4>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit</p>
                    <div class="ser-btn">
                        <a href="viewCategory?categoryId=BIRDS">Learn More</a>
                    </div>
                </div>
                <div class="col-md-4 ser-grid">
                    <div class="view view-first">
                        <img src="${pageContext.request.contextPath}/images/s3.png" />
                        <div class="mask">
                            <h2>DOG</h2>
                        </div>
                    </div>
                    <h4>Lorem ipsum</h4>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit</p>
                    <div class="ser-btn">
                        <a href="viewCategory?categoryId=DOGS">Learn More</a>
                    </div>
                </div>
                <div class="col-md-4 ser-grid">
                    <div class="view view-first">
                        <img src="${pageContext.request.contextPath}/images/new.jpg" />
                        <div class="mask">
                            <h2>REPTILES</h2>
                        </div>
                    </div>
                    <h4>Lorem ipsum</h4>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit</p>
                    <div class="ser-btn">
                        <a href="viewCategory?categoryId=REPTILES">Learn More</a>
                    </div>
                </div>
                <div class="col-md-4 ser-grid">
                    <div class="view view-first">
                        <img src="${pageContext.request.contextPath}/images/new_fish.jpg" />
                        <div class="mask">
                            <h2>FISH</h2>
                        </div>
                    </div>
                    <h4>Lorem ipsum</h4>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit</p>
                    <div class="ser-btn">
                        <a href="viewCategory?categoryId=FISH">Learn More</a>
                    </div>
                </div>
                <div class="col-md-4 ser-grid">
                    <div class="view view-first">
                        <img src="${pageContext.request.contextPath}/images/s6.png" />
                        <div class="mask">
                            <h2>DOG</h2>
                        </div>
                    </div>
                    <h4>Lorem ipsum</h4>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit</p>
                    <div class="ser-btn">
                        <a href="viewCategory?categoryId=DOGS">Learn More</a>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<!--services end here-->
<!--service call strat here-->
<div class="service-call">
    <div class="container">
        <div class="service-call-main">
            <div class="services-call-left">
                <h4>Nor again is there anyone who loves</h4>
                <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system</p>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--service call end here-->
<!---gallery strat here-->
<div id="gallery" class="gallery">
    <div class="container">
        <h3 class="tittle need_col">Gallery</h3>
        <div class="gallery-grids">
            <div class="gallery-grid">
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal1"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g1.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal2"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g2.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal3"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g3.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
            </div>
            <div class="gallery-grid">
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal4"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g4.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal5"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g5.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal6"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g6.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
            </div>
            <div class="gallery-grid">
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal7"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g7.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal8"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g8.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
                <div class="gallery-img slideanim">
                    <figure class="effect-jazz">
                        <a href="#portfolioModal9"  data-toggle="modal">
                            <img src="${pageContext.request.contextPath}/images/g9.jpg" alt="img25" class="img-responsive"/>
                        </a>
                    </figure>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- Portfolio Modals -->
<div class="portfolio-modal modal fade slideanim" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Lorem ipsum</h3>
                    <img src="${pageContext.request.contextPath}/images/g1.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Dummy text</h3>

                    <img src="${pageContext.request.contextPath}/images/g2.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Popular belief</h3>

                    <img src="${pageContext.request.contextPath}/images/g3.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Lorem ipsum</h3>

                    <img src="${pageContext.request.contextPath}/images/g4.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Dummy text</h3>

                    <img src="${pageContext.request.contextPath}/images/g5.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Popular belief</h3>

                    <img src="${pageContext.request.contextPath}/images/g6.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal7" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Lorem ipsum</h3>

                    <img src="${pageContext.request.contextPath}/images/g7.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal8" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Lorem ipsum</h3>

                    <img src="${pageContext.request.contextPath}/images/g8.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="portfolio-modal modal fade slideanim" id="portfolioModal9" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl"></div>
            </div>
        </div>
        <div class="container">

            <div class="col-lg-8 col-lg-offset-2">
                <div class="modal-body">
                    <h3>Lorem ipsum</h3>

                    <img src="${pageContext.request.contextPath}/images/g9.jpg" class="img-responsive" alt="">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- /Portfolio Modals -->
<!-- //gallery -->
<!--contact strat-->
<div class="contact" id="contact">
    <div class="container">
    </div>
</div>
<!--contact end here-->
</body>
</html>


