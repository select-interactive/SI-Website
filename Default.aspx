<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register TagPrefix="uc" TagName="header" Src="~/controls/header.ascx" %>
<%@ Register TagPrefix="uc" TagName="footer" Src="~/controls/footer.ascx" %>
<!doctype html>

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>Select Interactive - Website Design, Website Development, Web Application Development - Fort Worth, Texas</title>
    <meta name="description" content="Developers of innovative websites and web applications for the forward thinking company.">
    <meta name="keywords" content="website development, website design, web development, web design, select, interactive, select interactive, fort worth, dallas, texas">
    <link type="text/plain" rel="author" href="/humans.txt">
    <meta name="viewport" content="width=device-width">
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/img/m/h/apple-touch-icon.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/img/m/m/apple-touch-icon.png">
    <link rel="apple-touch-icon-precomposed" href="/img/m/l/apple-touch-icon.png">
    <link rel="shortcut icon" href="/img/m/l/apple-touch-icon.png">
    <meta http-equiv="cleartype" content="on">
    <link rel="Alternate" type="application/rss+xml" title="News from Select Interactive" href="http://select-interactive.com/feed/rssfeed.xml">
    <link rel="Stylesheet" href="/css/styles.v-1.11.min.css">
    <script src="/js/libs/modernizr-2.0.6.min.js"></script>
</head>
<body id="home">
    
    <div id="page-wrapper">
        <uc:header runat="server" ID="ucHeader" />
        <div id="content-wrapper" role="main">
            <section id="cycle">
                <a href="#" id="prev" class="arrow"></a><a href="#" id="next" class="arrow"></a>
                <div id="cycle-overlay" class="in"><span id="specialize-text" class="in"></span></div>
                <img src="/img/home/cycle/stream.jpg" alt="Website Design and Development" width="960" height="250" data-text="Fast, Creative, User-Friendly Websites." class="in f" />
                <img src="/img/home/cycle/pc.jpg" alt="Innovative Web Applications" width="960" height="250" data-text="Innovative Web Applications." />
                <img src="/img/home/cycle/mobile.v.2.jpg" alt="Mobile website development" width="960" height="250" data-text="Be Mobile. Go Everywhere." />
                <img src="/img/home/cycle/cms.jpg" alt="Content Management" width="960" height="250" data-text="Content Management." />
            </section>
            <section class="copy">
                <div class="r threecol clearfix">
                    <div class="c">
                        <h3>Web Development</h3>
                        <p>
                            <span class="orange">Select Interactive</span> creates fast, creative and user-friendly websites and web applications built with innovative web technologies.
                        </p>
                        <p class="nm">
                            Rather than creating an &ldquo;online brochure,&rdquo; we develop websites that allow for rich user interaction, optimized for today&rsquo;s modern web browsers and mobile devices.
                        </p>
                    </div>
                    <div class="c">
                        <h3>What&rsquo;s Happening</h3>
                        <asp:Literal runat="server" ID="ltrlLatestBlogs" />
                    </div>
                    <div class="c">
                        <h3>Connect</h3>
                        <p>
                            <span class="contact phone"></span>817-810-0021<br />
                            <span class="contact email"></span><a href="mailto:contact@select-interactive.com">contact@select-interactive.com</a><br />
                            <span class="contact twitter"></span><a href="http://twitter.com/sel_interactive" target="_blank">@Sel_Interactive</a><br />
                            <span class="contact rss"></span><a href="http://feeds.feedburner.com/SelectInteractive" rel="alternate" type="application/rss+xml">Subscribe</a><br />
                            <span class="contact map"></span><a href="http://g.co/maps/529t3" target="_blank">Get Directions</a>
                        </p>
                        <p class="nm">
                            <strong class="orange">Select Interactive</strong><br />
                            3343 Locke Ave.<br />
                            Suite 107<br />
                            Fort Worth, TX 76107
                        </p>
                    </div>
                </div>
            </section>
        </div>
        <uc:footer runat="server" ID="ucFooter" />
    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script defer src="/js/si/si.home.v-1.0.min.js"></script>

    <script>
        window._gaq = [['_setAccount','UA-28490429-1'],['_trackPageview'],['_trackPageLoadTime']];
        Modernizr.load({
            load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'
        });
    </script>

    <!--[if lt IE 7 ]>
        <script defer src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
        <script defer>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
    <![endif]-->

</body>
</html>