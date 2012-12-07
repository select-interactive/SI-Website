<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="announce_Default" %>
<%@ Register TagPrefix="uc" TagName="header" Src="~/controls/header.ascx" %>
<%@ Register TagPrefix="uc" TagName="footer" Src="~/controls/footer.ascx" %>
<!doctype html>

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>Select Interactive - Website Development - Fort Worth, Texas</title>
    <meta name="description" content="Developers of innovative websites and web applications for the forward thinking company.">
    <meta name="keywords" content="website development, website design, web development, web design, select, interactive, select interactive, fort worth, dallas, texas">
    <meta name="author" content="Jeremy Burton" />
    <link rel="Alternate" type="application/rss+xml" title="News from Select Interactive" href="http://select-interactive.com/feed/rssfeed.xml" />
    <link rel="Stylesheet" href="/css/styles.v-1.0.min.css" />
    <script src="/js/libs/modernizr-2.0.6.min.js"></script>
</head>
<body id="announce">
    <div id="container">
        <div id="sohopros">
            <h1>SohoPros</h1>
            is now
        </div>
        <div id="si">
            <img src="/img/logos/SI-150height-transparent.png" alt="Select Interactive" width="501" height="150" />
        </div>
    </div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script>
        $(function() {
            var mt = ( $( document ).height() - $( '#container' ).height() ) / 2;mt -= 200;$( '#container' ).css({ 'margin-top': mt + 'px', 'visibility': 'visible' });
            !Modernizr.cssanimations && $( '#si' ).hide();
            setTimeout(function() {
                if ( Modernizr.cssanimations ) {
                    $( '#sohopros' ).addClass( 'out' );
                    $( '#si' ).addClass( 'in' );
                }
                else {
                    $( '#sohopros' ).fadeOut( 2000 );
                    $( '#si' ).fadeIn( 3000 );
                }
            }, 2500 );
            setTimeout(function() {
                window.location = '/';
            }, 7000 );
        });
    </script>
</body>
</html>