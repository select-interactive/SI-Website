<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="news_Default" %>
<%@ Register TagPrefix="uc" TagName="header" Src="~/controls/header.ascx" %>
<%@ Register TagPrefix="uc" TagName="footer" Src="~/controls/footer.ascx" %>
<!doctype html>

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <!--<![endif]-->
<head runat="server">
    <meta charset="utf-8">
    <link type="text/plain" rel="author" href="/humans.txt">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<body id="news">

    <div id="page-wrapper">
        <uc:header runat="server" ID="ucHeader" />
        <div id="content-wrapper" role="main">
            <section class="r pg-two-col clearfix">
                <div class="c f copy">
                    <asp:Literal runat="server" ID="ltrlBlogPost" />
                </div>
                <div class="c">
                    <aside>
                        <h4>Stay Connected</h4>
                        <span class="contact rss"></span><a href="http://feeds.feedburner.com/SelectInteractive" rel="alternate" type="application/rss+xml">Subscribe</a><br />
                        <span class="contact twitter"></span><a href="http://twitter.com/sel_interactive" target="_blank">@Sel_Interactive</a><br />
                        <span class="contact fb"></span><a href="https://www.facebook.com/pages/Select-Interactive/365668433446732" target="_blank">Like Us on Facebook</a><br />
                        <span class="contact google"></span><a href="https://plus.google.com/106726509160059301827/about" target="_blank">Add Us to a Google+ Circle</a>
                    </aside>
                    <aside>
                        <h4>Recent News</h4>
                        <asp:Literal runat="server" ID="ltrlRecentPost" />
                    </aside>
                    <aside>
                        <h4>Recent Projects</h4>
                        <asp:Literal runat="server" ID="ltrlRecentProjects" />
                    </aside>
                    <aside>
                        <h4>Archives</h4>
                        <asp:Literal runat="server" ID="ltrlArchives" />
                    </aside>
                </div>
            </section>
        </div>
        <uc:footer runat="server" ID="ucFooter" />
    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script defer src="/js/si/si.util.v-1.0.min.js"></script>
    <asp:Literal runat="server" ID="ltrlBlogJS" />

    <div id="fb-root"></div>
    <script>
        window.___gcfg = {
            lang: 'en-US'
        };

        (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/plusone.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=206799279358821";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

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